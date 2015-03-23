;;;
;;;   Letter to sound rules (first stage) for Welsh, written by 
;;;   Briony Williams
;;;   Built automatically from newwelstr.r
;;;   Adds stress

(lts.ruleset
;  Name of rule set
 newwelstr
;  Sets used in the rules
(
  (C b c b f g h j k l m n p q r s t v w x y z M J )
  (V a e i o u y A E I O U Y ) 
  (D b d f g )
)
;  Rules
(
;   Rules for determining the location of a stressed syllable in Welsh
;   ------------------------------------------------------------------
;   New version with no dot and containing 'M' and 'J'
;   -------------------------------------------------
;   First deal with vowels after diaeresis or circumflex (always monophthongs):
( "\"" [ i ] = i  )
( "\"" [ e ] = e  )
( "\"" [ a ] = a  )
( "\"" [ o ] = o  )
( "\"" [ u ] = u  )
( "\"" [ w ] = w  )
( "\"" [ y ] = y  )
( ^ [ i ] = i  )
( ^ [ e ] = e  )
( ^ [ a ] = a  )
( ^ [ o ] = o  )
( ^ [ u ] = u  )
( ^ [ w ] = w  )
( ^ [ y ] = y  )
( [ ^ ] = ^  )
;  a Vowels orthographically marked stressed: may be in ultima,
;     monosyllable, antepenult, or preantepenult.
( [ o / i ] = O I  )
( [ o / y ] = O I  )
( [ o / u ] = O U  )
( [ o / e ] = O I  )
( [ a / i ] = A I  )
( [ a / u ] = A U  )
( [ a / e ] = A I  )
( [ w / y ] = U I  )
( [ i / w ] = I W  )
( [ y / w ] = Y W  )
( [ u / w ] = U W  )
( [ e / w ] = E W  )
( [ a / w ] = A W  )
( [ e / i ] = E I  )
( [ e / y ] = E I  )
( [ e / u ] = E U  )
( [ o / w ] = O W  )
( [ i / ] = I  )
( [ e / ] = E  )
( [ a / ] = A  )
( [ o / ] = O  )
( [ w / ] = W  )
( [ u / ] = U  )
( [ y / ] = Y  )
;      b Stress in ultima or monosyllable shown by a circumflex or grave,
;         not an acute accent (circumflex not used in penults):
( [ i ^ ] = I ^  )
( [ e ^ ] = E ^  )
( [ a ^ ] = A ^  )
( [ o ^ ] = O ^  )
( [ w ^ ] = W ^  )
( [ u ^ ] = U ^  )
( [ y ^ ] = Y ^  )
( [ i \ ] = I \  )
( [ e \ ] = E \  )
( [ a \ ] = A \  )
( [ o \ ] = O \  )
( [ w \ ] = W \  )
( [ u \ ] = U \  )
( [ y \ ] = Y \  )
;      c Vowels in monosyllables (assumed to be stressed monosyllables) and
;         in putative monosyllables (which may not actually be monosylls):
;    Diphthongs (some may have intervening single quote) -
;   Versions where vocalic "'"w' precedes (looks like a monosyll):
( # G w S G [ o "'" i ] G # = o "'" i  )
( # G w S G [ o i ] G # = o i  )
( # G w S G [ o y ] G # = o i  )
( # G w S G [ o "'" u ] G # = o "'" u  )
( # G w S G [ o u ] G # = o u  )
( # G w S G [ o e ] G # = o i  )
( # G w S G [ a "'" i ] G # = a "'" i  )
( # G w S G [ a i ] G # = a i  )
( # G w S G [ a "'" u ] G # = a "'" u  )
( # G w S G [ a u ] G # = a u  )
( # G w S G [ a e ] G # = a i  )
( # G w S G [ i "'" w ] G # = i "'" w  )
( # G w S G [ i w ] G # = i w  )
( # G w S G [ y w ] G # = y w  )
( # G w S G [ u "'" w ] G # = u "'" w  )
( # G w S G [ u w ] G # = u w  )
( # G w S G [ e w ] G # = e w  )
( # G w S G [ a w ] G # = a w  )
( # G w S G [ e "'" i ] G # = e "'" i  )
( # G w S G [ e i ] G # = e i  )
( # G w S G [ e y ] G # = e i  )
( # G w S G [ e u ] G # = e u  )
( # G w S G [ o "'" w ] G # = o "'" w  )
( # G w S G [ o w ] G # = o w  )
;  Versions where no vocalic "'"w' precedes (though cons 'w' can precede):
( # C [ o "'" i ] C # = O "'" I  )
( # C [ o i ] C # = O I  )
( # C [ o y ] C # = O I  )
( # C [ o "'" u ] C # = O "'" U  )
( # C [ o u ] C # = O U  )
( # C [ o e ] C # = O I  )
( # C [ a "'" i ] C # = A "'" I  )
( # C [ a i ] C # = A I  )
( # C [ a "'" u ] C # = A "'" U  )
( # C [ a u ] C # = A U  )
( # C [ a e ] C # = A I  )
( # C [ i "'" w ] C # = I "'" W  )
( # C [ i w ] C # = I W  )
( # C [ y w ] C # = Y W  )
( # C [ u "'" w ] C # = U "'" W  )
( # C [ u w ] C # = U W  )
( # C [ e w ] C # = E W  )
( # C [ a w ] C # = A W  )
( # C [ e "'" i ] C # = E "'" I  )
( # C [ e i ] C # = E I  )
( # C [ e y ] C # = E I  )
( # C [ e u ] C # = E U  )
( # C [ o "'" w ] C # = O "'" W  )
( # C [ o w ] C # = O W  )
;  Accent-marked monophthongs and diphthongs after yod:
( # C [ i a / ] C # = J A  )
( # C [ i e / ] C # = J E  )
( # C [ i o / ] C # = J O  )
( # C [ i a \ ] C # = J A \  )
( # C [ i e \ ] C # = J E \  )
( # C [ i o \ ] C # = J O \  )
;  Non-accent marked monophthongs and dipthongs after yod:
; Versions for preceding vocalic 'w' (which look like a monosyll to the rules):
; With two intervening consonants:
( # G w S S [ i a "'" i ] G # = J a "'" i  )
( # G w S S [ i a i ] G # = J a i  )
( # G w S S [ i a e ] G # = J a i  )
( # G w S S [ i a "'" u ] G # = J a "'" u  )
( # G w S S [ i a u ] G # = J a u  )
( # G w S S [ i a "'" w ] G # = J a "'" w  )
( # G w S S [ i a w ] G # = J a w  )
( # G w S S [ i a ^ ] G # = J A ^  )
( # G w S S [ i a ] G # = J a  )
( # G w S S [ i e w ] G # = J e w  )
( # G w S S [ i e "'" i ] G # = J e "'" i  )
( # G w S S [ i e i ] G # = J e i  )
( # G w S S [ i e y ] G # = J e i  )
( # G w S S [ i e "'" u ] G # = J e "'" u  )
( # G w S S [ i e u ] G # = J e u  )
( # G w S S [ i e ^ ] G # = J E ^  )
( # G w S S [ i e ] G # = J e  )
( # G w S S [ i o y ] G # = J o i  )
( # G w S S [ i o "'" u ] G # = J o "'" u  )
( # G w S S [ i o u ] G # = J o u  )
( # G w S S [ i o e ] G # = J o i  )
( # G w S S [ i o w ] G # = J o w  )
( # G w S S [ i o ^ ] G # = J O ^  )
( # G w S S [ i o ] G # = J o  )
; With one intervening consonant:
( # G w S [ i a "'" i ] G # = J a "'" i  )
( # G w S [ i a i ] G # = J a i  )
( # G w S [ i a e ] G # = J a i  )
( # G w S [ i a "'" u ] G # = J a "'" u  )
( # G w S [ i a u ] G # = J a u  )
( # G w S [ i a "'" w ] G # = J a "'" w  )
( # G w S [ i a w ] G # = J a w  )
( # G w S [ i a ^ ] G # = J A ^  )
( # G w S [ i a ] G # = J a  )
( # G w S [ i e w ] G # = J e w  )
( # G w S [ i e "'" i ] G # = J e "'" i  )
( # G w S [ i e i ] G # = J e i  )
( # G w S [ i e y ] G # = J e i  )
( # G w S [ i e "'" u ] G # = J e "'" u  )
( # G w S [ i e u ] G # = J e u  )
( # G w S [ i e ^ ] G # = J E ^  )
( # G w S [ i e ] G # = J e  )
( # G w S [ i o y ] G # = J o i  )
( # G w S [ i o "'" u ] G # = J o "'" u  )
( # G w S [ i o u ] G # = J o u  )
( # G w S [ i o e ] G # = J o i  )
( # G w S [ i o w ] G # = J o w  )
( # G w S [ i o ^ ] G # = J O ^  )
( # G w S [ i o ] G # = J o  )
;  Default versions:  no preceding vocalic 'w':
( # C [ i a "'" i ] C # = J A "'" I  )
( # C [ i a i ] C # = J A I  )
( # C [ i a e ] C # = J A I  )
( # C [ i a "'" u ] C # = J A "'" U  )
( # C [ i a u ] C # = J A U  )
( # C [ i a "'" w ] C # = J A "'" W  )
( # C [ i a w ] C # = J A W  )
( # C [ i a ^ ] C # = J A ^  )
( # C [ i a ] C # = J A  )
( # C [ i e w ] C # = J E W  )
( # C [ i e "'" i ] C # = J E "'" I  )
( # C [ i e i ] C # = J E I  )
( # C [ i e y ] C # = J E I  )
( # C [ i e "'" u ] C # = J E "'" U  )
( # C [ i e u ] C # = J E U  )
( # C [ i e ^ ] C # = J E ^  )
( # C [ i e ] C # = J E  )
( # C [ i o y ] C # = J O I  )
( # C [ i o "'" u ] C # = J O "'" U  )
( # C [ i o u ] C # = J O U  )
( # C [ i o e ] C # = J O I  )
( # C [ i o w ] C # = J O W  )
( # C [ i o ^ ] C # = J O ^  )
( # C [ i o ] C # = J O  )
;    Monophthongs with diaeresis and following vowel grapheme:
( # C [ i ] "\"" V C # = I  )
( # C [ e ] "\"" V C # = E  )
( # C [ a ] "\"" V C # = A  )
( # C [ o ] "\"" V C # = O  )
( # C [ u ] "\"" V C # = U  )
( # C [ w ] "\"" V C # = W  )
( # C [ y ] "\"" V C # = Y  )
;   Sorting out orthographic 'w':
;   i Velar-cons-plus-wy^ counts as cons cluster, as does word-initial 'wy^':
( # K [ w y ^ ] C # = M Y ^  )
( # n g [ w y ^ ] C # = M Y ^  )
( # [ w y ^ ] C # = M Y ^  )
;   ii Delete circumflex in Velar-(or start-of-word)-plus-w^y, as here it
;       denotes the location of the syllable nucleus, not vowel lengthening:
( # K [ w ^ y ] C # = W Y  )
( # n g [ w ^ y ] C # = W Y  )
( # [ w ^ y ] C # = W Y  )
;  iii Uncircumflexed 'wy' -- this is the default in monosyllables:
( # S S S [ w y ] "'" S # = W Y  )
( # S S S [ w y ] G # = W Y  )
( # S S [ w y ] "'" S # = W Y  )
( # S S [ w y ] G # = W Y  )
( # S [ w y ] "'" S # = W Y  )
( # S [ w y ] G # = W Y  )
( # [ w y ] "'" S # = W Y  )
( # [ w y ] G # = W Y  )
;  iv  Circumflexed single 'w' in ultimas and monosyllables:
( [ w ^ ] C # = W ^  )
;  v  'w' as labialisation marker:
;      Labialising context ( = g|ng|# ) plus 'w' word-initially dealt with
;      here before penult vowels, as otherwise the 'w' would become 'W':
( # g [ w ] R = M  )
( # n g [ w ] R = M  )
( # [ w ] R V = M  )
;   vi  Case where non-velar cons precedes 'w' and non-w, non-y vowel
;        follows in any form of word (eg. 'dweud', 'swalpio', 'swil'):
( # S S [ w ] I = M  )
( # S S [ w ] i = M  )
( # S S [ w ] u = M  )
( # S [ w ] I = M  )
( # S [ w ] i = M  )
( # S [ w ] u = M  )
;  Circumflexed single y in monosyllables:
( # G [ y ^ ] C # = Y ^  )
;  Vowels after labialising context eg. 'gwlad', 'ngwraig' (B = g | ng ):
( # B w R [ i ] C # = I  )
( # B w R [ e ] C # = E  )
( # B w R [ a ] C # = A  )
( # B w R [ o ] C # = O  )
( # B w R [ u ] C # = U  )
( # B w R [ y ] C # = Y  )
( # B w R [ w ] C # = W  )
;  Allow for cases like 'cwest', 'gwyn', 'chwyn', 'nghwest' (K = c|g|ch|ngh)
;   ie. where 'w' must be a consonant:
( # K w [ i ] C # = I  )
( # K w [ e ] C # = E  )
( # K w [ a ] C # = A  )
( # K w [ o ] C # = O  )
( # K w [ u ] C # = U  )
( # K w [ y ] C # = Y  )
;  Deal with word-final non-diphthongising vowels after single quote (need
;  to specify monosyllabic context exactly, to avoid preempting single-quote
;  vowel rules for unstressed ULTIMAS where diphthongisation occurs):
;  Versions for where 1st cons (cluster) not 'w', 1st vowel is 'w':
( # G w G "'" [ i ] # = i  )
( # G w G "'" [ e ] # = e  )
( # G w G "'" [ a ] # = a  )
( # G w G "'" [ o ] # = o  )
( # G w G "'" [ u ] # = u  )
( # G w G "'" [ w ] # = w  )
;  Default versions, where 1st C (cluster) may have 'w', 
;     1st vowel not 'w' (cases of 'Gwy' come here):
( # C H C "'" [ i ] # = i  )
( # C H C "'" [ e ] # = e  )
( # C H C "'" [ a ] # = a  )
( # C H C "'" [ o ] # = o  )
( # C H C "'" [ u ] # = u  )
( # C H C "'" [ w ] # = w  )
;  Basic monosyllable rules for monophthongs:
;  In words where the 1st vowel is 'w': we need to use 'G' forms instead of 'C'
;  forms of rules, to avoid problems due to counting this 'w' as a consonant
;  for the purposes of the rule for the second vowel (which then gets stressed).
;  eg. cwbl  -> cwbwl -> kWbWl -> k u* b u* l          (if this precaution
;      bwled -> bwled -> bWlEd -> b u* l e* d          is not taken)
;             Versions for where 1st cons is 'w':
( # w [ i ] G # = I  )
( # w [ e ] G # = E  )
( # w [ a ] G # = A  )
( # w [ o ] G # = O  )
( # w [ u ] G # = U  )
( # w [ y ] G # = Y  )
( # w R [ i ] G # = I  )
( # w R [ e ] G # = E  )
( # w R [ a ] G # = A  )
( # w R [ o ] G # = O  )
( # w R [ u ] G # = U  )
( # w R [ w ] G # = W  )
( # w R [ y ] G # = Y  )
;                Versions for where 1st cons is not 'w':
;  ! char needed as these rules were firing for the last vowel in "\""gallu'i"\"",
;  making the 'i' (wrongly) stressed - need to distinguish between start-of-wd
;  and single quote here.
;              ! = any non-alphanumeric char except single quote.
( ! G [ i ] G # = I  )
( ! G [ e ] G # = E  )
( ! G [ a ] G # = A  )
( ! G [ o ] G # = O  )
( ! G [ u ] G # = U  )
( ! G [ y ] G # = Y  )
( ! G [ w ] G # = W  )
;     d Vowels in unstressed penults before stress-marked ultimas or
;        in unstressed preantepenults before stress-marked antepenults
;   Versions to allow for case where cons is not 'w', 2nd vowel is 'w/':
( [ o i ] G w / = o i  )
( [ o y ] G w / = o i  )
( [ o u ] G w / = o u  )
( [ o e ] G w / = o i  )
( [ a i ] G w / = a i  )
( [ a u ] G w / = a u  )
( [ a e ] G w / = a i  )
( [ w y ] G w / = w y  )
( [ w ^ y ] G w / = w ^ y  )
( [ i w ] G w / = i w  )
( [ y w ] G w / = y w  )
( [ u w ] G w / = u w  )
( [ e w ] G w / = e w  )
( [ a w ] G w / = a w  )
( [ e i ] G w / = e i  )
( [ e y ] G w / = e i  )
( [ e u ] G w / = e u  )
( [ o w ] G w / = o w  )
( [ i a ] G w / = J a  )
( [ i e ] G w / = J e  )
( [ i o ] G w / = J o  )
( [ i ] G w / = i  )
( [ e ] G w / = e  )
( [ a ] G w / = a  )
( [ o ] G w / = o  )
( [ w ] G w / = w  )
( [ u ] G w / = u  )
( [ y ] G w / = y  )
;  Default versions - cons may be 'w', 2nd vowel is not 'w'
;  (if cons *is* 'w', will automatically get counted as a 'C'):
( [ o i ] C H / = o i  )
( [ o y ] C H / = o i  )
( [ o u ] C H / = o u  )
( [ o e ] C H / = o i  )
( [ a i ] C H / = a i  )
( [ a u ] C H / = a u  )
( [ a e ] C H / = a i  )
( V [ w y ] C H / = M y  )
( [ w y ] C H / = w y  )
( [ w ^ y ] C H / = w ^ y  )
( [ i w ] C H / = i w  )
( [ y w ] C H / = y w  )
( [ u w ] C H / = u w  )
( [ e w ] C H / = e w  )
( [ a w ] C H / = a w  )
( [ e i ] C H / = e i  )
( [ e y ] C H / = e i  )
( [ e u ] C H / = e u  )
( [ o w ] C H / = o w  )
( [ i a ] C H / = J a  )
( [ i e ] C H / = J e  )
( [ i o ] C H / = J o  )
( [ i ] C H / = i  )
( [ e ] C H / = e  )
( [ a ] C H / = a  )
( [ o ] C H / = o  )
( [ w ] C H / = w  )
( [ u ] C H / = u  )
( [ y ] C H / = y  )
;  Cases where stress was marked by a circumflex:
;  Versions to allow for case where cons is not 'w', 2nd vowel is 'w':
( [ o i ] G w ^ = o i  )
( [ o y ] G w ^ = o i  )
( [ o u ] G w ^ = o u  )
( [ o e ] G w ^ = o i  )
( [ a i ] G w ^ = a i  )
( [ a u ] G w ^ = a u  )
( [ a e ] G w ^ = a i  )
( V [ w y ] G w ^ = M y  )
( [ w y ] G w ^ = w y  )
( [ w ^ y ] G w ^ = w ^ y  )
( [ i w ] G w ^ = i w  )
( [ y w ] G w ^ = y w  )
( [ u w ] G w ^ = u w  )
( [ e w ] G w ^ = e w  )
( [ a w ] G w ^ = a w  )
( [ e i ] G w ^ = e i  )
( [ e y ] G w ^ = e i  )
( [ e u ] G w ^ = e u  )
( [ o w ] G w ^ = o w  )
( [ i a ] G w ^ = J a  )
( [ i e ] G w ^ = J e  )
( [ i o ] G w ^ = J o  )
( [ i ] G w ^ = i  )
( [ e ] G w ^ = e  )
( [ a ] G w ^ = a  )
( [ o ] G w ^ = o  )
( [ w ] G w ^ = w  )
( [ u ] G w ^ = u  )
( [ y ] G w ^ = y  )
;  Default versions:  no need to separate cases of [..]wH^ and [..]GH^
;  because if cons *is* 'w', this will automatically be counted as 'C':
( [ o i ] C V ^ = o i  )
( [ o y ] C V ^ = o i  )
( [ o u ] C V ^ = o u  )
( [ o e ] C V ^ = o i  )
( [ a i ] C V ^ = a i  )
( [ a u ] C V ^ = a u  )
( [ a e ] C V ^ = a i  )
( V [ w y ] C V ^ = M y  )
( [ w y ] C V ^ = w y  )
( [ w ^ y ] C V ^ = w ^ y  )
( [ i w ] C V ^ = i w  )
( [ y w ] C V ^ = y w  )
( [ u w ] C V ^ = u w  )
( [ e w ] C V ^ = e w  )
( [ a w ] C V ^ = a w  )
( [ e i ] C V ^ = e i  )
( [ e y ] C V ^ = e i  )
( [ e u ] C V ^ = e u  )
( [ o w ] C V ^ = o w  )
( [ i a ] C V ^ = J a  )
( [ i e ] C V ^ = J e  )
( [ i o ] C V ^ = J o  )
( [ i ] C V ^ = i  )
( [ e ] C V ^ = e  )
( [ a ] C V ^ = a  )
( [ o ] C V ^ = o  )
( [ u ] C V ^ = u  )
( [ y ] C V ^ = y  )
; Allow for cases like "\""wla^n"\"" where 'w' is labialisation marker:
( # K [ w ] C V ^ = M  )
( # n g [ w ] C V ^ = M  )
( # [ w ] C V ^ = M  )
( [ w ] C V ^ = w  )
;  e vowels in unstressed penults after stress-marked antepenults
;  Versions to allow for case where 2nd cons is not 'w', 2nd vowel is 'w':
( / C [ o i ] G w C # = o i  )
( / C [ o y ] G w C # = o i  )
( / C [ o u ] G w C # = o u  )
( / C [ o e ] G w C # = o i  )
( / C [ a i ] G w C # = a i  )
( / C [ a u ] G w C # = a u  )
( / C [ a e ] G w C # = a i  )
( / [ w y ] G w C # = M y  )
( / Q C [ w y ] G w C # = w y  )
( / C [ w ^ y ] G w C # = w ^ i  )
( / C [ w y ^ ] G w C # = w y ^  )
( / C [ i w ] G w C # = i w  )
( / C [ y w ] G w C # = y w  )
( / C [ u w ] G w C # = u w  )
( / C [ e w ] G w C # = e w  )
( / C [ a w ] G w C # = a w  )
( / C [ e i ] G w C # = e i  )
( / C [ e y ] G w C # = e i  )
( / C [ e u ] G w C # = e u  )
( / C [ o w ] G w C # = o w  )
( / C [ i a ] G w C # = J a  )
( / C [ i e ] G w C # = J e  )
( / C [ i o ] G w C # = J o  )
( / C [ i ] S G w C # = i  )
( / C [ e ] S G w C # = e  )
( / C [ a ] S G w C # = a  )
( / C [ o ] S G w C # = o  )
( / C [ w ] S G w C # = w  )
( / C [ u ] S G w C # = u  )
( / C [ y ] S G w C # = y  )
;  Default versions: no need to separate /C[..]GHC# and /C[..]wHC#
;  as if 2nd cons *is* 'w' it will automatically be counted as 'C':
( / C [ o i ] C V C # = o i  )
( / C [ o y ] C V C # = o i  )
( / C [ o u ] C V C # = o u  )
( / C [ o e ] C V C # = o i  )
( / C [ a i ] C V C # = a i  )
( / C [ a u ] C V C # = a u  )
( / C [ a e ] C V C # = a i  )
( / [ w y ] C V C # = M y  )
( / Q C [ w y ] C V C # = w y  )
( / C [ w ^ y ] C V C # = w ^ i  )
( / C [ w y ^ ] C V C # = w y ^  )
( / C [ i w ] C V C # = i w  )
( / C [ y w ] C V C # = y w  )
( / C [ u w ] C V C # = u w  )
( / C [ e w ] C V C # = e w  )
( / C [ a w ] C V C # = a w  )
( / C [ e i ] C V C # = e i  )
( / C [ e y ] C V C # = e i  )
( / C [ e u ] C V C # = e u  )
( / C [ o w ] C V C # = o w  )
( / C [ i a ] C V C # = J a  )
( / C [ i e ] C V C # = J e  )
( / C [ i o ] C V C # = J o  )
( / C [ i ] Q C V C # = i  )
( / C [ e ] Q C V C # = e  )
( / C [ a ] Q C V C # = a  )
( / C [ o ] Q C V C # = o  )
( / C [ w ] Q C V C # = w  )
( / C [ u ] Q C V C # = u  )
( / C [ y ] Q C V C # = y  )
;  f Vowels in stressed penults before non-stress-marked ultimas (default)
;  Sorting out orthographic 'w' in (putative) penult:
;  i 'ywy' or Vwy cluster, eg. 'tywyllwch':
( [ y w y ] S G w G # = y M Y  )
( [ y w y ] Q C V C # = y M Y  )
( V [ w y ] Q C V C # = M Y  )
;  ii  'wyw' cluster:
;  Versions where 2nd 'w' is cons and no cons intervenes
;  but (non-'w') vowel follows (eg. 'gwywo', 'dwywaith'):
( # K [ w y w ] H = M Y M  )
( # n g [ w y w ] H = M Y M  )
( # S [ w y w ] H = M Y M  )
( # [ w y w ] H = W Y M  )
( K [ w y w ] H = W Y M  )
( n g [ w y w ] H = W Y M  )
( S [ w y w ] H = W Y M  )
( [ w y w ] H = W Y M  )
;   Versions where 2nd 'w' is vowel and no cons intervenes (eg. 'gwyw'):
( # K [ w y w ] C # = M Y W  )
( # n g [ w y w ] C # = M Y W  )
( # [ w y w ] C # = M Y W  )
( K [ w y w ] C # = W Y W  )
( n g [ w y w ] C # = W Y W  )
( [ w y w ] C # = W Y W  )
;  iii  'wy' cluster:
;  Versions where 2nd 'w' is vowel, at least 1 cons precedes it (eg. 'gwydrwr'):
( # K [ w y ] S G w C # = M Y  )
( # n g [ w y ] S G w C # = M Y  )
( # [ w y ] S G w C # = W Y  )
( K [ w y ] S G w C # = W Y  )
( n g [ w y ] S G w C # = W Y  )
( [ w y ] S G w C # = W Y  )
;   Versions where 2nd vowel is 'wy' and at least 1 non-'w' cons precedes it
;   (eg. 'gwyddbwyll') - the 'w' will be counted under the 1st 'C' here:
( # K [ w y ] S C y C # = M Y  )
( # n g [ w y ] S C y C # = M Y  )
( # [ w y ] S C y C # = W Y  )
( K [ w y ] S C y C # = W Y  )
( n g [ w y ] S C y C # = W Y  )
( [ w y ] S C y C # = W Y  )
;  Default versions - neither following cons nor vowel is 'w' (eg 'gwylan'):
( # K [ w y ] G H C # = M Y  )
( # n g [ w y ] G H C # = M Y  )
( # [ w y ] G H C # = W Y  )
( K [ w y ] G H C # = W Y  )
( n g [ w y ] G H C # = W Y  )
( [ w y ] G H C # = W Y  )
;  Rules for wy in penult after at least 1 cons (not c,g,ch,ng,ngh,w)
;  where following cons (if any) is not 'w':
;  i  Where ultima vowel is 'w':
( S [ w y ] G w C # = W Y  )
; ii  Default (where ultima vowel not 'w'):
( S [ w y ] G H C # = W Y  )
; Two vowel graphemes in penult, NOT 'wy' or 'ywy':
; Versions to deal with case where 1st cons is not 'w', 2nd vowel is 'w':
( [ o i ] G w G # = O I  )
( [ o y ] G w G # = O I  )
( [ o u ] G w G # = O U  )
( [ o e ] G w G # = O I  )
( [ a i ] G w G # = A I  )
( [ a u ] G w G # = A U  )
( [ a e ] G w G # = A I  )
( [ i w ] G w G # = I W  )
( [ y w ] S G w G # = Y W  )
( [ u w ] G w G # = U W  )
( [ e w ] G w G # = E W  )
( [ a w ] G w G # = A W  )
( [ e i ] G w G # = E I  )
( [ e y ] G w G # = E I  )
( [ e u ] G w G # = E U  )
( [ o w ] G w G # = O W  )
( [ w ^ y ] G w G # = W Y  )
( [ w y ^ ] G w G # = w Y ^  )
;  Versions where intervening cons is yod (2nd vowel therefore not 'w'):
;  ( I = 1 or more of;  J = zero or more of;   a|e|i|o|u|y|w )
( [ o i ] I J C # = O J  )
( [ a i ] I J C # = A J  )
( [ e i ] I J C # = E J  )
( [ w ^ y i ] I J C # = W Y J  )
( [ w y ^ i ] I J C # = M Y ^ J  )
;   Versions where no consonant intervenes:
( [ o i ] V C # = O J  )
( [ o y ] V C # = O I  )
( [ o u ] V C # = O U  )
( [ o e ] V C # = O I  )
( [ a i ] V C # = A J  )
( [ a u ] V C # = A U  )
( [ a e ] V C # = A I  )
( [ i w ] i V C # = I W  )
( [ y w ] i V C # = Y W  )
( [ u w ] i V C # = U W  )
( [ e w ] i V C # = E W  )
( [ a w ] i V C # = A W  )
( [ i w ] V C # = I M  )
( [ y w ] V C # = Y M  )
( [ u w ] V C # = U M  )
( [ e w ] V C # = E M  )
( [ a w ] V C # = A M  )
( [ e i ] V C # = E J  )
( [ e y ] V C # = E I  )
( [ e u ] V C # = E U  )
( [ o w ] i V C # = O W  )
( [ o w ] V C # = O M  )
( [ w ^ y ] V C # = W Y  )
( [ w y ^ ] V C # = M Y ^  )
;  Default versions: 1st cons may be 'w' (no separate [..]wHC# and [..]GHC# ):
( [ o i ] Q C V C # = O I  )
( [ o y ] Q C V C # = O I  )
( [ o u ] Q C V C # = O U  )
( [ o e ] Q C V C # = O I  )
( [ a i ] Q C V C # = A I  )
( [ a u ] Q C V C # = A U  )
( [ a e ] Q C V C # = A I  )
( [ i w ] Q C V C # = I W  )
( [ y w ] Q C V C # = Y W  )
( [ u w ] Q C V C # = U W  )
( [ e w ] Q C V C # = E W  )
( [ a w ] Q C V C # = A W  )
( [ e i ] Q C V C # = E I  )
( [ e y ] Q C V C # = E I  )
( [ e u ] Q C V C # = E U  )
( [ o w ] Q C V C # = O W  )
( [ w ^ y ] Q C V C # = W Y  )
( [ w y ^ ] Q C V C # = w Y ^  )
;  'i'-plus-vowel(s) in ultima put here in 'penult' section instead of the 
;   following 'ultima' section because otherwise this input pattern is treated
;   as a sequence of diphthong-in-penult, no cons, monophthong-in-ultima:  so
;   it needs to be picked up at this earlier stage:
;   ( I = a | e | o ,  ie. all vowels that can follow yod)
( [ i a u ] # = J a u  )
( [ i ] I J C # = J  )
( [ i ] I "'" V C # = J  )
( [ i ] I ^ V C # = J  )
; 'i-plus-single-vowel' in penult:
( [ i a ] S G w C # = J A  )
( [ i e ] S G w C # = J E  )
( [ i o ] S G w C # = J O  )
; Where string is trisyllabic with 'w' in ultima:
( [ i a ] S G V S G w C # = J a  )
( [ i e ] S G V S G w C # = J e  )
( [ i o ] S G V S G w C # = J o  )
;  Default versions:
( [ i a ] Q C V C # = J A  )
( [ i e ] Q C V C # = J E  )
( [ i o ] Q C V C # = J O  )
; This ultima looks like penult to rules, so put here before single [y] rules:
( [ y w ] G # = y w  )
;  Single vowel in penult:
; For the case where a cons intervenes, all three possible separate
; versions are given, to avoid risk of antepenult looking like a 
; penult (and so getting stressed) due to the presence of a 'w' in
; the ultima or antepenult, eg. 'ymwrthod', 'gwargaledwch', 'papurwr'
; (this might happen if just '[..]QCVC#' was specified):
;  Versions where ultima V is 'Vw' diphthong, at least one C must intervene:
( [ i ] S G H w G # = I  )
( [ e ] S G H w G # = E  )
( [ a ] S G H w G # = A  )
( [ o ] S G H w G # = O  )
( [ w ] S G H w G # = W  )
( [ u ] S G H w G # = U  )
( [ y ] S G H w G # = Y  )
;  Versions where ultima V is 'w' monophthong, at least one C must intervene:
( [ i ] S G w G # = I  )
( [ e ] S G w G # = E  )
( [ a ] S G w G # = A  )
( [ o ] S G w G # = O  )
( [ w ] S G w G # = W  )
( [ u ] S G w G # = U  )
( [ y ] S G w G # = Y  )
;  Versions where intervening C is 'w', ultima V not 'w':
( [ i ] G w H G # = I  )
( [ e ] G w H G # = E  )
( [ a ] G w H G # = A  )
( [ o ] G w H G # = O  )
( [ u ] G w H G # = U  )
( [ y ] G w H G # = Y  )
; Default versions where neither ultima V nor intervening C is 'w':
( [ i ] S G H G # = I  )
( [ e ] S G H G # = E  )
( [ a ] S G H G # = A  )
( [ o ] S G H G # = O  )
( [ w ] S G H G # = W  )
( [ u ] S G H G # = U  )
( [ y ] S G H G # = Y  )
; Versions where *NO* C intervenes and V does not start with 'w':
; i Cases where 2nd vowel is a diphthong:
( [ a ] y w G # = A  )
( [ a ] i w G # = A  )
( [ e ] i w G # = E  )
( [ o ] i w G # = O  )
( [ a ] o V G # = A  )
( [ e ] o V G # = E  )
( [ u ] o V G # = U  )
( [ e ] a V G # = E  )
( [ o ] a V G # = O  )
( [ u ] a V G # = U  )
( [ a ] u w G # = A  )
( [ e ] u w G # = E  )
( [ o ] u w G # = O  )
( [ a ] e V G # = A  )
( [ o ] e V G # = O  )
( [ u ] e V G # = U  )
; ii  1st V is monophthong, followed by diaeresis (not found by 'hashtest'):
( [ a ] "\"" V G # = A  )
( [ e ] "\"" V G # = E  )
( [ i ] "\"" V G # = I  )
( [ o ] "\"" V G # = O  )
( [ u ] "\"" V G # = U  )
( [ y ] "\"" V G # = Y  )
( [ w ] "\"" V G # = W  )
; iii Both V's monophthongs, no "\"" (all possible non-diphthong combinations):
( [ a ] o G # = A  )
( [ e ] a G # = E  )
( [ e ] o G # = E  )
( [ o ] a G # = O  )
( [ o ] u G # = O  )
( [ u ] a G # = U  )
( [ u ] e G # = U  )
( [ u ] o G # = U  )
; To avoid 'wy' in ultima looking like 2 separate sylls, ie Wy 
; (eg. 'gwyddbwyll') - put here despite being an ultima problem,
; because it can 'look like' penult-plus-ultima to the rules.
; But first sort out case where 'w' is cons (eg. 'gwewyr', 'awyr'):
( H [ w ] y G # = M  )
( H w [ y ] G # = y  )
( S G [ w y ] G # = w y  )
; Next rule must have 'Q' in to ensure optional 'C' doesn't allow a cons
; 'w' to get treated like a vowel 'w', as in 'widw' (wrongly 'WIdw');
; Also must have 'G' at end to block case where 'w' in antepenult looks like
; a penult 'w' due to presence of 'w' in ultima (eg. 'gwdihw^'):
( [ w ] Q C V G # = W  )
; g  Vowels in unstressed ultimas, antepenults (default), & unstressed penults
;   Sequences of three vowel graphemes
( [ o i ] V C = o J  )
( [ a i ] V C = a J  )
( [ i w ] i V C = i w  )
( [ y w ] i V C = y w  )
( [ u w ] i V C = u w  )
( [ e w ] i V C = e w  )
( [ a w ] i V C = a w  )
( [ i w ] V C = i M  )
( [ y w ] V C = y M  )
( [ u w ] V C = u M  )
( [ e w ] V C = e M  )
( [ a w ] V C = a M  )
( [ e i ] V C = e J  )
( [ o w ] V C = o M  )
;    Diphthongs and diphthong blends in ultima:
( [ o "'" i ] = o "'" i  )
( [ o i ] = o i  )
( [ o y ] = o i  )
( [ o "'" u ] = o "'" u  )
( [ o u ] = o u  )
( [ o e ] = o i  )
( [ a "'" i ] = a "'" i  )
( [ a i ] = a i  )
( [ a "'" u ] = a "'" u  )
( [ a u "'" r ] # = a u "'" r  )
( [ a u "'" n ] # = a u "'" n  )
( [ a u ] = a u  )
( [ a e ] = a i  )
( [ w y ] = w y  )
( [ i "'" w ] = i "'" w  )
( [ i w ] = i w  )
( [ y w ] = y w  )
( [ u "'" w ] = u "'" w  )
( [ u w ] = u w  )
( [ e w ] = e w  )
( [ a w ] = a w  )
( [ e "'" i ] = e "'" i  )
( [ e i ] = e i  )
( [ e y ] = e i  )
( [ e "'" u ] = e "'" u  )
( [ e u ] = e u  )
( [ o w ] = o w  )
( [ i a ] = J a  )
( [ i e ] = J e  )
( [ i o ] = J o  )
;       "'"y' in unstressed ultima:
( w G [ y ] C # = y  )
( w G [ y ] # = y  )
;  Default:
( V C [ y ] C # = y  )
( V C [ y ] # = y  )
;       'y' in unstressed antepenult:
( [ y ] = y  )
;  Deal with word-final non-diphthongising vowels after single quote (those
;  vowel graphemes which can diphthongise with the preceding vowel grapheme
;  will already have been picked up, so no need to state the context exactly):
( "'" [ i ] # = i  )
( "'" [ e ] # = e  )
( "'" [ a ] # = a  )
( "'" [ o ] # = o  )
( "'" [ u ] # = u  )
( "'" [ w ] # = w  )
;   Default for monophthongs in unstressed ultimas, antepenults 
;   and unstressed penults (is the default for all vowel graphemes):
( [ i ] = i  )
( [ e ] = e  )
( [ a ] = a  )
( [ o ] = o  )
( [ u ] = u  )
; 'w' is either cons or vowel depending on context:
( K [ w ] H = M  )
( n g [ w ] H = M  )
( # [ w ] H = M  )
( H S S S [ w ] H = M  )
( H S S [ w ] H = M  )
( H S [ w ] H = M  )
( [ w ] = w  )
;     h  Let consonant graphemes pass through unchanged:
;         (k,q,v,x: In English alphabet but not Welsh one, but
;         added anyway to deal with the odd English word).
 ( [ b ] = b )
 ( [ c ] = c )
 ( [ d ] = d )
 ( [ f ] = f )
 ( [ g ] = g )
 ( [ h ] = h )
 ( [ j ] = j )
 ( [ l ] = l )
 ( [ m ] = m )
 ( [ n ] = n )
 ( [ p ] = p )
 ( [ r ] = r )
 ( [ s ] = s )
 ( [ t ] = t )
 ( [ w ] = w )
 ( [ z ] = z )
 ( [ k ] = k )
 ( [ q ] = q )
 ( [ v ] = v )
 ( [ x ] = x )
 ( [ "'" ] = "'" )
;       i  Capitalised vowels and underscore from epen.r
;  [OI]=OI
( [ O Y ] = O I  )
( [ O E ] = O I  )
;  [AI]=AI
;  [AU]=AU
( [ A E ] = A I  )
;  [WY]=WY
;  [IW]=IW
;  [YW]=YW
;  [UW]=UW
;  [EW]=EW
;  [AW]=AW
;  [EI]=EI
( [ E Y ] = E I  )
;  [EU]=EU
;  [OW]=OW
;  [A]=A
;  [E]=E
;  [I]=I
;  [O]=O
;  [U]=U
;  [Y]=Y
;  [_]=_
;  [,]=,
;  [.]=.
;  [-]=-
;  ["\""]="\""
;  [:]=:
;  [']='
;  [--]=--
;  [?]=?
;  [;]=;
;  [+]=+
;  [*]=*
;  [$]=$
;  [%]=%
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
))

(provide 'newwelstr)