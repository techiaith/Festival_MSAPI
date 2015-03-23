;;;
;;;   Letter to sound rules (first stage) for Welsh, written by 
;;;   Briony Williams
;;;   Built automatically from newepen.r
;;;

(lts.ruleset
;  Name of rule set
 newepen
;  Sets used in the rules
(
  (C b c b f g h j k l m n p q r s t v w x y s )
  (V a e i o u y ) 
  (N 0 1 2 3 4 5 6 7 8 9 )
  (F l n r f )
  (R l n r f )
)
;  Rules
(
;  Put lexical exceptions first of all:
( [ a n g o s ] = a n g g o s )
( [ a r a t o i ] ! = a r a t o / i )
( # h [ e n ] # = e ^ n )
( V + C * [ h a u ] ! = h a / u )
( # [ y m y l ] # = y m y / l )
( # [ y m y s g ] # = y m y / s g )
( # [ y n g h y d ] # = y n g h y / d )
;  Now add epenthetic vowels
( o e [ b ] F # = b i )
( a e [ b ] F # = b i )
( o e [ g ] F # = g i )
( a e [ g ] F # = g i )
( o e [ p ] F # = p i )
( a e [ p ] F # = p i )
( o e [ f f ] F # = f f i )
( a e [ f f ] F # = f f i )
( o e [ f ] R # = f i )
( a e [ f ] R # = f i )
( o e [ t h ] F # = t h i )
( a e [ t h ] F # = t h i )
( o e [ t ] F # = t i )
( a e [ t ] F # = t i )
( o e [ d d ] F # = d d i )
( a e [ d d ] F # = d d i )
( o e [ d ] F # = d i )
( a e [ d ] F # = d i )
( o e [ s ] F # = s i )
( a e [ s ] F # = s i )
( o e [ c h ] F # = c h i )
( a e [ c h ] F # = c h i )
( o e [ c ] F # = c i )
( a e [ c ] F # = c i )
( o e [ m ] l # = m i )
( a e [ m ] l # = m i )
( i [ b ] F # = b i )
( e [ b ] F # = b e )
( a [ b ] F # = b a )
( o [ b ] F # = b o )
( w [ b ] F # = b w )
( u [ b ] F # = b i )
( y [ b ] F # = b i )
( i [ g ] F # = g i )
( e [ g ] F # = g e )
( a [ g ] F # = g a )
( o [ g ] F # = g o )
( w [ g ] F # = g w )
( u [ g ] F # = g i )
( y [ g ] F # = g i )
( i [ p ] F # = p i )
( e [ p ] F # = p e )
( a [ p ] F # = p a )
( o [ p ] F # = p o )
( w [ p ] F # = p w )
( u [ p ] F # = p i )
( y [ p ] F # = p i )
( i [ f f ] F # = f f i )
( e [ f f ] F # = f f e )
( a [ f f ] F # = f f a )
( o [ f f ] F # = f f o )
( w [ f f ] F # = f f w )
( u [ f f ] F # = f f i )
( y [ f f ] F # = f f i )
( i [ f ] R # = f i )
( e [ f ] R # = f e )
( a [ f ] R # = f a )
( o [ f ] R # = f o )
( w [ f ] R # = f w )
( u [ f ] R # = f i )
( y [ f ] R # = f i )
( i [ t h ] F # = t h i )
( e [ t h ] F # = t h e )
( a [ t h ] F # = t h a )
( o [ t h ] F # = t h o )
( w [ t h ] F # = t h w )
( u [ t h ] F # = t h i )
( y [ t h ] F # = t h i )
( i [ t ] F # = t i )
( e [ t ] F # = t e )
( a [ t ] F # = t a )
( o [ t ] F # = t o )
( w [ t ] F # = t w )
( u [ t ] F # = t i )
( y [ t ] F # = t i )
( i [ d d ] F # = d d i )
( e [ d d ] F # = d d e )
( a [ d d ] F # = d d a )
( o [ d d ] F # = d d o )
( w [ d d ] F # = d d w )
( u [ d d ] F # = d d i )
( y [ d d ] F # = d d i )
( i [ d ] F # = d i )
( e [ d ] F # = d e )
( a [ d ] F # = d a )
( o [ d ] F # = d o )
( w [ d ] F # = d w )
( u [ d ] F # = d i )
( y [ d ] F # = d i )
( i [ s ] F # = s i )
( e [ s ] F # = s e )
( a [ s ] F # = s a )
( o [ s ] F # = s o )
( w [ s ] F # = s w )
( u [ s ] F # = s i )
( y [ s ] F # = s i )
( i [ c h ] F # = c h i )
( e [ c h ] F # = c h e )
( a [ c h ] F # = c h a )
( o [ c h ] F # = c h o )
( w [ c h ] F # = c h w )
( u [ c h ] F # = c h i )
( y [ c h ] F # = c h i )
( i [ c ] F # = c i )
( e [ c ] F # = c e )
( a [ c ] F # = c a )
( o [ c ] F # = c o )
( w [ c ] F # = c w )
( u [ c ] F # = c i )
( y [ c ] F # = c i )
( i [ m ] l # = m i )
( e [ m ] l # = m e )
( a [ m ] l # = m a )
( o [ m ] l # = m o )
( w [ m ] l # = m w )
( u [ m ] l # = m i )
( y [ m ] l # = m i )
;       Add dummy diaeresis between paired vowels that don't form diphthong
( [ a o ] = a "\"" o )
( [ e a ] = e "\"" a )
( [ e o ] = e "\"" o )
( [ o a ] = o "\"" a )
( [ u a ] = u "\"" a )
( [ u e ] = u "\"" e )
( [ u i ] = u "\"" i )
( [ u o ] = u "\"" o )
( # g w [ i o ] = i "\"" o )
( # g w [ i a ] = i "\"" a )
( # g w [ i e ] = i "\"" e )
( # w [ i o ] = i "\"" o )
( # w [ i a ] = i "\"" a )
( # w [ i e ] = i "\"" e )
( # n g w [ i o ] = i "\"" o )
( # n g w [ i a ] = i "\"" a )
( # n g w [ i e ] = i "\"" e )
( # c w [ i o ] = i "\"" o )
( # c w [ i a ] = i "\"" a )
( # c w [ i e ] = i "\"" e )
( # c h w [ i o ] = i "\"" o )
( # c h w [ i a ] = i "\"" a )
( # c h w [ i e ] = i "\"" e )
( # n g h w [ i o ] = i "\"" o )
( # n g h w [ i a ] = i "\"" a )
( # n g h w [ i e ] = i "\"" e )
;       Reduce capitals to lower-case
;  [A]=a
;  [B]=b
;  [C]=c
;  [D]=d
;  [E]=e
;  [F]=f
;  [G]=g
;  [H]=h
;  [I]=i
;  [J]=j
;  [K]=k
;  [L]=l
;  [M]=m
;  [N]=n
;  [O]=o
;  [P]=p
;  [Q]=q
;  [R]=r
;  [S]=s
;  [T]=t
;  [U]=u
;  [V]=v
;  [W]=w
;  [X]=x
;  [Y]=y
;  [Z]=z
; Let
;          (k,q,v,x: in English alphabet but not Welsh:
;           added anyway, to deal with any English words)
 ( [ a ] = a )
 ( [ b ] = b )
 ( [ c ] = c )
 ( [ d ] = d )
 ( [ e ] = e )
 ( [ f ] = f )
 ( [ g ] = g )
 ( [ h ] = h )
 ( [ i ] = i )
 ( [ j ] = j )
 ( [ l ] = l )
 ( [ m ] = m )
 ( [ n ] = n )
 ( [ o ] = o )
 ( [ p ] = p )
 ( [ r ] = r )
 ( [ s ] = s )
 ( [ t ] = t )
 ( [ u ] = u )
 ( [ w ] = w )
 ( [ y ] = y )
 ( [ z ] = z )
 ( [ k ] = k )
 ( [ q ] = q )
 ( [ v ] = v )
 ( [ x ] = x )
 ( [ "'" ] = "'" )
 ( [ ^ ] = ^ )
; Rules
( [ 1 "," ] N N N # = m I l - )
( [ 1 ] N N N # = m I l - )
( [ 2 "," ] N N N # = d A I $ f I l - )
( [ 2 ] N N N # = d A I $ f I l - )
( [ 3 "," ] N N N # = t r I $ m I l - )
( [ 3 ] N N N # = t r I $ m I l - )
( [ 4 "," ] N N N # = p E d w a r $ m I l - )
( [ 4 ] N N N # = p E d w a r $ m I l - )
( [ 5 "," ] N N N # = p I m $ m I l - )
( [ 5 ] N N N # = p I m $ m I l - )
( [ 6 "," ] N N N # = c h w E $ m I l - )
( [ 6 ] N N N # = c h w E $ m I l - )
( [ 7 "," ] N N N # = s A I t h $ m I l - )
( [ 7 ] N N N # = s A I t h $ m I l - )
( [ 8 "," ] N N N # = W Y t h $ m I l - )
( [ 8 ] N N N # = W Y t h $ m I l - )
( [ 9 "," ] N N N # = n A W $ m I l - )
( [ 9 ] N N N # = n A W $ m I l - )
( N [ 0 ] N N = )
( # [ 1 0 0 ] # = c A n t - )
( [ 1 0 1 ] # = c A n t $ a g $ I n - )
( [ 1 0 ] N # = c A n t $ a - )
( [ 1 ] N N # = c A n t - )
( [ 2 0 1 ] # = d A U $ g A n t $ a g $ I n - )
( [ 2 0 ] N # = d A U $ g A n t $ a - )
( [ 2 ] N N # = d A U $ g A n t - )
( [ 3 0 1 ] # = t r I $ c h A n t $ a g $ I n - )
( [ 3 0 ] N # = t r I $ c h A n t $ a - )
( [ 3 ] N N # = t r I $ c h A n t - )
( [ 4 0 1 ] # = p E d w a r $ c A n t $ a g $ I n - )
( [ 4 0 ] N # = p E d w a r $ c A n t $ a - )
( [ 4 ] N N # = p E d w a r $ c A n t - )
( [ 5 0 1 ] # = p I m $ c A n t $ a g $ I n - )
( [ 5 0 ] N # = p I m $ c A n t $ a - )
( [ 5 ] N N # = p I m $ c A n t - )
( [ 6 0 1 ] # = c h w E $ c h A n t $ a g $ I n - )
( [ 6 0 ] N # = c h w E $ c h A n t $ a - )
( [ 6 ] N N # = c h w E $ c h A n t - )
( [ 7 0 1 ] # = s A I t h $ c A n t $ a g $ I n - )
( [ 7 0 ] N # = s A I t h $ c A n t $ a - )
( [ 7 ] N N # = s A I t h $ c A n t - )
( [ 8 0 1 ] # = W Y t h $ c A n t $ a g $ I n - )
( [ 8 0 ] N # = W Y t h $ c A n t $ a - )
( [ 8 ] N N # = W Y t h $ c A n t - )
( [ 9 0 1 ] # = n A W $ c A n t $ a g $ I n - )
( [ 9 0 ] N # = n A W $ c A n t $ a - )
( [ 9 ] N N # = n A W $ c A n t - )
( [ 1 0 ] # = d E g - )
( [ 1 ] N # = I n $ d E g - )
( [ 2 0 ] # = d A I $ d d E g - )
( [ 2 ] N # = d A I $ d d E g - )
( [ 3 0 ] # = t r I $ d E g - )
( [ 3 ] N # = t r I $ d E g - )
( [ 4 0 ] # = p E d w a r $ d E g - )
( [ 4 ] N # = p E d w a r $ d E g - )
( [ 5 0 ] # = p I m $ d E g - )
( [ 5 ] N # = p I m $ d E g - )
( [ 6 0 ] # = c h w E $ d E g - )
( [ 6 ] N # = c h w E $ d E g - )
( [ 7 0 ] # = s A I t h $ d E g - )
( [ 7 ] N # = s A I t h $ d E g - )
( [ 8 0 ] # = W Y t h $ d E g - )
( [ 8 ] N # = W Y t h $ d E g - )
( [ 9 0 ] # = n A W $ d E g - )
( [ 9 ] N # = n A W $ d E g - )
( [ 0 ] = d I m - )
( [ 1 ] = I n - )
( [ 2 ] = d A I - )
( [ 3 ] = t r I - )
( [ 4 ] = p E d w a r - )
( [ 5 ] = p I m p - )
( [ 6 ] = c h w E c h - )
( [ 7 ] = s A I t h - )
( [ 8 ] = W Y t h - )
( [ 9 ] = n A W - )
; ( R u l e s )
;  [","]=","
( [ "." ] = )
;  [-]=-
;  ["\""]="\""
;  [:]=:
;  [']='
;  [--]=--
;  [?]=?
;  [;]=;
;  Allow input + to be read as circumflex accent
( [ + ] = ^ )
;  [*]=*
;  [$]=$
;  Allow input % to be read as diaeresis
( [ % ] = "\"" )
;  [&]=&
;  [!]=!
;  [(]=(
;  [)]=)
;  [=]==
;  [@]=@
;  [<]=<
;  [>]=>
;  [/]=/
;  [#]=#
;  [\\]=\\
;  [_]=_
))

(provide 'newepen)
