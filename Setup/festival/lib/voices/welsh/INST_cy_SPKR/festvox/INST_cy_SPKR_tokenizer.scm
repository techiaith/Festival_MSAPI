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
;;;
;;; Tokenizer for cy
;;;
;;;  To share this among voices you need to promote this file to
;;;  to say festival/lib/INST_cy/ so others can use it.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Load any other required files

;;; Voice/cy token_to_word rules 
; we don't use the default
;(define (INST_cy_SPKR::token_to_words token name)
;  "(INST_cy_SPKR::token_to_words token name)
;Specific token to word rules for the voice INST_cy_SPKR.  Returns a list
;of words that expand given token with name."
;  (cond
;   ((string-matches name "[1-9][0-9]+")
;    (INST_cy::number token name))
;   (t ;; when no specific rules apply do the general ones
;    (list name))))

(define (INST_cy::number token name)
  "(INST_cy::number token name)
Return list of words that pronounce this number in cy."

  (error "INST_cy::number to be written\n")

)

(define (INST_cy_SPKR::select_tokenizer)
  "(INST_cy_SPKR::select_tokenizer)
Set up tokenizer for cy."
  (Parameter.set 'Language 'INST_cy)

; Use the existing tokenisation module. This is in ../../Tokenisation/
; which should have been added to load-path in INST_cy_SPKR_diphone.scm
  (set! INST_cy_SPKR::token_to_words welsh_token_to_words)

  (set! token_to_words INST_cy_SPKR::token_to_words)
)

(define (INST_cy_SPKR::reset_tokenizer)
  "(INST_cy_SPKR::reset_tokenizer)
Reset any globals modified for this voice.  Called by 
(INST_cy_SPKR::voice_reset)."
  ;; None

  t
)

(provide 'INST_cy_SPKR_tokenizer)
