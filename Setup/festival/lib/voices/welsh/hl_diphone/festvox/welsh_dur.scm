;;;
;;;  Copying the rules create by Briony Williams for Welsh into
;;;  a format Festivalk can use.  These rules were Klatt like and
;;;  hence multiplied an average by a factor
;;;

(set! welsh_dur_tree
 '(
   ((ph_vc is +)  ;; a vowel
    ;; Determine what is after this word
    ((Syllable.syl_break is 0) ;; word internal break
     ((ph_longvowel is +)
      ((0.75))
      ((1.0)))
     ((Syllable.syl_break is 1) ;; word final
      ((Syllable.p.syl_break is 0)  ;; poly-syllabic
       ((1.75))
       ((Syllable.stress is 1)  ;; stressed monosyllable
	((1.10))
	((1.0))))
      ((Syllable.syl_break is 3) ;; clause final
       ((2.0))
       ((Syllable.syl_break is 4) ;; word final
	((3.0))
	((1.0))))))      ;; don't think it ever gets here 
    ;; Consonant
    ((coda is 1)
     ((Syllable.stress is 1)
      ((2.0))  ;; post stress consonant rule
      ((1.0)))
     ((1.0))))))
