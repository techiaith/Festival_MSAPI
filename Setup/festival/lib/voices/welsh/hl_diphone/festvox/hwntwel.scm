(lts.ruleset
;  Name of rule set
  hwntwel
;  Sets used in the rules
(
  ( V a e i o u w y A E I O U W Y )
  ( C b c d f g h j k l m n p q r s t v x z M J X S "-" )
  ( Q b c d f g h j k l m n p q r s t v x z M J X S "-" )
  ( D b d f g )
  ( Z "-" # )
)
;  Rules
(
;    South Welsh version of grapheme-to-phoneme rules using HL phoneset:
;    -------------------------------------------------------------------
;    Adapted by BJW to HL phoneset from NW rules (gogwel), April 2006

;   # symbols

;   	i	[i]
;   	e	[e]
;   	a	[a]
;   	o	[o]
;   	u	[u]
;   	@	[schwa]
;   	ii	[i:]
;   	ee	[e:]
;   	aa	[a:]
;   	oo	[o:]
;   	uu	[u:]
;       @@      [long schwa]
;       oa      [oa (as in English "paw"]
;   	oi	[oi]
;       @u      [ou]
;   	ai	[ai]
;       au      [au]
;   	ui	[ui]
;   	iu	[iu]
;   	@i	[ei]
;   	eu	[eu]

;   	p	[p]
;   	t	[t]
;   	k	[k]
;   	b	[b]
;   	d	[d]
;   	g	[g]
;   	f	[f]
;   	th	[theta]
;   	h	[h]
;   	x	[x (voiceless uvular fricative)]
;   	v	[v]
;   	dh	[edh]
;   	s	[s]
;   	z	[z]
;   	sh	[voiceless palato-alveolar fricative]
;       zh      [voiced palato-alveolar fricative]
;   	ch	[voiceless palato-alveolar affricate]
;   	jh	[voiced palato-alveolar affricate]
;   	lh	[voiceless alveolar lateral fricative]
;   	rh	[voiceless alveolar apical trill]
;   	l	[l]
;   	r	[r]
;   	w	[w]
;   	j	[voiced palatal approximant]
;   	m	[m]
;   	n	[n]
;   	ng	[voiced velar nasal]
;   	mh	[voiceless m]
;   	nh	[voiceless n]
;   	ngh	[voiceless velar nasal]
;   	lw	[labialised voiced alveolar lateral approximant]
;   	nw	[labialised voiced alveolar nasal stop]
; 	rw	[labialised voiced alveolar central approximant]

;   # variables

;         V       one or more of [a e i o u w y A E I O U W Y]
;         C       zero or more of [b c d f g h j k l m n p q r s t v x z M J]       
;         Q       [b c d f g h j k l m n p q r s t v x z M J -]
;         D       [b d f g ff ch dd]
;         P       [s ll]

;   # end symbols	

( [ - ] = )
( [ "\"" ] = )


;        Put labialised consonant rules first, to preempt the 'w' rules
;         (as the labialised consonant rules are more specific).
( [ q l ] = lw )
( [ q n ] = nw )
( [ q r ] = rw )

( Z [ t s i ] V = ch )

; 	Rules for diphthongs and circumflexed or grave'd monophthongs:

( [ s I ] "\"" = s ii1 )
( [ s I ] a = s ii1 )
( [ s I ] e = s ii1 )
( [ s I ] o = s ii1 )
( [ s J ] a = sh )
( [ s J ] e = sh )
( [ s J ] o = sh )
( [ s J ] A = sh )
( [ s J ] E = sh )
( [ s J ] O = sh )
( [ s J ] a = sh )
( [ s J ] e = sh )
( [ s J ] o = sh )
( [ s J ] A = sh )
( [ s J ] E = sh )
( [ s J ] O = sh )

( [ i ^ ] = ii )
( [ i "+" ] = ii )
( [ I ^ ] = ii1 )
( [ I "+" ] = ii1 )
( [ i "\\" ] = i )
( [ I "\\" ] = i1 )
( [ I W ] = iu1 )
( [ I "'" W ] = iu1 )
( [ i "'" w ] = iu )
( [ i w ] = iu )

( [ u ^ ] = ii )
( [ u "+" ] = ii )
( [ U ^ ] = ii1 )
( [ U "+" ] = ii1 )
( [ u "\\" ] = i )
( [ U "\\" ] = i1 )
( [ U W ] = iu1 )
( [ U "'" W ] = iu1 )
( [ u "'" w ] = iu )
( [ u w ] = iu )

( [ E ^ ] = ee1 )
( [ E "+" ] = ee1 )
( [ e ^ ] = ee )
( [ e "+" ] = ee )
( [ E "\\" ] = e1 )
( [ e "\\" ] = e )
( [ E W ] = eu1 )
( [ E "'" W ] = eu1 )
( [ e "'" w ] = eu )
( [ e w ] = eu )
( [ E I ] = @i1 )
( [ E "'" I ] = @i1 )
( [ e "'" i ] = @i )
( [ e i ] = @i )
( [ E Y ] = @i1 )
( [ e y ] = @i )
( [ E U ] = @i1 )
( [ E "'" U ] = @i1 )
( [ e "'" u ] = @i )
( [ e u ] = @i )

( [ A I ] = ai1 )
( [ A "'" I ] = ai1 )
( [ a "'" i ] = ai )
( [ a i ] = ai )
( [ A U ] = ai1 )
( [ A "'" U ] = ai1 )

;;;;;;;;( [ a u ] Z = a )

( [ a u ] Z = e )

( [ a "'" u ] = ai )
( [ a u ] = ai )
( [ A W ] = au1 )
( [ A "'" W ] = au1 )
( [ a "'" w ] = au )
( [ a w ] = au )
( [ A ^ "'" i ] = ai1 )
( [ A "+" "'" i ] = ai1 )
( [ a ^ "'" i ] = ai1 )
( [ a "+" "'" i ] = ai1 )
( [ A E ] = ai1 )
( [ a e ] = ai )
( [ A ^ "'" u ] = ai1 )
( [ A "+" "'" u ] = ai1 )
( [ a ^ "'" u ] = ai )
( [ a "+" "'" u ] = ai )
( [ A ^ ] = aa1 )
( [ A "+" ] = aa1 )
( [ a ^ ] = aa )
( [ a "+" ] = aa )
( [ A "\\" ] = a1 )
( [ a "\\" ] = a )

( [ O ^ ] = oo1 )
( [ O "+" ] = oo1 )
( [ o ^ ] = oo )
( [ o "+" ] = oo )
( [ O "\\" ] = o1 )
( [ o "\\" ] = o )
( [ O Y ] = oi1 )
( [ o y ] = oi )
( [ O U ] = oi1 )
( [ O "'" U ] = oi1 )
( [ o "'" u ] = oi )
( [ o u ] = oi )
( [ O W ] = @u1 )
( [ O "'" W ] = @u1 )
( [ o "'" w ] = @u )
( [ o w ] = @u )
( [ O E ] = oi1 )
( [ o e ] = oi )
( [ O I ] = oi1 )
( [ O "'" I ] = oi1 )
( [ o "'" i ] = oi )
( [ o i ] = oi )

( [ Y ^ ] = ii1 )
( [ Y "+" ] = ii1 )
( [ y ^ ] = ii )
( [ y "+" ] = ii )
( [ Y "\\" ] = i1 )
( [ y "\\" ] = i )
( [ Y W ] = iu1 )
( [ Y "'" W ] = iu1 )
( [ y "'" w ] = iu )
( [ y w ] = iu )


( [ W ^ ] = uu1 )
( [ W "+" ] = uu1 )
( [ w ^ ] = uu )
( [ w "+" ] = uu )
( [ W "\\" ] = u1 )
( [ w "\\" ] = u )
( [ W Y ] = ui1 )
( V + [ w y ] = w i )
( [ w y ] = ui )
( [ w "'" i ] = ui )
( [ w "'" u ] = ui )

;       Rules for consonants:

( [ p h ] = f )
( [ p p ] = p )
( [ p ] = p )
( [ t h ] = th )
( [ t t ] = t )
( [ t s h ] = ch )
( [ t s ] V + = ch )
( [ t ] = t )
( [ c h ] = x )
( [ c c ] = k )
( [ c k ] = k )
( [ c ] = k )
( s [ b ] = p )
( [ b b ] = b )
( [ b ] = b )
( [ d d ] = dh )
( [ d s h ] = jh )
( [ d s ] V + = jh )
( s [ d ] = t )
( [ d ] = d )
( s [ g ] = k )
( [ g g ] = g )
( [ g ] = g )
( [ f f ] = f )
( [ f ] = v )
( [ j ] = jh )
( [ J ] = j )
( [ l l ] = lh )
( [ l ] = l )
( Z [ r h ] = rh )
( Z a n [ r h ] = rh )
( V + [ r h ] V + = r h )
( Q [ r h ] = rh )
( [ r r ] = r )
( [ r ] = r )
( [ s s ] = s )
( [ s h ] = sh )
( [ s ] = s )

( V + [ m h ] V + = m h )
( V + [ m h ] w = m h )
( V + [ m h r ] = m rh )
( V + [ m h l ] = m lh )
( w [ m h ] V + = m h )
( w [ m h ] w = m h )
( w [ m h r ] = m rh )
( w [ m h l ] = m lh )

;( V + [ m h ] V + = mh )
;( V + [ m h ] w = mh )
;( V + [ m h r ] = mh r )
;( V + [ m h l ] = mh l )
;( w [ m h ] V + = mh )
;( w [ m h ] w = mh )
;( w [ m h r ] = mh r )
;( w [ m h l ] = mh l )

( Z [ m h ] = mh )

( V + [ n h ] V + = n h )
( V + [ n h ] w = n h )
( V + [ n h r ] = n rh )
( V + [ n h l ] = n lh )
( w [ n h ] V + = n h )
( w [ n h ] w = n h )
( w [ n h r ] = n rh )
( w [ n h l ] = n lh )

;( V + [ n h ] V + = nh )
;( V + [ n h ] w = nh )
;( V + [ n h r ] = nh r )
;( V + [ n h l ] = nh l )
;( w [ n h ] V + = nh )
;( w [ n h ] w = nh )
;( w [ n h r ] = nh r )
;( w [ n h l ] = nh l )

( Z [ n h ] = nh )

( V + [ n g h ] V + = ng h )
( V + [ n g h ] w = ng h )
( V + [ n g h r ] = ng rh )
( V + [ n g h l ] = ng lh )
( w [ n g h ] V + = ng h )
( w [ n g h ] w = ng h )
( w [ n g h r ] = ng rh )
( w [ n g h l ] = ng lh )

;( V + [ n g h ] V + = ngh )
;( V + [ n g h ] w = ngh )
;( V + [ n g h r ] = ngh r )
;( V + [ n g h l ] = ngh l )
;( w [ n g h ] V + = ngh )
;( w [ n g h ] w = ngh )
;( w [ n g h r ] = ngh r )
;( w [ n g h l ] = ngh l )

( Z [ n g h ] = ngh )

( [ n g ] = ng )
( [ n n ] = n )
( [ n ] c = ng )
( [ n ] = n )
( [ m m ] = m )
( [ m ] = m )
( [ r r ] = r )
( [ h ] = h )
( [ M ] = w )
( [ X ] = ch )
( [ S ] = sh )

;  k.q.v.x,z: In English alphabet but not Welsh one:  added to deal
;           with the occasional English word.

( [ k ] = k )
( [ k k ] = k )
( [ q u ] = k w )
( [ v v ] = v )
( [ v ] = v )
( [ x x ] = k s )
( [ x ] = k s )
( [ z z ] = z )
( [ z ] = z )

( [ "." ] = )
( [ ! ] = ! )
;    4.11.97 - retain hyphen so as to be able to force a syll boundary later
;;;;( [ - ] = - )
( [ "'" ] = )
( [ "\"" ] = )
( [ ^ ] = )
( [ "+" ] = )
( [ _ ] = )
( [ "\\" ] = )

; 	Rules for (unmarked) monophthongs:
;       ( D b d f g )

( [ I ] D V + C * Z = ii1 )
( [ I ] s V + C * Z = ii1 )
( [ I ] d d V + C * Z = ii1 )
( [ I ] c h V + C * Z = ii1 )
( [ I ] f f V + C * Z = ii1 )
( [ I ] t h V + C * Z = ii1 )
( [ I ] "\"" = ii1 )
( [ I ] D Z = ii1 )
( [ I ] s Z = ii1 )
( [ I ] d d Z = ii1 )
( [ I ] c h Z = ii1 )
( [ I ] f f Z = ii1 )
( [ I ] t h Z = ii1 )
( [ I ] Z = ii1 )
( [ I ] = i1 )
( [ i i ] = ii )
( [ i ] = i )

( [ U ] D V + C * Z = ii1 )
( [ U ] s V + C * Z = ii1 )
( [ U ] d d V + C * Z = ii1 )
( [ U ] c h V + C * Z = ii1 )
( [ U ] f f V + C * Z = ii1 )
( [ U ] t h V + C * Z = ii1 )
( [ U ] "\"" = ii1 )
( [ U ] D Z = ii1 )
( [ U ] s Z = ii1 )
( [ U ] d d Z = ii1 )
( [ U ] c h Z = ii1 )
( [ U ] f f Z = ii1 )
( [ U ] t h Z = ii1 )
( [ U ] Z = ii1 )
( [ U ] = i1 )
( [ u ] = i )

( [ E ] D V + C * Z = ee1 )
( [ E ] s V + C * Z = ee1 )
( [ E ] d d V + C * Z = ee1 )
( [ E ] c h V + C * Z = ee1 )
( [ E ] f f V + C * Z = ee1 )
( [ E ] t h V + C * Z = ee1 )
( [ E ] "\"" = ee1 )
( [ E ] D Z = ee1 )
( [ E ] s Z = ee1 )
( [ E ] d d Z = ee1 )
( [ E ] c h Z = ee1 )
( [ E ] f f Z = ee1 )
( [ E ] t h Z = ee1 )
( [ E ] Z = ee1 )
( [ E ] = e1 )
( [ e e ] = ii )
( [ e ] = e )

( [ A ] D V + C * Z = aa1 )
( [ A ] s V + C * Z = aa1 )
( [ A ] d d V + C * Z = aa1 )
( [ A ] c h V + C * Z = aa1 )
( [ A ] f f V + C * Z = aa1 )
( [ A ] t h V + C * Z = aa1 )
( [ A ] "\"" = aa1 )
( [ A ] D Z = aa1 )
( [ A ] s Z = aa1 )
( [ A ] d d Z = aa1 )
( [ A ] c h Z = aa1 )
( [ A ] f f Z = aa1 )
( [ A ] t h Z = aa1 )
( [ A ] Z = aa1 )
( [ A ] = a1 )
( [ a a ] = aa )
( [ a ] = a )

( [ O ] D V + C * Z = oo1 )
( [ O ] s V + C * Z = oo1 )
( [ O ] d d V + C * Z = oo1 )
( [ O ] c h V + C * Z = oo1 )
( [ O ] f f V + C * Z = oo1 )
( [ O ] t h V + C * Z = oo1 )
( [ O ] "\"" = oo1 )
( [ O ] D Z = oo1 )
( [ O ] s Z = oo1 )
( [ O ] d d Z = oo1 )
( [ O ] c h Z = oo1 )
( [ O ] f f Z = oo1 )
( [ O ] t h Z = oo1 )
( [ O ] Z = oo1 )
( [ O ] = o1 )
( [ o o ] = oo )
( [ o ] = o )

( [ Y ] Q C * V + = @1 )
( [ Y ] "\"" = ii1 )
( [ Y ] D Z = ii1 )
( [ Y ] s Z = ii1 )
( [ Y ] d d Z = ii1 )
( [ Y ] c h Z = ii1 )
( [ Y ] f f Z = ii1 )
( [ Y ] t h Z = ii1 )
( [ Y ] Q C * Z = i1 )
( [ Y ] Z = ii1 )
( [ y y ] = ii )
( [ y ] = @ )

( [ W ] D V + C * Z = uu1 )
( [ W ] s V + C * Z = uu1 )
( [ W ] d d V + C * Z = uu1 )
( [ W ] c h V + C * Z = uu1 )
( [ W ] f f V + C * Z = uu1 )
( [ W ] t h V + C * Z = uu1 )
( [ W ] "\"" = uu1 )
( [ W ] D Z = uu1 )
( [ W ] s Z = uu1 )
( [ W ] d d Z = uu1 )
( [ W ] c h Z = uu1 )
( [ W ] f f Z = uu1 )
( [ W ] t h Z = uu1 )
( [ W ] Z = uu1 )
( [ W ] = u1 )
( [ w w ] = uu )
( [ w ] = u )

))

(provide 'hwntwel)


