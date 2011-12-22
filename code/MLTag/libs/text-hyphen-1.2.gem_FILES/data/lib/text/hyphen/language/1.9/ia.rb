# -*- encoding: utf-8 -*-
# Hyphenation patterns for Text::Hyphen in Ruby: Interlingua
#   Converted from the TeX hyphenation/iahyph.tex file, Version 0.2b.
#   Released 3 July 2001, Created by Peter Kleiweg, kleiweg@let.rug.nl
#
# The original copyright holds and is reproduced in the source to this file.
# The Ruby version of these patterns are copyright 2004 Austin Ziegler.
#--
# File: iahyphen.tex
#
# TeX hyphenation patterns for Interlingua.
#
# Version 0.2b. Released 3 July 2001.
#
# Created by Peter Kleiweg, kleiweg@let.rug.nl
#
# About Interlingua: http://www.interlingua.com/
#++
require 'text/hyphen/language'

Text::Hyphen::Language::IA = Text::Hyphen::Language.new do |lang|
  lang.encoding "UTF-8"
  lang.patterns <<-PATTERNS
.ch2 .de4s .in1 .se4i a1a a1b a2b1l a3b4lo a1ca a1ce a1ch a4chr a1co a1cr
a1cu a1d 1adm 1adv ae1 a1el aero3 a1g a4g3ed 1agg a1h a1ic a1is a1iv a1j a1k
a1la a1le al3ei a1lo a1lu a1m 3anim an4sp a1o a1p a1q a1ra a1ri a1ro a1ru
a1ry a1s2h 3asth a1t atyr4 a1v a1w a1z 1ba 2b1b b3bo b1c 2b1d 1be b1h 1bi
bi4s3a b1j b1lu b2ly b1m b1n 1bo b1p 1b2r 2b1s2 b1t 1bu bu1e bu1i b1v ca1i
2c1c c1d 4c3enn 1chr 2chs 2cht 1chu 1ci 2c1k 1c2l 2c1m co4cl co3p2 c1q c2r
c1s2 2c1t ctro3 cu1a cu1e cu1i 1cy cy4ne cyr2 c1z 1da 2d1d 1de de4ru des3e
de4s3o de4su 2d1g d1he dia3s4 di3p4t di4sa di4s3e di4si di4so di4s3u 2d1j
2d1m 1do do4l3a 4d3osm d2r dro3s4 du1a du1e du1i 2d1v dy2s e1a e2au e1b e1ca
e1ce e3che e3chi e1co e1cr e1cu e1d e1e e1f 1eff e1g e1h e1i e1j e1k e1la
e1le e1lo el3od e4l3om e1lu e1m e4m3ag 2enl eno3p4 e1o eo3g2 eo3p2 e1q e1ra
e1ri e1ro 4erog ero3p4 e1ru er3ur e1ry es4em e2st es3ue e1t eu1 eu4ce e1un
e1v e1w 1fa 2f1f 2f1h 1fi 1f2l 1fo 1f2r f1t 1fu 1ga 2g1d 1ge 4g3evi 2g1g 1gi
4g3ima g2l 2g1m 2g1n 1go 1g2r 2g1s2 1gu1 gym2 gymn3 gy4na gy4r3a 2g1z h2e
hec2 hect3 he3ur h3loc 2h1m h1n ho3g2 ho3p2 ho3rh h2r h1s h1t i1a ia4l3a
i1b2 i1c i1d ido3 idop4 i1e i1f i1g i1h i1i i1k i1l i1m i4mad 1imb 1inf 1inr
ins2 1inv i1o1 io3g2 ios2 io2x i1p i1q i1ra i1ri i1ro iro3p4 ir3ur is3ac
is3as is3au is3eq is3es is3il is3in i3s4ph i1t i1u i1v i1z ka4le ke1 kra1
4l3alg 4l3arc l1b 2l1c 2l1d le3ch le4id 2l1f l1g 2l1h 1li 2l1k 2l1l ll3ur
2l1m l4m3od l1n 2lod l3odo 4lopi 2l1p l1q 2l1s2 2l1t l4t3un lu1e lu1i 2lur
2l1v 1ly ly3ch 1ma 2m1b m1c 1me me3ch me4s3e m1f 1mi mi3p2 mis4i m1j m1l
2m1m mme4n3 2m1n mn3am mn3as mno1 mn3ob mn3op 1mo 4m3ony mo3p2 mo3rr mos4p
mo3s4t 2m1p m3ps m1s2 1mu 2m1v 1my my4rr 1na n1ae n3alg n3ani n1a2p n1au n1b
n1c 2n1d 1ne n1eq n1ex n1f n1g n1h 1ni n1iq ni3sp n2it n1j n1l n1m n1n2 1no
nob4l n3o3s4p n1ox n1q n1r n1s n4s3ie n4sir n2sl ns2t n1t n4t3ah n4t3ap 1nu
nu1a nu1e nu1i n1v 1ny n1z o1a o1b ob3lo 1obs o1c oc3le o1d o1e o1f o1g o1h
o1i o1j o1l om4na on2a ono1 onos4 ons2 o1o o1p o1q o1ra o1ri o1ro or4rh o1ru
o1s2l os4po o1t o4t3ac oto3s4 ou1 o1ug o1v oy1 o1z 1pa pan3s 1pe 1ph 1pi
1p2l pl4a 4pl3op p1n p2n1a p2ne 1po 2p1p p4p3ia 1p2r 2p1s p4s3od 3p2sy 2p1t
1pu pu1b2 2pu1e pu1i pyl1 py4lo qu2 qua4n 4r3alg 2raq 4r3arc r1b r1c 2r1d
1re re3ch regi3 4r3enn re3ut r1f 2r1g 1rhi r1hu r3hyd r1j r1l 2r1m r1n r1p
r1q r1r rr3aq r1s2 2r1t ru1a ru1e ru1i r1v r1w ry4se r1z 1sa s3abu 4s3act
2s1af s3agr s3ann 2s1ap 2s1aq s3arg s3arm s3art 2s1b 1s2c scle4 s1d 1se 2s1f
2s1g s1h 1si 4s3ige s3iro s1j 1sk s1l s4lav 2s1m s1n 1so sob2 s3obe s3obl
s3occ s3odo s3ord s3org s3oss 2s1ox s1p 2spa spa4i 2spl 2spo s1q s1r 2s1s2
s3sa s1t 1su su1a su4ba su4br su1e su1i 2s1un 2s1v 1sy 4t3alg 4t3amb 4t3art
2t1d 4t3eco 2t1f 2t1g th1l 2thm ti3s4p t1l 2t1m tmo1 to3s4p 4t3oxy 2t1p t2r
4tr3or 2t1s 2t1t tu1a tu1e tu1i tu4s3a ty1 2t1z u3ani u1as u1av ub3al ub1l
ub3ro u1ca u1ce uc3em u1ch u1co u1cr u1cu u1d u1el u1ib u1ic u1la u1le u1lo
u1o1 u1ra 3urgo u1ri u1ro u1ru u2st u1t u1u u1v va1i vi3ru 2vn v2r w2n1 x1a
x1c x1e x1h x1i x1o x1p x1q x1s2 x1t x1u xu1a x1y1 1xyl y1a y1b yc1a y1ce
ych1 y1co yc4t3a ydr1 y1e y1g y1h y1i 2yl y3lac yl3am y1le y1lo yn3an yn3eg
y1o ypo1 ypos4 y1r yro1 yros4 ys1e y1t y1u y1z ze1 1zi 1zu1 2z1z
  PATTERNS

  lang.exceptions <<-EXCEPTIONS
alc-un alc-u-nis-si-me alc-un-men-te a-lic-un a-lic-u-nis-si-me
a-lic-un-men-te mos-lem qualc-un qualc-u-nis-si-me qualc-un-men-te
  EXCEPTIONS
end
