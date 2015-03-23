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
;;; Prosodic phrasing
;;;

;;; Load any necessary files here

(set! cb_cy_phrase_cart_tree
'
((lisp_token_end_punc in ("'" "\"" "?" "." "," ":" ";"))
  ((B))
  ((n.name is 0)
   ((B))
   ((NB)))))


(set! cb_cy_phrase_pos_cart_tree
'
((n.pos is 0)
 (((0 0) (B 0.0736094) (BB 0.921802) (NB 0.0045882) BB))
 ((n.pos is conj)
  ((pos is conj)
   (((0 0) (B 0.0823893) (BB 0) (NB 0.917611) NB))
   ((pos is CompAdj)
    (((0 0) (B 0.064695) (BB 0.00184843) (NB 0.933457) NB))
    ((pos is number)
     ((p.pos is nf)
      (((0 0) (B 0.298507) (BB 0) (NB 0.701493) NB))
      ((p.pos is prep)
       (((0 0) (B 0.411111) (BB 0.0037037) (NB 0.585185) NB))
       (((0 0) (B 0.525097) (BB 0) (NB 0.474903) B))))
     ((pos is DemPron)
      (((0 0) (B 0.416804) (BB 0.014827) (NB 0.568369) NB))
      ((p.pos is vb)
       (((0 0) (B 0.191104) (BB 0.00329489) (NB 0.805601) NB))
       ((pos is DefArt)
        (((0 0) (B 0.0175439) (BB 0) (NB 0.982456) NB))
        ((pos is npl)
         (((0 0) (B 0.221752) (BB 0.00227939) (NB 0.775969) NB))
         ((pos is vb)
          (((0 0) (B 0.219914) (BB 0.00179083) (NB 0.778295) NB))
          ((p.pos is 0)
           (((0 0) (B 0.178908) (BB 0.00564972) (NB 0.815443) NB))
           ((pos is EqAdj)
            (((0 0) (B 0.0992908) (BB 0) (NB 0.900709) NB))
            ((pos is pron)
             (((0 0) (B 0.376068) (BB 0.003663) (NB 0.620269) NB))
             ((pos is SupAdj)
              ((p.pos is nf)
               (((0 0) (B 0.566038) (BB 0) (NB 0.433962) B))
               (((0 0) (B 0.416216) (BB 0) (NB 0.583784) NB)))
              ((p.pos is YnPred)
               (((0 0) (B 0.239707) (BB 0.00225606) (NB 0.758037) NB))
               ((pos is adv)
                (((0 0) (B 0.353171) (BB 0.00313234) (NB 0.643696) NB))
                ((p.pos is DefArt)
                 (((0 0) (B 0.313116) (BB 0.00147929) (NB 0.685404) NB))
                 ((pos is nm)
                  (((0 0) (B 0.247331) (BB 0.0024983) (NB 0.75017) NB))
                  ((pos is nperson)
                   (((0 0) (B 0.249059) (BB 0.00690088) (NB 0.74404) NB))
                   ((pos is nf)
                    (((0 0) (B 0.254067) (BB 0.000956938) (NB 0.744976) NB))
                    ((p.pos is adv)
                     (((0 0) (B 0.2021) (BB 0.00262467) (NB 0.795276) NB))
                     ((p.pos is nperson)
                      ((pos is nplace)
                       (((0 0) (B 0.508197) (BB 0) (NB 0.491803) B))
                       (((0 0) (B 0.455882) (BB 0.0147059) (NB 0.529412) NB)))
                      ((p.pos is CompAdj)
                       (((0 0) (B 0.151515) (BB 0) (NB 0.848485) NB))
                       ((p.pos is npl)
                        (((0 0) (B 0.265823) (BB 0.000843882) (NB 0.733333) NB))
                        ((p.pos is prep)
                         (((0 0) (B 0.288945) (BB 0) (NB 0.711055) NB))
                         ((p.pos is nm)
                          (((0 0) (B 0.294296) (BB 0.00364078) (NB 0.702063) NB))
                          ((pos is abbr)
                           (((0 0) (B 0.481013) (BB 0) (NB 0.518987) NB))
                           ((p.pos is nplace)
                            ((pos is nplace)
                             (((0 0) (B 0.315152) (BB 0) (NB 0.684848) NB))
                             (((0 0) (B 0.603448) (BB 0) (NB 0.396552) B)))
                            (((0 0) (B 0.326371) (BB 0.00365535) (NB 0.669974) NB))))))))))))))))))))))))))))
  ((n.pos is vbf)
   ((pos is PvPart)
    (((0 0) (B 0) (BB 0) (NB 1) NB))
    ((pos is conj)
     (((0 0) (B 0.00875958) (BB 0.000156421) (NB 0.991084) NB))
     ((pos is RelPron)
      (((0 0) (B 0) (BB 0) (NB 1) NB))
      ((pos is NegPart)
       (((0 0) (B 0) (BB 0) (NB 1) NB))
       ((pos is pron)
        (((0 0) (B 0.0926422) (BB 0.0059577) (NB 0.9014) NB))
        ((pos is DefArt)
         (((0 0) (B 0.00200803) (BB 0) (NB 0.997992) NB))
         ((pos is adv)
          (((0 0) (B 0.153887) (BB 0.00825346) (NB 0.837859) NB))
          ((pos is pronf)
           (((0 0) (B 0) (BB 0) (NB 1) NB))
           ((p.pos is YnPred)
            (((0 0) (B 0.440334) (BB 0.0322196) (NB 0.527446) NB))
            ((p.pos is prep)
             ((pos is npl)
              (((0 0) (B 0.176471) (BB 0.0168067) (NB 0.806723) NB))
              ((pos is nperson)
               (((0 0) (B 0.564516) (BB 0.0645161) (NB 0.370968) B))
               (((0 0) (B 0.355446) (BB 0.0237562) (NB 0.620798) NB))))
             ((pos is nperson)
              (((0 0) (B 0.363636) (BB 0.0610583) (NB 0.575305) NB))
              ((pos is excl)
               (((0 0) (B 0.84) (BB 0) (NB 0.16) B))
               ((pos is pronm)
                (((0 0) (B 0) (BB 0) (NB 1) NB))
                ((pos is pronpl)
                 (((0 0) (B 0) (BB 0) (NB 1) NB))
                 ((pos is prep)
                  (((0 0) (B 0.15482) (BB 0.0136319) (NB 0.831548) NB))
                  ((pos is part)
                   (((0 0) (B 0.030303) (BB 0) (NB 0.969697) NB))
                   ((pos is vbadj)
                    (((0 0) (B 0) (BB 0) (NB 1) NB))
                    ((pos is letter)
                     (((0 0) (B 0.488372) (BB 0.116279) (NB 0.395349) B))
                     (((0 0) (B 0.248325) (BB 0.0296809) (NB 0.721994) NB))))))))))))))))))))
   ((pos is prep)
    (((0 0) (B 0.00607937) (BB 0.000454147) (NB 0.993466) NB))
    ((pos is DefArt)
     (((0 0) (B 0.00111279) (BB 1.82425e-05) (NB 0.998869) NB))
     ((pos is nplace)
      ((n.pos is nm)
       (((0 0) (B 0.529586) (BB 0.0207101) (NB 0.449704) B))
       ((p.pos is nplace)
        ((n.pos is nplace)
         (((0 0) (B 0.512397) (BB 0.00275482) (NB 0.484848) B))
         (((0 0) (B 0.283871) (BB 0.00645161) (NB 0.709677) NB)))
        ((n.pos is nf)
         (((0 0) (B 0.557143) (BB 0.0142857) (NB 0.428571) B))
         ((n.pos is number)
          (((0 0) (B 0.562963) (BB 0) (NB 0.437037) B))
          (((0 0) (B 0.208503) (BB 0.0037653) (NB 0.787731) NB))))))
      ((pos is number)
       ((n.pos is number)
        ((p.pos is number)
         (((0 0) (B 0.449704) (BB 0.0650888) (NB 0.485207) NB))
         (((0 0) (B 0.695817) (BB 0.121673) (NB 0.18251) B)))
        ((n.pos is npm)
         (((0 0) (B 0.0142857) (BB 0) (NB 0.985714) NB))
         ((n.pos is nm/f)
          (((0 0) (B 0.0518519) (BB 0.00740741) (NB 0.940741) NB))
          ((p.pos is DefArt)
           (((0 0) (B 0.0461538) (BB 0) (NB 0.953846) NB))
           ((n.pos is npl)
            (((0 0) (B 0.109489) (BB 0.00729927) (NB 0.883212) NB))
            ((n.pos is prep)
             ((p.pos is 0)
              (((0 0) (B 0.589474) (BB 0) (NB 0.410526) B))
              (((0 0) (B 0.229139) (BB 0) (NB 0.770861) NB)))
             ((n.pos is nf)
              (((0 0) (B 0.171429) (BB 0.00714286) (NB 0.821429) NB))
              ((n.pos is nm)
               (((0 0) (B 0.246305) (BB 0.00246305) (NB 0.751232) NB))
               ((n.pos is vb)
                (((0 0) (B 0.205479) (BB 0.0205479) (NB 0.773973) NB))
                ((n.pos is foreign)
                 (((0 0) (B 0.188679) (BB 0.0188679) (NB 0.792453) NB))
                 ((n.pos is vbadj)
                  (((0 0) (B 0.291667) (BB 0) (NB 0.708333) NB))
                  ((n.pos is DefArt)
                   (((0 0) (B 0.330508) (BB 0) (NB 0.669492) NB))
                   ((p.pos is prep)
                    (((0 0) (B 0.307263) (BB 0.0335196) (NB 0.659218) NB))
                    ((n.pos is YnPred)
                     (((0 0) (B 0.336957) (BB 0.0108696) (NB 0.652174) NB))
                     ((n.pos is letter)
                      (((0 0) (B 0.425) (BB 0) (NB 0.575) NB))
                      ((p.pos is nf)
                       (((0 0) (B 0.319444) (BB 0.0138889) (NB 0.666667) NB))
                       ((n.pos is nplace)
                        (((0 0) (B 0.396825) (BB 0) (NB 0.603175) NB))
                        ((n.pos is abbr)
                         (((0 0) (B 0.45679) (BB 0) (NB 0.54321) NB))
                         ((p.pos is 0)
                          (((0 0) (B 0.38806) (BB 0.0298507) (NB 0.58209) NB))
                          ((n.pos is nperson)
                           (((0 0) (B 0.442308) (BB 0.0192308) (NB 0.538462) NB))
                           (((0 0) (B 0.526829) (BB 0.0585366) (NB 0.414634) B))))))))))))))))))))))
       ((pos is nperson)
        ((p.pos is nperson)
         ((n.pos is nplace)
          (((0 0) (B 0.824627) (BB 0) (NB 0.175373) B))
          ((n.pos is nm)
           (((0 0) (B 0.781457) (BB 0.0198675) (NB 0.198675) B))
           ((n.pos is prep)
            (((0 0) (B 0.152031) (BB 0.00393185) (NB 0.844037) NB))
            ((n.pos is vbadj)
             (((0 0) (B 0.114173) (BB 0) (NB 0.885827) NB))
             ((n.pos is nperson)
              (((0 0) (B 0.244792) (BB 0) (NB 0.755208) NB))
              ((n.pos is YnPred)
               (((0 0) (B 0.158537) (BB 0) (NB 0.841463) NB))
               ((n.pos is vb)
                (((0 0) (B 0.141732) (BB 0) (NB 0.858268) NB))
                ((n.pos is adv)
                 (((0 0) (B 0.210084) (BB 0.00840336) (NB 0.781513) NB))
                 ((n.pos is pronm)
                  (((0 0) (B 0.135593) (BB 0.0508475) (NB 0.813559) NB))
                  ((n.pos is number)
                   (((0 0) (B 0.615385) (BB 0.010989) (NB 0.373626) B))
                   ((n.pos is RelPron)
                    (((0 0) (B 0.552083) (BB 0) (NB 0.447917) B))
                    ((n.pos is pron)
                     (((0 0) (B 0.392857) (BB 0.0357143) (NB 0.571429) NB))
                     ((n.pos is alphnum)
                      (((0 0) (B 0.533333) (BB 0) (NB 0.466667) B))
                      ((n.pos is DefArt)
                       (((0 0) (B 0.502646) (BB 0.010582) (NB 0.486772) B))
                       ((n.pos is nf)
                        (((0 0) (B 0.489583) (BB 0.0208333) (NB 0.489583) B))
                        ((n.pos is foreign)
                         (((0 0) (B 0.5) (BB 0.0185185) (NB 0.481481) B))
                         (((0 0) (B 0.43609) (BB 0.0112782) (NB 0.552632) NB))))))))))))))))))
         ((n.pos is nperson)
          (((0 0) (B 0.0300752) (BB 0.00110571) (NB 0.968819) NB))
          ((p.pos is vbf)
           (((0 0) (B 0.0881057) (BB 0.0143172) (NB 0.897577) NB))
           ((n.pos is number)
            (((0 0) (B 0.663043) (BB 0) (NB 0.336957) B))
            ((n.pos is vbadj)
             (((0 0) (B 0.0621762) (BB 0) (NB 0.937824) NB))
             ((n.pos is prep)
              (((0 0) (B 0.121711) (BB 0.00438596) (NB 0.873904) NB))
              ((p.pos is 0)
               ((n.pos is nm)
                (((0 0) (B 0.614035) (BB 0.0175439) (NB 0.368421) B))
                (((0 0) (B 0.404858) (BB 0.0121457) (NB 0.582996) NB)))
               (((0 0) (B 0.214496) (BB 0.0107738) (NB 0.774731) NB)))))))))
        ((pos is YnPred)
         (((0 0) (B 0.000686725) (BB 0.000171681) (NB 0.999142) NB))
         ((pos is vbf)
          (((0 0) (B 0.0136957) (BB 0.00137314) (NB 0.984931) NB))
          ((pos is conj)
           (((0 0) (B 0.0105972) (BB 0.000426322) (NB 0.988977) NB))
           ((pos is vbadj)
            (((0 0) (B 0.000583465) (BB 5.83465e-05) (NB 0.999358) NB))
            ((pos is vb)
             (((0 0) (B 0.0245755) (BB 0.00203539) (NB 0.973389) NB))
             ((pos is pronm)
              (((0 0) (B 0.00028509) (BB 0) (NB 0.999715) NB))
              ((n.pos is adj)
               (((0 0) (B 0.0284641) (BB 0.000906706) (NB 0.970629) NB))
               ((p.pos is vbf)
                (((0 0) (B 0.0268844) (BB 0.00137446) (NB 0.971741) NB))
                ((n.pos is prep)
                 (((0 0) (B 0.0609032) (BB 0.00164943) (NB 0.937447) NB))
                 ((p.pos is prep)
                  (((0 0) (B 0.0517988) (BB 0.00259686) (NB 0.945604) NB))
                  ((p.pos is vb)
                   (((0 0) (B 0.046514) (BB 0.00200924) (NB 0.951477) NB))
                   ((n.pos is DemPron)
                    (((0 0) (B 0.0155014) (BB 0.000316356) (NB 0.984182) NB))
                    ((n.pos is SupAdj)
                     (((0 0) (B 0.00558919) (BB 0) (NB 0.994411) NB))
                     ((pos is pron)
                      (((0 0) (B 0.0511433) (BB 0.00209461) (NB 0.946762) NB))
                      ((pos is pronf)
                       (((0 0) (B 0) (BB 0) (NB 1) NB))
                       ((n.pos is number)
                        (((0 0) (B 0.215385) (BB 0.035503) (NB 0.749112) NB))
                        ((pos is letter)
                         ((p.pos is 0)
                          (((0 0) (B 0.766355) (BB 0.046729) (NB 0.186916) B))
                          ((n.pos is vb)
                           (((0 0) (B 0.581818) (BB 0) (NB 0.418182) B))
                           (((0 0) (B 0.288973) (BB 0.0114068) (NB 0.69962) NB))))
                         ((n.pos is abbr)
                          (((0 0) (B 0.24938) (BB 0.0384615) (NB 0.712159) NB))
                          ((pos is alphnum)
                           (((0 0) (B 0.385621) (BB 0.0326797) (NB 0.581699) NB))
                           ((pos is card)
                            (((0 0) (B 0.0215827) (BB 0.00143885) (NB 0.976978) NB))
                            ((n.pos is NegPart)
                             ((p.pos is YnPred)
                              (((0 0) (B 0.5) (BB 0) (NB 0.5) B))
                              (((0 0) (B 0.30163) (BB 0.0217391) (NB 0.67663) NB)))
                             ((pos is part)
                              (((0 0) (B 0.0086741) (BB 0) (NB 0.991326) NB))
                              ((n.pos is letter)
                               (((0 0) (B 0.279116) (BB 0.0361446) (NB 0.684739) NB))
                               ((pos is pronpl)
                                (((0 0) (B 0) (BB 0) (NB 1) NB))
                                ((n.pos is vbadj)
                                 (((0 0) (B 0.0832517) (BB 0.000489716) (NB 0.916259) NB))
                                 ((n.pos is RelPron)
                                  (((0 0) (B 0.0661866) (BB 0.000342936) (NB 0.933471) NB))
                                  ((p.pos is conj)
                                   (((0 0) (B 0.0754752) (BB 0.00424433) (NB 0.92028) NB))
                                   ((n.pos is YnPred)
                                    (((0 0) (B 0.0945693) (BB 0.00120385) (NB 0.904227) NB))
                                    ((n.pos is vb)
                                     (((0 0) (B 0.0828322) (BB 0.0071775) (NB 0.90999) NB))
                                     ((pos is cardf)
                                      (((0 0) (B 0.00724638) (BB 0.00241546) (NB 0.990338) NB))
                                      ((p.pos is adv)
                                       (((0 0) (B 0.0606254) (BB 0.00255265) (NB 0.936822) NB))
                                       ((p.pos is 0)
                                        (((0 0) (B 0.07813) (BB 0.0105668) (NB 0.911303) NB))
                                        ((n.pos is adjpl)
                                         (((0 0) (B 0.0124688) (BB 0.00249377) (NB 0.985037) NB))
                                         ((pos is cardm)
                                          (((0 0) (B 0.0257009) (BB 0) (NB 0.974299) NB))
                                          ((n.pos is nplace)
                                           (((0 0) (B 0.0799087) (BB 0.00171233) (NB 0.918379) NB))
                                           ((pos is npf)
                                            (((0 0) (B 0.394366) (BB 0.00704225) (NB 0.598592) NB))
                                            ((p.pos is npl)
                                             ((n.pos is npl)
                                              ((pos is npl)
                                               (((0 0) (B 0.653061) (BB 0) (NB 0.346939) B))
                                               (((0 0) (B 0.363281) (BB 0.00390625) (NB 0.632812) NB)))
                                              (((0 0) (B 0.150772) (BB 0.0091017) (NB 0.840127) NB)))
                                             ((p.pos is pronm)
                                              (((0 0) (B 0.192623) (BB 0.0229508) (NB 0.784426) NB))
                                              ((pos is DemPron)
                                               (((0 0) (B 0.232283) (BB 0.0177165) (NB 0.75) NB))
                                               ((pos is npm)
                                                (((0 0) (B 0.301075) (BB 0.0215054) (NB 0.677419) NB))
                                                ((p.pos is nf)
                                                 (((0 0) (B 0.165631) (BB 0.00767824) (NB 0.826691) NB))
                                                 ((n.pos is adjf)
                                                  (((0 0) (B 0) (BB 0) (NB 1) NB))
                                                  ((n.pos is alphnum)
                                                   (((0 0) (B 0.271318) (BB 0.0465116) (NB 0.682171) NB))
                                                   ((pos is ord)
                                                    (((0 0) (B 0.0131579) (BB 0) (NB 0.986842) NB))
                                                    ((n.pos is nm/f)
                                                     (((0 0) (B 0.0649351) (BB 0.0178571) (NB 0.917208) NB))
                                                     ((n.pos is cprep)
                                                      (((0 0) (B 0) (BB 0) (NB 1) NB))
                                                      ((n.pos is pron)
                                                       (((0 0) (B 0.160763) (BB 0.0118074) (NB 0.82743) NB))
                                                       ((pos is nf)
                                                        (((0 0) (B 0.150041) (BB 0.0116054) (NB 0.838353) NB))
                                                        ((n.pos is DefArt)
                                                         ((p.pos is DefArt)
                                                          ((pos is npl)
                                                           (((0 0) (B 0.52381) (BB 0) (NB 0.47619) B))
                                                           (((0 0) (B 0.407166) (BB 0.0260586) (NB 0.566775) NB)))
                                                          (((0 0) (B 0.102302) (BB 0.00292291) (NB 0.894775) NB)))
                                                         (((0 0) (B 0.118794) (BB 0.00766708) (NB 0.873539) NB)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;; entropy 0.0693168 perplexity 1.04922


)

(define (cb_cy_llg::select_phrasing)
  "(cb_cy_llg::select_phrasing)
Set up the phrasing module for English."
  (set! phrase_cart_tree cb_cy_phrase_cart_tree)
  (Parameter.set 'Phrase_Method 'cart_tree)
)

(define (cb_cy_llg::reset_phrasing)
  "(cb_cy_llg::reset_phrasing)
Reset phrasing information."
  t
)

(provide 'cb_cy_llg_phrasing)