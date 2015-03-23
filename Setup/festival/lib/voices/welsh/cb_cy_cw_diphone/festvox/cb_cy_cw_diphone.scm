;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-*-mode:scheme-*-
;;;                                                                       ;;
;;;                      University of Wales, Bangor                      ;;
;;;                         Copyright (c) 2006                            ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Distribution policy                                                  ;;
;;;     Free for any use                                                  ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  A female Welsh diphone voice (North Welsh accent)
;;;
;;;  Authors: Briony Williams
;;;           Rhys James Jones
;;;           Ivan Uemlianin
;;;

;;; Try to find out where we are
(if (assoc 'cb_cy_cw_diphone voice-locations)
    (defvar cb_cy_cw_dir 
      (cdr (assoc 'cb_cy_cw_diphone voice-locations)))
    ;;; Not installed in Festival yet so assume running in place
    (defvar cb_cy_cw_dir (pwd)))

(if (not (probe_file (path-append cb_cy_cw_dir "festvox/")))
    (begin
     (format stderr "cb_cy_cw: Can't find voice scm files they are not in\n")
     (format stderr "   %s\n" (path-append cb_cy_cw_dir "festvox/"))
     (format stderr "   Either the voice isn't linked into Festival\n")
     (format stderr "   or you are starting festival in the wrong directory\n")
     (error)))


;;;  Add the directory contains general voice stuff to load-path
(set! load-path (cons (path-append cb_cy_cw_dir "festvox/") load-path))

;;; We develop tokenisation in a separate directory from the voices, so:
(if (not (probe_file (path-append cb_cy_cw_dir "../Tokenisation")))
    (begin
     (format stderr "cb_cy_cw: There should be a tokenisation module in\n")
     (format stderr "   %s\n" (path-append cb_cy_cw_dir "../Tokenisation/"))
     (format stderr "   (in the file welshtoken.scm)\n")
     (format stderr "   Please check that your directory structure is complete\n")
     (format stderr "   and that you are starting festival in the right directory\n")
     (error)))

(set! load-path (cons (path-append cb_cy_cw_dir "../Tokenisation/") load-path))

;;; Do the same for the lexicon and for letter-to-sound rules
(if (not (probe_file (path-append cb_cy_cw_dir "../Lexicon")))
   (begin
     (format stderr "cb_cy_cw: There should be a lexicon in\n")
     (format stderr "   %s\n" (path-append cb_cy_cw_dir "../Lexicon/"))
     (format stderr "   (in the file gogdict.out)\n")
     (format stderr "   Please check that your directory structure is complete\n")
     (format stderr "   and that you are starting festival in the right directory\n")
     (error)))

(set! load-path (cons (path-append cb_cy_cw_dir "../Lexicon/") load-path))

(if (not (probe_file (path-append cb_cy_cw_dir "../LTS")))
   (begin
     (format stderr "cb_cy_cw: Letter-to-sound rules should be present in\n")
     (format stderr "   %s\n" (path-append cb_cy_cw_dir "../LTS/"))
     (format stderr "   (files gogepen.scm, gogwel.scm, gogwelstr.scm)\n")
     (format stderr "   Please check that your directory structure is complete\n")
     (format stderr "   and that you are starting festival in the right directory\n")
     (error)))

(set! load-path (cons (path-append cb_cy_cw_dir "../LTS/") load-path))

;;; Voice specific parameter are defined in each of the following
;;; files
(require 'cb_cy_cw_phoneset)
(require 'cb_cy_cw_tokenizer)
(require 'cb_cy_cw_tagger)
(require 'cb_cy_cw_lexicon)
(require 'cb_cy_cw_phrasing)
(require 'cb_cy_cw_intonation)
(require 'cb_cy_cw_duration)
(require 'cb_cy_cw_f0model)
(require 'cb_cy_cw_other)
;; ... and others as required
;; this is our standard Welsh tokenisation module, in ../../Tokenisation
(require 'welshtoken)

;;;  Ensure we have a festival with the right diphone support compiled in
(require_module 'UniSyn)

(set! cb_cy_cw_lpc_sep 
      (list
       '(name "cb_cy_cw_lpc_sep")
       (list 'index_file (path-append cb_cy_cw_dir "dic/cwdiph.est"))
       '(grouped "false")
       (list 'coef_dir (path-append cb_cy_cw_dir "lpc"))
       (list 'sig_dir  (path-append cb_cy_cw_dir "lpc"))
       '(coef_ext ".lpc")
       '(sig_ext ".res")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

(set! cb_cy_cw_lpc_group 
      (list
       '(name "cw_lpc_group")
       (list 'index_file 
	     (path-append cb_cy_cw_dir "group/cwlpc.group"))
       '(grouped "true")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

;; Go ahead and set up the diphone db
;(set! cb_cy_cw_db_name (us_diphone_init cb_cy_cw_lpc_sep))
;; Once you've built the group file you can comment out the above and
;; uncomment the following.
(set! cb_cy_cw_db_name (us_diphone_init cb_cy_cw_lpc_group))

(define (cb_cy_cw_diphone_fix utt)
"(cb_cy_cw_diphone_fix UTT)
Map phones to phonological variants if the diphone database supports
them."
  (mapcar
   (lambda (s)
     (let ((name (item.name s)))
       (cb_cy_cw_diphone_fix_phone_name utt s)
       ))
   (utt.relation.items utt 'Segment))
  utt)

(define (cb_cy_cw_diphone_fix_phone_name utt seg)
"(cb_cy_cw_fix_phone_name UTT SEG)
Add the feature diphone_phone_name to given segment with the appropriate
name for constructing a diphone.  Basically adds _ if either side is part
of the same consonant cluster, adds $ either side if in different
syllable for preceding/succeeding vowel syllable."
  (let ((name (item.name seg)))
    (cond
     ((string-equal name "pau") t)
     ((string-equal "-" (item.feat seg 'ph_vc))
      (if (and (member_string name '(r w l))
	       (member_string (item.feat seg "p.name") '(p t k b d g))
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (member_string name '(w l m n p t k))
	       (string-equal (item.feat seg "p.name") 's)
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (string-equal name 's)
	       (member_string (item.feat seg "n.name") '(w l m n p t k))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      (if (and (member_string name '(p t k b d g))
	       (member_string (item.feat seg "n.name") '(r w l))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      )
     ((string-equal "ah" (item.name seg))
      (item.set_feat seg "us_diphone" "aa"))

   )))

(define (cb_cy_cw_voice_reset)
  "(cb_cy_cw_voice_reset)
Reset global variables back to previous voice."
  (cb_cy_cw::reset_phoneset)
  (cb_cy_cw::reset_tokenizer)
  (cb_cy_cw::reset_tagger)
  (cb_cy_cw::reset_lexicon)
  (cb_cy_cw::reset_phrasing)
  (cb_cy_cw::reset_intonation)
  (cb_cy_cw::reset_duration)
  (cb_cy_cw::reset_f0model)
  (cb_cy_cw::reset_other)
)

;;;  Full voice definition 
(define (voice_cb_cy_cw_diphone)
"(voice_cb_cy_cw_diphone)
Set speaker to cw in us from cb."
  ;; Select appropriate phone set
  (cb_cy_cw::select_phoneset)

  ;; Select appropriate tokenization
  (cb_cy_cw::select_tokenizer)

  ;; For part of speech tagging
  (cb_cy_cw::select_tagger)

  (cb_cy_cw::select_lexicon)

  (cb_cy_cw::select_phrasing)

  (cb_cy_cw::select_intonation)

  (cb_cy_cw::select_duration)

  (cb_cy_cw::select_f0model)

  ; these must be set to allow anything involving SayText to work
  ; at the moment they're fairly default values
  ; Rhys, Dec 2005 
  (Parameter.set 'Token_Method 'Token_Welsh)
  (Parameter.set 'POS_Method Classic_POS)
  (Parameter.set 'Phrasify_Method Classic_Phrasify)
  (Parameter.set 'Word_Method Classic_Word)
  (Parameter.set 'Pause_Method Classic_Pauses)
  (Parameter.set 'PostLex_Method Classic_PostLex)

(require 'cb_cy_cw_durtreeZ)
  (set! duration_cart_tree cb_cy_cw_duration_cart_tree)
  (set! duration_ph_info cb_cy_cw_durs)
  (Parameter.set 'Duration_Method Duration_Tree_ZScores)
  (Parameter.set 'Duration_Stretch 1.1)

  ;; Waveform synthesizer: UniSyn diphones
  (set! UniSyn_module_hooks (list cb_cy_cw_diphone_fix))
  (set! us_abs_offset 0.0)
  (set! window_factor 1.0)
  (set! us_rel_offset 0.0)
  (set! us_gain 0.9)

  (Parameter.set 'Synth_Method 'UniSyn)
  (Parameter.set 'us_sigpr 'lpc)
  (us_db_select cb_cy_cw_db_name)

  ;; This is where you can modify power (and sampling rate) if desired
  (set! after_synth_hooks nil)
;  (set! after_synth_hooks
;      (list
;        (lambda (utt)
;          (utt.wave.rescale utt 2.1))))

  ;; set callback to restore some original values changed by this voice
  (set! current_voice_reset cb_cy_cw_voice_reset)

  (set! current-voice 'cb_cy_cw_diphone)
)

(proclaim_voice
 'cb_cy_cw_diphone
 '((language english)
   (gender COMMENT)
   (dialect american)
   (description
    "COMMENT"
    )
   (builtwith festvox-1.3)))

(provide 'cb_cy_cw_diphone)
