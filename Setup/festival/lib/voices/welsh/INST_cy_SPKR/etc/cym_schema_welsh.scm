 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                     ;;;
;;;                     Carnegie Mellon University                      ;;;
;;;                  and Alan W Black and Kevin Lenzo                   ;;;
;;;                      Copyright (c) 1998-2000                        ;;;
;;;                        All Rights Reserved.                         ;;;
;;;                                                                     ;;;
;;; Permission is hereby granted, free of charge, to use and distribute ;;;
;;; this software and its documentation without restriction, including  ;;;
;;; without limitation the rights to use, copy, modify, merge, publish, ;;;
;;; distribute, sublicense, and/or sell copies of this work, and to     ;;;
;;; permit persons to whom this work is furnished to do so, subject to  ;;;
;;; the following conditions:                                           ;;;
;;;  1. The code must retain the above copyright notice, this list of   ;;;
;;;     conditions and the following disclaimer.                        ;;;
;;;  2. Any modifications must be clearly marked as such.               ;;;
;;;  3. Original authors' names are not deleted.                        ;;;
;;;  4. The authors' names are not used to endorse or promote products  ;;;
;;;     derived from this software without specific prior written       ;;;
;;;     permission.                                                     ;;;
;;;                                                                     ;;;
;;; CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK        ;;;
;;; DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     ;;;
;;; ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  ;;;
;;; SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE     ;;;
;;; FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   ;;;
;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  ;;;
;;; AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         ;;;
;;; ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      ;;;
;;; THIS SOFTWARE.                                                      ;;;
;;;                                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;  Scheme for a set of diphones                               ;;
;;;  Inspired by Steve Isard's diphone schemas from CSTR, University of   ;;
;;;  Edinburgh                                                            ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; A diphone list for (North) Welsh for the WISPR project
;;; Briony Williams, August 2005


;; All v's and c's except:  zh oa @@
;; yod-plus-vowel combinations: only before nonhigh vowels (Eng /j uu, j u/ --> Welsh /yu/
;; xx is a dummy used to signal word break in orthographic conversion

(set! vowels '(i e a o u y @ ii ee aa oo uu yy ei ai oi iu eu au ou uy yu ay aay ey oy ))
(set! vshort '(i e a o u y ))
(set! vschwa '(@))
(set! vlong '(ii ee aa oo uu yy ei ai oi iu eu au ou uy yu ay aay ey oy ))

(set! conss '(p t k b d g f v th dh s sh r l m n ng ch jh lh x w j mh nh ngh lw nw rw rh hh z xx ))
(set! onset-only '(hh j w mh nh ngh rh lw nw rw xx))
(set! coda-only '(xx))
(set! silence '#)

;; "nocvcs" C's used only in separate VC and CV contexts, so no "t aa j i j ay", "t aa rh i rh ay"
;;  Other cons's are used in CVC context only
(set! nocvcs '(mh nh ngh ng rh lw nw rw w j xx))

;; Palatal glide (yod) only before nonhigh vowels in Welsh - treated separately from other "nocvcs"
;;  i.e. NOT: i u y @ ii uu yy iu uy yu
;; of the above, these are needed for English: i u @ ii uu oa @@ (covered in "newgp9" files)
(set! yodvowels '(e a o ee aa oo ei ai oi eu au ou ay aay ey oy ))
(set! yod '(j))
(set! kludge '(j xx))


;;; Syllable-initial consonant clusters
(set! stops '(p t k b d g))
(set! vlessstops '(p t k))
(set! nasals '(m n ng))
(set! liquids '(l r w))
(set! lr '(l r))

;; clusters1:  
;; ---------
;; Syllable-initial consonant clusters with possible devoicing of the liquid or
;;   non-aspiration of the post-s stop
;;
;; One of [p t k b d g] plus one of [l r w]
;; s  plus one of [p t k l w n m] 
;; f plus one of [l r]
(set! clusters1
      (append
        (apply
	 append
          (mapcar (lambda (b) (mapcar (lambda (a) (list a b)) stops)) liquids))	
          (mapcar (lambda (b) (list 's b)) '(p t k l w n m))       
          (mapcar (lambda (b) (list 'f b)) '(l r ))
        ))          


;; clusters2:  English words only 1: j (followed by /uu/)
;; ---------
;;              (doesn't occur in Welsh:  /iu/ used instead)
;; one of [p t k b d g] plus j (occurring with following /uu, u, @, @@/ only)
;; one of [m n ng] plus  j (occurring with following /uu, u, @, @@/ only)
;; one of [f mh th nh x ngh v dh] plus j (for mutated forms of English words)
;; one of [s f v hh] plus  j (occurring with following /uu, u, @, @@/ only)
;;;;(set! clusters2
;;;;      (mapcar (lambda (b) (list b 'j))  
;;;;         (append stops nasals '(f mh th nh x ngh v dh) '(s f v hh))))
;; clusters3: English only 2: w
;; ---------
;;            (doesn't occur in Welsh:  /uy/ used instead)
;; one of [p t b d f s sh th m] plus w
;; one of [mh nh v dh n] plus w (for mutated forms of English words)
;;(set! clusters3
;;;;       (mapcar (lambda (b) (list 'p b)) '(w))
;;;;       (mapcar (lambda (b) (list 't b)) '(w))
;;;;       (mapcar (lambda (b) (list 'b b)) '(w))
;;;;       (mapcar (lambda (b) (list 'd b)) '(w))
;;;;       (mapcar (lambda (b) (list 'f b)) '(w))
;;;;       (mapcar (lambda (b) (list 's b)) '(w))
;;;;       (mapcar (lambda (b) (list 'sh b)) '(w))
;;;;       (mapcar (lambda (b) (list 'th b)) '(w))
;;;;       (mapcar (lambda (b) (list 'm b)) '(w))       
;;;;       (mapcar (lambda (b) (list '(mh nh v dh n) b)) '(w)))


;;; carrier phrases

;; CVC:  e.g. # @ xx p i p ay #
(set! cvc-carrier '((# @ xx ) (ay #)))

;; VC:   e.g. # d @ d a p ay #
(set! vc-carrier '((# d @ d) (ay #)))

;; VshortC:   e.g. # d @ d i xx p ay #
(set! vshortc-carrier '((# d @ d) (ay #)))

;; VschwaC:   e.g. # d @ xx p ay #
(set! vschwac-carrier '((# d) (ay #)))

;; VlongC:   e.g. # @ xx d ii - p ay #
(set! vlongc-carrier '((# @ xx d) (ay #)))

;; CV:   e.g. # @ xx p i d ay #
(set! cv-carrier '((# @ xx) (d ay #)))

;; CC:   e.g. # @ xx d a p k a d #
(set! cc-carrier '((# @ xx d a ) (a d #)))

;; VshortVshort:   e.g. # d @ d i xx o t #
(set! vshortvshort-carrier '((# d @ d) (t #)))

;; VshortVschwa:   e.g. # d @ d i xx @ d y #
(set! vshortvschwa-carrier '((# d @ d) (d y #)))

;; VshortVlong:    e.g. # d @ d i xx oo d #
(set! vshortvlong-carrier '((# d @ d) (d #)))

;; VschwaVshort:   e.g. # d @ xx o t #
(set! vschwavshort-carrier '((# d) (t #)))

;; VschwaVschwa:   e.g. # d @ @ d y #
(set! vschwavschwa-carrier '((# d) (d y #)))

;; VschwaVlong:   e.g. # d @ oo d #
(set! vschwavlong-carrier '((# d) (d #)))

;; VlongVshort:   e.g. # @ n xx d ii - i t #
(set! vlongvshort-carrier '((# @ n xx d) (t #)))

;; VlongVschwa:   e.g. # @ n xx d ii - @ d y #
(set! vlongvschwa-carrier '((# @ n xx d) (d y #)))

;; VlongVlong:   e.g. # @ n xx d ii - oo d #
(set! vlongvlong-carrier '((# @ n xx d) (d #)))

;; #V:   e.g. # i d ay #
(set! silv-carrier '(() (d ay #)))

;; #C:   e.g. # p a d ay #
(set! silc-carrier '(() (a d ay #)))

;; V#:   e.g. # @ xx t a d i #
(set! vsil-carrier '((# @ xx t a d ) ()))

;; C#:   e.g. # @ xx t a p #
(set! csil-carrier '((# @ xx t a) ()))


;;; Syllable splits: force syllable-initial cons cluster

;; t aa p - r aa t ay versus  t aa - p r aa t ay
;; Without hyphen:  t aa p . r aa t ay (i.e. cc-carrier)
;; With hyphen (as here):  @ xx t aa . p r aa t ay
(set! cc1-carrier '((# @ xx t aa -) (aa t ay #)))

;; for t aa - p _j_ uw t ay 
;; Use /uu/ vowel after /j/
;;;;;English only (set! cc2-carrier '((# t aa -) (uu t ay #)))

;; t aa p - r aa t ay versus  t aa - p r aa t ay
;; Without hyphen:  t aa p . r aa t ay (i.e. cc-carrier)
;; With hyphen (as here):  @ xx t aa . p r aa t ay
;;;;English only(set! cc3-carrier '((# @ xx t aa -) (aa t ay #)))

;; t aa p - r aa t ay versus  t aa - p r aa t ay
;; Without hyphen:  t aa p . r aa t ay (i.e. cc-carrier)
;; With hyphen (as here):  @ xx t aa . p r aa t ay
;;;;;(set! cc4-carrier '((# @ xx t aa -) (aa t ay #)))

;;; VC open vowels (syllable break after vowel) plus following syll-init cons
;;     e.g. # @ xx t aa t i - p ay #
(set! vcopen-carrier '((# @ xx t aa t) (ay #)))


;;; These functions simply fill out the nonsense words
;;; from the carriers and vowel/consonant definitions

(define (list-cvcs)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append c "-" v) (string-append v "-" c))
	  (append (car cvc-carrier) (list c v c) (car (cdr cvc-carrier)))))
       (remove-list conss nocvcs)))
    vowels)))

(define (list-vshortcs)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vshortc-carrier) (list v 'xx c) (car (cdr vshortc-carrier)))))
       (remove-list nocvcs kludge)))
    vshort)))

(define (list-vschwacs)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vschwac-carrier) (list v 'xx c) (car (cdr vschwac-carrier)))))
       (remove-list nocvcs kludge)))
    vschwa)))   
    
(define (list-vlongcs)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vlongc-carrier) (list v '- c) (car (cdr vlongc-carrier)))))
       (remove-list nocvcs kludge)))
    vlong)))    

;;(define (list-vyod)
;;  (apply
;;   append
;;   (mapcar
;;    (lambda (v)
;;      (mapcar
;;       (lambda (c)
;;	 (list
;;	  (list (string-append v "-" c))
;;	  (append (car vc-carrier) (list v 'xx c) (car (cdr vc-carrier)))))
;;       yod))
;;    vowels)))

(define (list-vshortyod)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vshortc-carrier) (list v 'xx c) (car (cdr vshortc-carrier)))))
       yod))
    vshort)))

(define (list-vschwayod)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vschwac-carrier) (list v 'xx c) (car (cdr vschwac-carrier)))))
       yod))
    vschwa)))   
    
(define (list-vlongyod)
  (apply
   append
   (mapcar
    (lambda (v)
      (mapcar
       (lambda (c)
	 (list
	  (list (string-append v "-" c))
	  (append (car vlongc-carrier) (list v '- c) (car (cdr vlongc-carrier)))))
       yod))
    vlong)))    

(define (list-cvs)
  (apply
   append
   (mapcar
    (lambda (c)
      (mapcar 
       (lambda (v) 
	 (list
	  (list (string-append c "-" v))
	  (append (car cv-carrier) (list c v) (car (cdr cv-carrier)))))
       vowels))
       (remove-list nocvcs kludge)))    
    )

(define (list-yodv)
  (apply
   append
   (mapcar
    (lambda (c)
      (mapcar 
       (lambda (v) 
	 (list
	  (list (string-append c "-" v))
	  (append (car cv-carrier) (list c v) (car (cdr cv-carrier)))))
       yodvowels))
       yod))    
    )

(define (list-vshortvshort)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vshortvshort-carrier) (list v1 'xx v2) (car (cdr vshortvshort-carrier)))))
       vshort))
    vshort)))
    
(define (list-vshortvschwa)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vshortvschwa-carrier) (list v1 'xx v2) (car (cdr vshortvschwa-carrier)))))
       vschwa))
    vshort)))

(define (list-vshortvlong)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vshortvlong-carrier) (list v1 'xx v2) (car (cdr vshortvlong-carrier)))))
       vlong))
    vshort)))    

(define (list-vschwavshort)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vschwavshort-carrier) (list v1 'xx v2) (car (cdr vschwavshort-carrier)))))
       vshort))
    vschwa)))
    
(define (list-vschwavschwa)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vschwavschwa-carrier) (list v1 'xx v2) (car (cdr vschwavschwa-carrier)))))
       vschwa))
    vschwa)))

(define (list-vschwavlong)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vschwavlong-carrier) (list v1 'xx v2) (car (cdr vschwavlong-carrier)))))
       vlong))
    vschwa))) 

(define (list-vlongvshort)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vlongvshort-carrier) (list v1 '- v2) (car (cdr vlongvshort-carrier)))))
       vshort))
    vlong)))    

(define (list-vlongvschwa)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vlongvschwa-carrier) (list v1 '- v2) (car (cdr vlongvschwa-carrier)))))
       vschwa))
    vlong)))    

(define (list-vlongvlong)
  (apply
   append
   (mapcar
    (lambda (v1)
      (mapcar 
       (lambda (v2) 
	 (list
	  (list (string-append v1 "-" v2))
	  (append (car vlongvlong-carrier) (list v1 '- v2) (car (cdr vlongvlong-carrier)))))
       vlong))
    vlong)))    

(define (list-ccs)
  (apply
   append
   (mapcar
    (lambda (c1)
      (mapcar 
       (lambda (c2) 
       (list
	(list (string-append c1 "-" c2))
	(append (car cc-carrier) (list c1 '- c2) (car (cdr cc-carrier)))))
       (remove-list conss coda-only)))
    (remove-list conss onset-only))))

(define (list-silv)
  (mapcar 
   (lambda (v) 
     (list
      (list (string-append silence "-" v))
      (append (car silv-carrier) (list silence v) (car (cdr silv-carrier)))))
   vowels))

(define (list-silc)
  (mapcar 
   (lambda (c) 
     (list
      (list (string-append silence "-" c))
      (append (car silc-carrier) (list silence c) (car (cdr silc-carrier)))))
   (remove-list conss coda-only)))

(define (list-vsil)
  (mapcar 
   (lambda (v) 
     (list
      (list (string-append v "-" silence))
      (append (car vsil-carrier) (list v silence) (car (cdr vsil-carrier)))))
   vowels))

(define (list-csil)
  (mapcar 
   (lambda (c) 
     (list
      (list (string-append c "-" silence))
      (append (car csil-carrier) (list c silence) (car (cdr csil-carrier)))))
   (remove-list conss onset-only)))

(define (list-ccclust1)
  (mapcar
   (lambda (c1c2)
     (list
      (list (string-append (car c1c2) "_-_" (car (cdr c1c2))))
      (append (car cc1-carrier) c1c2 (car (cdr cc1-carrier)))))
   clusters1))


;;(define (list-ccclust2)
;;  (mapcar
;;   (lambda (c1c2)
;;     (list
;;      (list (string-append (car c1c2) "_-_" (car (cdr c1c2))))
;;     (append (car cc2-carrier) c1c2 (car (cdr cc2-carrier)))))
;;  clusters2))
;;(define (list-ccclust3)
;;  (mapcar
;;   (lambda (c1c2)
;;     (list
;;      (list (string-append (car c1c2) "_-_" (car (cdr c1c2))))
;;      (append (car cc3-carrier) c1c2 (car (cdr cc3-carrier)))))
;;   clusters3))   
;;
;;(define (list-ccclust4)
;;  (mapcar
;;   (lambda (c1c2)
;;     (list
;;      (list (string-append (car c1c2) "_-_" (car (cdr c1c2))))
;;      (append (car cc4-carrier) c1c2 (car (cdr cc4-carrier)))))
;;   clusters4)) 
;;(define (list-vcopen)
;;  (apply
;;   append
;;   (mapcar
;;    (lambda (v)
;;      (mapcar 
;;       (lambda (c) 
;;	 (list
;;	  (list (string-append v "$-" c))
;;	  (append (car vc-carrier) (list v '- c) (car (cdr vc-carrier)))))
;;       conss))
;;    vowels)))
;;(define (list-syllabics)
;;  (append
;;   (apply
;;    append
;;    (mapcar
;;     (lambda (s)
;;       (mapcar 
;;	(lambda (c) 
;;	  (list
;;	   (list (string-append c "-" s))
;;	   (append (car syllabics-carrier1) (list c s) (car (cdr syllabics-carrier1)))))
;;	(remove-list conss onset-only)))
;;     syllabics))
;;   (apply
;;    append
;;    (mapcar
;;     (lambda (s)
;;       (mapcar 
;;	(lambda (c) 
;;	  (list
;;	   (list (string-append s "-" c))
;;	   (append (car syllabics-carrier2) (list s '- c) (car (cdr syllabics-carrier2)))))
;;	(remove-list conss coda-only)))
;;     syllabics))
;;   (apply
;;    append
;;    (mapcar
;;     (lambda (s)
;;       (mapcar 
;;	(lambda (v) 
;;	  (list
;;	   (list (string-append s "-" v))
;;	   (append (car syllabics-carrier3) (list s '- v) (car (cdr syllabics-carrier3)))))
;;	vowels))
;;       syllabics))))



;;; End of individual generation functions



(define (diphone-gen-list)
  "(diphone-gen-list)
Returns a list of nonsense words as phone strings."
  (append
   (list-cvcs)  ;; consonant-vowel and vowel-consonant
;;;;   (list-vcs)  ;; V-C's which don't go in cvc
   
   (list-vshortcs)  ;; V-C's which don't go in cvc
   (list-vschwacs)  ;; V-C's which don't go in cvc
   (list-vlongcs)   ;; V-C's which don't go in cvc
   
;;;   (list-vyod)        ;; V-yod
   (list-vshortyod)  ;; V-yod
   (list-vschwayod)  ;; V-yod
   (list-vlongyod)   ;; V-yod
         
   (list-cvs)  ;; C-V's which don't go in cvc
   
   (list-yodv)  ;; yod-nonhigh vowels
   
   (list-vshortvshort)  ;; vowel-vowel
   (list-vshortvschwa)  ;; vowel-vowel
   (list-vshortvlong)  ;; vowel-vowel   
   (list-vschwavshort)  ;; vowel-vowel
   (list-vschwavschwa)  ;; vowel-vowel
   (list-vschwavlong)  ;; vowel-vowel   
   (list-vlongvshort)  ;; vowel-vowel
   (list-vlongvschwa)  ;; vowel-vowel
   (list-vlongvlong)  ;; vowel-vowel
   
   (list-ccs)  ;; consonant-consonant
   (list-ccclust1)   ;; consonant clusters
;;;;   (list-ccclust2)   ;; consonant clusters
;;;;   (list-ccclust3)   ;; consonant clusters  
;;;;   (list-ccclust4)   ;; consonant clusters      
   (list-silv)
   (list-silc)
   (list-csil)
   (list-vsil)
   (list
    '(("#-#") (# t aa t aa # #)))
;;       (list-vcopen)    ;; open vowels
   ))

;;(define (Diphone_Prompt_Word utt)
;;  "(Diphone_Prompt_Word utt)
;;Specify modifications of the utterance before synthesis
;;that are specific to this phone set."
;;'  (mapcar
;;   (lambda (s)
;;     (let ((n (item.name s)))
;;       (cond
;;	((string-equal n "el")
;;	 (item.set_name s "l"))
;;	((string-equal n "em")
;;	 (item.set_name s "m"))
;;	((string-equal n "en")
;;	 (item.set_name s "n"))
;;	((string-equal n "er")
;;	 ;; ked doesn't deal with er properly so we need to insert 
;;	 ;; an r after the er to get this to work reasonably
;;	 (let ((newr (item.insert s (list 'r) 'after)))
;;	   (item.set_feat newr "end" (item.feat s "end"))
;;	   (item.set_feat s "end" 
;;			  (/ (+ (item.feat s "segment_start")
;;				(item.feat s "end"))
;;			     2))))
;;	)))
;;   (utt.relation.items utt 'Segment))
;;;  (set! phoneme_durations kd_durs)
;;;  (Parameter.set 'Duration_Stretch '1.2)
;;;  (Duration_Averages utt)
;;  )
;;
;;(define (Diphone_Prompt_Setup)
;; "(Diphone_Prompt_Setup)
;;Called before synthesizing the prompt waveforms.  Defined for AWB
;;speaker using rab diphone set (UK English) and setting F0."
;; (voice_rab_diphone)  ;; UK male voice
;; (set! FP_F0 90)
;; )


(provide 'cym_schema_welsh)
