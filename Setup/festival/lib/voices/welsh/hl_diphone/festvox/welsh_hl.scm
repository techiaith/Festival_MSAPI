;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;                Centre for Speech Technology Research                  ;;
;;;                     University of Edinburgh, UK                       ;;
;;;                         Copyright (c) 1996                            ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Permission to use, copy, modify, distribute this software and its    ;;
;;;  documentation for any purpose is hereby granted without fee,         ;;
;;;  subject to the following conditions:                                 ;;
;;;   1. Redistributions of source code must retain the above copyright   ;;
;;;      notice, this list of conditions and the following disclaimer.    ;;
;;;   2. Redistributions in binary form must reproduce the above          ;;
;;;      copyright notice, this list of conditions and the following      ;;
;;;      disclaimer in the documentation and/or other materials provided  ;;
;;;      with the redistribution.                                         ;;
;;;   3. Neither the name of the University nor the names of its          ;;
;;;      contributors may be used to endorse or promote products derived  ;;
;;;      from this software without specific prior written permission.    ;;
;;;   4. Any modifications must be clearly marked as such.                ;;
;;;   5. Original authors' names, if present, remain.                     ;;
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
(defvar welsh_dir "/projects/festival/voices/welsh/")
(set! load-path (cons welsh_dir load-path))

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
(lex.set.compile.file (string-append welsh_dir "welsh2.out"))
(lex.set.phoneset "welsh")

;;; Phrase breaks
;;;    use punctuation 
(set! welsh_phrase_cart_tree
'
((Token.punc in ("'" "\"" "?" "." "," ":" ";"))
  ((B))
  ((n.name is 0)
   ((B))
   ((NB)))))

;; Load in the letter to sound rules
(require 'newepen)
(require 'newwelstr)
(require 'newwel)

(define (welsh_lts word features)
  "(welsh_lts WORD FEATURES)
Using various letter to sound rules build a welsh pronunciation of 
WORD."
  (let (epen str wel)
    (set! epen (lts.apply (downcase word) 'newepen))
    (set! str (lts.apply epen 'newwelstr))
    (set! wel (lts.apply str 'newwel))
    (list word
	  nil
	  (lex.syllabify.phstress wel))))

(lex.set.lts.method 'function)

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
    ((Syllable.syl_break is 0) ;; word internal break
     ((ph_syllabic is +)
      ((0.75))
      ((1.0)))
     ((Syllable.syl_break is 1) ;; word final
      ((Syllable.p.syl_break is 0)  ;; poly-syllabic
       ((1.2))
       ((Syllable.stress is 1)  ;; stressed monosyllable
	((1.10))
	((1.0))))
      ((Syllable.syl_break is 3) ;; clause final
       ((1.5))
       ((Syllable.syl_break is 4) ;; utterance final
	((1.5))
	((1.0))))))      ;; don't think it ever gets here 
    ;; Consonant
    ((coda is 1)
     ((Syllable.stress is 1)
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
  ((Word.pos is fn)
   ((NONE))
   ((position_type is single)
    ((Accented))
    ((p.stress is 1)
     ((p.syl_break is 0)
      ((Accented))
      ((NONE)))
     ((NONE))))))

;;;  Diphone set up 
(define (setup_welsh_diphones)
  (Taylor_Init
   '(
     (SPEAKER hl)
     (PHONESET welsh)
     (SAMPLE_RATE 10000)
     (ALL_PATH /data/diphone/welsh/hl/)
     (VOX_PATH /data/diphone/welsh/hl/VOX/)
     (PM_PATH /data/diphone/welsh/hl/PM/)
     (DIC_NAME /data/diphone/welsh/hl/DICT/masterindex)
     (MAX_DIPHONES 2828)
     (AVAILABLE_DIPHONES 2828)
     (DIPHONE_TYPE WAVEFORM)
     (DIPHONE_STORAGE SEPARATE)
     (DIPHONE_OFFSET 400)
     (VOX_HEADER_SIZE 496)
     (BIT_SIZE 16))))

;; Go ahead and set up the diphone db
(setup_welsh_diphones)

;;;  Full voice definition 
(define (voice_welsh_hl)
"(voice_welsh_hl_diphone)
Set up synthesis for Male Welsh speaker: HL"
  (Parameter.set 'Language 'welsh)
  ;; Phone set
  (Parameter.set 'PhoneSet 'welsh)
  (PhoneSet.select 'welsh)
  ;; No pos prediction (get it from lexicon)
  (set! pos_lex_name nil)
  ;; Lexicon selection
  (lex.select "welsh")
  (set! lex_user_unknown_word welsh_lts)
  ;; Phrase break prediction by punctuation
  (set! phrase_cart_tree welsh_phrase_cart_tree)
  (Parameter.set 'Phrase_Method 'cart_tree)
  ;; Accent and tone prediction
  (set! int_accent_cart_tree welsh_accent_cart_tree)
  (set! int_simple_params
	'((f0_mean 140) (f0_std 70)))
  (Parameter.set 'Int_Method 'Simple)
  (Parameter.set 'Int_Target_Method 'Simple)
  ;; Duration prediction
  (set! duration_cart_tree welsh_dur_tree)
  (set! duration_ph_info welsh_hl_phone_data)
  (Parameter.set 'Duration_Method 'Tree_ZScores)
  ;  (set! phoneme_durations welsh_hl_av_durs)
  ; (Parameter.set 'Duration_Method 'Averages)
  ;; Waveform synthesizer: diphones
  (Parameter.set 'Synth_Method 'Taylor)
  (Taylor.select 'hl)

  ;; Change sample rate to 16k as some devices don't support 10k
  (set! synth_hooks 
	(lambda (utt) 
	  (utt.wave.resample utt 16000)
	  (utt.wave.rescale utt 1.9)))

  'welsh_hl
)

(provide 'welsh_hl)
