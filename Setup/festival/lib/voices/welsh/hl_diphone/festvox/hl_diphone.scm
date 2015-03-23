;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;                Centre for Speech Technology Research                  ;;
;;;                     University of Edinburgh, UK                       ;;
;;;                      Copyright (c) 1996-1999                          ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Permission to use, copy, modify, distribute this software and its    ;;
;;;  documentation for research, educational and individual use only, is  ;;
;;;  hereby granted without fee, subject to the following conditions:     ;;
;;;   1. The code must retain the above copyright notice, this list of    ;;
;;;      conditions and the following disclaimer.                         ;;
;;;   2. Any modifications must be clearly marked as such.                ;;
;;;   3. Original authors' names are not deleted.                         ;;
;;;  This software may not be used for commercial purposes without        ;;
;;;  specific prior written permission from the authors.                  ;;
;;;                                                                       ;;
;;;  THE UNIVERSITY OF EDINBURGH AND THE CONTRIBUTORS TO THIS WORK        ;;
;;;  DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      ;;
;;;  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   ;;
;;;  SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE     ;;
;;;  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    ;;
;;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   ;;
;;;  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          ;;
;;;  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       ;;
;;;  THIS SOFTWARE.                                                       ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  A Welsh synthesizer using the Osprey Welsh synthesizer as a model
;;;  
;;;  This is mostly Briony Williams' work, ported to Festvial by awb
;;;

;;;  Add the directory contains general welsh stuff to load-path
(defvar hl_diphone_dir (cdr (assoc 'hl_diphone voice-locations)))
(set! load-path (cons (string-append hl_diphone_dir "festvox/") load-path))
(set! load-path (cons (string-append hl_diphone_dir "../Tokenisation/") load-path))

;;;  The Welsh phoneme set
(defPhoneSet
  welsh
  ;;;  Phone Features
  ;;;  Taken from table at start of klatt_durs.h.bw
  ((fricative + -)
   (plosive + -)
   (obstruent + -)
   (nasal + -)
   (liqglide + -)
   (vc + -)
   (syllabic + -)
   (sonorant + -)
   (vox + -)
   )
  ;; Phone set members
  (
   ;;   Fricative Vowel
   ;;     Plosive   Syll
   ;;       obstruent Sonoranr
   ;;         nasal     Voicing
   ;;           liqglide
   (@   - - - - - + - + +)
   (@@  - - - - - + + + +)
   (@i  - - - - - + + + +)
   (@u  - - - - - + + + +)
   (a   - - - - - + - + +)
   (aa  - - - - - + + + +)
   (ai  - - - - - + + + +)
   (au  - - - - - + + + +)
   (e   - - - - - + - + +)
   (ee  - - - - - + + + +)
   (eu  - - - - - + + + +)
   (i   - - - - - + - + +)
   (ii  - - - - - + + + +)
   (iu  - - - - - + + + +)

   (o   - - - - - + - + +)
   (oa  - - - - - + + + +)
   (oi  - - - - - + + + +)
   (oo  - - - - - + + + +)
   (u   - - - - - + - + +)
   (ui  - - - - - + + + +)
   (uu  - - - - - + + + +)

   (b   - + + - - - - - +)
   (ch  - + + - - - - - -)
   (d   - + + - - - - - +)
   (dh  + - + - - - - - +)
   (f   + - + - - - - - -)
   (g   - + + - - - - - +)
   (h   + - + - - - - - -)
   (j   - - - - + - - + +)
   (jh  - + + - - - - - +)

   (k   - + + - - - - - -)
   (l   - - - - + - - + +)
   (lh  + - + - - - - - -)
   (lw  - - - - + - - + +)
   (m   - - - + - - - + +)
   (mh  + - + + - - - + -)
   (n   - - - + - - - + +)
   (ng  - - - + - - - + +)
   (ngh + - + + - - - + -)
   (nh  + - + + - - - + -)
   (nw  - - - + - - - + +)
   (p   - + + - - - - - -)

   (r   - - - - + - - + +)
   (rh  + - + - + - - - -)
   (rw  - - - - + - - + +)
   (s   + - + - - - - - -)
   (sh  + - + - - - - - -)
   (t   - + + - - - - - -)
   (th  + - + - - - - - -)
   (v   + - + - - - - - +)
   (w   - - - - + - - + +)
   (x   + - + - - - - - -)
   (z   + - + - - - - - +)
   (zh  + - + - - - - - +)
   (#   - - - - - - - - -)
   ))
(PhoneSet.silences '(#))

;;;  A welsh dictionary
(lex.create "welsh")
(lex.set.compile.file (string-append hl_diphone_dir "lex/welsh2.out"))
(lex.set.phoneset "welsh")

;; Load in the letter to sound rules
(require 'hwntepen)
(require 'hwntwelstr)
(require 'hwntwel)

(lex.add.entry '("," punc ()))
(lex.add.entry '("." punc ()))

;; This has been edited, based on the current template for
;; LTS rules in festvox (cb_cy_cw_lexicon.scm)
;; Rhys Jones, Dec 2005

(define (welsh_lts word features)
  "(welsh_lts WORD FEATURES)
Using various letter to sound rules build a Welsh pronunciation of 
WORD. This function is only called if a word has not been found in lexicon."
;; (format stderr "couldn't find pronunciation for %s in lexicon\n" word)
  (if (lts.in.alphabet word 'hwntepen)
    (let (epen str wel)
      (set! epen (lts.apply (downcase word) 'hwntepen))
      (set! str (lts.apply epen 'hwntwelstr))
      (set! wel (lts.apply str 'hwntwel))
      (list word
	  nil
	  (lex.syllabify.phstress wel)))
      (begin
          (format stderr "unpronuncable word %s\n" word)
          ;; this is a 'word' used when pronunciation is unknown
          '("yy" nil (((@@) 0)))))
)

;; Load in the tokenisation file
(require 'welshtoken)

(lex.set.lts.method 'welsh_lts)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Duration means (and stdevs)
;;;  As Klatt like rules produce a factor to multiply the average
;;;  we can get that effect by using the Tree_ZScores Duration_Method
;;;  This is achieve by setting the "average" field to 0 and the "stddev"
;;;  field to the actuall average thus (aver + zscore*stddev) is the
;;;  same as (0 + ave * factor)
;;;  The tree was converted by awb from Briony's code, there's no
;;;  guarantee I got it right.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set! welsh_dur_tree
 '
   ((ph_vc is +)  ;; a vowel
    ;; Determine what is after this word
    ((R:SylStructure.parent.syl_break is 0) ;; word internal break
     ((ph_syllabic is +)
      ((0.75))
      ((1.0)))
     ((R:SylStructure.parent.syl_break is 1) ;; word final
      ((R:SylStructure.parent.R:Syllable.p.syl_break is 0)  ;; poly-syllabic
       ((1.2))
       ((R:SylStructure.parent.R:Syllable.stress is 1) ;; stressed monosyllable
	((1.10))
	((1.0))))
      ((R:SylStructure.parent.syl_break is 3) ;; clause final
       ((1.5))
       ((R:SylStructure.parent.syl_break is 4) ;; utterance final
	((1.5))
	((1.0))))))      ;; don't think it ever gets here 
    ;; Consonant
    ((coda is 1)
     ((R:SylStructure.stress is 1)
      ((1.0))  ;; post stress consonant rule
      ((1.0)))
     ((1.0)))))

(set! welsh_hl_phone_data
      '(
        (@ 0.0 0.065)
        (@@ 0.0 0.225)
        (@i 0.0 0.197)
        (@u 0.0 0.189)
        (a 0.0 0.123)
        (aa 0.0 0.196)
        (ai 0.0 0.222)
        (au 0.0 0.250)
        (e 0.0 0.102)
        (ee 0.0 0.207)
        (eu 0.0 0.237)
        (i 0.0 0.155)
        (ii 0.0 0.195)
        (iu 0.0 0.218)

        (o 0.0 0.108)
        (oa 0.0 0.154)
        (oi 0.0 0.224)
        (oo 0.0 0.218)
        (u 0.0 0.094)
        (ui 0.0 0.224)
        (uu 0.0 0.220)

        (b 0.0 0.077)
        (ch 0.0 0.166)
        (d 0.0 0.083)
        (dh 0.0 0.072)
        (f 0.0 0.131)
        (g 0.0 0.070)
        (h 0.0 0.115)
        (j 0.0 0.089)
        (jh 0.0 0.122)

        (k 0.0 0.119)
        (l 0.0 0.073) ;; Edited from 63 on 9.12.94
        (lh 0.0 0.147)
        (lw 0.0 0.116)
        (m 0.0 0.067)
        (mh 0.0 0.176)
        (n 0.0 0.104)
        (ng 0.0 0.118)
        (ngh 0.0 0.182)
        (nh 0.0 0.167)
        (nw 0.0 0.119)
        (p 0.0 0.128)

        (r 0.0 0.077)
        (rh 0.0 0.116)
        (rw 0.0 0.134)
        (s 0.0 0.133)
        (sh 0.0 0.137)
        (t 0.0 0.155)
        (th 0.0 0.146)
        (v 0.0 0.096)
        (w 0.0 0.090)
        (x 0.0 0.145)
        (z 0.0 0.093)
        (zh 0.0 0.086)
        (# 0.0 0.250)
))

;;; Intonation
;;; Add accents on monosyllabic function words, and on the syllable
;;; following the stressed syllable.

(set! welsh_accent_cart_tree
 '
  ((R:SylStructure.parent.pos is fn)
   ((NONE))
   ((position_type is single)
    ((Accented))
    ((p.stress is 1)
     ((p.syl_break is 0)
      ((Accented))
      ((NONE)))
     ((NONE))))))

(define (welsh_targ_func1 utt syl )
 "Target function for accents"
  (let ((start (item.feat syl 'syllable_start))
        (end (item.feat syl 'syllable_end))
        (ulen (item.feat (utt.relation.last utt 'Segment ) 'segment_end))
        nstart nend fustart fuend fuend fstart fend)
    (set! nstart (/ start ulen))
    (set! nend (/ end ulen))
    (set! fustart '140)
    (set! fuend   '100)
    (set! fstart  (+ (* (- fuend fustart) nstart) fustart))
    (set! fend    (+ (* (- fuend fustart) nend) fustart))

    (cond
      ((equal? (item.feat syl "R:Intonation.daughter1.name") "Accented")
       (list
        (list start fstart)
;	(list (/ (+ start end) 2) (+ fstart 20))
        (list (+ start 0.010) (+ fstart 70 ))
        (list (- end   0.010) (+ fstart 50 ))   
        (list end   fend) 
	))
      ((not (item.next syl))
       (list
	(list end (- fuend 10))))
      ((not (item.prev syl))
       (list
	(list start fustart)))
      (t
       nil))))


(set! hl_lpc_sep 
      (list
       '(name "hl_lpc_sep")
       (list 'index_file (path-append hl_diphone_dir "dic/diphdic.est"))
       '(grouped "false")
       (list 'coef_dir (path-append hl_diphone_dir "lpc"))
       (list 'sig_dir  (path-append hl_diphone_dir "lpc"))
       '(coef_ext ".lpc")
       '(sig_ext ".res")
       '(default_diphone "@-@")))

(set! hl_lpc_group 
      (list
       '(name "hl_lpc_group")
       (list 'index_file 
	     (path-append hl_diphone_dir "group/hllpc10k.group"))
       '(grouped "true")
       '(default_diphone "@-@")))

;; Go ahead and set up the diphone db
(set! hl_db_name (us_diphone_init hl_lpc_group))

(define (welsh_voice_reset)
  "(welsh_voice_reset)
Reset global variables back to previous voice."
  t
  (set! token.prepunctuation cstr_wl_hl_prev_token_prepunc)
  (set! token.punctuation cstr_wl_hl_prev_token_punc)
  
)

;;;  Full voice definition 
(define (voice_hl_diphone)
"(voice_welsh_hl_diphone)
Set up synthesis for Male Welsh speaker: HL"
  (voice_reset)

  (format t "do do \n")
  (set! cstr_wl_hl_prev_token_prepunc token.prepunctuation)
  (set! cstr_wl_hl_prev_token_punc token.punctuation)
  (set! token.prepunctuation "\"")
  (set! token.punctuation ".,")
  (set! token_to_words welsh_token_to_words)

  (Parameter.set 'Language 'welsh)
  ;; Phone set
  (Parameter.set 'PhoneSet 'welsh)
  (PhoneSet.select 'welsh)
  ;; No pos prediction (get it from lexicon)
  (set! pos_lex_name nil)
  ;; Set UTF-8 translation
  (set! pre_token_hooks welsh_translit_utt utt) 
  ;; Lexicon selection
  (lex.select "welsh")
  ;; Phrase break prediction by punctuation
  (require 'phrase)
  (set! phrase_cart_tree simple_phrase_cart_tree)
  (Parameter.set 'Phrase_Method 'cart_tree)
  ;; Accent and tone prediction
  (set! int_accent_cart_tree welsh_accent_cart_tree)
  (set! int_simple_params
	'((f0_mean 140) (f0_std 70)))
  (Parameter.set 'Int_Target_Method 'Simple)
  (Parameter.set 'Int_Method 'General)
  (set! int_general_params (list (list 'targ_func welsh_targ_func1)))
  ;; Duration prediction
  (set! duration_cart_tree welsh_dur_tree)
  (set! duration_ph_info welsh_hl_phone_data)
  (Parameter.set 'Duration_Method 'Tree_ZScores)

  ;; Unisyn diphone synthesizer
  (Parameter.set 'Synth_Method 'NONE)
  (set! UniSyn_module_hooks nil)
  (set! us_abs_offset 0.0)
  (set! window_factor 1.0)
  (set! us_rel_offset 0.0)
  (set! us_gain 0.9)

  (Parameter.set 'Synth_Method 'UniSyn)
  (Parameter.set 'us_sigpr 'lpc)
  (us_db_select hl_db_name)

  ;; Sampling rate change to 16k has been reverted as this is not always reliable in Festival
  (set! after_synth_hooks 
	(lambda (utt) 
;	  (utt.wave.resample utt 16000)
	  (utt.wave.rescale utt 1.9)))

  (set! current_voice_reset welsh_voice_reset)

  (set! current-voice 'hl_diphone)
)

(proclaim_voice
 'hl_diphone
 '((language welsh)
   (gender male)
;;   (dialect ????)
   (description
    "This voice provides a Welsh male voice using a residual excited LPC 
     diphone synthesis method.  The lexicon consists of a set of around
     20,000 words and letter to sound rules to deal with the rest.
     The durations, intonation and prosodic phrasing are minimal but are 
     acceptable for simple examples.")))

(provide 'hl_diphone)

