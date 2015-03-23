;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-*-mode:scheme-*-
;;;                                                                       ;;
;;;                            [SOMEBODY]                                 ;;
;;;                         Copyright (c) 2000                            ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Distribution policy                                                  ;;
;;;     [CHOOSE ONE OF]                                                   ;;
;;;     Free for any use                                                  ;;
;;;     Free for non commercial use                                       ;;
;;;     something else                                                    ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  An example diphone voice
;;;
;;;  Authors: [The people who did the work]
;;;

;;; Try to find out where we are
(if (assoc 'INST_cy_SPKR_diphone voice-locations)
    (defvar INST_cy_SPKR_dir 
      (cdr (assoc 'INST_cy_SPKR_diphone voice-locations)))
    ;;; Not installed in Festival yet so assume running in place
    (defvar INST_cy_SPKR_dir (pwd)))

(if (not (probe_file (path-append INST_cy_SPKR_dir "festvox/")))
    (begin
     (format stderr "INST_cy_SPKR: Can't find voice scm files they are not in\n")
     (format stderr "   %s\n" (path-append INST_cy_SPKR_dir "festvox/"))
     (format stderr "   Either the voice isn't linked into Festival\n")
     (format stderr "   or you are starting festival in the wrong directory\n")
     (error)))

;;;  Add the directory contains general voice stuff to load-path
(set! load-path (cons (path-append INST_cy_SPKR_dir "festvox/") load-path))
(set! load-path (cons (path-append INST_cy_SPKR_dir "../Tokenisation/") load-path))

;;; Voice specific parameter are defined in each of the following
;;; files
(require 'INST_cy_SPKR_phoneset)
(require 'INST_cy_SPKR_tokenizer)
(require 'INST_cy_SPKR_tagger)
(require 'INST_cy_SPKR_lexicon)
(require 'INST_cy_SPKR_phrasing)
(require 'INST_cy_SPKR_intonation)
(require 'INST_cy_SPKR_duration)
(require 'INST_cy_SPKR_f0model)
(require 'INST_cy_SPKR_other)
;; ... and others as required
(require 'welshtoken)

;;;  Ensure we have a festival with the right diphone support compiled in
(require_module 'UniSyn)

(set! INST_cy_SPKR_lpc_sep 
      (list
       '(name "INST_cy_SPKR_lpc_sep")
       (list 'index_file (path-append INST_cy_SPKR_dir "dic/SPKRdiph.est"))
       '(grouped "false")
       (list 'coef_dir (path-append INST_cy_SPKR_dir "lpc"))
       (list 'sig_dir  (path-append INST_cy_SPKR_dir "lpc"))
       '(coef_ext ".lpc")
       '(sig_ext ".res")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

(set! INST_cy_SPKR_lpc_group 
      (list
       '(name "SPKR_lpc_group")
       (list 'index_file 
	     (path-append INST_cy_SPKR_dir "group/SPKRlpc.group"))
       '(grouped "true")
       (list 'default_diphone 
	     (string-append
	      (car (cadr (car (PhoneSet.description '(silences)))))
	      "-"
	      (car (cadr (car (PhoneSet.description '(silences)))))))))

;; Go ahead and set up the diphone db
(set! INST_cy_SPKR_db_name (us_diphone_init INST_cy_SPKR_lpc_sep))
;; Once you've built the group file you can comment out the above and
;; uncomment the following.
;(set! INST_cy_SPKR_db_name (us_diphone_init INST_cy_SPKR_lpc_group))

(define (INST_cy_SPKR_diphone_fix utt)
"(INST_cy_SPKR_diphone_fix UTT)
Map phones to phonological variants if the diphone database supports
them."
  (mapcar
   (lambda (s)
     (let ((name (item.name s)))
       (INST_cy_SPKR_diphone_fix_phone_name utt s)
       ))
   (utt.relation.items utt 'Segment))
  utt)

(define (INST_cy_SPKR_diphone_fix_phone_name utt seg)
"(INST_cy_SPKR_fix_phone_name UTT SEG)
Add the feature diphone_phone_name to given segment with the appropriate
name for constructing a diphone.  Basically adds _ if either side is part
of the same consonant cluster, adds $ either side if in different
syllable for preceding/succeeding vowel syllable."
  (let ((name (item.name seg)))
    (cond
     ((string-equal name "pau") t)
     ((string-equal "-" (item.feat seg 'ph_vc))
      (if (and (member_string name '(r w j l))
	       (member_string (item.feat seg "p.name") '(p t k b d g))
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (member_string name '(w j l m n p t k))
	       (string-equal (item.feat seg "p.name") 's)
	       (item.relation.prev seg "SylStructure"))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (string-equal name 's)
	       (member_string (item.feat seg "n.name") '(w j l m n p t k))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      (if (and (string-equal name 'hh)
	       (string-equal (item.feat seg "n.name") 'j))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      (if (and (string-equal name 'j)
	       (string-equal (item.feat seg "p.name") 'hh))
	  (item.set_feat seg "us_diphone_right" (format nil "_%s" name)))
      (if (and (member_string name '(p t k b d g))
	       (member_string (item.feat seg "n.name") '(r w j l))
	       (item.relation.next seg "SylStructure"))
	  (item.set_feat seg "us_diphone_left" (format nil "%s_" name)))
      )
     ((string-equal "ah" (item.name seg))
      (item.set_feat seg "us_diphone" "aa"))

   )))

(define (INST_cy_SPKR_voice_reset)
  "(INST_cy_SPKR_voice_reset)
Reset global variables back to previous voice."
  (INST_cy_SPKR::reset_phoneset)
  (INST_cy_SPKR::reset_tokenizer)
  (INST_cy_SPKR::reset_tagger)
  (INST_cy_SPKR::reset_lexicon)
  (INST_cy_SPKR::reset_phrasing)
  (INST_cy_SPKR::reset_intonation)
  (INST_cy_SPKR::reset_duration)
  (INST_cy_SPKR::reset_f0model)
  (INST_cy_SPKR::reset_other)
)

;;;  Full voice definition 
(define (voice_INST_cy_SPKR_diphone)
"(voice_INST_cy_SPKR_diphone)
Set speaker to SPKR in cy from INST."
  ;; Select appropriate phone set
  (INST_cy_SPKR::select_phoneset)

  ;; Select appropriate tokenization
  (INST_cy_SPKR::select_tokenizer)

  ;; For part of speech tagging
  (INST_cy_SPKR::select_tagger)

  (INST_cy_SPKR::select_lexicon)

  (INST_cy_SPKR::select_phrasing)

  (INST_cy_SPKR::select_intonation)

  (INST_cy_SPKR::select_duration)

  (INST_cy_SPKR::select_f0model)

  ;; Waveform synthesizer: UniSyn diphones
  (set! UniSyn_module_hooks (list INST_cy_SPKR_diphone_fix))
  (set! us_abs_offset 0.0)
  (set! window_factor 1.0)
  (set! us_rel_offset 0.0)
  (set! us_gain 0.9)

  (Parameter.set 'Synth_Method 'UniSyn)
  (Parameter.set 'us_sigpr 'lpc)
  (us_db_select INST_cy_SPKR_db_name)

  ;; This is where you can modify power (and sampling rate) if desired
  (set! after_synth_hooks nil)
;  (set! after_synth_hooks
;      (list
;        (lambda (utt)
;          (utt.wave.rescale utt 2.1))))

  ;; set callback to restore some original values changed by this voice
  (set! current_voice_reset INST_cy_SPKR_voice_reset)

  (set! current-voice 'INST_cy_SPKR_diphone)
)

(proclaim_voice
 'INST_cy_SPKR_diphone
 '((language english)
   (gender COMMENT)
   (dialect american)
   (description
    "COMMENT"
    )
   (builtwith festvox-1.3)))

(provide 'INST_cy_SPKR_diphone)
