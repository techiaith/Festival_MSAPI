;;;
;;;   Letter to sound rules (first stage) for Welsh, written by 
;;;   Briony Williams
;;;   Built automatically from newwel.r
;;;

(lts.ruleset
;  Name of rule set
 newwel
;  Sets used in the rules
(
  (C b c b f g h j k l m n p q r s t v w x y z M J )
  (V a e i o u y A E I O U Y ) 
  (D b d f g )

)
;  Rules
(
;  ----------------------------------------
;  includes 'M' and 'J', excludes dot after vowel.
;  -----------------------------------------------
;      Put labialised consonant rules first, to preempt the 'w' rules
;       (as these six are more specific).
 ( # g [ M l ] = lw )
 ( # n g [ M l ] = lw )
 ( # [ M l ] V + = lw )
 ( # g [ M r ] = rw )
 ( # n g [ M r ] = rw )
 ( # [ M r ] V + = rw )
 ( # g [ M n ] = nw )
 ( # n g [ M n ] = nw )
 ( # [ M n ] V + = nw )
 ( [ W Y ] = ui1 )
 ( V + [ w y ] = w )
 ( [ w y ] = ui )
 ( [ Y W ] = iu1 )
 ( [ y "'" w ] = iu )
 ( [ y w ] = iu )
 ( [ s I ] "\"" = s )
 ( [ s I ] a = s )
 ( [ s I ] e = s )
 ( [ s I ] o = s )
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
 ( [ I ] "\"" = ii1 )
 ( [ I ] a = ii1 )
 ( [ I ] e = ii1 )
 ( [ I ] o = ii1 )
 ( [ i ] a = ii )
 ( [ i ] e = ii )
 ( [ i ] o = ii )
 ( [ i ] A = ii )
 ( [ i ] E = ii )
 ( [ i ] O = ii )
 ( [ i ] a = ii )
 ( [ i ] e = ii )
 ( [ i ] o = ii )
 ( [ i ] A = ii )
 ( [ i ] E = ii )
 ( [ i ] O = ii )
 ( [ i ^ ] = ii )
 ( [ I ^ ] = ii1 )
 ( [ i \ ] = i )
 ( [ I \ ] = i1 )
 ( [ I W ] = iu1 )
 ( [ I "'" W ] = iu1 )
 ( [ i "'" w ] = iu )
 ( [ i w ] = iu )
 ( [ u ^ ] = ii )
 ( [ U ^ ] = ii1 )
 ( [ u \ ] = i )
 ( [ U \ ] = i1 )
 ( [ U W ] = iu1 )
 ( [ U "'" W ] = iu1 )
 ( [ u "'" w ] = iu )
 ( [ u w ] = iu )
 ( [ E ^ ] = ee1 )
 ( [ e ^ ] = ee )
 ( [ E \ ] = e1 )
 ( [ e \ ] = e )
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
 ( [ a u ] ! = e )
 ( [ a "'" u ] = ai )
 ( [ a u ] = ai )
 ( [ A W ] = au1 )
 ( [ A "'" W ] = au1 )
 ( [ a "'" w ] = au )
 ( [ a w ] = au )
 ( [ A ^ "'" i ] = aai1 )
 ( [ a ^ "'" i ] = aai1 )
 ( [ A E ] = ai1 )
 ( [ a e ] = ai )
 ( [ A ^ "'" u ] = aai1 )
 ( [ a ^ "'" u ] = aai )
 ( [ A ^ ] = aa1 )
 ( [ a ^ ] = aa )
 ( [ A \ ] = a1 )
 ( [ a \ ] = a )
 ( [ O ^ ] = oo1 )
 ( [ o ^ ] = oo )
 ( [ O \ ] = o1 )
 ( [ o \ ] = o )
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
 ( [ y ^ ] = ii )
 ( [ Y \ ] = i1 )
 ( [ y \ ] = i )
 ( [ W ^ ] = uu1 )
 ( [ w ^ ] = uu )
 ( [ W \ ] = u1 )
 ( [ w \ ] = u )
 ( [ w "'" i ] = ui )
 ( [ w "'" u ] = ui )
 ;     Rules for consonants:
 ( # [ p h ] = f )
 ( [ p ] = p )
 ( [ t h ] = th )
 ( [ t s ] = ch )
 ( [ t ] = t )
 ( [ c h ] = x )
 ( [ c ] = k )
 ( s [ b ] = p )
 ( [ b ] = b )
 ( [ d d ] = dh )
 ( [ d ] = d )
 ( s [ g ] = k )
 ( [ g ] = g )
 ( [ f f ] = f )
 ( [ f ] = v )
 ( [ j ] = jh )
 ( [ J ] = j )
 ( [ l l ] = lh )
 ( [ l ] = l )
 ( # [ r h ] = rh )
 ( # a n [ r h ] = rh )
 ( Q [ r h ] = rh )
 ( [ r ] = r )
 ( [ s ] = s )
 ( V + [ m h ] = m )
 ( w [ m h ] = m )
 ( # [ m h ] = mh )
 ( [ m ] = m )
 ( V + [ n h ] = n )
 ( w [ n h ] = n )
 ( # [ n h ] = nh )
 ( # a n [ n h ] = nh )
 ( V + [ n g h ] = ngh )
 ( w [ n g h ] = ngh )
 ( # [ n g h ] = ngh )
 ( # a [ n g h ] = ng )
 ( [ n g ] = ng )
 ( [ n ] = n )
 ( [ h ] = h )
 ( [ M ] = w )
 ;k.q.v.x: In English alphabet but not Welsh one:  added to deal
 ;         with the occasional English word.
 ( [ k ] = k )
 ( [ q ] = k )
 ( [ v ] = v )
 ( [ x ] = k )
; ( [ . ] =  )
 ( [ ! ] = ! )
 ( [ - ] =  )
 ( [ "'" ] =  )
 ( [ "\"" ] =  )
 ( [ ^ ] =  )
 ( [ _ ] =  )
 ( [ \ ] =  )
 ( [ I ] D w y = ii1 )
 ( [ I ] D M V + = i1 )
 ( [ I ] D w = ii1 )
 ( [ I ] D J V + = i1 )
 ( [ I ] D V + = ii1 )
 ( [ I ] "\"" = ii1 )
 ( [ I ] V + = ii1 )
 ( [ I ] D # = ii1 )
 ( [ I ] P # = ii1 )
 ( [ I ] # = ii1 )
 ( [ I ] = i1 )
 ( [ i ] = i )
 ( [ U ] D w y = ii1 )
 ( [ U ] D M V + = i1 )
 ( [ U ] D w = ii1 )
 ( [ U ] D J V + = i1 )
 ( [ U ] D V + = ii1 )
 ( [ U ] "\"" = ii1 )
 ( [ U ] V + = ii1 )
 ( [ U ] D # = ii1 )
 ( [ U ] P # = ii1 )
 ( [ U ] # = ii1 )
 ( [ U ] = i1 )
 ( [ u ] = i )
 ( [ E ] D w y = ee1 )
 ( [ E ] D M V + = e1 )
 ( [ E ] D w = ee1 )
 ( [ E ] D J V + = e1 )
 ( [ E ] D V + = ee1 )
 ( [ E ] "\"" = ee1 )
 ( [ E ] V + = ee1 )
 ( [ E ] D # = ee1 )
 ( [ E ] P # = ee1 )
 ( [ E ] # = ee1 )
 ( [ E ] = e1 )
 ( [ e ] = e )
 ( [ A ] D w y = aa1 )
 ( [ A ] D M V + = a1 )
 ( [ A ] D w = aa1 )
 ( [ A ] D J V + = a1 )
 ( [ A ] D V + = aa1 )
 ( [ A ] "\"" = aa1 )
 ( [ A ] V + = aa1 )
 ( [ A ] D # = aa1 )
 ( [ A ] P # = aa1 )
 ( [ A ] # = aa1 )
 ( [ A ] = a1 )
 ( [ a ] = a )
 ( [ O ] D w y = oo1 )
 ( [ O ] D M V + = o1 )
 ( [ O ] D w = oo1 )
 ( [ O ] D J V + = o1 )
 ( [ O ] D V + = oo1 )
 ( [ O ] "\"" = oo1 )
 ( [ O ] V + = oo1 )
 ( [ O ] D # = oo1 )
 ( [ O ] P # = oo1 )
 ( [ O ] # = oo1 )
 ( [ O ] = o1 )
 ( [ o ] = o )
 ( g M [ Y ] D i V + = ii1 )
 ( g M [ Y ] D V + = ii1 )
 ( g M [ Y ] M V + = @ )
 ( g1 M [ Y ] Q V + = *i )
 ( g M [ Y ] C * V + = i1 )
 ( [ Y ] C + V + = @ )
 ( # C1 [ Y ] D # = *ii )
 ( # C * [ Y ] P # = ii1 )
 ( # C * [ Y ] "'" C # = i1 )
 ( # C * [ Y ] C # = i1 )
 ( # C * [ Y ] # = @ )
 ( [ Y1 ] V + = ii1 )
 ( [ Y ] D # = ii1 )
 ( [ Y ] P # = ii1 )
 ( [ Y ] C * # = i1 )
 ( [ Y ] = @ )
 ( [ y1 ] C * # = i )
 ( [ y ] "'" = i )
 ( [ y ] = @ )
 ( [ w ] V + = w )
 ( [ W ] D w y = uu1 )
 ( [ W ] D M V + = u1 )
 ( [ W ] D w = uu1 )
 ( [ W ] D J V + = u1 )
 ( [ W ] D V + = uu1 )
 ( [ W ] "\"" = uu1 )
 ( [ W ] V + = uu1 )
 ( [ W ] D # = uu1 )
 ( [ W ] P # = uu1 )
 ( [ W ] # = uu1 )
 ( [ W ] "'" V + = uu1 )
 ( [ W ] = u1 )
 ( [ w ] = u )
))

(provide 'newwel)
