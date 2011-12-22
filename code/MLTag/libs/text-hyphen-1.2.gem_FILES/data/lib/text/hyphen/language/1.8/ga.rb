# Hyphenation patterns for Text::Hyphen in Ruby: Irish Gaelic
#   Converted from the TeX hyphenation/gahyph.tex file, by Kevin P. Scannell
#   <scannell@slu.edu> (2004).
#
# The original copyright holds and is reproduced in the source to this file.
# The Ruby version of these patterns are copyright 2004 Austin Ziegler.
#--
# `gahyph.tex': Hyphenation patterns for Irish
# Copyright (C) 2004 Kevin P. Scannell <scannell@slu.edu>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
#%% ====================================================================
#%%  @TeX-hyphen-file{
#%%     author          = "Kevin P. Scannell",
#%%     version         = "1.0",
#%%     date            = "23 January 2004",
#%%     time            = "15:46:12 CST",
#%%     filename        = "gahyph.tex",
#%%     email           = "scannell@slu.edu",
#%%     codetable       = "ISO/ASCII",
#%%     keywords        = "TeX, hyphen, Irish, Gaeilge",
#%%     supported       = "yes",
#%%     abstract        = "Hyphenation patterns for Irish (Gaeilge)",
#%%     docstring       = "This file contains the hyphenation patterns
#%%                        for the Irish language",
#%%  }
#%% ====================================================================
#
#    See the web page  http://borel.slu.edu/fleiscin/index.html
#    for more information on how these patterns were generated.
#  
#    Please report incorrect hyphenations to the author at the 
#    email address above.
#message{Hyphenation patterns `gahyph.tex' Version 1.0 <2004/01/22>}
#++
require 'text/hyphen/language'

Text::Hyphen::Language::GA = Text::Hyphen::Language.new do |lang|
  lang.patterns <<-PATTERNS
.ab4ai .ab6ar .ab5r .ac6ad .ach6ar .ad6aim .ad6am .ae5n .ag6ar .agh4a .ag4�
.ag5r .ag6�i .ai6c5 .ail6te .ain3g4 .ain6te. .ain6t5�n .air6n� .ais3 .aist4
.ais6te. .a�4 .ala5m6 .al5g6 .allag6 .alm4� .al2t5a .al6t5� .am6ac .am6�
.an2a .ana5c .anach6 .an2� .anc6 .an6d�r .an6dr .an6fa .ang4l .an6i .an6lain
.an6lan .an6� .an6rai .an6sa .an2ta .ar2 .aral4 .aralt3 .ara5m6 .ara5s6
.ard5 .ar�5 .ar�c6 .art4 .as6ail .as6aim5 .as6al. .as6am .asa5m6a .asc6ar
.as6� .as6pa. .as2t .ast5ai .ast5a� .ast3� .as6t� .as4� .ata6 .at5ar. .at6�
.�il6te. .�il6t5ea .�ir5ge .�ir5g� .�ir6s .�l6t .�r2a .�r6m .ba6d .bad3�
.bal6b .beo5f .beo5g .beo5id .beo5im .bh4 .bh�5ite. .bh�5it� .bheo5f
.bheo5id .bheo5im .bheo5in .bh�5d�s .bh�5mis .bh�5oda .bh�5omar .bh�5te�
.bh�5t� .bhl�3 .bhreo5f .bhreo5id .bhreo5im .bhreo5in .bhr�3o .bl�3 .breo5f
.breo5id .breo5im .br�3o .ca4 .cach5 .cacht6 .cad5� .ca�5d .ca�5g� .ca�5m
.ca�5o .car6t5ar .ch4 .cha4 .chach5 .chad5� .cha�5d .cha�5g� .cha�5m .cha�5o
.cha�5te� .cha�5t� .chan5� .char6t5ar .char6t� .ch�r5ta. .cheil6te. .ch�6
.chl�5f .chl�5id .chl�5im .chl�5inn .chna�3 .chn�5 .ch�is5 .ci6 .cil6 .c�6
.cli6 .clip5 .cl�5f .cl�5id .cl�5im .cna�3 .cn�5 .da6 .dh2 .dhl�5d .dhl�5g
.dhl�5m .dhl�3o .dh�5ite. .dh�5it� .dhreach5 .dhreacht6 .dhreo5f .dhreo5id
.dhreo5im .dhreo5in .dl�5d .dl�5g .dl�5m .dl�5o .d�5f .d�5id� .d�5im
.d�5ite. .d�5it� .dreach5 .dreo5f .dreo5id .dreo5im .ead1 .ea6g3 .eal4t3
.earb5 .eas3t� .ei6 .eisc3e .eis4il .�a6b .�ad6ar .�a3g6� .�ar5 .�art6
.�i5d6r .�i5gear .�im5� .fa6 .fach3 .feo5f .feo5id� .feo5im .fhrioch5
.fhua6fair .fhua6fara .fhua5im. .f�5d� .f�5g .f�5m .f�5odh .f�5onn
.geal6t5a� .geat5 .gh2 .ghair5t .ghlae3 .ghr�6n .g�f5 .ha4 .hab6ai .hab6ar
.hac6ad .hag6ar .hag4� .hail6te .hain3g .hain3t .hain6te. .hair6n� .hais5ce
.hais5tea .hais5t6eo .haist6i .hais5tig .ha�4 .hala5m6 .halm4� .hal4t3a
.hal6t5� .han2a .hana5c .hanc6 .han6fa .hang4l .han6� .han4ta .har2a .har6�
.har6�5 .har�c6 .hart6 .has6ai .has6al. .has6am .has4ta .hat6� .h�6
.h�il6te. .h�il6t5ea .h�ir5ge .h�ir5g� .h�ir6s .h�l6t .h�r4a .h�r6m .head3
.heal4t3 .heis6il .h�ad6ar .h�a3g6� .h�id4e .h�i5dea .hib6� .him6ire .hios5
.hiosc6 .hir4 .his4 .hist3 .hit6eo .hit6r .h�2 .h�l3 .h�och5 .h�ocht6 .hoc4r
.hod6 .hogh6 .hoir6n5i .hol6ac .hom2 .hor5m .hort4 .h�6 .hua4f .huaf5a
.huil4e .h�d4 .ia5it .iat6 .ib6� .ibh5 .id2 .il3 .im6ire .in6d5ia .in6id
.in6�n .in4�o .in6�r .in6ste. .int6e .iom�in5 .ios3 .iosc6 .iost4 .ir4 .is4
.ist6 .it6 .�l3 .�o6 .�och5 .�ocht6 .�os5 .la4 .lach6t5 .lad5a .lag5� .lait5
.lan5c .lao5n .l�5it� .leab3� .lea6m .leas5 .leat6a� .leo3c .leoch4 .l�5ann.
.l�5ig� .li6 .lib5� .lim5 .lint6 .lip5 .l�5d .l�5g .l�5mi .l�5od .l�5omar
.l�5onn .l�6t .l�t5i .l�2 .mad5a .mair5t�. .ma�5d .ma�5g� .ma�5mi .ma�5od
.ma�5oma .ma�5on .ma�5te� .ma�5t� .mam5 .man2t .ma6r .mar6l5 .mar6s5ac
.mar6s5ai .mar5ta .mar5� .ma6t .mat3� .mead5a .meat5� .mh2 .mhad5a
.mhais6te. .mhais6t�. .mha�5d .mha�5g� .mha�5mi .mha�5od .mha�5oma .mha�5on
.mha�5te. .mha�5te� .mha�5t� .mhan4t3 .mhar6l5 .mhar6sa. .mhion6t5a .mh�6oc
.mh�6 .mh�ch5 .m�6oc .m�5st .nair5 .nais5 .na�3 .na�o5l6 .nar5 .nd6 .nd�5f
.nd�5id� .nd�5im .nd�5in .neach6 .neacht5 .ne�6 .ne�d5 .ng4 .ng�f5 .nit6
.n�5d .n�5g� .n�5m .n�6oc .n�5od .n�5om .n�5on .nom6 .och6t5 .oc4r .od6
.ogh6 .oilt6 .oir4n3e .oir6n5i .oir6n� .oir5t .ol6ac .om6a .or6ai .ort4
.or6thu .os6l�. .ost5a .�p6 .�r4� .phor5t6r .pist6 .ra4 .rad5a .rad5�
.raf6t5 .rai6 .rat5� .r�6 .reas5 .reo5f .reo5id .reo5im .reo5in .r�im5i
.r�5d� .r�5g� .r�5mi .r�6ocha .r�5od .r�5oma .r�5onn .r�b5a .r�5c .r�ch6
.r�st5 .rua5im. .r�m5 .sa6l .sal5a .s�5it� .sc6 .sca6 .scad5� .scar5 .scart6
.searbh5 .s�a5l6ain .sh�5inn. .si4 .sim3 .si�n4 .si�nt3 .s�4o .slios5 .sm4
.sn�5d .sn�5g .sn�5m .sn�5od .sn�5oma .sn�5on .s�5f .s�5id� .s�5im .s�5inn
.spl�ach5 .st4 .steam5 .ta6 .tach6t5 .tan5g .tap5 .tar5ta .t�it5e .th2
.th�it5ea .thr�5it� .thr�f5 .ti6 .tr�f5 .ts�6o .tua5im .ua4f .uaf5a .ua6i
.uas6ala .uil2e .uir6t .uirthi5 .un6s5 .ur5b .ur3n4 .�d2 .�m5 .�r6�i ab1a
abac6 aba5ca aba5d� ab4airt a3b4al ab4art ab1� ab3d abh1 abh6aile a3bh6e
abh6�r abh6re abh2t a5bi ab1l a5b�. ab3�ig a5b�n a1br ab3rad6 abra3da a5bu
ab1� ac1a ac4ad� acae6 ac4aoi ac6ard aca1s4 ac4ast� aca3t4� a3c�id ac�r5
ac5� ach1a a4cha. acha6d5� achar5 ach4arf acharn6 achart6 ach1� 6ach�r
6a3che ach3� 4ach1l a6chli ach3�g ach5�r ach1r 6achri ach1� ac1l 3acm ac1n
ac1� ac1ra acra3f ac4ras ac3r� a5cr� ac5ua ac5� adag6 ad1al ad1am 4adamh
ada5n6� ad3ara ad3arl ad5art ad5�il ad5�s 4adc adh1 adhb1 a3dhi 4adhro a5dh�
ad3i 4ad3l 4a3d4o a1d� a4d3�d a2d�f a2d3�id a4d3�ig a2d3�im a4d3�inn ad1r
ad3rog ad3u ad1� a3d4�r ae3a ae1� aeil3 aeilg4 aeil�5te af1 afa3d� af5air
af5art af�il3 af�ilt6 afhol6 afholt5 a3f6l a3fo a3f�ib a3f�in a1f2�n af6r�
af6� agad3� agair5n6 ag2al ag5�is ag3e ag3� agh1 agh4aid agh5an a5ghi ag3i
ag1l a3go a3graim a3gram a6g5re ag3ri ag5rui ag3r� ag3ua ag3� a1h ah6a
aich6t ai5ci� aic5r 6aidear 4aidhl aid1i aid�t5 ai3fil ai3gin 6aigis ail5bh�
ailc3ea ailp3i ailp3�n ailt2 a6imh 4ai3mia aim3ise ain5� ains5eo ain6tean
ain5t� air6bh3r airb4� air4b5r air4d� airf5ean air6f5in. airf3� air4f�n
4airisc airis6t air5n�n air5n�o air4t5�is 6aisei aisi3n4� ai5s6�l 4aisp
ais5teog ais6ti5s ais5t6�n. 4aitei ai5t6il aits3e 4aivi a�2c 4a�n� a�3o3d�
a�o5l6an a�3onna a�5�i al1a ala3b alabh4 al4ainne alait4 al3a� alan4a alan5d
al2ann alas3 alasc6 4al4ath al1� a3l�ib 6al�m a3l�r al1c� 6al5e al4f3air
al3g� al3i a3l� a6ll al5o al1� 2alr a6lt alt3e al6t5�d al4t�f al6t5�id
al6t5�im al6t5�in al6t� al3ui al3� al�3ch4 ama3b ama3d4� am1al am5all am1an
am3ara ama3ra� a6mas ama5s� 4am�l am4�na 4amb amh1 amh5ad amhais6t a3mhas
a1mo am5�na 6amp amp1a amp1� am4pr 4amt am5ut am3�i am5�r anac4 ana3ca an6ag
6anaige anaist4 an3ait an5a� ana5l6� ana5m6� ana5r6a anat6 an1� an5�is
a5n6�ise an5�r 6anb anc1a anc4aire an5c�5 an2d3� and�6 and�b5 and3o an3dr
6andu an3e an6ea an3� ang1 ang3a anga3r� ang3� an5g�. anin5 an4ma ann5 6ann�
an3oi an5o� an1� an�d4 an�3d� an4san an6sin an6tu an3u anuas6 an1� aoch3
aocht6 6aod ao5dar ao5id�s ao5im. ao3imi aoin6s aoin3t2 ao4l1 ao5mar aon3u
ao6r1 aorg4 aort4 aos3t ap1 apa5d� a3p4ait aplais6 ar1a ara3b� ar6ac.
ara3c6� arach6t5 ara5c� ara3g4a araic6� ara5l4� ara3p4 ar5as. ara5s� ara3t�
ar1� arbh3a ar3bhe arch6 arc1� ar1cr ar1e ar2f1� ar3i arm4� a5ro ar1�
ar�c6ar ar5�n ar5�p ar1p ar4p3� ar4s3�l ar6sta ar3u ar3�il ar5�l ar3�p
ar5�5s6 a5r�t asa5c6a a3s4ae asain4 as5a� as6alait asal2t asa5mait as6arb
asc1 ascar5 as5cara ascart6 as3co 4ascr 4as3e as3� as3i as3� 2asl as1o as1�
as6�il a3s4�l as1ta as6t5ais ast4a�. ast3al asta5r6� as6tas as3t�n. as5t�
as3ti as5to a4st� as5t�r as5tua as3t� as1u as1� as�d6 as�3it as�5m at1a
atac6 ata5c� atad5�n at4agr a5t6aint at5a1l2 ata3m atam4� a3t4ant ata3p4
at5arn at3as at�6i a5t�r at�5t at�th6 at�3 at�ad6 ath1 athr�5d athr�5g�
athr�5m athr�5o ath6us at5�d a6t�g at3�id at3�ig at3�im at5rap at1r� a6tro
ats5a at6sar at1u at4ui at1� a5v� �b3a �b4al �b1� �bh1 �bht6 �b1l �5bo �b3�
�b3� �c1a �car5 �carn6 �ch5� �ch5e �ch5i �ch3l �ch5r �ch4t3 �c3l �c3r �c3�
�d1 �3d4ar �dh3a �dh5� �1fa �4fa. �6f3ac �f5air �f5ara �3f� �f3l �f1r �ga5d�
�3g� �g3r �g5u �5h� �ib5� �id1 �3id�s �3ig� �il5b �il3c6 �ilt6e� �ilt3i �i6m
�3im. �im5� �6imh �1imi �6im5ise 6�inia �ins4 �in3te �in4teo 6�ip 4�ir4g3
�irt3 �isc1 �ist3e �ist3i �is5t6�n� �3itear �it3� �it3s �5�re �l1 �lc6 �l4s3
�m3an �3mar �m3at �mh1 �n1 �n6ga �3nna �nt4 �p1 �r1 �rach3 �r5aim �r5am
�r6ca �5r6� 4�rn2 �3rol �r4ta �rt6ai �rt6an �rt6r �s3a �sc3 �s5c6� �s5e �s3�
�s1� �s1t4a �s3t� �s3u �s3� �t3a �t1� �th1 �3th4e �t1� �t3r �5�l ba5cas
4bac� bac6s5 b5adar ba3d�i b3aid� b3aig b3aim bain5t4 baisc5e baist3 bait3�
b6ait� b1a� balbh5� bamb6 banais3 ban3d4 bar3b bar1n2 b4arr bar3� ba5s6�ir
ba5s6�r bas5c6ar6 bascarn5 bat5a b�5inn b�5ite. b�5ite� b�5it� b�5�6 b1�l
b4�lt b�r4 b�rth5 b1c bc4� b5da b5d� b3dh 3beab bea5bh6 bea6c beal5t6
bear3b� b1e� b6e�r 5b4ei beif6 beil6t beir5f beir5t� beo3c beoch4 beo5itea
beo5m 3b�it b1f b3gh 6bh. b4ha bha6d3� bha3g4� bh3aig bhain3t4 bhaist3
bhal6b bhalbh5 bhar3b bhar3t4 bhat5a bh�5inn bh�5ite� bh�r6 bh�rth5 bhc6�
b4he 4bhe. bh5eam 3bh4ear 2bh1e� bheif6 bheil6t bheir5f bheir5t� bheo3c
bheoch4 bheo5g bh�al5 bh�alt6 bh�5ann bhia5ta. bhia5tac 3bh4id bh3im
bhin6s3e bhin6s� bhin6t5e bhion5g� bhios5 3bh4irt 6bh3i� 4bh�g 4bh3�m bh3�n
4bh�o bh�5ot 4bh�t bh�6th 3bh4las bhl�6 bhl�f5 bhlead5 1bho bhol6ta.
bhol6t5a� bhol6t� bh1� bh�i5s6 bh�5l6ac bhran6d5 6bhre. bh6r�a bh6ric
bhr�3oc bhr�o5mh4 4bhs bh5t� 1bhu bh4ua bhua5da bhua5im bhua5ite. bhual5
4bhuit bh3uith bhurd5� bhur2l3 bhust5 bh�ir5 bh�is5 bh�m5 bia3l bia5ta.
bia5t6ac bia5t6aig bia5t6a� b1id bid5i bin4 bi3n� bin5i bins3 bint3 bion5g�
bios5 biosc6 6b1ir 6bis3 bist4 bit5s b�3c b1�n b1�t b�t5eac b�6th5 b�6tig
blad5a bla3gr blas3 bl�4 bl�f3 blead5 bl6i blim6 b1l� b1l� bn6i b3n� bod3�
bol4s bol6ta. bol6t5a� bol4t� bord3 bos5t6 b1�g b3�id b�5l6ac b�6s5 b�th5
bp6� bp6i bpist6 b5po brad5� bran6d5 bran3g4 brat5� br�6 b1r� br�o3mh4 b1s2
b1t bth6 bua5da bua3im buair3 bua5ite. bua5itear buin6t bun1 bur2 burd3
burl1 bust5 3b�id b�ir5 b�is5 b�m3 cab5al c1ac c1ad ca3d� cae4d3 caib5�
caidh5ne cai5m4� cain6d cain2t3 cair6b cairbh5 cair6d5� cair6t5e c2aisn
cais3t6 cait3� c1a� cal5an calbh3a cal4m ca3m�n can5c6 can5s6 can3t2 5caod
c6ara 3c4ar1b carbh4 card3 c4arl carn5� c4ars c6arta cart6ac car3� cas1
cast6 cas5t� cat5a cat3� c1� 5c6�c c�4f3 c�6i c2�id c�in6t5eac c�in6ti c6�nn
c�r5ta. c2�t c3bh6 c3dh 2ce cea6b c3eab5a 6cead cead5as c3ead� 5c6eai 3ceana
5cean� cean4t� cear3b cearbh4 3ceasm ceas6t ceast5a cea3st� ceast5� cea3s�
c1e� 5ce�. ce�6f5 ce�3n4 3c4e�na c4ei ceil4t ceir5m4 ceit6s ceo3m ce3r4
c�al5 c�alt6 5c�as c�a3t� c�i6 c6�it 2c1f c3gh c2h 4ch. 6ch5acha chacht6
ch1ad chaint3 chair6d5 chais5t6 5ch6aite ch5al. chal4m 5champ chan5c6
ch4ant� char3b charbh6 ch3arf charn5 ch1as1 chast4 chat5a chat5� ch�6 ch3�ir
ch1�l ch1�n 5ch�r 2che. chear3b chearbh6 cheas6t5 che�6 che�f5 cheir5m6 3ch�
ch1f chia6 chil6 chin5t ch�l5 ch4lasa chlas6p5 ch4l�r chl�6i 3ch4lo chloch5
chlocht6 chl�d6 ch1m2 ch3n� 3c4ho ch5oba choirn6 cho4m chomh3 chona5m chon3c
chon5g chorb5 chorn5 chor6p3 chor5t6 5ch�. 5ch�c 5ch�da ch3�dh ch3�g. ch3�ig
3ch�ip ch�1m 5ch�rai 5ch�ras 3ch�t 5ch6raic 3ch6rao 3chrap chr�5inn chr�5it�
3ch4re chreach5 chreacht6 chri6 3chrio ch6rit ch4r�6 chr�och5 1chro chros3
chrost6 chrua5im 4cht 1chu chua6 chuacht6 chuil5c chuil6t chul5 chulc6
chur6l5 chus3 c6h� ch�6i ch�l5 ch3�s cia6f5 c3iam. cid5i c1id� c3igh c1ig�
c4illi ci3m� cim6p5�n� cin4d cineach5 cineacht6 3cint 3cion 3cip ci6p5�
ci3p4l 3cirt cis5tear cis5te� cis3t6in c3i�. c3i�l ci5v 2c�. c�l5 c1�m 2c1�n
3c�r c�t6 3c4�t. 3c4�te. c�6th cla4 clad5� clad3� clas6p5 cleach6t5 cleat5a
cl�6i clim5 2clo cloch5 clocht6 cl�d4 cl�3d� cl�5im. cl�5it� 4clu c1m2 2cn2
cna6 cnag5 cne�5c c2o cod3 cof5 coil4t3 coirn4 co4m comh3 cona6c cona3m
con3c con5g coran4 corant3 corb3 corn3 cor6p1 cor3t4 5cos cosc3 c6�c 4c1�f
c4�ip c�is3 c�ist4 3c4�1m c�4ma 3c�n 6c�p c�r5 5c6�t3 c1p c3ra. crag5
crai3l4 crais4 craist5 c4rat cr�5inn cr�5it� c2re crea6b creab5a creach5
creacht6 crea5sc c5re� cr�al3 cr�alt4 cri5b c5ril cri6t crit5� cri�5i cr�6
cr�och5 croch3 crocht4 cros3 crost4 cruacht6 crua5im crua5itea cr�5it� c6se.
csea5g6 c6s5eal c4sic csi5d c4sig c6s5il cs4im cs5is c4s3�t c3s4m cs3� c3st4
c6s5tar cs3� 2c1t c6te. c4t3eac c6t5ean c6te�i c6t5e�r ct4eo cth4 ct6i�
ct4�o cuacht6 cuach5ta� cua6m cuil3 cuilc6 cuil6t cul3 culc4 cul6t5ai cur6l5
cus3 c�6i c�l5 c3�la. c4�n 3c�r da6b dab5a d1ac da5c6ac da5c6a� 3d4acs d1ad
dae5 d3a3g dagas5c6 d1ai dai3ghn 5d6aine 3d4aing dai5p 3d4air4b dairbh5
3d4airi dair4n d1a� dalbh5 6da3l4� d1an 4dann dar1 da3r4ao d4ar� dar6d darg4
darn4 d3ars dar5t4 da3st 3d4at d6�d 3d�id d5�is d4�it d1�l d�r5 d�ra5s d�rt6
d�3th d1b dbhin4 d1c 4d3ead 6deag3 d5eag� deal5a 6deam d6eand 4deann
5d6eannai 5d6eannas 5d6earb6 dear5ba dearbh5 dear5t6 deat3 de�4 de�th3
deilbh5 deil6te. 3d4eir d6em d1eo 4deoir 4deor d�am5 d�idlia5 d4�im 2d1f d1g
d2h 6dh. dh4ao dhar3t4 dhas5 dhasc6 1dh� dh2b dh6c5a dh4c� dh4ci dhearb6
dhear5ba dhearbh5 dhear5t6 dhe�6 dheilbh5 dheil6te. 3d6h� dh5f dhia5f dhint5
dhip5 dh�4o dh�3r� dh6l5ean dhl�o5d� dh4n3e dh5nu dh5n� 3dho dhob4 dho5chaid
dho5che dho5dh dho5ghl dhoir4n5 dhor2 dho5r� dhorn5 dhosc6a dhos5ca� dho5s6m
dho5thr dho5thu dh�3f dh�5id� dh�3im dh�5in 3dh4ro dhr�5l6 dh2s3� dh6te 3dhu
dhual5 dhua5m dhuamh6 dhur1 dhurd4 dh�5l� dh�5r� dh�3s dia5f6 6d5iam. dia3mh
4dib dic4 dic5e 3dict d5idh d3id� d1ig di5l� d1im 4din d3in� di3n4�i din6t5
5dip dist5 d1it d�1gh d�3le d�4lea d1�m d�2o d�3r� d2�s d1�t d�6the d�t6i
d�v3 d1la d4l3ad dlam5pa. d3lan 5d6l� d1l� dl�3b dl�o3d� d3l� 3d4l� d1m
dman4 dmh2 dm6i d1n dn4i dob4 do3br do5chaid do5che doch6t5a doch6t� do3dh
do3ghl d3oif doilbh3 5doir doir4n3 do5lag do5le do3mhi do5mho do5mh� 3dor
dor2c dorch3 dord3 do5r6� do5ri dor6n3 dosc4a dos3ca� do5s6m do3t doth4
do6th5a 3d�. 3d4�c d1�f 2d1�g 5d6�ic 5d6�igh d�5im. 2d3�irs 5d�iv d�5m6
3d�nn 6d5�s d�th3 6draim dra5n6� d1r� d3re� dreo5it 3d4reor d1r� 3d2ro 4drog
3dr�c dr�3l4 3dr�m 3d4ru dr4� d1s ds4a ds6r d1t2 dta6 dtach6t5 dtaist5
dtan5g dtap5 dt�it5ea dt6i6 dtr�5it� dtr�f5 dtua5im dual5 dua3m duamh4
duar5t 3d4uc duch6 ducht5 d1uit 3d4ul dun6s5 dur1 durd2 d�3bh d�3l4� d�5r�
d�3sc d3ve eabh5t6 ea5car each3� ea5c6l� ea5co ea5c�. ead1� ea6dh ea4d3�in
eaft5 ea4g3a ea3g4�l eagh2d3 6eagm eag3� eain5 eais6t3 ealbh5ac eal6p5
eal4t3ac eal6t5aig ealt3� eal6t�i eal6t�n eam5ait eamar4 eama3ra ea3mat
6eam� eam4p3l� ean3d4 ean6t�il 6ean� earai5c earb3� ear3f4 ear1m2 earn3
6earta. ea3r�i eas3a ea3s4�ir 6eash 4easm ea3s2tr 4eas� ea4t�. ea5t�ir 2e�.
e�5g 4e�ib e�3id e�1im e�3inn 5e�is e�3it e�it4e e�it6i 4e�m e�1t e�th2 e3bh
e1c e1d e1f e1g eg6� eib3� ei6bh5 ei4c eic4si eic6s5� 4eid eidh5n6 eidh5t6
eid1i eig4eac 4eil eil�t6 eilp5 eil6t5eac eil6t5ean eil5tear eil5te� eil4t3i
6eimh eimin3 eini3c ein2t3e ein3t4e� 4eip eips6 eipt4 eirbh6i eir4b� eir6fig
eirg3 eir2m eirm5� eirm5is eir5m6�t eir6p5 eir6st ei4s eisc5eac eis5cir
eis6ean. eis6ilid eis5in4 eist3 eit3� eithin6 eitim6 eiti5m� eits3 el1a e3l�
el3� e3lu e3m4ac e5m6a� e3mh emh�6 en1 e5n6i eo3dar eod5�r eo3fad eo3fai
eog4acht eo1gh eoi3f eo3im. eo5itear eo3ite� eo3it� eol3c4 eol5g6 eo3lu
eo5mar eomh2a eo3nna eor1 eorn4 eo3st e�5d e5�lac e5�la� er1 era5d6 era3s4
er�3b e3s4a e5se e3s4p e1t ethan5 �ab5r� �a2d1 �ag3�i �a1gr �a1gu �al1
�albh6 �alt3 �al5tar �am3at �6amh 4�ann 3�a3p �ar5g6 �ars5a �ast4 �at3a �1b
�bhr�3 �1c �ch4 �3dh �1f �1g �6go �3h� �ic4s3 �id1 �i5dei �i5d6reo �if4ear
�3if2i �5if� �i3g4eal �i5g6� �i3ghn �i5g6ia �i3g4il �ig3in. �i3g4r� �il5g
�ilips3 �il4t3 �6im. �im5ir �6in �int3 �in6tea �in4t� �ip4s �ir4g3i �ir2n3
�ir6s5e� �isc1 �i6se �ist3e �ist3i �6ite. �3ite� �it3� �it6ir �it1s �3l�
�5le �3l� �5mh �5n6� �1r �6rb �1s �1t �5�l fa4b fab3r facht2 facht5a f6ain.
faist3 faisti3 faistic4 fal3c4 f6an. faois3 far6am far6at far3n4 fas4t
f�il2t3 f�ir5 4f�s f3ch fea6 fead5a f6eadh 4fean fear5t6a feil6te. feis5c6
f4e3l4 feo5itea 6feol feo5m f4ep f�ach5 f�acht6 f�alt6 f6�it fg4a f3gh 1fh2
fha6 fhach3 fhacht4 fhair5t fhal5c6 fhas6t fh�il2 fh�ilt3 fh�ir5 f4he
fhead5a fhear5t6a fheil6te. fheis5c6 fheo5f fheo5id� fheo5im fheo5in fh�ach5
fh�acht6 fhid5 fhios5 fhiosc6 fh�5d� fh�5g fh�5m fh�4o fh�5oda fh�5odh
fh�5om fh�5onn fho5b fho3dh fhoil5 fhoin6 fhol6ta. fhor5b6 fhor5n6 fh�mh3
fhraim5 fhriocht6 f6hu fhua5itea fhuir4s3 fiach5 fiacht6 fid5i f4ill fios3
fiosc4 fir6m fisc3 fi3t� f�4o f�od3� f2�s fl6i fl�t5 f4lu f1n fn4i fo3b fo1d
fo6d5a f4oi foil5 foin6 foirn4 fo3le fol6ta. fol3u f4or for3b6 forch4 for3n6
fo3scr fost3 3f4�b f4�ib f4�in f�int6 f�mh1 frai3d f6raim5 5f6ram 4fri fri3d
frioch3 friocht4 f2t ft5� f5t� ft3i fuad3 fua6fair fua6f5ara fua5im.
fua5itea fuir2s3 f�ith6 f6�l f�s4 f�st3 g1a g2ab ga5b6a gabh5 gabht6 ga3dao
g2ae 6gaig gair4n3e gai3sp gais5tea gais5te� gai3t� g3al. 5galm6 4g5amar
gana3 g6and 3g2ao gaof3 g6a5p6 garbh5� gard3 gar5ma. gar1n2 gar6t� gas5c6ar
gas3c4r ga3st� g1� g�ir5 6g�is g3�l 6g5�nt 3g4�r g1b gb6a g1c2 gca4 gcach5
gcacht6 gcad5� gca�5d gca�5g� gca�5m gca�5o gca�5te� gca�5t� gcar6t5a
gcar6t� gc6i6 gcil6 gcin5t gc�6 gcli6 gclip5 gcl�5f gcl�5id gcl�5im gcl�5inn
gcna�3 gcn�5 gc6� g1d gd6a 2ge g1eac gea4d 6g5eadar gead5as 6g5eadh gead3�
g6eaf geal5a geal5b geal6ta. gea3nam 6gear. 5g6eart. gea3st geat5a g1e� g4ec
geit5 g1eo g6es g�a5b6 5g6�as 2g1f g2h 4gh. ghabh3 ghabht4 ghair4n5e
ghais5tea ghais5te� gh6am. gharbh5� gh�ir5 gh5c6 6ghd ghd3ac ghd3� gh4de.
gh2di gheal5a gheit5 gh1f ghint6i ghin5t� ghis5 gh2lu 3gho ghoin5 gh�6f5
ghr�5inn. ghr�5it� ghr�3m ghr�mh4 3ghr�6 6ghr�. gh4s3� ght4 ghual5 g1id
3g4id. g1ig gild5 g4ili g1im 3gine 3gin� g3inn. 3ginnt gin5t6� 1gio gios3
giost4 gip4 gip5s gipt5 g1is g1it g1i� gi�m5 gi�s3 g1� glae1 g4l�n gl4i6
5g6lic 3glif g6lis g1l� g6lo gl6� g1m2 gmh2 2g1n2 g2n� gn�3l4 goin5 g�1c
g3�d g1�6f g1�g g3�id g3�ig g1�im g�in4 g3�inn g�int3 g4�l g3�ra. g3ra.
g1rac 1g4raf 3graif g3raig g3rait g1ra� gra6m grama5d6 g5ras 3gr�d gr�5inn.
gr�5it� gr�3m gr�mh4 gr�4n 4gri g1r� 3gru gr�6i g1s2 2g1t gth4 gual5 g3uc
g3uir 1gum gust5a 4g�. g5wa hab3r ha4c hach6ar hach5� hac6s5 had6aimh
had6amh ha3d�i ha3d�n. hae5nn hag�5l hag5r hag6�is hai6c haic5� haidh5ne
h1aim hain2t haint5� hain6t�n hais5t6eor hais5tic hait3� h1a� ha�t5eac
ha�6ti hal5a halbh3a hal5g6 hallag6 halt5ar ham5at hamb6 ham5� h6ams han4�
han3d4 han6lain han6lan han6rai han6sa. han6sac han3t4� haof3 hara5b6
harai5s6� haral4 haralt3 hard3� h4arg har5ma. har3n4� h6arr har6s5ac
har6s5aig hart4ac har3� hasam6a ha5s6�ir ha5s6�r hasc6ar has5car6n5 has6pa.
has6p5a� hast5ait has6t�. hat5ar. hat5ra hat5� h�ch1 h�in4t h�int5eac h��6
h�5�o h4�r h1b h2ba h5bha hbhain6 h5bhe hbheo5f hbheo5id hbheo5im hbheo5in
hbhu�6 h1c hc4a hc4�n h6c� h3ch2 h4c3� h1d hd2a hd3aim hd3an hd5eam hd3eann
hde�5nn hd6eog hd6eoig hdh4 h5dine hd5inn hd3i� hd4� h4dt hea6c h3eacn hea6g
heag5r heal6ta. heana6 heanad5 h4eang hea6r hear5b� h4eat heat5� heat5�
he�1c h6e�na he�6t he�th5 heift5 heod5� heo5itea heo3mh h6es h4�adr h�idlia5
h�i5gear h�im5� hfach3 hfair5t hfeo5f hfeo5id� hfeo5im hfeo5in hfhuad5
hfhuaf6 hf�5d� hf�5g hf�5m hf�5oda hf�5odh hf�5om hf�5onn h1g hgh2 hghair5t
hghin5 h4g� hg6n hiach5t6 hiat6ac hia5t6aig hia5t6a�. hi6b hibh5 h1id hid4�
h1ig hil3b hi4m him3� hin6d5ia h4ine hineach5 hineacht6 hin6�n hin4�on
hin6�r hin6ste. hint4e hin5te� hin4t5i� hiosc6� hios3t4 hip4e hipi5c6 hip6id
hirim5 hir6im. hir6ime hir6n his5tear his5te� his3t6in hit6eor hit5s hi�m5
hi�nt3� hi�r5 hi�s5t h�1gh h�3le� h�od5� h�ol5 h�oll6 h4�os h�os5t h�5sti
h�6th5e hla6 hlac5� hlad5a hlad3� hlad5� h1la� hlas5t h4l�ir hleach6t5
hleat5a hle�5d6 hl�ach6 hl�acht5 hl�5am hl�5ig� hl�5imi hl6i6 hlim6p hlin4
hlip5 h1l� hl�5im. hl�5it� hl6� hma6 hm4ad hmad5� hm4aid. hm4ain hm5ainn
hm3an h1mh h4mt hn2 h1na6 hnag5 h1ne hn6e�n h1ni hni�3c hni�ch6 h1n� h1n�
h6n�. hn�5l6 h4nr hn5t hnua5c ho3br� hoch6t5a hoch6t� hod3a hod3� hof3a h4og
hoilt6 hoi4m hol4ag� ho5le hol3u h4om homai3g ho5mh� h4on hon4c3� ho5nu
horan6 horant5 horch3a hord3� host5ac hos6t� host5�in host5�n h1�f h�5im.
h�in4s h�int6 h�ist6 h�5l6ain h�5l6an h�6ma. h�6ma� h�p6a h�6s h�s5a h2�t
h�th1 h1p h2p1e h6p5i h6p� h1ra. hrad5� h1ra� hra6m hramad6 hran5g6� hrat5�
hr�3th4� h3re. hr�6i h4rio hrioch5t6� hr�2o hr�3r h4r�s hroch3 hrocht6
hruac6 hrua5c� hruacht6 hrua5itea hr6� hr�3it� h4r�p h1s2 hsc2 hscar5
hscart6 ht1 h3t4ae h3t4aic ht4anac hta5p6 h3tar h2t�i h1t2e h5th6 hthor6t
hthorth5 ht6i h2t� h3t2�ir h1t2�r huil5ce huil5c6i hul6t5ais hur5b hur3n4
h�ch3t6 h�d5a� h�in5t h6�is h�5ite. h�st5 h�t5� h3v� ia3chl iach3� iacht5a�
ia5dar ia3f4a ia5f� iag5� ia3gr ia3id�s ia3ig� 4iail ia5im. ia3imi ia5inn
ia3ite iai3t4r ialach3 ialacht4 ia3l4ain ia3lan ia3lat ia5mar iam4b3 ia4mhai
ian5a ian3g4 iar3b iarbh6 iarc6 iar3d2 iar5m6 iar3t4 iast5r ia6t� ia1t6r
ib1e ib4eab ib3�a ib5�id ib3�il ibh1 ibh5� ibhin4 ibhit4 ib1i ib5ia ibia5n
ib5ir ib1� ib1l ib1r ic1 iceap4 iceapt5 i3cei ic�5an ich1 i5ch6a i3chr icim4
ic6i�. i3c4�d ic�5tea ic4ri ic4st id1e id1� idh3bh idhc3 idh3e idh3i idh1l
idh1r id1ia id3ic� idi3f4 id1in id1i� id3�d id3�g id1�n id1�o id�5oc id1l
id1r id4r� i5�a if1 i6fe if5in. ifini5 ifinid6 ifin6t if3�r i3f�s if6r� ig1e
igea3s4 igea5t ig1� igh1 ig3ia igi3b ig1il igi3l4i ig1ip ig1ir ig1l ig1r i1h
il3a ilbh5in il4bh5r 4ilc il1e ileac2 ilea3ca ilea3c� ilea5c� il5e� il1�
il�5an il6fr il1i 4ilia ilia5n ili5b� ili3c4� il1� il�6f il5�o il2sc im5a
imar6 imb3l imeach6 imeacht5 im3�i 2img imh1 i3mha imhead6 im3ide imig6
imi5g� im3io im3ire im3irn im3irt im5isc im5�r� in3� ind3e� ind5ia. ind3iai
ind3ib ind�6 ind�l5 ind�1 in3e in5ea ineam6 inea5ma� inea3m� in1� i5n6�ag
ing1 in6gir in3i in5ic in5ig ini�ch3 in1� in5�oc in�6t 6innis in3o in4scn
int3ean in2t�. ioch5t4�g ioch5t6�ig ioc5s6 iod1 iof1 iogad3� iol5g6 iom3ar
6iom� ion3c6 iopa5d ior3d 4ios iosc6ac io6t iot6as ip1 ipea3g i3p�id ip5is
ipist6 ip3� i5pl� ir1 ir5ch irea5b6 iream6 irea5m� irea5m� ir5id ir5ip ir3�
ir�r3 ir5sc irscar5 irscart6 ir6ta irt3o ir4tr irt6s5 i6sc isc3ead isc5eal
isc5eam isc5eann isc1� is3c�im isc3inn is1e isear3 isearbh6 6iseas i3sei
is1� is�al5 is1i 4isic i3sint 6isis is1� i5s6�t. i5s6�te. is3o is5p� is1ta
ist4r it5ai it1ea 6itean it3eart it3e�n ith1 ith�5an ithin6t it1i itil4t
i6t�nn i1to it1r it6r� 4its its5ean iuch3 iucht4 i�ch3t6 4i�d 4i�id i�5im
i�5inn i�ir�5 i�ir6s i�it�5 i�r4s3 i�st4 i�s5t� 6i�t i�5t6ac iv1 �5ba �3bea
�b3eo �1bha �bh3ei �5bheo �bh1i �5bhr �bhu�4 �b1l �b3o �b1r �c1e �cea3s
�3cei �c3�a �5c�i �1ch �5cha �4ch3eal �ch6n �c1i �d1e �1dh �d1i �d3�d �d3�g
�d3�n �d1�o �1f �6fe. �f5ean �6f5ir �6f5is �g3e �gh4 �ghna�6 �g3i �5gr�
�g5ri �1h �l3a �1l� �6le. �l1ea �le�5cha �le�5ic �l3� �l3ig �l3im �l5in
�l3is �1lit �4l5ith �l5i� �3l�th �5lo �1l� �1lu �4m3� �1mh �4mhid �mi3t �n1
�1n2a �n5ai �3n4� �6nn �3n4o �3n4� �n3t4 �1oc �o3c4� �o6c� �of1 �oga3d�
�omh3 �o4mhe �3onna. 6�op 2�or1 �org4 �orn6 �ort6 �ot6r �5�ga �p3e �p3� �p5i
�p3r 2�r1 �1r2a �5r� �r4easc �3rei �r2�ir �1r2ia �5r6u �5r6� �1sca �sc5e
�3sc� �sc3ir �1scr �s1e 4�s3� 4�sh �s3i �s1� �1s2p �s3ta �st5e �st5in �5stu
�t4e �t5ean �4tear �3teas �t5� �1th �th5is �6th5oin �3ti �1tr �6�i �3�l
la5bas 4lac� la3c4�n lach5� lach6t� ladh2m5 lae6c la3f4� la3f6� l4agam
la1g2� l6agh laghd6 lai5d6� l4aih lai3l4 lai3m4� lain4 lainc4 lain5ci
l4ai3n� lais1 laisc3 laist6 l4ait� lai3t�n la3l4 l4amo lamp1 la5m� lan2d3
l5ang lao3f lao5inn lao5ire. lao5ir� lao5itea lao5ite� lao5it� lao5nna l1ar
l4ar3n la3r�i lasar3 lasarn4 l4asb las6pa. las5t� lat3� lat3� lat5r l�ch5
l4�ib l6�im l�in3 l�5inn l�int4 l�5ite� l�5it�. 1l�l l�mhach5 l�mhacht6 l�r5
l�rt6 l1b4a lba5t l3b� lbh5ac� lbh5ad l5bhain lbh3ait l5bhan l1bh� l4bh5�in.
l6bh5�n. lbh5ead lbh5ean lbh3eo l3bh� lbh3f l6bh5id lbhin4 lbh5ir. lbh5ith
lbh1� l1bhr l3b6� lb3n l4b3� lc1a l3c4ail lca3l4 l3c4� l6c5�nt lc3ean l3cei
lc3eo l1ch2 lc5id lc3im lc5in lc3it lc3� l3cl l5c�5 l1d2 ld5ean ldeighil6
ld�3 ld�d4 leach6t� lea5g� lea5m6� learb3 leat5� lea3tra l4eav le�ch3 3le�f
l4ec l4ef l4ei leicead5 leif5 leir5c6 leisc3 l4e5l l4em leo6d5 leomh3
l�3ad4ar l�3adh l�alaim5 l�3id�s l�1if4 l�5imid. l�5imis l�int6 l�3itea
l�3it� l�it6s l6�iv l1f l4fc lf5ean l4fg lf5r� lga3d� l1g2am lg1e l3g� l1gh6
lg3i lg3l lg3r lg6r� l3ha l5he liant3a lian4tac lias5 liast6 liat6 l4ibh
li3bhe li5b6il li5b�. li5b6�o lic6s5 l1id 4l1i1f4 lig3 li5g6�a li3l6 li5m6�
li3mhi lim5ir limp3� li5n6� ling6te. lin4s lint3e 4liona lion4t5 liost3
lip4s l1ir lis1 list4 li3t� li3ti� li�5d6ar li�5it�. li�5ma li�3st l�3bh�
l�6och� l1�s l�3s�5 l�th6i l2l1 llab6 lla5ba lla3c4� lla3g llag6ac llag6ar
llai3s llait4 llam6 lla5m� l6l� llt4 l1m l2ma l5ma5n6 lm6� l2me lmh2 l6mia
lm6� l6m�. lm4�g lm6�ig l4ms l1n ln4a ln4i lod5 l3oid 6loine loit5e lon5c
lorai5 loraic6 l�5d�ir l�5d6�r l6�in� 5l6�ip l�3l4 l�5mh 5l�p. l�1s l�t3a
l�th3 4l�v lp1a lp3� lp1e l5pei l3p� lp5i� l5p�t l3p� l1r lr�5 l1s2 l6sc3ai
lsc4� lsc3e lsc6ead l5scid lsc5in l5scl l5s4e l5s6l l1t lt6air lt4ar l6tb
lt2e l4t3eann lt3eof lt2i l4tm ltor6 lt6rac ltra3l lua3im lua5itear luch6t5
lu�3o lus5t 3l�b l�ca3 l�ch3t4 4l�d l�4f3 l�g4 l�it5� l3�l6 l�m3a l�ma5n6
l�4mh5a l�4mh3� l1�n l4�pa l�s3 l�t3� l1v m3ab mabh6 m1ac 5m6ac. mac5a m1ad
m5adar ma5das ma3d� m5adh4 madhm5 m3ae m3a3f4 m3ag ma5g6l ma3gr m1ai
mai5l6�t 4maim maini3c4 mai3n4id maint6i main6t5� mair6ne mair6n� maist6e
mais5teo mais5t6�n mai3t� m2aiti m1a� ma�5te. ma�t5eac ma�6ti m5al. ma3l6an
m4al� mal5g6 m1am mam5� mam5�5 ma5n6am 5m6an5c 3m4an3d6 mant3 ma3r4ad m3ar6b
marbh3 m1ar6c5 m1ard mar6f5 mar3m6 m3ars mar6sa. m3art m3a3r� m1as mast4
ma3tag m3a3t� mat5�g m1� m�ch1 6m�l m�r5 m�rt6 m4�t m1b2 mba6d mbad3� mbal6b
m6bd mbeo5f mbeo5g mbeo5id mbeo5im mbeo5in mb�5d�s mb�5mis mb�5te� mb�5t�
m4bl mbl�3 mb4� mbreo5f mbreo5id mbreo5im mbreo5in mbr�3o m1c mch2 m3c4� m1d
m1e m2eal meal6t mear5c6 mear5t6ai m2easc meas5t meat5�n me�5c meir6f5
meo3n� m6es 1m�a 6m5�5ac m5�am m3�ar 4m�ar. m�5ic m�5igh m�in6t m5�is 2m1f
m6fe. m1g 2mh. 3mh4ac5a mh4ad. mhadh4 mh4ag mh4aid. mhaini5c4 mhain5te
mhain5ti mhais3 mhais6c mhaist4 mh6am. mhar6b mharbh5 mhar6ca mhar6c5r
mhar4f3 3mharg mhar3m6 mhar3t4a mh3asf mh6at. mhat3� mhat5� mh6ats mh�r5
mh�rt6 mhd6 mhea5dai mhead5ar mhea5das mhear5c6 mheas3t6 mheir6f5 mh4�al
mh1f mh4ill mhion6ta. mhion6t5a� mhis3 mhist6 mh�3b mh�bh6 mh�6le mh�3r�
mh1l mhluad5 mh1n 5mhol5t6 mhon5c6 mhong5� mhon6t5 mhor6c mhor5n mhor6s5
mh�5mh 4mh5r mhr�5oc mh1t4 3mhuir mhuis5 mhuisc6 mhu�6 mhur5 mhus3t mh�d6
mh4�in m3ia m1ic mid5i m3id� m1ig m1il mi3l4� mil�6 mil�t5 m1im m1in2 mi3n�
min5se min5s� mint1 mion4t5a mior5 mir4c3 m3i3r4� m3ir� mirt3 misc3 m1isi
m3is3t6 m1it mit6e mi3t4i m1i� 3mi�d m1� m�3b m�bh6 m�3gh m�5gr 3m4�l m�3l�t
m�6na m�os5 5m�re. m�3r� 3m4�t. 3m4�te. m�3teac m�t6i m1l mleat6 mlua5da
mlua5itea 2m1n2 m5na modh5 m1oi mol5t6 mon5c6 mong5� mon6t5 mor2 morch5
mor5d morf1 mor5n mors5 m1� 4m�f m4�in. m6�in� m�int6 m�5m m2�n 3m�n. m�r5
5m6�r� m4�s mp3all mpar5 m3p4arn m1pe mp3eann m5p�. m5p�ar mp5�id m5p�ir
m4pf m1pi mpis6 mpi5se m3p� m1p2l m1po m1pr m6pt m1p� m1r mroch5 mrocht6
m1s2 msc4 m1t mth6 m1ua muilc5 muis5 muisc6 mu�6 5mul mur5 murd6 mus3t m3�6c
m�ch3 m�cht6 m�in5 m3�l m3�s m�t5 n1a n3aba� na3bh4 nach6ain na3ch4an na3chl
na5chr na5c� na3cr na3d� nae5m6 n3aer naf5 2nag na3g4am nag3� na3gr nai3l4i
nai5l6�n nail6t n4aise naist3e nais5teo na�t6 nal3 nalbh4 na3l4�g na5mara
na5mat namh5a na3mh� nan2 nant1 nao5nn 2nap narb5a narbh6 na3st� nata6
na5tam na3t� nava5 4n�. n�4f3 n�6i n1�id n1�il n5�isc n5�� n1�l n1�r 6n5�sc
n1b nb6a n4b3e nbhan6 nbhand5 n6bh5ao n6b5i n6b� n1c n2ca nc5aig nc5an ncar5
n5c6ar. ncarn6 n2c� n3c4�s n6cb nc3e n3ceas n5cei n4c3� n5c�ad n5c�id n5ch2
nchr�5 n6cig n5cis� nc1lo nc3lu n4c4s3 n4c3� n5c�n n1d2 nda6g n5d6�n n5dea
n4de� n5d� n4diai ndic5 n6dis nd5is. nd5ise ndl�5d ndl�5g ndl�5m ndl�3o
nd3�g nd�5ite. nd�5it� ndreach5 ndreacht6 ndreo5f ndreo5id ndreo5im ndreo5in
nd6r� nea3g4� nea5ma. nea5s6�r neat5 ne�5cha n4ed n4eg n4em neo6 neod5
n5eoiri 5n6eot n�a6 n�al5 n�alt4 4n�as n1f n6fa. nfair6 nfairt5 2ng nga3d�
ng4aint ngair5t ng4al� n3g4ant ng2� ng3�n ng6eal ngear3t4 ngeat5 n3g4� n1gh6
ng6ia n3g4il n4gin ng6�ne ng6�oc ng6l� ng6�id. ng6�ide ng6�r ngt4 n5g6�n
n5g�s n5h6a n5h� n1i nia5it nib6� ni5c�ne ni3f n5ig� n3il 6n5im. ni6m5�
4n3imi n5in nin6d5 nin�t5 nin4s 2nio nir5b nir4i nis1 nist6 ni3t� n�lim5
2n�omh n�o3t n3�r n�4th5 n�6t5r n1l nl�5am nl�5an nl�5ig� nl�3imi nlia5n
n5l� n1m nm5an n6mc n4me nmh4 n6mi n6m� nm4� n2n1 2nn. nna3b4 6nnac nn3t2
noch6 nocht5 noich4 nol6 no5la 3nom n3ord noscail4 5n6�b n1�g 3n�ia n4�it
n1�l 5n6�ma n1�n n1�r n�r6t5as 2n2�t n�1th2 n1p n1r n3ra n5ri nroch5 nrocht6
n6r�. nr6� n1s2 nsab6 nsa5ba ns3ann n4s3�il ns�5inn ns�3it n2s3�l nsc6�
nsc6i nsc6r n5seac ns3e� ns4e�n nseir5 n5s� nsin6t n5s�n nst4 ns�d6 ns�5it�
ns�5m n1t ntai3b nt5a5l6�n nta5m� nta3p nt5art n5t�. nt4ead nt3eag n5tear
n2t1e� n5te�. n5t6e�n nt6eog nt4eol n5tia nt3ic ntil4 nti3l�t n3tin n5tis
nt5i�ir n4t3i�r n4t3�l nt4�n. nt6�ni nt4�n� nt4�oc n4tm nt5oid n3tr ntra5b
ntrabh6 n6trais n6tras n6ts nua5ch4an nua3ch� nua5da nua5im nuais6l nua5itea
nuan6 n5uar n6uas. nua5t n1ui n�5� n1�l n1�n n1�s n�t6 n3ve ob1a oba3d� ob1�
obh1 obhar3 obhard4 o3bh4e o5bhr� o3bh6ri obht4 ob1l ob1� ob1r ob3� 4oc.
2oc1a ocan4 oca3t oc3� 2ocf och1a och1� 4ochb och3eo och3i och5� och1l 6ochn
och1� och1r och3t4� och3ua oc1l 6oc3n 4oc1� oc�5c 2oc1r 2oct 4oc3u oc5�
od3al od3am od3art o3das od1� od5e odh1a odhear6 odhearm5 odh5eo o5dhi o5dh�
odh6l o5dh� odh1r odh3� o6d5r od3� oen6 o6f3ac of5� of5ra og5al og3e ogh1
oghair5t ogh2e og1l og3o og1� og1r og3u og1� o3h� oid1i oif3 oift4 o3ig�.
oil5e oimead5 oim3ir oimp3� oim4p3� 6oinn oint3� oi6p5 6oir. oir6bhig
oir4bh� oir3d4 oirn6e� oir6n5it oir6ni� oirn3� oir6n�d oir6n�g oir4n�m
oir4n�o oir4n�t oir4p3� 6ois oisc1 ois5c4e� ois1t4 ois4t5�n oit1� o�1 o�2c
o�che5 o�l4 o�4te. ol1a o5l6ab ola3d� ola3f4 ola1g6 o5lagh ol6aim� olai3t�
olan5d ol1� o5l�im ol1b olbh4 olc3� ol3eo o3l� ol4g3a o1li o3l� ol3m2 o1lo
ol1� 6olt ol1�i ol3�r oma3l4� om1an omant4 om3ao om3ar� om3at oma5t� omh1
omhair5t o5mhara o1mh2e o5mhil o3mh6� om5� om1p omp6� om3� on5a ona3b4
ona6cra ona3g4� ona3l4 onam4a ona5mai on1� ondu5s on3e on3� on5gab ong3�
ong3l ong3�i ong5�n on5gr on5g�i on1o on1� o3n�t 6onr onsc2 on6t5ail on6t5al
ontar3 ontarn4 ont6e ont6� ont2� on1� op1 opad6 opa5d� opa3la or5a ora3d�i
ora3d�n ora3t� or5� orb5ad or3b� or1bh or4ca orch3� or5c� or3e or1� or3i
o5r6ia or6ma� or3m�n or3ne or5ni o1ro or3oid or1� or5p�i or6s5a� or5tas
orth�3a or5u or1� osai5l6 os5am osar5 osarn6 osa3t osc1a o5scao o5sc� osc1l
osc3�i osc�3l4 osc5�r osc5ra o3scri osc3�i o5sm� os1� ospair3 ospairt4
o3s4p� ost5ad ost3ai os4t3� os3ti ost1� ost3� os5t6�n os3u os1� ot3a otam4
ot4asa ot1� oth1 o3thais othar3 oth6as o3th�ir o3th4e o3th� o3tho oth6ri
oth6us ot5i ot1� ot1r ots5� ot3u ot1� �3�l �b3a �6b5ai �1bh �b5r �c1a 6�car
�ch1a �ch5� �3che �ch5r �cht6a �ch3� �c3i �c5� �c3r �c5s6 �c1� �d1 4�da
�dai5d �3d4ar �3dhe �3dh� �5dh� 4�d� �3fad 6�f5ag �1fai �f5air �f5ait �f5�
�f3r �g1 �g3a �ga3l4 �5g�. 6�gt 4�ia �ib5� �id3i �6igh �3ig�. �ill�4 �i4m5�
6�i1mh2 �in6se. �in5si �in5s� �in3t �i3p� �ir3 4�ireo �isc3 �ist1 �is5teo
�is6t� �3itear �3ite�. �it3� �its3 6�iv �5�n� �l1 �la5d� �3l4e �5l6� �3l4i
�3l4� �3mar �ma3s4� �m3at �mh4a� �5mhao �mh5art �mh3as �mh3� �n1 �n2as
�n3as. �ng2 2�1nn �3n4o 2�p1 �p6al �5p6� �r1 6�rais 6�ras �r4�id �rg4 �r4ma
�r�s5 �rt2a �r6t5air �r4t� �s6aise �s5am �sar5 �sarn6 �sc3a �s3� �st1 �s6tr
�s5u �s5� �ta1c4 �t5aig �t3air �t1a� �t5a3m �tar3 �t1� �th3� �t3� �3�l �5y�
p4aca p4acr pai5g6e pair4n3e paisi3 pais3t6i 4pall pana3m4 pan6t5al pa3p4�
para5b6 6parag parai3s4 par3d4 par3n4 par2s3 par6ta p6asam past4 3p4at3
p�in4t5 p1�l p�s5 p1c p5c6� 4pe. peacht6 peal5a peam6 pea5mai 6peann pear3
pearn6 pea3s4� pea5st p4ei peil3b peilbh6 pein6t 4peir peir5t p4�id 5p�in
p�in6t p�ir6s p1f 1p2h ph6a phais5t6i phana5m6 phar5d6 phar6s5 phast6 phat3r
ph�int5 pheil3b pheilbh6 ph�in6t ph�ir6s ph4i phin6se. phion6t5 phis5t6 ph6l
phl�5an phoin2 phoint3 phol5c6 phonc5 ph�r6t5a ph�s3 ph�st6 phr�ach5
phr�acht6 phr�is5 phuin4 phun4t3 ph�it6 6pias pic6s5 pi3d� pid5i pi3le p3im
pin6se. pion6t5 pios5 piost6 pirim5 p6irt pist3e pis3ti p6itei p4i3t� pit3s
6p�l 6p�ol 3p�s p�6t p�t5i pla4 4p3lag3 p6l� pl�acht6 pl�5am pl�5an pl�5ig�
pl�5imi plim4 pl�3m6 p1n pn6a poch5 pocht6 poin4 point5 poist5 pol2ag
pol4aim pol5c6 pon4c3 por3t4r post5ac pot3 5p6�r p�r4t3a p�s3 p�st4 p�t3
praoi5 pr�ach5 pr�acht6 pr�5ad6 pr�5am pr�5id pr�5imi pr�5itea pr�5it�
pr�is5 p1s ps4a p6sa. psain6 ps5ean p5s6im p5sis p1t p4te. pt3ean pth4 pt4ig
pt3is 6pu. puin2 pun4 punt3 6p6us p�in4 p�ins5 p�it6 rabh5t6 ra3b� rad5�n
raf3 ra3g4� ragh4 raghs5 rag5o 6raicn raimh4 rai3mh� raimp3 rain4 rainc3
rain5t� rais4eol rais3t4 rait3� rait5s ra5l6a�c ra3l4a�o r6alan ra3l4�
rama5dac rama5da� ra3mat ra3n4am ra5n6�m ran4t3� rant4� 4raob 4raol 4rap
ra3p4� 6rasn ras1t4 rata6m ra3t� ra5t� rat3�g ra3tr r�bh4ail r�ch5a r6�ini
r�3ite� r�3�nt rb3ac4 rba3c� rb3adh r3bair rb5ais. r5bait rb3am rb3ann r1bar
rb3as rb5a5tr r4be rb3ea rbh3as rbh6at rbh�5cha rbh3�n r6bh5eas r2bh3eo
r5bhia rbh3in r6bh5is r4bh3it rbh5�d rbh3�g rbh3�o rbh3�t r2bh1l r3bhr
rbh5uis r4b3ia rb5is rb3l r1br rb4r� r3b� rc1a r3cais rca3s4 rc1e r4c3� r1ch
rch3ac rcha3d6 rchar5t6 rch4� rch6i rch5la. rch6n rch3ra r2c1i rc4int r5cisi
r5c6is� rc1l r4cm rc3n r6cra. rc3r� rc3s rc5� rd1a r6d5acht rd6air r5d6ao
r5d6ar r2d1e rd3� r1dh4 rdh�5it� r2d1i6 rdin5� r4d�. r6d5�d r6d5�g r4d�m
r6d5�nn r4d3�o r4d�t rd3l r6dn rd5oid rd1� r2d3r r3d4r� r6ds r4dt rd3u rd3�
r5d6�in r5d4�n reag3r reas2t reast5a rea3t� re�3ir reic5t6 reo3d� reo5ite.
reo1m r�5adh r�al5a r�al2t r�5ann. r6�as r�5ife r�ig3 r�5ig� r�i5m�r r6�ith
r1f rf5eol rga5d� r3g4as r4gd r3gead rg5eam rg5ean4 rg3eas r4g3� r1gh6
rghair5 rghin5 r2gi r3gint r2g� r4g1l r5g�it r5g�t r1gr r4g3ru r4gs r3g�
r3ha riach3 riacht4 rias4t5 4riat ribh6i ri3ch4 ridh4 rid3i 4righn ri5gin
4rih ri5lei rin2 rinc1 ri3n� rins3i� rint3� rion2t3 rios3t4 rip4te rir4
ri5r� ris3c4� ris1t4 ri3ta ri3t� rit5�a rit5�ir ri5tr r�bh3 r�2c r�6ch5e
r�5ch� r�3ocht r�o5mhar r�r2 r�6the r�6thi r1l rla5m6�n rleat6 rl�5ama
rl�5an rl�5ig� rl�5imi r4lg rlin6 r1m2ad r5m6ain rm6air rm3al r3man r2me
r3measc r1mh6 r4mig rm4il r4mim r5m6isi r4mit r2mi� r2m� r4ml r4mo r3m�s
r4ms r4m3u rm3� r3n4aca r3n4ap r3n�d r3n�s r6n5eam rn5e�ilt rn3e�l r4ne�lf
rn5eoire r4nf rn3g rn2i r6n5ia rn5id rn3i� rn4�ne rn6�ni r3no rn1� r5n6�in.
r5n6�n rn3� ro4c rof5 roi4 4roid roim3� 2ro� r4ol rom4p3a rost3ac rost5al
rost3� rost6�r r�b4 4r�c r�6f r�i6 r�ist5 4r�it r�5l6an 4r�m r�mh5ai r�mh5ar
r�s6t� r�t1 r�t5a r5pa. r5pa� rp3ar r3p�n r4p3e r4p3i r6p5�g. r5p�ga rp1r
r2r1 rra3ch� rra3l rran4 rrbh4 rrc4 rr5d rrt4 r1s2 rs6ain r5san rs6�in
r5s6�n rsc2� r2scn r6s3ead r4sf rshlua5 rs3im rt1a rt4ag� r5t6ail rt6ain�
r3tair. rt5a�o r3t4al r3tana r1tar rt6as� rt1� r5t�. r4tc r2te rt3eac rt5eag
rt3eam rt3ean r3t4ear r3t4e�. r1th2 rtha3t rth�ad6 rth�5id rth�5ig� rth�5imi
rth�5itea rth�5it� r2t1i r3t4il rti3s4 r2t� r4t5l r4to rt1� rt1r r6ts rt3u
rt3�c r3t�i rt5�il r6t5�l r5t�m r1t�n rua5b ruad6 rua3da ruai6 rua3imi
rua5itear ruch3t4� r4ud rusc3a rus3c4� rus4t5 r�ch6t5 4r�d r�3d4ar. r�3id�
r�1im r5�ine r�3inn r�3itea r�5it�. r1�l r�3mar r�st3a r3wi s1a sa3b�
sa5c6as sa3d� sa3f� sa5fr sa3g4� saigh6d5 sail5b sain6t5e sair5d6 s6ais�
saist3e sa3l4ain sa3lan sal5at 5sal�m salt3 s6a5mat s2amh s6ams 3s4an. san2�
sant4 5s6ao. sar3b sar5c s4arl sa3r4� s6at. sat5a sa5t� sat5ra s6ats s1�
s6�ili s�5inn. s�in6t s�5ite. s�5ite�. s1b sb6a sbh6 sbheir5 6sc. sca6b
scach6 sca5ch� s3c4ae s3c4aird sc6ao sc3ar3n4 s5cat sc�in5t s3cear sc1eo
s3c4eog s5c6eoig sc4�im s1ch4 3scia s6cig sc1im 3scior sc3it sc3i�il 2sc1�
s6c�. sc1n scoir5 s4cor scor3b4 s3c�. s6c�i 3sc�ip s3c�l 1sc�p s3c�s sc3ra�
s1cr� scr�ach5 scr�acht6 1scr� sc1r� sc3um4 sc3�c s3c�n s1d seach6t5a 6seag
s5eag� 5seai seal5a seal6b sealbh5 sealt6 seana6 seanad5 sean5m s5eanna.
seas5t s4eat 5se�ib s6eic seic6t seift5 seil6f seir4f3 seit5s 6seo. seod3
s�alt6 s�ar3 s�ir4s5 s1f s3fe 3s4f�a 3s4f�ir sfhear5 s3fi s1g sghair5t 1sh2
shaigh6d5 shail5b shair5d6 shant6 shar5 sh�5ite. sh�5ite�. sh�5it�
sheach6t5a sheal5a shean5m shearbh5 sheas5t sheic4t sheil6f sheir6f3 sheit5s
sh�a5l6ain sh�ir6s shib5� ship5 shi�n4 shi�nt3 sh�5bh sh�6l5 sh�4o sh�6t
shlios5 shl�od5 shn�5d shn�5g shn�5m shn�5od shn�5oma shn�5on shnua5
sho5chaid sho5gh sho3mh6 shor4 shorb5 sho5th sh�5f sh�5id� sh�5im sh�5inn
sh�5it� sh�5mh shua6i shua3l6 sh�5c sh�ch6 sh�5d6ar sh�5im. sh�5in sh�5it�.
sh�5mar sh�s5 s1ia siach6 siacht5 sia5it si5be sib5� s1ic s1id sidh6 6sif
si3f4� s5i5fr s1ig si5g6� s6ilea s4ilf s6ilig� s4ilt s1im simea5 s4im�
5s6ing sin6� s4int sint5i� sios5t6 sis3 sis6c sist4 s1i� 6si�d 5s6i�it si�r5
5si�t s�3bh s�l3 3s4�le s5�mea s�ol5 s�oll6 s�4th5 s1l sla4 slac5� slag3�
slag3� s4l�in s6l�n sle�5d6 sl�ach6 sl�acht5 sl�od5� sl�6t s1m2 sma5la
smeach5 smeacht6 smead5 smear5 smeart6 sme�6 smh4 sm6i s1n2 snit4 s3n� snua5
sobh6 so5chaid soch6t5 sod3 sof3a so5gh soir6bh so5l�i so3mh4 so5nu sorb5
sor4c sorch5 so5th6 s1�f s1�g s�in4 3s4�in. s6�ine s6�in� s�5it� s�5l6ain
s�5l6an s�5mh 3s4�n s�5tac s�5t6a� s1p spad5a spad5� spair4n5 s6p5ann
speach5 spi6d spor5 sport6 sp�r6 sprae5 spuir6 s1r sr6� 6st. sta5d� s1tag
stai6 st3aig staist5 st1a� s1tal st5ama st3as st�in6 5st�it 5st�t3 st5eann
4steo s1t� 3st�ig s4t�in 6sti. s3tice s5ticig s5tile. st1im s6tio s3t4ir
st6ise st3ith s3t4�c s3t4�s s3t�g s1tr strae5 s4trala st6u s3t6�in sua6i
sua3l4 s�5c s�ch6 s6�d s�5d6ar s4�f s6�ig s�5im. s�5inn s4�it s�5ite.
s�5it�. s�5mar s1�n s�s5 sv4a ta4cha tach6t� ta3cr ta5d�i t3adh. tae5n
3t4aga ta3g4� tag5�5l tagh4 taghd3 ta1g� 5t6aig. 5t6aige 3t4ainia tain4t3
tair2b tairbh3 tair6g3 tair2n3 taisc5e tais5tear tais5te� taist5il tais5t�
tai3t� t5ait� ta4l5a tal6c5 t4all 6t5a5l6�in 6tal�n tam4al ta5m6�i ta3m�n
5tanb tan3g� t3ann 4tanna. t6annac t6annai ta5no tan4t3 ta5p6l t2ar tar1c2
tar5d6 tar3g4 tart4a tar5ta. ta3s4l ta3s4t tas5tr 3t4at 5tata 4ta3to tat5�
3t�. t�6d5 t1�il t�6im. t�ir4s3 t�ir5t t6�it t3�iv 2t1�l 3t4�s t6�t t�5th6ar
t1b tbh6 t1c t3dh 3teab t3ead tea5fa tea3g4� tea3gr t3eal. t3eala tea5lain
tea3lan t3eal� t5ealt tea3m4� t4eamo 5tean� t2ear t3ear3n4 teas2t5 te�6
t1e�i t1e�l te�m5 1tei t1eo 5t4eoc t�ach6 t�acht5 t�al2 t�a3la t�ar5t6 4t�ig
t�6igh 4t3�irs t4�it 2t1f t1g t2h 4th. t6ha 6thab thach6t5 thagh4 thaghd3
thair4b thairbh5 thair6g thair6is. thair4n thairn5e thaist5 th5am. than3g
than2t3 tha6p5 tharc6 thar5g6 thar3n4 5tharr thar5t6a th�in5 th�ir5t t4he
thead5as thea3la theas4t5 6the� th5e�n t6h� th�ach6 th�acht5 th�al2 th�a3la
th�3if th1f th5in. thin6i thit3e th�6f5 th�o5t th6�s th1l thlua5da th5n�
5thoin6 thoir4n3 3thon thor4c thor5p� thost5 th�ch5 5th�gt th�ir6se th�ir6s�
th�s4 thr�5b thr�5inn thr�3oc thros6 4ths thua5da thua5im thua5itea thuar5
5thuig 3thur thu5sa 6ti. tia5g 6t5iam t1ib2 tib5� tib6�ar ti1bi t1id4 ti3d�
ti3di ti3f4 t1ig 5t6ige t3ileo t3il� 4til�t t5ilt 4t3i1m4� ti5m�ne ti5m�ni
tin6d5 t3inea t3ini t3in� tin5t4 tipi5c6 tir4i tis3 t3ist6 tit5ea tit5e�
6t5iteo ti5t� ti3ti� t1i�. t3i�l 3ti�n t1� t�4f3 t�g5 3t2�l1 5t6�ol 5t�op
5t�or t�o5t6 3t4�p 5t�r 6t5�teas 6t5�ti 2t1l t1m tm4a tm6e tm6i 2t1n2 t5ne
t5n� tod5� tof5 6toid toin6 toir2n3 tom6a tor2c torch3 tor3p tort5a tos6t3
t�ch5 t1�f 3t�ip t�ir6se t�ir6s� 3t�l 3t�p 1t�s4 tra6b� trac6 6tra5c�
trai6m5 4traip 6tral�ib t3rar tr�5b tr�5inn t6r�is t4r�t tream4 trea3ma
triach6 tri3ghn tr�1r tros6 trost5 3tr�p t4ru truac4 trua3c� tr6� t6r�s ts2
t5sa t6sai tsa6l tsal5a tsal6v5 t1s4ea t6sean tsearbh5 t3seo t3si tsi6m5
tsi�n6 tsi�nt5 t1s� t3su t3s� tua5da tua5itea tuar5 tuis3 tu�o3 tur3b tur3n4
t5�id t�3m6 3t�s3 t3vi uabh6r ua3chl uad3� ua1f2 ua6fa. 6uaid ua3id� uai5g6�
ua3ig�. ua3imid ua3imis ua3inn. uains6 uain5t4 uair3c4� uairn6 uair5t� uais1
uaist2 ua3ite� uaith6i5s ua3it�. uait5s uala5t ualath6 ual3g4 ua3lu ua3mar
uamh6ar ua3mh� uana5l6 5uanla ua5n�s uar3g4 uart4 uar5tai uar5ta�. uar5tan
ub1a ub5� ubh1 uc1a uch1a uch3� uch3� uch3r uc5l uc3r uc3s uc5� ud1 uf1
uga5d� ug3l uic6i5s uid1 uif�5 6uig3 uil3p ui4m uim3p uin5c uins3i� uin3t4
uint5� uin6t�n ui6p5 uir5b4 uirbh6 uir3c4� 4uire uirn6 6uirs uirs3t uir3t
uirt4� ui6s uis3cr uis5t uit3� uit3s u�3b u�3d u�1g u�5l6e u�1m u�1od u�o3d�
u�3oma u�3onn u�3� u�5te� u�th6 u�5t� ul1a ul3� ul3g4 ul3m4 ul3� ul5p6
ul6t5as ul4tr um1a umh1 ump1 un5a un3� unc1a un5e ung1 un5ga3l un3g4ar un5g�
un3o un1� un6sa. un6s5a� un3� un�d4 u�3t6 up1 4ur1a urach3 ur6ag ur3�
urca3m4 urch4 ur3d6� urg5�i ur5g�n ur3i ur6l3�l ur3m4 6urn ur3� ur3p urscar6
urscart5 ur3t4 ur5u ur3� 6us. usc5ai usc3l us3cr ust5ac ust5ail us4t3al
us3t� us5tu ust5�n ut5a u6t5� ut3e uth1 uthan5t ut3� uz3a �5an �1� �4�il.
�b1 �ba5d� �bail4 �b4h �bh5a �c1a �ca3b �cas4t �ch1a �1ch2� �3che �3ch�
�ch5l �ch5�g �5chr �cht4� �c1l �c1� �c1r �c4r� �d1 �6d� �d5r �d5� �1f �6f�
�1gh �g1r 4�id �3id�s �3ig� 6�ile 6�ili �il4t3 �3imi �int4 �irt3 �ir2t�
�isc3 �is3c4� �5itear �3ite�. �ithi5s �6it�n �its3e� �l1 �3l4ag �4l5ag� �lc4
�5l6e �l6�im �3l4i 6�lr �lt4 �3l4ua �l5� �l�5l �1mh �mh3ac �4mhn �4mh3� �n5a
�n3� �ng5� �ng5u 6�nl 4�1nn �n3o �n1� �n3t2 �p1 �6p5a �pa5t6 �5p6r �r1 �ra3b
�rabh4 �ra3d� �ran6 �r6ana �r5� �rt4 �3r6u �r4� �5r�i �s4air �s2� �s5�n �sc1
�4sh3l �3s4m �s3� �3s4p� �3sto �st3� �s6t3r �s3� �t3a �6t1� �th1 �3tho �t5�g
�t1r �5�i �5�l v1a vach6 vac3s4 v4ad vais5 vaisc6 var5 vard6 3v4at v1� vean6
veant5 vear3 vearn6 3v4ei veil5b v3eo v�ar6 v�is5 v�ist6 5v6ial 3v4ini vios5
vir5 virg6 v6�c v3la 3vol4 volt3 vu�t5 x3ac x5ai x5a�
  PATTERNS

    # See the web page cited above for descriptions of these ambiguities.
    # These cover capitalized versions, *including* eclipsed capitals
    # 2004-01-25:  46 of them coming from 23 classes modulo
    # lenition/eclipsis
  lang.exceptions <<-EXCEPTIONS
bhrachta� mbrachta� ch�int� gc�int� cheilt� gceilt� chist� gcist� choirt�
gcoirt� chreata� gcreata� dhoirte� dhoirtear dhoirt� doirtear ndoirte�
ndoirtear ndoirt� bhfuadar fhuadar bhfuafar fhuafar fuafar ghaist� ngaist�
ghealta� ngealta� ghorta� ngorta� haist� l�amar luadar meata� mheata�
r�alta� r�fear s�dar sh�dar s�imis sh�imis s�fa� sh�fa� spealta dtiom-�int�
thiom-�int�
  EXCEPTIONS
end