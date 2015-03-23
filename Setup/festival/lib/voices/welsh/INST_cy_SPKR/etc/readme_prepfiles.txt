Resources for constructing a new Welsh voice
============================================

1)  cym_schema_welsh.scm

Scheme file for constructing 2596 pseudo-Welsh nonsense words using the WISPR phoneset (i.e. including North Welsh vowels).  Does NOT contain anything for the three English-only segments /zh, oa, @@/, as these need individualised carrier phrases for many of them - see engonly.list.

To run this Scheme file in Festival:
(load "diphlist.scm")     [find it in festvox/src/diphones]
(load "cym_schema_welsh.scm")
(diphone-gen-schema "gogdiphs" "cymdiph.list")

NB: using 
(diphone-gen-list)
will give instant output of the format:
diphone-name   phonestring-of-nonsense-phrase

2)  cymonly.list

Output of cym_schema_welsh.scm - contains 2596 items
Format:
( gogdiphs_0001 "sil t aa p i p aa sil" ("p-i" "i-p") )

3)  engonly.list

Similar, but for all needed permutations of Welsh segments with the English-only phonemes /zh, oa, @@/ (/oa/ is the vowel in "paw", /@@/ is the vowel in non-rhotic "fir", /zh/ is the medial consonant of "leisure").  Contains 344 items.

4)  cydiph.list

Complete schema:  concatenation of cymonly.list plus engonly.list, with editing of filenames from "gogdiphs_NNNN" to "cb_cy_cw_NNNN" (i.e. edit as required for the particular speaker).  Contains all 2940 items.

5)  gogdiphs.doc

Print this out as the hard-copy script to be used by the voice talent.
See .....WISPR/Data/scripts/gogdiphs/gogdiphs.doc

6)  cb_cy_cw_phoneset.scm

Phoneset for Welsh - can apply to both North and South Welsh speakers.  Not specific to any one voice.
