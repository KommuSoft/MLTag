# Hyphenation patterns for Text::Hyphen in Ruby: UK English
#   Converted from the TeX hyphenation/ukhyph.tex file, by Dominik Wujastyk
#   and Graham Toal in 1992.
#
# The original copyright holds and is reproduced in the source to this file.
# The Ruby version of these patterns are copyright 2004 Austin Ziegler.
#--
# File: ukhyphen.tex
# TeX hyphenation patterns for UK English [NOT TO BE CHANGED IN ANY WAY!]
#       $Log$
#       Revision 1.2  2004/12/20 22:43:04  austin
#       Update of Text::Hyphen for 1.0 release.
#
#       Revision 1.1  2004/12/20 07:27:24  austin
#       Initial checkin of Text::Hyphen 1.0.
#
#       Revision 2.0  1996/09/10 15:04:04  ucgadkw
#       o  added list of hyphenation exceptions at the end of this file.
#
#
# Version 1.0.  Released 17 April 1992.
#
# Created by Dominik Wujastyk and Graham Toal using Frank Liang's PATGEN 1.0.
# Like the US patterns, these UK patterns correctly hyphenate about 90% of
# the words in the input list, and produce no hyphens not in the list
# (see TeXbook pp. 451--2).
#
# These patterns are based on a file of 114925 British-hyphenated words
# generously made available to Dominik Wujastyk by Oxford University Press.
# This list of words is copyright to the OUP and may not be redistributed.
# The hyphenation break points in the words in the abovementioned file is
# also copyright to the OUP.
#
# We are very grateful to Oxford University Press for allowing us to use
# their list of hyphenated words to produce the following TeX hyphenation
# patterns.  This file of hyphenation patterns may be freely distributed.
#
# These patterns require a value of about 14000 for TeX's pattern memory size.
#++
require 'text/hyphen/language'

Text::Hyphen::Language::EN_UK = Text::Hyphen::Language.new do |lang|
  lang.patterns <<-PATTERNS
.ab4i .ab3ol .ace4 .acet3 .ach4 .ac5tiva .ad4din .ad3e .ad3o .ae5d .aer3i
.af3f .af3t .ag4a .ag5n .air3 .al5im .al1k .al3le .am5ar .ama5te .am2i
.am3pe .am3ph .an1 .ana3b .ana3s .and2 .an5da .an4el .an4en .an4gl .an4on.
.an3s .ant3a .an3ti3 .ant4ic .an4t5o .any5 .aph5or .ap4i .ar5ab .ar5ap
.ar4ci .ar5d .ar4e .ari4 .ar4ise .ar4isi .ar5sen .art5icl .as1 .as4q .as5sib
.at5ar .ateli4 .at5omise .at5omiz .at3r .at3t .au3b .au3g4u .aur4e5 .aus5
.authen5 .av4 .av5era .bap5tism .barri5c .bas4i .ba5sic .be3di .be3lo
.be5r4a .be5sm .bi4er .blaz5o .bo3lo .bos5om .boun4d .bov4 .bra5ch .bre2
.burn5i .ca3de .ca4gin .cam5i .cam3o .can1 .can5ta .ca5pitu .car4i .cas5ual
.ca4ti .cen5so .cen5tena .cent5ri .cer4i .ch4 .cit4a .clem5e .clima5to
.co5it .co3pa .cop5ro .co3ru .co3si .co5ter .cotyle5 .cri5tici .custom5
.dav5 .dea5co .de5lec .del5eg .de3li .deli5r .de1m .de5nit .de3no .der2
.de3ra .de5res .de3ri .de5scrib .de5serv .de5signe .de5sir .de5sis .de5spoi
.determ5i .de3ve .de4w .di4al. .dia3s .di4at .din4a .dio5c .do2 .do4e
.domest5 .du4al. .du4c .dys3 .east5 .echin5 .eco3 .ec3t .ed5em .ed4it.
.ed4iti .eg4 .ei3d .ei5r .el3ev3 .el2i .elu5s .em3b .em5in .emp4 .em5py .en1
.en5c .en4ded .en3s .ent2 .en5ta .eos5 .epi1 .epi3d .er2a .er5em5 .er4i4
.er4o2 .eros4 .erot3 .er4ri .es1 .escal5 .es3p .es3t .etern5 .eth3e .eu1
.eur4 .eval3 .evol5ut .ew4 .ex1 .ex3a .eye3 .fal4le .far4i .fec5unda .fen4d
.feoff5 .fi2 .fi5lia .fil5tr .fin5ess .fin3g .fi5n4it .fis4c5 .fo3c .fran5ch
.fu5ga .ga4m .gam5et .gen4et .ge5neti .gen5ia .ge3ro .glor5io .gnost4 .go3no
.gos3 .hab2 .ha5bili .hama5 .han4de .hast5i .he4i .hem5a .hi2 .hi3b .ho2l
.ho5rol .hov3 .hy3lo .ico3s .idi2 .ig3 .ig1n .il4i .im5b .in1 .in3d .in3e2
.in2i .in3o .in3t .invest5i .ir3r .is4c .is4li .is4o .iso5m .ka5ro .ki4e
.kin3e .lab4o .la4me .lam5enta .lan5i .lash4e .le4m .len5ti .le2p .lep5r
.les5son .le5van .librar5 .lig3a .li3o .li4ons .li4p .loc3a .lo4gia .lo2p
.loph3 .lous5i .lov5er .lub3 .lyo3 .mac5u .mal5ad5 .ma5lin .mar5ti .math5
.me5lodio .ment4 .men5ta .me5rid .me5rin .met4er .mi4e .mi3gr .min5ue .mirk4
.mis1 .mi5to .mo3bi .mo5lec .mon3a .mor5ti .mu3ni .mu3si .musi5co .myth3
.na5k .nari4 .nast4 .nas5ti .nec3t .ni4c .ni5tro .no4c .nom3o .nos3t .no5tic
.nucle5 .obed5 .ob3el .ob3l .od4 .oed5 .oe5so .of5t .oi4 .ol4d .ome2 .om5el
.on4ce .on4e .op2i .opt5a .or1 .or4at4 .ora5tori .or5che .or3d .ore4 .or3eo
.or4i .orner4 .or2o .os1 .osi4 .oth5 .out1 .ov4 .pal5i .para5dis .par5af
.para5t .pa5ta .pa4tio .pec3t4 .pecu3 .ped3e .pend4 .pen5de .pep3t .peri5n
.perse5c .pe5titi .ph2 .phe5nom .phon4i .pi2e .pi3la .plast4 .plic4 .plica4
.plos4 .po3la .po5lite .po2p .pop5l .po5sitio .pos5si .pro5bat .pur4r
.put4te .ra5cem .ran5gi .re3ca .ref5ere .re5gar .re1i .re5lin .re1m .re5o
.res5ci .re5sen .re5spo .re5stat .re5store .re5str .re3ta .re5u .re3w .rib5a
.rin4 .rit2 .rol4la .ros3a .sa2 .sac5r .sal4i .sa5lin .salt5er .sanc5 .sap5a
.sa3vo .sci3e .sea3s .sect4 .sec5to .se3gr .sen3t .se1q .ser4ie .ses1
.sev5era .sh2 .si5gno .sis3 .st4 .stat4o .stra5to .string5i .su5da .sulph5a
.sul3t .tact4i .tac5tic .ta4m .tamar5 .tar5o .tect4 .tel5a .tell5e .te4m
.te5ra5t .ter4p .th4 .tho4 .thol4 .ti2 .til4 .ti5ni .tit4is .tor1 .tran4c
.tri5bal .tri3d .trin4a .tri5sti .tro4ph .troph5o .tro4v .tular5 .turb4
.turi4 .tu5te .tu3to .ul4l .ulti5mat .un5ce .un5ch .un3d2 .under5 .un3e
.un3g .uni3c .uni3o .un3k4 .un5s .un3t4 .un5u .up1 .up3l .ura4 .ur5eth .ur4o
.va5led .ve2 .vec5 .ve5lo .vent5il .ver4ie .ver3n .vic5to .vi2s .vis3i
.vi5so .vo1c .vo5lut .wine5s .xy3l .za5r a4a 1ab 2ab. 2aba ab5are abay4 2abb
ab5ber 2abe4 ab3erd ab3err a3bet ab1ic a3bie 2abin 4abio abi5on ab3ita
ab4itu ab3la abli4 4abolic ab3om ab3ota 3about ab1r 2abs. ab1ul abu4lo
ab3use ab3usi 2aby ac2a ac5abl ac3al 5acanth ac5ard a5cat ach5al a5chini
ach5ism achro4 ach5ur 2aci a4cic aci4ers acif4 4acit ack5a ac3li 4aco. aco3d
ac5onr 4acos 4acou ac1r ac3ry act5ate act5ile ac2to act5ory ac2t5r ac5uat
a5dai ada3v 4adee ad5eni ad4ha ad3ica a5dif 4adil adi4op adi4p adis4i a3diti
3adju 5admit a2do 4adoe 4adoi ad3ol a3dos ad1ow ad1r adram4 4a2du ad3ula
ad3um 4ady ae5a ae4cit aeco3 4aed aed5is ae5g ae3on ae5p aerody5 ae4s ae5si
aes3t aet4a aeth4 aet4or. aev3a 4af. 4afe af5ta a4fu ag4ari 4ageri a5ghe
a5gia agi4as 4agino 4agl agli4 4ag1n ag3oni agor4a ag5ot a2gr ag3ri agru5
2ah a1h2a ahar2 aha5ra a1he ah4n a5hoo 2ai2 4ai. ai3a a1ic aid4a aid5er aig2
ai5gu ail3er ail3o aim5er ain5ders ai5nea a3ing. ain3i ain5o aint5er air5a
air5p air3s ais1i a5ism 2a1j a4ju 2ak akel4 ak5u al5abl alact4 a1lae al5ais
ala3ma al5ance al3at a5lav alc3at al3ch ald5ri 2ale a3lec aleg4 ale5ma
al5ende a1leo a2let al3ibr ali4ci al5ics al1id al3if 5alig al1in a5lini
alin5o al5ipe al5ipot 4alis. 4aliu 4alk alk5ie al4lab al4lag alli5an allig4
al4lish a5loe al3ogr a3lom a3loo al1or al4orim alos4 a4lou al3ous a5low
al5pen al3ph al5tati al3tie alu3b al5ued al3ues a5lumnia al1va al5ver alv5u
2a1ly4 a5lyn 2a2m a5mad ama4g aman5d a5marine a3mas. am1at a5m4atic am5atu
am4bin 3ambu am5elo a3men amen4d am3era am5erl am1i ami2c am5ica amic5r
3amid a3mili am5ily amini4f am5iniz aminos4 a5mis. a4mium. a3mon amor5a
amort3 am5ose am2p am5peri amphi5g amp3li ampo5l am3ul amyl5 a2n an2a a5nadi
an3ae an3age ana5k an3ali an3arc a5nast an4con an3d4at and5au and5eer an5del
an5dif and5ist an5dit an4doni an4ea an5eer an3ell anel5li an3eu an3gan
angov4 an4gur 4anh an3ic ani3f an5ifo 4anig an5ion anis5te 4anity 4aniu
an5no 4anny an1o an2oe an3oma anor3 an2os an5ot an2s an3sc an4sco ans3il
an4sur an2t2a ant5abl an3tal an5tam an2te 1anth an4thi 3anthr 4antic an4tie
an4ting ant4iv an4tone ant4r an4tus an5tym an3ul an3um. an5ums a3nur a5nut
an2y an5ya a5nyi 2ao aol3i 5aow 2ap 4ap. 4apa a1pac ap3al ap5aro ape5li
a5peu aph5em aph3i aph5ol aphyl3 ap1i ap5icu ap3in ap4ine a5pir a3plan ap5li
apo5str apo3th a2pr ap5ron 4aps apt5at apu5lar a5pun a4q a5qui a2r 4arabi
ara5bo aract4i ara2g ar3age ar4aged ar5agi ar3ago a3raj ar3all ara3m aran4g
aran5te ar5apa ar1at a3rau ara3v ar3ba arb5et ar4bid ar4bl arb3li ar4bul
ar5chet arch5o ar5dina ar4done ar3en aren5d ar5ett ar3ev5 ar5gh ar3gu ar3h
ar1i ar5iff ar4ill a5ri5net ar5ini a5rishi arm3er ar5mit ar3nal ar3nis ar3od
ar5oid aro4mas aro4n a5roti a5rouc ar3ox arp5ers ar4pu 2arr ar2rh ar2s
ars5al ar3so art5at ar2th arth4e arth3r ar5tiz 2aru ar3um ar5un4 a3ryo a5ryt
ar5z as1a as4af asan2 2asc as5con as5cot as2cr as2e as3ect 4ased asep4
ash5ay ash5il as5ily as3in a5sio a3sit as5iv ask5er aski4 as4la as4lo 2aso
as5och a4soned as5or as3ph ass2 assa5gi ass5ibl as4sil assit5 2asta as4tat
as4tia as3tis as4tit 4asto2 as3tra as4tri as1u as4un as5ur 2a2ta 4atabi
a5talis atam4 ata3p atar3a ata3s ata3t4 at3eau at3ech at5eer a5tel. ate5le
at5enat at3ent 4ater at3era at5ernis at5erniz 4atess at5et 4a2th ath3a
a3then ath5erin ath5ero ath5ete ath3i ath3od a5thon ath5r 4a3tia ati2c
at5icis ati5cit at5iciz a2tif a4t1i4l a4tim a2t3in 4atina at5ing 4at4is.
at1it atit3u atitud5i 4atiu at4ivi a5tiviz a2to 5at5od 4atog 2atol 4aton
a3too a4tops a5torian a4tory atos4 a5toz 2a2tr at3ra a4tre 5at5ress at1ri
atric5u at3ron at5rou at4tag 2a2tu at1ul atu4m at3ura at3urg 4a2ty 2au2 4au.
aub5i 4auc au5cer auc3o aud5er audic4 aul3i aul4t aul5ted ault5er ault5i
au3ma aun2 aun5chie aun3d aun4dre au5reo aur4o au5ror 4aus. aus5er aus5p
aus4ted aut3ar aut3er au3th 2av av4ab ava4g av3age ava5la av5alr av5ant
av5ar avas3 av3end av3ern av3ig aviol4 av1is aw5er. aw5ers aw1i aw5nie aw5y
a4x ax2id 4ay ay5la ay3m ayn4 ays2 ay5si ay5sta ayth4 2az2 az3ar aze4 az5ee
azyg4 azz4l 2ba. ba5bir 3back baen4 bag4a 5bah ba4i bal3a balm5i ba5lon
bal5u bam4a ban4a ba5nan b4ane 5bang b4aniti b4ans ba4p1 5barb bar4d bardi4
bar4n ba5rom bar3on 5bars 1bas bas4te ba4th4 3batic ba5tio bat5on battle5
2b1b2 b4bata b3bli b4bone b1c2 bcord4 2b1d bdeac5 bde4b bdi4v b2e 4be. 3bea
4beas be3ca 3becu 2bed be3da bed5el bed2i be4do be5dra be4du 5bee 3bef be3go
be5gr be3gu 1bel be3la 2bele be3lit bel4t be3m ben4d bend5a bend5er be1ne
be5nig be5nu 4beo be3q 2bere berga5m berl4 5berr ber5s b5ertin be1s2 2bes.
be3sl be3tr be3w 2b1f bfa4 4b1h b4ha 2bi. 1bia bi4b1 bicen5 3b2id bid5i b4ie
bi4ers bif4 bi4fid. bi5ga bigu3 b1il b2ile 5biles 3b2ill 4bim bimet5 5bina
5bin4d bind3e bin5et bin5i4 1bi2o bio3l bio5m bi3ou bip4 bi5q bir4 bi3re4
bi5rus b2is 5bism bis4o bisul5 3bitua 4bity bi5ve b1j 4b5k4 2bl2 5blac blag4
b3lan 5blast bla5tu blem5at 3bler 5blesp 4blik blim3a bli3o bli2q b3lis 4bly
2b1m bment4 bmi4 4b1n bo2 4bo. 3boa bo5am 5bob bod5i bo5h 2boid 4boke bol4e
4boled bol3i bol4t 3bon bon4c bon4e bon4ie boni4f bon4sp 1boo b3orat bor3d
bor5ee bor5et 3bori bor5ic bor5io bor4n bot3an 5boti boun5ti 3bour bous4
bow2 bow3s 4boxy 5boy br4 3brach 4bral bram4 b2ran bran4d 4bre. b4reas
4b2res brev5et b2rid 5brief bring5 bri4os b5rist b4roa bro4ma bros4 brum4
4bry. 4b1s2 b3sc bscon4 bsen4 bserv5an b5si bsin4 bso2 bsol3e bso3lu b4stac
bstupe5 2b1t b5tlet 4bu. 5bub buf5fer b4uli b4ulos bun2 bun4a b5u5nat bunt4
bur3e bur4ri busi4e buss2 bus5si 3bust bu5tar b3ute b5utin 3butio but4iv
b5ut5o b1v 4b3w 2by 4by. 3byi bys4 5byt 2ca. cab5in c4ace caco3 cad4r 5caf
ca3go 5cai 5cak c1al c4ala ca5laman cal5ar 3calc ca5lef call5in cal4m ca3ly
ca3ma cam4i ca5nar c2an4e c4ano ca3noe can5tar can5ted can4tic can4tr 5cao
1cap ca5pil capt4 cap3ti cap3u 1car ca3ra5c car5ame ca3ree ca3r4i3c car3if
car5m car3ni car3ol car5on car5oo ca3rou car4v case5 cashi4 3cas3s cas5tig
3casu3 c1at c4at. c2atc c4atom ca3t2r c4ats cat4u 3cau caulk4i cav3il 3cay
c1c4 ccent5r cces4sa c3ch cci3d4 ccip4 ccle3 4ce. 4ceab cean3 3ceas ce4ci
2ced 5ceda ce3dar 3cede 3cedi 4cef ce5g 3ceiv cel3ai cel5ib5 5cell cel5lin
celo4 ce5lom 4cely 2cem ce4met 3cemi ce4mo 1cen2 5cenc cen5ci cen5ded
cend5en cend5er cen3i 2cenn 3cent cent4a cen5ted cen5ter. cen5ters cen5tes
1cep cept3a cep5tic 3cera cer4bi 3cerd ce3rem 5cern 5cess cest5o ces5tr ce2t
cew4 2ch 4ch. 4chab 3chae 3chai cham5per chan5gi cha3pa chec4 4ched 3chee
3chem che3ol ch1er ch4eri 5cherin ch4erl 4ches 3chete ch5eu che5va 3chew
ch5ex 5chi. 3chia 3chico ch3ily ch4in. ch3inn 3chio 5chip chizz4 ch5k 5chlor
4chm 1cho cho3a 5choc 4choi ch5oid 3chor 4chored chor5ol 4choso 3chot 4choti
ch5ous chow5 3chr chur4 3chut 5chyd 3chyl 3chym 1c2i2 4ci. 4ciac cia4m ci3ca
4cids 4cie. ci3er ci3est ci5et ci3f cifi4 4cig ci3ga cigar5 3cil cil5lin
2cim cim3a ci3me 5cimen 4cinab 4cind cine5a cine5mat ci5ness 4cint ci3ol
ci5om ci4po cisi4 cit3r ck1 ckar5 cka5t c4ke ck5if ck4sc cl2 cla5rif 3clas
c2le2 2cle. c5lec clemat4 clev3 cli1m c3ling cli2q clo4q c4lotr clue4 clyp5
5clys cn2 c3ni 1c2o2 4co. 3coa co5ba 3coc co3ci co5cu co3dic co3dif 4cody
3coe co5et co3gr 4c3oid co3inc 4col. col3a co3log 5colou co5ly co5mas co4me
co3mo4 comp4 con1 con4ati con4ch cond5er con4ey con4ie con3s con3t conta5d
3coo coop4 co3or cop4e co3ph co5pl co3po cop4t 2cora cor5ded cord5er 4cored
co3rel 3corn 4coro co5rol 5cort 3cos. cost3a cost5er co5ta 3co3tr 5coty
cous5t cov1 co3va cow5a coz4 co5zi c1q cr2 5craf craft5i c4ran 5crani
cra5niu cras3t cra4te c2re 4crean cre3at cre4p3 5creti cre4to cret5or cri3l
cron4 crost4 4crou 5c4rus cry2 crym3 cryo3 4c5s4 csim5 2ct c2ta c3tac ctac5u
c5ta5g ct1an ct5ant c5taria c3tato c1te c4tea c2t5ee c4tent cter4ia ct5es
ct5et ct2ic c5ticia c4tics ctifi4e c3tim ct4in. ct4ina ct5ing c3tini c5tin5o
c5tio c3t2is c3tit c4titu c4tity ct5ive ct4ivit ct5olo c1tom c3ton c5toris
c5toriz c1tr c2tre ctro5t c1tu c2tum c1ty cub3at c4uf cu5ity cul5ab c2uli
cull5er cull5in 1c2ult cu4mi 5cuna cun4e 5cuni 5cuol cu5pa cu3pi c3upl 1cur
cur4er cur5ial 4cur4o 1cus cus5a c3utiv c3utr 5cuu cu5v 2cy. cy4bi 1cyc cyl3
cy4m cy5no cys4 cys5to cy4t cz2 4da. d4abr 1d2ac dach4 d5ache 3dact d1ag
d4a4gi d4ale d4alg dal5ler dam5a 3dame d3ami da5mu 3dang d1an4t d3ap d3ard
5darm 3d4as2 dast5a d1at dativ4 dat4u daugh3 daun5te 3dav d3b d3c4 d1d4
d4dere d3di d3dler d3dli d3dyi 2de. deac3t de5aw de4bi deb5it 3dec de5cant
de4cil de1cr 4dect ded3i defor5e de4fy. de3g de4gu de3io 5de3is de3lat
deli4e del5ler del5li de5lo 1d4em 4demie 4dem4is demo4n de4mons de3mor
de4mos 4demy de1n2a den4d 4dene d3enh deni4e dens5a dens5er den5tit de3od
deo3l deon2 deont5 de1p depen4 deposi4 de2pu d3eq derac4 de3rai d4ere 4dered
de5reg 3derer 1deri der3k 3derm der4mi der5min 5derne 3dero4 der5os der3s
5deru 4des. de3sa 5desc des4ca de5scal de3sec des4i de3sid des5igna des1p
des5pon de3sq d3est. des3ti 1de1t de3tes de5th de2ti dev3il de3vis de3vit
de4voi devol5u 3dex 2d5f dfol4 d2g dg4a dgel4 d4gen d3gr 4d1h dhot4 d4hu
4di. 1dia di2ad 3diar diat5om 4d1ib d1ic. dic5am di4ce di3ch d5icl dic5ol
1dict dic5tat dic4te 5dicul d5icur 1did di4ers 3di3ev d4ifo dig3al di3gam
dil4 5dill dilo4 di3lu di5mer dimet4 di1mi 2d1in din4e din5gi di5nos 3di1o
dio4c di4ola dip5t 3dire di3ri 4d5iro di4s1 d4isc disen3 3disia 3diss d4itas
d4iter dithe4 d3ito ditor3 2dity 1diu 1di1v2 di4val di5vine dix4i d1j 2dl4
d1la 5dlef 5dlest 3dlew dlin4 d1lo d5lu 2d1m 4d1n2 1do 4do. d4ob do4c3u
dog4a do4j d4ol. dol3en do5line dol5it do4lon d4ols 5dom. doman4 domin5
dom5ino dom5it do5mo don4at 4dony 3doo d2or 4dor. dor4m dort4 d4os do5sim
dossi4 dot1a dot4tin 2dous d4own 3dox d1p dr2 d5rail d3ral 3dram dran4 d4ras
drast4 3drel dres4 dress5o dri4e d4rif dri4g3 d4rom dropho4 drunk3 4d1s2
d5sl ds3m ds4mi d4sw dt4 dt5ho 1du 2du. du1at 3duc duch5 duci5an du4co
du5eli du5ell du5en du5ett du5in dul3c d3ule dul4l dum4be dun4a d5un4c du2p
du3pl 5duro d5use dust5er du3u d1v dver2 dvert3 dvoc5at 2d1w dwell3 2d2y
dy4ad. dy5ar 5dy4e 5dyk dyl2 dyll3 5dymi 3dyn dys3p d3zo ea2 4eab e1act
eac4te ea5cu e5add ead3er ead1i ead3li ea4g eak1 eal3a eal3er ea3log eam4bl
eam3er ean5i eap2 eap5er e3app ear3a ear3er ear4li e5ar2r ear4te earth5i
eas5er ea4soni e1as1s eassem4 eas4t east5i eat5eni eat3er eat5ie e3atif
eatit4 eat4itu e3atri e4atu eau3 eav5i eavi4e eav5ou eaz5i e1b ebar4 eb2b
ebe4 e4bel. e4bels e2ben eb5et eb2i e5bil e4bin e4bis e4bl e4bos ebot3o e2br
eb1ra eb2t e4buc ebus5i ec2a ec3ade ecad5en ecal5e e5cam e4capo ec3at ec5ath
e1ce ecent5o ech3i e4cib eci4f ecip5i e1cl ec3lip econ4sc econstit5 ec3ora
ec5oro ec3rat ec5rean e4crem ec1ro ect5ati ec4ter ecti4c ec4tit ec4t5us
ec1ul e5culi 2ed e5dans e2dat ede2 e4ded e5deh e4dele edes3t ede3te edeter5
e3dev e5dew ed4g edi4als ed5ical ed5ics ediges4 ed5igr ed3ime ed1it edi2v
ediv5id ed3li edor4 e4dox ed1ro edu5cer e2dul ed3ulo e4d5ur ee4ce eed3er
ee4do ee2f ee5g ee1i ee2l1i ee2m eem5er eem3i eep1 ee4pa eer4ine eesi4 ee3to
e1f efact5o efal4 ef5eree ef5inite e4fite ef4l efor5est 2efu e4fug efut5a
egel3 egi5a e4gib e3gla eg3le eg4mi eg5nab e5g4on e2gr e5gur e1h2 e5ho eh5s
ehy2 ehyd5r eid4 5eido 4eif eig2 e5ignit e4in. e3inc e2ine e1ing ein5i
e4ins. ei4p4 eir3o 4eis eis3i eit5er eith4 e2iv eiv3er e2iz e1j ejudic4
ek3en ek5is ek4l e4lac e5lad el5age elam4 el5anc elast3 e4lates el5ative
elch5er eld3er 2ele elea5g 4e4led el5eni el3eno ele3o ele5ph el1er e1les
e5less e4leste el3et3o elev3a ele3vi el5ex e4l3ica4 e1lie eli4ers e3lim
el3ing eli3on e4li4s elit4t e3liv el4lab ell5iz e3loa e3loc elo5ca eloc3u
elo4di e2log elom5ate el5op. el5ops elp5in el3so el5tie e1lu elu4m elus4
elv4 e5lyi 3elyt em3ago em3ana emar4 emarc5a em5atiz emat5ol em5bi e1me4
e4mee e4mel e3mem e4m3era em5ero emet4e em4icis e4mie e2mig emig5ra em3ina
em5ing e3mio em3ism e4mita e4miu em4mae 4emnit emo3bi emod4u e2mog e4moi
em3olo em5om 4emon e3moni emon5ol e2mor em5oris em3orr e4motic e5moz empa5r
empara5 em5pes 4empli. em4pre em3um e5mut en3ac e4nal en3am3o en4ann e2n3ar
en3as. ena5ture 3encep en4cile enct4 2end en4d5al en4dedl end5rit 4ene ene5d
en3ee e5nelle e5nep e2ner e5nereo ener5v en5esi e3ness en1et en4ett e2n3eu
e3new en3gi en3ic en5ier en3ig3r en5in enit5u en3k en1o en3oi eno2m en3oty
enov3 en2s ens5al en3sp en4sum en4sus ent3ar en4ters en5tia en4tify en2to
en4tri ent5rin ent5up en4tus 4enu en3ua en3uf en3ur en5ut 5enwa eo3b e4och
e4oda eof2 eo2l eol5ar. eol5at eologi4 e5olu eo3m eon4a e3ont eop4t e1or1
eor4de eor3e eor5o eo1s2 eo4to e1pa ep4al ep5arc epa4t epend5en ep5ert
e4pete epe5titio ep5ex eph1 eph4i e2pig e5pla ep3lic epol3a epol3i epolit5
ep3reh epres5e ep5rim e4p5rob5 ept3or e1p4u e3pur5 e4puta equin4 equi5no er1
era4cie era4do era4g era4l er3aph er3api er3apy 4erati. 4eratim er5atu
er3bat er3be erb5os 2erc er3ch er3cl 2erd erd5ar erdi4e 2ere er3eal 4ered
er3egr er5el. er5ell er5els e4reme er3en 5erend eren4e ere5ol e3req er3er
ere4s er5ese er3esi er5este er5esti eres5tr eret4 er3et. er3ets er3ett ere4v
er3ex ergi3v er3gl er3ia. er4ian eri4cid 5er5ick er2id er3ie er3iff er4imet
er3in eri4na eri4on er3iou er4isc eri5sta 4eri2t e3riv er5iz 4erj erk4 er3me
er4moi 5ernacl er5nalis ern3er ern3is ern3it 4ero. er3oid ero5is ero5st
erpent5in erre5la er4rep er5sine er5ted er4ter ert5er. ert5ers er4thi ert5iz
2eru eru4b eru5d erund5 er4vil 5erwau eryth3 2erz 4es. es5am es5an e2sc
es5can es5che esci5e escut5 e3sea e3sect e5see e5seg5 ese4l es5enc e3sh4a
e1shi e5shu esi4an es5ic. e5sick es5iden esi5diu es5ies es3im es3in e5sion
e4sit es4it. es4its e3skin e3s4mi es4od es3ola es3ol3u es3ona eso3p e1sor
es3per3 es5pira es5pit es4pl esplen5 es5pot e5s2pr es4s3an essar5 ess5ee
es4sil es2so esta4b est3an e5star es5tau e2sti est5ifi est5igati e3stoc
es5too est4r estud4 e1su e2s3ul es4ur5 et2a et3al. et5allis et3al5o eta5me
eta3p et3ari et5ary et4as et3ate et3ati et5ay et3eer etell5i etend5er et5eni
eter2 et3er3a et5eria etex4 e2th1 ethyl3 2etia e3ticu eti4gi e5tim et3in
eti4na e3tir et5itiv eti4u et5olo e5tomete e2ton et3ona etor3i etra5g
4e4tral etra5m et4ran et5ress et1ri et4ria etrib5a e4trim et1ro et2t et3ter
etud4 et3ude e4tum et4we et5z eudio5 eue4 euk5 4eum e3urg eur5i eus4 eu5ten
eu3ter eut3i ev4abi eval5e eva2p3 ev3ast ev3at ev5eli eve4n ev5erat ev5eren
ever4er e4veri e4ves e1via e4viab e2vic evictu4 evid3 ev5ig ev4ile ev5ish
evis5in evis5o e4viu evoc3 evol5e evol5ute evu4 e1wa e4wag e5way ew1er e3wh
ew5ie ew1in ew5ish e3wit e1wr ex5ic ex4on. 1exp 4ey. ey4as eyl4 ey3s2 ez5er.
ez5ers ez5ie 1f2a 2fa. fab4i fa3cet fact2 fa2c3u 2f3ag fall5in 5falo fa5lon
fals5ifie 4fan3a fan5tasiz fant3i 5far far3i 5faw 4f5b 2f5d 2fe. 3feas
fea3tu feb5r 3fec 2fed1 5fei fe1li fem3i femin5 fend5er f5eni 4fered fer3ee
3fero fe5roc fer5om 3ferr fer3v 2fes. fess3o fest3a fest5i fe4t fet4al
fet4in fet4o 3feu fe5veri 2ff f1fe ffec4te f5fet f1fi f5fia f3fic f5fie
ffil3 f2f3is ff4le ff3lin ffoc3 ffoni4 ffor3e f3fr ffranch5 4f5h fi5ance
fib5u 4fic. 4fical 3fici 4fics fi5del fid3en fiel4 fier4c fight5 1fi2l 2fin
fin2a fi3nal find3 fin2e f1ing 5finin fin4ni fir2m1 f3ita f5itee fl2 3fla
fle2s f3lica flin4 3flo flo5ric 3flu flum4i 1fo 4fo. 3foc fo2e foeti4 fo1l4i
fo4lie foment4 fo2n fon4de 3foo fo5ram for5ay for5b for4di fore3t 5form
for4m3a fortu5na fo3v 1fr2 frag5a frant4 frar4 fratch4 fre4s frost5i fruc4
2f3s fs4p 2ft f1ted f4ter. ft5es fti4et ft4ine 3fu 4fu. fu4c fuel5li fug4a
fu4min fun2g 4fured fur3n fu3sil fus5o fu5til 4ga. ga4cie gadi4 ga4dos 3gag
3gai 3gale ga5len gali4a gal5ler 3galo gam4bl gan5at 4ganed gang5er g5ant.
gan4tr g5ants g5arc g4are gar3ee gariz4a ga5rot gar5p 5garr 1ga4s gas5i
gas3o gasol5 gass5in gast3r g1at g4at. gat5iv g4ato. g4atos g4att gat5u
gaud5 ga5za g1b g5d4 2ge. 5geal 3gean 2ge4d 3gedi 5gedn 4gef 1gel 4gele
ge4li gel4in gel5li ge4lu 2gely gem3i 5gemo 3gen gen4du gen5it gen3o gen5ti
ge4o geo3lo 4gere 3germ4 2ges. 5gess gest5at 3get get3a 2g1f 2g1g gg4a g2ge
g5gedl g3ger g5gerer ggi4a5 g3gli gglu3 g5gly ggrav3 g4gro 2gh g5hai gh5eni
g3ho g4hos gh2t 1g2i 4gi. gi4all gi4at 3gib gi5co gi4g gi5gan gin5gi 3gio
gi4or gi4ot 5gip gi5pa g4i4s 5gis. gi2t1 5gitu giv5en. 2gl2 g3lar 5glass.
glec4 3gler g4leto g4letr g4ley gli5on g5lis4 3glo 4g5lod glom3 4glop 3glu
glu5te glu5ti 3glyp 2g1m4 2gn2 g1na g4nab g5nate 5gnath g5nati gna5tur
gn5edl gn5ee gn3er g1ni g4nia g2n3in gn4in. g4ni2o g2no 5gnori gno4s 2go.
5goa 3goc 5god 3goe go4et go4ge 4gogram g5oid go3is go2me 5gonn go5nom 3goo
goph4 4gor. 5gorg 4gors g4ory 3gos gos4t 2gou gour4i g1ous gov1 g3p 1gr2
grab4 3gram 4grame gra2p g4re gril4 grim3a g4ro gro4g g5ron grop4 3gru
gru3en gru5i grum4b 2g1s gs4c gs4t g4sti gth5eni g5to g4u2a gu5ab 5guan
3guard g5uat 2gue 5gueu 5guit4 gui5ta gu2ma gu4mi 3gun g4uras g4ured gur4n
gur4u 4gury gust5a 2g1w 2gy gy2b 5gym 3gyn gyn5o g5z2 ha2 4ha. h4ac hadi4e
had4ine hae3o haged5 hagi3o hag5u ha5ic hais4 hak4ine hal5ant ha4m ham5an
han4cro han2g h1ani4 h5aniz han4t hant3a ha4pe hap3l har1a har5b har4d
har5die harge4 ha5rism har3o har4ted har4ti has4te hat5o haught5 havel4
hav5ersi hav5o h1b h1c h1d hdeac5 hdu4 he2 4he. h2ea 1head 3hear hearch4
heast5 heav5en hec3t4 he5del he3do heek4 h4ei he3is he5lat h5elin he3lio
he5liu hel4li h3el3o hem1a he3men hemis4 he5mop hem4p hende5 he3or hep1
h1er. her4as her2b herb3a herb3i here3a here3o h5erett h5erh her5ial h5erine
h1erl her5om h4eron h1ers h5erwa hes3tr het1 h4et3a het3i het4ted heu2 heum3
heumat5 he4v4 hev5i hex5o h1f h5h 2hi. hi4ar h1ic hi3c4an hi4cin h4icl h5ie.
h1ier h4i4ers h1ies h3ifi4 h3ify hig4o hi5ka hi4l hi5ma4 hi5mer himos4 h1in
hin4d h2in2e hi5nie h5iniz hi5nop h2ins hio5lo h4ior hi2p hip3l h4ir hir4r
hirr5i hit4a hiv5a 4hl h3la h1le h3let h1l2i hli4a 2h1m h4manic h5mica 2h1n2
hnocen5 4ho. ho3an ho4co ho3don ho5du ho5ep hol3ar hold1 hol4is. ho5lys
ho4mag hom5in h2o4n hon5em ho5neu hon3ey hong3i ho5nio hon1o 1hood hoo5r
h4ope ho2p5r h4op4te hor5et h4orn horn5i ho5rog hort5h hosi4 ho4ton h2ou
3house3 4h1p 2hr hras5eo hre4 hre5ma hr5er hres4 hri4 hrill5in hrim4 h5rit
h3rod hrom4i hry4 h3rym3 2h1s hsi4 h4sk ht5ag ht5ee ht3en. ht5ener ht3eni
ht3ens ht5eo ht5es ht4foo h1th ht4ine hu4g hu4mat hu5mer hu4min hun4c hunk4
hun4t hur3i hu3sia huz4 h1w h4wart h2y hy2l hyl5en hy2m hyn4 hy3o hyol5i
hy1pe hy3ph hyr4 hys3te hy4t 2i1a2 ia4bl iab5olis iab5oliz i2ach iac3o
i2ac2r ia5cri ia5dem i5ae iaf4 i2ag4 ia3gn i5a4g5o ia3gr i3ah i5ai ialect4
i3alit ial5li 4ialn i2a3lo ia5ly i5amb ia3me ianch5 i3ant i5ape ia3ph i2ard
4iarit i3at ia5the i5atom iat4u iatur4a i3au iav4 ib3era ib1i ibio4 ibios4
ib5li 4ibo i4bon ibor4 i4bose i5bou ib1ri 4ibu ib3uta ic3ac ic5ado i4cal
ic1an 2icar iccu4 4ice i5ceo 4ich ich4i ich5ing ich5ol 4icin i5cio 2ick
ic4lo 2i2co ico3c ic5ola icon3o i5cop icotyle5 2i1cr i4cri i4cru i4cry
ic4tedl ic4ter ict5ic 2icu icu4lu ic3um i5cun4 i5cut 2i1cy i2d id1a i5day
ide4m id3enc id3era iderm5 i3dicu id3if i5dig i5dil i3dim id4ines idios4
idir4 id1is4 id4ist 2i4d1it idi4v id3li id3ol idol3a 4idomi id3ow 4idr id5ri
id3ul ie2 4iec 2ieg2 ie3ga ie5i i5ell 4iem 2i1en ien2d i1er i3eres i2eri
ieri4n 4iern ier2o i4ert i3esc ies3el i1es2t i3est. 2i1et i4et. iet3ie 4ieu
i5euti iev3a iev3er iev3o 2i1f i2fe if4fa iff5ler if3ic. i4ficac if5ics
ifi4d ifi4n 4i2fl i3fo ifoc5 if5tee i3fy 2ig i3gad ig3and 3igar i1ge i3ger
ight5er. ight5ers 4igi ign5iz igno5m i3gon ig1or ig3ot i5gret i4g5ro igu5it
ig1ur 2i1h ihy4 2ii i5in ija4 4iju 2ik2 ik5an ike4b i2l3a ila4g ila5tel
i5later il4ax il5dr il4du i3len ilesi4 il3f il3ia. il3iar ili4arl i3lici
i5lien ili4er ili4fe il4ific il1in il5ine. 4iliou il5ipp il5iq il4ite ilit5u
il4mo i5lon il3ou ilth4 il2tr 4ilu il5ul i5lum il5ure il3v 4ilym ima4c im2ag
im3age im1al im5am i5m2as i4mated i4matin imat5u im1i i3m2ie im4ine im5ino
im5mes i2mo i5mog i3mon im5oo i3mos. impar5a imparad5 im5pie impot5 im5pr
impu4 im1ul im5um in3ab 4inace in4ado in5agl in3air ina4l 4inalit in5am
in3an in3ap in4ars i3nas. 4inata inator5 in3au in4aw 2inc inc4tua 2ind
in5dar inde5p indes5 inde3t indeterm5 in5dro 4inea 4ined in5ee in5ega 4in5eo
ine4s in3esi ine5te 4ineu inev5 infilt5 infol4 4infu 4inga in5gal 4inge
ing5ha 4ingi 4ingle 4ingli 4ingo 4ingu ing3um 2ini in5ia. 4inic in4ici
in3ion in4itud 4ink ink4ine 4inl 2inn 2ino 4ino. in3oi i5nole 4inos i3nos.
in5ose in3osi 4inq ins2 in4sch5 inse2 insect5 insec5u in3si 5insk insolv5
in4tee int5ess in3til int5res intu5m 2inu in5ul in5um in3un in3ur invol5u
2io2 ioact4 i1od iod3i4 iod5o ioe4 io3gr 4i1ol io3ma i4omani io3mo i5ope
io3ph i5opo iop4s i1or iora4m 4iore 4iorit 5ioriz 4iorl ior4n io3sc i3ose
i3osi i4oso io5sta i3ot iot4a io5th iot5ic io5tr i4oty i4our. i4ours i5ox
2ip ip3al ipap4 ipar3o ipart5ite ip1at i3pend i1ph2e iphen3 i5pheri iphi4
i4phu ip3id i5pil ip3in ip4ine ipir4 ip5is ip1i4t ip4iti ip3lin ip3lo i3po
i4pog i4poli i4pom ipon3 i4pow ip2pl ip3pli ip4re ip5tori ip1ul i5put ipy4
2iq i3qua 2ir ir1a ir4abi ira4c ir4ae. ir4ag ir4alin ir4alli i5raso irassi4
iray4 ird3i ire3a ir3ec ir5ee irel4 ire5li ires4 ir5ess ir1i ir2i4d ir4im
ir4is. 5iriz irl5ing ir5och ir5ol ir3om ir4q ir2s ir5ta ir5tee irwo4me i4sa
is5ad is3age is1al is3am is1an is3ar is5av 4isb i2s3c is5chi isci5c 4i1sec
ise5cr is3ell 4is3en is2er is5ere i2s3et 4iseu is3har ish5ee 4ishio ish3op
is5hor 2isia is5ic is3ie 4isim is3inc 4isis is4ke is1l islun4 2isma is1on
is5oner iso5p is1p i3s2ph 5ispr 2is1s iss5ad is4sal is5san iss4iv iss4o
4ista is4tal ist5enc ist5ent is5terer 4isth is4t3ic 4istl i4s1to 4is4tom
is1tr 3istry 4isty i5sul is3ur 2isy it1a it5ab ita4c 4itai it3am it4ana
it4as it3at i3tect it3ee it3enc it3ent it3era 2ith itha5l ith5i i5thol ith3r
ithy5 2itia iti4co it5icu it1ie it3ig 4itim it4in. it4ins 4itio. 4itione
i5tiq 4i5tit it3iv it4li it5lo 4ito. it5ol 2iton it1ou 2itr it5ress i4tric
2itt it4tit itu4als it5uar 4itue it1ul it1ur it3us 2i1u2 i3um iur5e 2iva
iv5anc iv1at i4ved iv5el. iv5eling iv5els i4ver. iv3eri i4vers. iver5sal
ives4 iv3et i4vie iv3if i5vilit 5ivist. 5ivists iv1it i2vo ivoc3 i5vore 2i1w
2ix ix3o i5ye 1iz 4izah iz3i2 2izo iz5oi 2izz 1ja 2ja. 3jac ja2c5o jac3u
jag5u jal4 ja5lo ja5pan jel5la jeo2 jeop3 4jes jeu4 jew3 2ji 3jig jil4 jill5
5jis. 3jo2 4jo. joc5o joc5u jol4e 4jr 4js ju1di jui4 ju5l ju3ni juscu4 jut3a
ju1v k4abi k2a5bu kach4 k3a4g kais5 ka4l ka5lim kal4is k4an ka3o kap4 kar4i
1kas. kaur4 kav4 k1b4 k1c kcom4 k5d2 kdo4 kdol5 4ked ke5da k5ede 3kee ke4g
ken4d keno4 kep5t ker5a k4ere k5erel ker4j ker5o kes4i ket5a key4wo k1f
kfur4 k3ho 5kih ki2l kilo3 k1in k2in. 3kind kinema4 kin5et k3ing kin4i k2ins
kir3m kir4r kis4 3kis. k1ish kit5c ki4w kk4 k5ker k2l2 k3la k5lea k3ler
k3let k3li k3lo k1m kn2 k2no 1know ko5a kol4 ko5mi ko5pe k1p k5ro4 k3ru 4k1s
k3sl ks2mi ks4t k1t kur5 k5v k1w 3kyl l2a 4la. 5laa lab5ar label4 5labr l4ac
la2ca la5ceo la5cer la4ch la2co 5la5col lac5on la3cu la4de l5adm l4ae l4af
la3ger la4gis lag3r 5lah4 la4ic. l4al 4lale 5lamandr la5melli lam4ie lam1o
l5amu lan3at lan2d 3land. land3i 3lands lan4er lan3et lan5tine lan4tr la4p
lapi4 lar5an lar5de 4lared l4as lat5al la4te 5latilis 5latiliz 5latini
lat5us l4au 5laur lav5at l4aw 4laz l3b lbe4 l4bit l4by l1c2 l2cat lce4 lcen4
l4cere lch4e l3dar l3ded l3deh l5dera ld3est l5dew ldi2 l3die ld4ine
l5di5nes ld3ish ld5li l3do 4le. 3leagu le5atio leav5er l3eb5ra le3ca le5cha
lect5ica 2led le5dr leg1a l3egan 3legg le4gin leg3o le3gra lek4 4leled lel5o
lelu5 lem5enc lem3is l5emiz 5lemm l3emn le2mo lem5on l5enda len5dar lend4e
len4do le1ne le5nie len3o 4lentio len5u le3on leo4s le5q 2ler le5rec 5l4eria
l4eric le5rig ler3om leros4 ler3ot 4les. le3sco 3les4s 1let le5tra le5tre
5le5tu5 leur5 2lev l3eva 5leve lev5ita le4wi l5exa 1ley lf5id l2fo lf3on
l1g2 l4gal l4gem lgi4a l4gid l4goi l3h 4li. li4ani lias4 lib1r l1ic. 5lich
li4cie 5licio l3ic3on lict4o li4cu l3ida l4idar 5lidif 3lieu l4ife l4ifo
lift5er 1lig li5ger light5i 5lih 3lik 1l4il lil4i lim2b limet4e lim4p l4ina.
l4inas lin4d l4ine 5lin3ea lin4er. lin4ers lin4ger ling3i 5lingt 3lingu
3linq lint5i 3liog li4ol lio3m liot4 li3ou 5liph lipt5 li1q 3lir l1is l4isk
5lisse l1it l2it. l3it5a 5liter 3lith 5litia 3litr lit4u l4iv l5ivat liv3er
liv5id lkal5o lk5at lk3er. lk3ers ll2 l1la lla4ba llact4 l5las l4law l5leb
l1lec l1leg l3lei l1lel lle5m l1len l3lep l3leu l3lev ll3f l1li lli5am
lli4an llib4e llic4 l4licl lli5co l5lie lligat4 l2lin l5lin. l3lina l3line
l5lio lli5v ll3m l1lo lloc3a lloc5u llo2q l4lov llow5er ll3p ll3s ll5t l1lu
llun4 l5lya l3lyc l3lyg l3lyh l3lyi l5lym lm2 l1ma l1me l4mer lm3ing l5mip
l2m3od l1n4 l3ne lneo4 2lo. 5load 5lob3a 1loc loc3al loc5ul lo4cus. 2locy
l3odis 3lo3dr 1log lo5gan 4loi. lo5mi lom4m lon4al lon4e l5onel lo5ney
long5in 3lonia loni4e l3onis l3oniz loom5er lop4e 5lo5pen l3opm 1lo1q l4ored
lor5iat lor4ife lo5rof loros4 l4os. lo1so loss4 los5sie lot5at loth4ie lo5tu
5loup lp1at lp3er lph2 l5phe l3phin l2pho l3pie l3pit lr4 l3ri l3ro l5ru 4ls
l5sam ls5an lsi4fia lsi4m ls4is l5sk ls4p l1s2t ltan3e l4tang lt5ant l5tar
l1te l4tei ltern3 lth3i lti4ci ltim4a ltin4 lti3t l3t4iv lt4or l1tr
ltramont5 l1tu l4tus 4lu. lu1a luch4 lu2c5o luc5ra lu4cu 4lue lu1en lu5er
lu1i lu4it lum4bri lu4mo 5lump lu2m5u lunch5eo 5lune l3unta lu3ori 5lup
3lur3o lusk5 luss4 lut5an 4lut5ar 5lutioniz lu5toc lut5r lu1v lv5ate l5vet4
l4vi l4vor l3w lx4 2ly 4ly. ly1c ly4ca lyc4l lyc5os lym2 lymph5 lyp2 ly4pa
lypt5o 3lyr lys5er 3lyw 3lyz lz4 4ma. m4aca mac3ad ma5chine 5machy ma4cis
mact4 4mad. 4mada 4mads ma4ge 5magn 2mago4 2mah ma5ho 3ma4i 4mai. maid3 5mak
mal3ap mal5ari 5male2 mal5ed mal3ef m3alg m3alis mal4is. mal3le mal4li 2mam
mament4 m5ament. 1man 3m4an. man3a man5dar man3dr manic4 man4ica ma5nil
m4ans mantel5 2map m3aph 1mar 5maran mar5ol ma5ron ma3roo mar5ri mar4shi
mar3v ma3son massi4 mass5ing 3mas1t mas4ted mast4ic mas4tin m4at. m4aten
ma3ter mater5n4 m4atit mat4iti m4atiza ma3tog mat5om ma3top m4ats 3m4att
ma5ture mav4 2m1b mbat4t mb4d m5bec m5berer m4bery m4bes mb2i m2bic m5bil5
m4b3ing m4bis mb5ist mbival5 m5bler m3bli mbru4 mbu3l mbur4 m1c m5d m2e 2me.
mea5g me5and me4ba me4bi 2med 4med. 3media med5icat 4medie m5ed5ies 3medit
me4do m5edy me2g 5meg2a1 mega5t 4mele mel5ee mel5ler mel3on mel4t melt5er
me2m 4m5eme 1men 3men. 2mena men4ag mend5er mend5o me1ne ment5or 5ments
5meog me4p m5eran 4mere mer4ia 2me2s mes5en me5si4a mes5q 3mesti4 1me2t
meta3t met1e 4meted meth4i meti4c met5ici met3o met3ri m1f 4m3h 4mi. m1ic
mi4cin mi3co 3micro m4ict mi3cul mi4cus m4idi mid4in mid5on mi5fi mig5a
migh5ti mi2gr 4mij mi5ka m2il m3ila mil4ad 4m5ilie mil5ies 3mill mi5lo mil4t
3m2im mim5i 5min4d mind5er min4er. min4ers ming5li min5ie m4init min3ol
1m4int minth5o mi3o mi3p mirab4 mi5racu m2is. m4isc mi4se 4misem mis3ha
5missi m3ist. mis4tin m3ists mi2t m5itan 4mity 3miu 5mix 4m1l mlo5cuti mlun4
2m1m2 mman4d mmand5er m3medi mmel5li mmet4e mmig3 mmin3u mmis3 mmob3 m5moc
mmor3 mmut3a 4m1n2 mnif4 m4nin mni5o mnis4 mno5l 1mo 4mo. 2moc mod1 mod5ifie
mogast4 mo4go mog5ri m5oir mok4i mol3a 4molog. 4mologs 4mologu mo3ly mo1m
mo4mis m4on mona4 4moned mon1g mo4no monolo4 monolog5i m4op mophil5i mop4t
m3orab m3orat4 mor4ato m5ord mo5rel 3moria m5oriz mor5on 3morp 3morse
mor5tal mo3sp 5most mo3sta 2m1ous m1p m3pa m4panc m4pant mpath3 mpel5li
m5perer mper3i mpet5it mphal5o m4phe m4phl m2pi mp5id m5pig mp3ily mp1in
m3pir mp3is m3po mpol5it mpo2t mpov5 mp3to mp5tr m3pu m5q m3r m4ry 4m1s
msel5f m5si msol4 mtu4 muck4e muff4 mul1t2 m5unc mu5nio mun3is mus5co mu4se
mus5ke mu3til m1v m3w 2my 5my3c my4d my3e 3myi 5myst4 3myt n1a 2na. na2c
nach4 na5cious. na5ciousl nac4te nac5tiva na5culari na4d4a nadi4 nad4op
n2ae. naffil4 nag4a n4agen 5na5geri na4gi n5ago 5n4a3gr 5nah 5nail na5iv
nak2 4naled n5alg n4alia na3ly 1nam 3name nam4n na5nas nannot4 nan4ta
nan5ted nan4to na5o 4n4ard nar5tisti n2as nas5i nas5p nas3s nas5te nat5al
na5tat n4atee na3the nath4l nati4 n4ati. nat5ic n4ato. na3tom na4tos nat4r
na5turi naugh5ti naus3 3naut naut3i na2v na5vel n3b4 nbarric5 nbeau4 nbe4n
nbene4 nbet4 nbit4 n1c2a n4cal. ncarn5at ncel4i ncent5ri n4cept. n3cer
ncer4e n4ces. n5cet n5cey n3cha nch4ie n3cho nch5olo n3chu n4cic ncid5en
n4cif ncip5ie n1c2l n4cles ncoc4 nco5pat n1cr nc1t nc4tin nct4ivi nct2o n1cu
ncu4lo n4cun n4curvi ncus4t 4nd n2da n3da4c n3dal n4dale n3dam nd3anc nde2
n3dea nde3ci n1ded nde4l ndeleg4 nd3enc ndepre4 n3derl nde4s ndes5cr n5dez
nd4hi n1dic ndic5u ndid5a n3die nd5ily nd4ine nd3ise nd5is4i nd5ism. nd5ity
nd3ler nd1li n5doc ndor4 n2dou nd5our ndrag5 ndram4 n5dron ndu4b nduct5iv
n4dun nd2we n3dyi 2ne. ne3alo n3ear ne2b3u 5neck ne4cl ne2co n5ectom 2ned
3nedi ne4du4 neg3a ne3go 5negu neis4 2nele ne5lia neli4g n4ely ne2mo 4n1en
n3end neo3l neon4 ne2p n1er 4nered 5nering ner5o ner4r5 ner2v nerv5in 2nes.
n1esc ne3sia 1ness n1est nes3tr net3a net3ic ne4tog net1r neuma5to neut5r
nev5er n4ew news3 n4eys. n3f nfo4 nform5er nfortu5 nfran3 4ng ng2a n4gae
n5gee n3geri n5gero ngh4 n2gi n5gic ngio4g n5glem n3glie n5glio ng1n n1go
n4gry n1gu n2gum n1h2 nhab3 nho4 nhy2 nhyd5 n1i 4ni. 3niac ni3ba n4icab
ni4cen 4nicl nict5a ni4cul4 ni4dio n2ie ni4ers nif4f nift4 nif5ti ni2g
night5i n3igm 3nign nik5e n2il nil4a n3im1 n4ime 5nimet n4ines nin4j 5ninn
n4inu 5niol ni1ou 3nipu 5niq n4is. n4isk nis4l nis4o n5iss nis5ter. nis5ters
nitch4 ni4te ni3tho n4itos ni5tra nit5res ni3tri nit4ur n2iv niv4a ni3vo
nivoc4 niz5en n1j njam2 njur5i 4n2k nk5ar n5kero n3key nk5if nk5il 4n1l2
nland5 n3le nlet4 n3m nmater4 nmor5ti n1n4 nne4 nnel5li nnerv5a n3ni nni3ki
nnov3 n5nyi 4no. n5obi no5bil nob4l no5blem nobser4 n5ocula no4di n4ody
noe4c no4fa nois5i n5ol. no3la nol4i nom3al 1nomi no2mo 4none 3nonic 5nood
nop5i nora4t nor5di nor4ia nor4is nor3ma n4oro nor4t n4os. nos4o no3sp not1a
3note n1ou n4oug 3noun 2nous nou5v nova4l nove2 nov3el novel5e n4ow now5er
now3l n3p4 npil4 npla4 npoin4 npo5la npos4 npri4 n1q n4quef n1r nre4i nre3m
nres5tr 4n1s ns2c n2sco ns3cot n4scu n5sec nsec4te n2ses n5seu n3sh2 n2si
ns3ib n4sic n5sick n3sid n3sie ns5ifi ns3ing n3sio n3s2is nsi2t ns3iv nsolu4
n5son n4sore n4sory n3spir n3s2t nsta4 nstil4 n3su nsur4e n3swa ntab4u
nt3age nt1al n4t3anc nt5and ntan5eo n4t3ant nt4ariu n5tasis nt3ast nt1at
nt5ath nt3ati nt5ativ n5tau n1te n4tec n4tee. n4tees n3tel ntend5en n4teo
n4ter. n3teri n5tern ntern5al nter5nat nth2 n1the nther5 nth5ine nt2i nt4ib
n4tic. n5ticis n5ticiz n4tics ntic4u4 n3tid4 n1tie n4tify. n3tig nt5ilati
n5till nt3ing nt5ing. nti3p n4tipar n4tis. nt3ism nt3ist n5titio nt3iz n2tj
n1t2o n3tom ntoni4 n5top n1tr ntra3d nt3ral n4trant n3trat nt5ress nt3ril
ntrol5ler n5trym n1tu n3tua ntub5 ntup5li n5tur n2ty n2u nu1a 5nuc 3nud
nud5i nu3en nug4a nu3i nu4is 5nuk n4ulo n3ult nultim5 nu1me 5numenta 5numer
5numi 3nunc nu3tat n5utiv nu4to nu1tr n3v2 nve2 nvel3 nven4e nven5o nvers5an
nvi4t nvoc5at n5w nwin4 nwom4 n2x4 2ny2 5nyc nym5it nyth4 n1z2 nzy4 2oa2
o5ace o3act oad5er oad5i o3ag oak5er o3ales oal4i oal5in o5alit oan4t oap5i
oar5er oar4se oast5er oat5a oat5ee oat5er 4oba obe4l ob2i ob3ing 2obi3o
ob3it o3bla ob1li 4obo ob3oc o5bol o5bot o3bra obrom4 ob5t ob3ul o3bus 2oc
oc2a o4cab o3cad oc5ag o5calli o4c5ativ oc5ato 4o3ce2 o4cea ocen5o ocess4i
och4e och5in o3chon ochro4n o5chu oci3ab oci4al o1cl o2cle o1cr ocre3 oct2
oc2te oc1to ocu4lu ocum4 oc5uo ocuss4 ocus5si ocut5r o1cy o5cyt ocyt5o
od3al. ode4c o5deg ode4ga o5dend o3dent odes4 od3ica o4d1ie od3iga od4il
od1is2 odis5ia od5it 5odiz od3li o2do od5olo od5ous o3dro od5ru o2du odu5cer
o4duct. o4ducts od3ul o5dyt oe3a oe4bi oe5cu oe4d o5ee oe5ic o3elec oelli4
oelo4 oe3o4p oep5 o5eq o3er oes3t o1et o4et. oet3i oet4r 3oeu o3ev o3ex
oflu4 4ofo o4ful ofun4 2o1g o2ga o3gam og5ar5 o3gas ogen1 o5gey o3gi o4gio
og2na ogoni4 o4got o2gri o4gro og4sh o2gu o5gyr o1h2 o3ha ohab3 o3he oher4er
o3ho4 ohy4 2oi oi4c o3ic. oi5ch o2i4d 4oide oig4 oi5ki5 oil3er oil5i oin3de
o3ing oin4t5er oin4tr oi4o 4ois o3ism oi4t oit4al oith4 o1j ok4ine ok3l ok5u
ola4c o4lack o5lali ol4an olan5d ol5ast olat5er ol5ch ole2c4 ol5eci ol5efi
o3leo ole4on o3lep ol1er o3lest o3leu o1lia ol3ica o3lice ol5iciz ol5ick
ol3ics ol5id. oli2e o3lier ol5ies. o5lif oli4f3e oli5go o5lina ol3ing oli5os
ol5ip4 olis4 ol2it olle2 ollim3 ol4lope ol4lyi ol3mi o1lo 4oloc ol3oid
o4lona olon5el ol1or o3los ol1ou 4ol1ub o3lumi o5lunte ol3us. oly3ph 4olyt
2om o1ma o4mab o2mac o2mal o4mane omast4 o3mat om4be ome4d ome4g omeg5a
ome3li om3ena omen4t o3meri om1i o3mia omi2c omic5r om4ie. omil4 om4iny
omiss4 om2it omme4 om2na omni3 o4moi omoli3 o2mo4n om5ony o4mos. omot5iv
o2mou om5pil ompt5er ona4d on3ai o5nas. onast5i on5ativ 4onau on1c oncat3
on4cho 5ond5ar ond5ent on3der on3dr on5dy o2ne 4onea onec4r 4oned on1ee
on5ell o3neo on3ess on1et ong3at on4gu 4onh 4o1nia on5iar 2oni4c onic5a
onical4 on4id on3ies on3if o5nig o1nio onk4s 4onnes on5odi on5oi ono4mi
4o5nomic ono3s o5nota ons2 2ont ont5ane. on4ter onti5fi onton5 ont4r on4tre
on5ur o5nus onvo5lu on2z 2oo oof3er oo1i ook3er ook3i oo4le ool5ie oo4m
oon3i oo2p oop4ie o3opt oo4se oost5er oo2t oot3er ooz5er o1pa o4pab o5pali
opa5ra opath5 o5pec opens4 op1er 3opera 4operag o1pha o4phe oph4ie o5phil
op5hol o1phy ophy5la op1i op3ies op5ing o3p2it 4opl oplast4 o4poi opol3i
opon4 op5ony op5ori opoun4 o2p5ov op2pl op5pli oprac4 op3ran opre4 opro4l
op5rop op5so 1op1t op2ta op1u o5quial or1a or5ado ora4g o5rai or5al 4orals
oram4 oran3e orator5 orb3in or4ch orch3i or4du 2ore or5ead ore5ar ore5ca
ore3f ore3g or3ei oreo5l or3esc ore3sh or3ess orest5at or5este or5ett ore4v
5orex or4fr or5gn or1i 4ori. or3ia. 4orian ori4ci ori5cid orien4 or3if 5orig
ori5ga ori4no 4orio. or5ion 4orios ork5a 2orm orm1i or3n4a 5ornis or3nit
or3one o5roo or5ose or5oso or1ou orrel3 orres3 or4sc or4sey or4sti 2ort
ort3an ort3at ort3er or5tes. or3thi or4thr or4tit ort3iz or4tor or5tra
ort3re 4or1u or4un ory5p osa5i os3al osar5 o1sc os4ca os4ce o2sch o4sci
osclero5s o3sec osec3u ose5g os5enc osens4 os5eo oser4 o2set os5eu o3sia
osi4al osi4an os5ide o3sier os5if os1in o4sis o5ske o5son o3soph os3opo 4osp
o3spec os1pi os4sa oss5ar os4sit 4osta ost5age os4tar os5tee os5ten osten5t
ost5ica os3til o5stome ost3or 4osu os1ur 2ot ot3a4g o5talit ot3am ot4anic
o3tap ot4atio o5ta5v o3tax o4ted oter4m ot5esta 4oth othalam5 oth5erin
o5therm otherm5a o5thor o5tia o5till 5ot5iniz ot4iv o3tiva o5tivi o1t2o
o5tone o4torn o4tou 4o1tr oturi4 oty3le o4u2 5ou3a oub2 ou5br ou5ca ou5co
oud5i 4oue ou3et oug4 ou5ga ought5i ou5gi oul4t oult5i ou3m 2oun oun2d
ound5a ound5el oun5gin oun3tr oup5li our3er ou5san 2ouse 5ousia ouss4
out5ish ouv5a ova3le o5var 4ovati ov5eling o4ver. over3b over3s ov4ete
ovid5en o1vis ovis5o o2v5os ow3ag ow3an o5way owd4i owd3l ow1el owel5li
ow5ha owhith4 ow1i ow5in owi5ne ows4 ow5sh ow5sl ow5y o4x ox3i oxic5ol ox5o
2oy oy5a oys4 2oz o1zo ozo5i o3zyg 4pa. pac4te pa5dou pad4r paes4 pa3gan
4pagat pag4ati pain2 4pairm pa5lan pal3in pa3lo p4als pan5ac pan1e pan3i
pa4pa pa3pe pap3u pa3py 1par para5s par3l pa3roc pa3rol par5on 1p4as
pass5ive pas1t pas4tin pa3ter pati4n p5ato pat4ric pa5tricia 5pau paul5e
pau3p pa5vil 5paw pawk4 paw5ki 2p1b p1c4 p5d2 2pe. pearl5i pe4co pec4tu 2ped
5ped3a 3pede 3pedi ped3is 3peds pe2du p4ee pe2f 4pele pe5leo pel5v pen4at
5p4enc pend5er pen5dr pen4ic 3p4enn pens5ati pen5u pe5on 5perc percent5
4pere perem5i p4eri 5p4er3n p3eron per4os. per5tin pert5is per3v p4ery 2pes
pes4s3 pes5til 3pet pet5all pet3en pe2ti pet3r pe4wa 4pex p1f p5g 2ph. 4phae
pha5ged ph5al. ph2an phant5i phe4 ph5esi ph3et 3phib 4phic 1phil phi4n ph1is
phi5th ph2l 1pho 4phobl 4phoned 3phor ph5oriz phos3p ph3ou 3phra 4phs 1phu
phu5i 2phy. 3phyl 4pi. 3piar 4pica p5ical pi3co pi4cr pict4 p2ie p4iest
pi5eti p5ifie pig3n p2il 3pile pill5in 5pilo pi3lot pim2 pin4e pin5et 3pinge
p4inn 5p4ins 3pi1o pip4a pi4pe 5piq pir5ac pir4t p4is. p4isc pis2s piss5a
pis5til pis4tr p2itu 2p3k2 p2l2 1pla pla5no plant5er plas5tici pla5t4o 4ple.
4pled. 3pleg 3plen 2ples 4plism 4plist plu2m plum4be plumb5er p4ly 2p1m 2pn
pnos4 1po 4po. po3ca 3pod 4pof 2p5oid pois5i po5lemic po4ly1 poly3s poman5
pom4e p4o2n pon4ac pon4ce pon4i4e 3ponif pon5ta 2pony po4pa po5ple 4porato
por3ea 4pored pori4f por3p 3port por5tie 3p4os pos1s2 po1te poult5e pound5er
pout5er p5oxi 5poy 4p1p2 ppar3 pparat5 p4pene ppet3 pph4 ppi4c p4pled p5pler
p5plet ppress5o pprob5a 1pr2 prac1 pra5d prar4 4pre. preb3 pre1d pref5ere
prel5ate 3prem pre5mat pren3 pres3a pre5scin p3rese 5pressi 5prici pri4es
4pri4m pring5er pring5i 4prio p5riol pri4os pris5in priv2 4priva 4pro.
pro3bo p3roc3a pro4ch pro1l pron4a proph5e propyl5 pro3r2 pros4i pros5tr
pro3th 4pry 2ps2 p3sac psal5t p3sh p1si p5sin. pso3m p1st psul3i 3psyc 2pt2
pt3ab p4tad p4tan p2tar pt5arc p1ted p5tena pt5enn 5ptery p5tet pt4ic p5tie
p3til p2t3in pt4ine p3tise p5tisi p5tom p4tr p1tu pub1 pu5be puc4 puch4
pudi4c pu5er puff5er pu4lar pu5lar. pu5lis p4u4m pum4o p4un pun4a 3punc
pun5gi pun3i pun2t pu3pi pur5b pur3c p4us push4ie pu3tat p5u5tis pu3tr 4p1w
2p4y py3e 3pyg 3pyl pyr3e py5t 4qf qu4 5quak 4quar qua5tio 2que. 3quera
4quere 4ques. 1quet 5quina 5quir 3quito 4quitu 4ra. ra3ba 5rabe 3ra3bin
r2abo ra3bol rac4a r2acu rac5ula ra5culo r2ad ra4de rad4ine rag5ou ra3gr
3raill ra5ist 4ralia ra3ly r5amn ra3mu r4andi ran5dish ran4du ra5nee ran4gen
ra3nia ra3noi ran2t ran5ted 5rantel rant5in rant5o rapol5 rap5to 4rarc rare2
rar3ef rar5ia. ras2 ras3c r2ase r4ask ra3so rass5a rass5in r4as5te ra5tap
ra5tat rat5eu rath4e rat3if rat4in. ra5toc 5ra5tol 4r4atom ra4tos ra5tui
rat5um rat3ur rav5ai rav5eli rav3it rawn4 ra3zie r1b r2ba r4bag rb3ali rb1an
rbar3 r2be rbe5c r3bel rbel5o rb3ent r4bes rb2i rbic4 rbic5u r2bin r5bine
rbit1 r2bos r4bum rbu5t4 r1c2 rcant5 rca4s r4cele rcen5er rcen5tena r2ces
rcha3i rch3al rch5ard rch5ate r3cheo r4cher rch4ier r4chin rch3is r3chit
rcil4 rci5nog rcis2 rciz4i r2cl r4cle r5clo rcolo4 rcrit5 rcriti4 rct4 rc5ti
r5dam r4d1an4 rd4an. r2dar r5de4l r3dens r4des rd5ess rd5ian r4die r5dig
rd2in rd3ing rdi3o rd1is2 rd5ler rd3li r4dol rd5ous r2e 4re. rea4 r4ea.
react5iv re3af re3ag re5alt re5amb re3ani re5ant re5asc reas3o r5eau 3reav
r5ebrate reb5uc re3cal rec4ce re3ce reced5en re3cha reci5si r4e1c2r rec4t3r
re3cu 2r4ed re1de re3dis re4dol re1dr reed5i ree3m 3reer re2fe re3fin
re5gali re5gra re3gre reg3ri re3gro reg3ul rei4 re3if re1in re3is reit3
reit4i re1la re1le 4reled re3lia rel3ic re5lig reli4q rel3li r5em. rem5ac
reman4d rem5ato r3emp rem5ul rena4 ren5at r4endi rene2 ren4es r4eni renic5
ren4it ren4ter re5num re3oc 3reog re5ola re3oli 3reos re1pe re4per re5ph
rep5id re3pin re3ple re4pre re1q rer4a rere4 re5rea re3r2u 2res. re3scr
re3sel re3sem re3ser res5ist re5sit re3spe r3esq re5stal rest5er re5stu
3retar re3ten re4t4er3 re5term re1t2o re5ton re3tra re3tre re5tri re3tu
re3un reur4 re1v rev3el revi4t r1f rf4l rfu4m r1g2 r4gag rgal4 r2ge r5gee
r4gene r3geo r3ger rg5li rgu5f rh2 r5hel4 rhe5ol rhos4 3r2hy 4ri. ri3am
ri5ap 2r2ib ri3bo rica5tu 2rice rich5om rick4en r4icl ri5cli ri3col ri5cor
ri4cra 2ricu rid4al rid4e ri5el ri3er ri2es rift5er rif5tie 5rifuga ri5gam
rig5ant ri5l4a r4ile rill5er. rill5ings 4rim. ri2ma rima4g rim5an4 rim3at
r4imb rimen4 4rimm 4rims rin4e r4inet ring5ie rink5er r4ino rin4s rins5i
rin4t5er ri3o rio4g 5rione ri4op ri5or ri5p2a ri5pie rip5lica ri5r ris4c
ris4is r2isp ris4pa ris4pe ris5ter 4risti ri3ton r5it5r r2i4v riv4al ri5vall
riv5eli riv3en riv3il 5ri5zo r1j r2k r5kas rk5ati r5kell rk5eni rk1er r3ket
r3key r3kier r5kiest r5kin. r5kins rks4me r1la rlat3 r1le r3l4ic r3line
r5lins r4lit r1lo r3mac rma5ce r5mad r2mal r4manc r4mano r4mari r4mary rm4as
r4m3ati rma5toc r5ma5tol rme2a r2mic rm4ica r5m2id rm4ie r5mig rmil5 rmin4e
rm3ing r4ming. r4mite. r3moc rmol4 r1mu rmu3li r2n2 rn3ab r3nac r5nad rn5ar
rn3ate rn5atin rn5edl r3nel r3ness rn5est r3net r3ney r5nia rn5ib r3nic
rn3in rn4ine r1nis rn3ist rni5v rn3iz rn5n r3noc r5nog rnt4 rnuc4 r5nut 4ro.
ro4be rob3le ro5br 5rocc ro3cu r2od ro3do rody4n ro1fe ro3gn 4roi ro3ic
roid3 ro3la r4oled rol5ite ro3ly romant4 ro5mel ro3mit romolec5 rom4p ro3mu
ron4ac 4ronal ro5nate ron5ch ron4do rong5i r5onme ro1no ron4ton roo4 1room
5root r2op 4rop. ro3pel rop4ine r4opr r5opte ror5d 4rore r4osa rosi4a ro5sol
4ross ro5stat ros4ti ros5tit ro3tat ro1te ro4ter ro3tu 5roue roul3 round5er
rou5sel 4rouss r4out r4ow row3er 4rox rpass5in rp3at rpe2 r3pent rp5er. r2ph
rph5e r3phol rp3ing rp5is rpol3a r2p5ou rpre4 rpret5er r3pu r1q 4r1r4 rra4h
rran5gi rrap4 rre2l r4reo4 rrhe3 r3ri rric4 rricu4 rri4fy. rrin5ge rri4os
rrob3 rrog5 rro4t r5ru rry5 r3ryi r3rym 2r1s2 r4sag r2sal r5salis r5saliz
r2san r4sar r2se r3sea r3sec rsel4 rsell5 rs3er. rs3ers r3set r3sha r3shi
r4shie r5si2a rs3ib r5sie r4sil rs3ing r3sio r4sit rs3iv rs5li rstor4
rstrat4 r3su r4sus rswear4 rt2 rt3ab rta4g rt3age r3tar r4tare rt3c r1ted
r4tedl r3tel4 r5tend rt3eni r5terer r5tet r5teu r4thene rth2i rth5ing.
rth3ri r1t4ic r4ticl r5tiet r5tila r5till rtil5le rt5ily r2tin r3tina rt3ing
r3titi rti5tu rt3iv r2tiz rt5let rt3li r1t4o rto5l rt5rid rt5si r1tu r4tus
rtwis4 ru3a r4ube rub3r ru4ce r2ud rue4l r4uf ru3in ruis5i ru2l r4ume r4umi
ru4more run4cl runcu4 runcul5 run2d4 run2e ru5net run4g run4t ru2p rup5lic
ru3pu rur4i rus4p rust5at rust5ee rus5tic rus4t5u ru3tal ru3ti r1v2 r4vanc
r2ve rvel4i r3ven rven4e rv5er. rv5ers. r3vest r3vet r3vey rvi4t r1w 2r2y
ry5er 5rygm ry4go rym4b 3ryngo 4ryngol ryp5a ry2t ryth4i r2z 2sa. 2sab s3abl
5sack sac4q s3act sac4te sad5i sad5o 5sae sa4g 3sai sain4t 5sak sa2l sa5lac
3sale sa3lie s4al4t sa3lu sa4m sa5min sam5o samp4 san3a san4ded s4an4e
san5gar san5if 2sant sant5ri s3ap sap3r sar5s 3sas. sas3s sassem4 s2a1t
sa2te s5ativ s5atory sat1u 1sau sau5ci saur5 savi2 sa3vou 4s3b s4bei sbe4s
sby3 sc2 s1ca sca5len sca2p scar4c scav3 s1ce s4ced 4scei 4s4ces sch2 scid5
s2co scof4 s4coi 3s4cope 5scopic 5scripti 2s1cu 4scura. 4scuras 2s1d2 2se.
se2a s4eam seas4 sea3w sec4a sec5an se2co secon4 2sed se4da sed4it 3seed
3sei sei3g 5sela 4sele se3lec selen5 5self 2s4eme sem2i semi5d sem4o sen5g
3sens sen5sati sen5sori sent5ee 5sentm seo5log se2p sep3a sep4si 3sept
sep3ti ser4an se5rene ser4to 4servo s2es 4ses. se5sh s5esta 1set 5seum 3sev
sev3en sewo4 3sex sexo2 3sey 2s1f sfact5o sfi4 sfor5e sfran5 2s1g4 s2h 4shab
sh4abi sh1er sh5et shil5li sh5iness sh3io 5ship s3hon 4shu4 shys4 si4all
siast5 4s1ib s3icat 3sicc 2s5icl si4cu si5cul s4id 4sid. si4de side5l sid3en
sid5eri 4sids 5sid5u4a si4ers sif4 sif5f si4g 1sili sim4ply 2sin s2ine
sin5et 5sing5er sin3i 5sink si5nol si3nus 1sio4 4sio. si5o5s 3sip si4pr
s1is2 4sish 4sism sist3a sist3o s1it si4te sit5om 4s1iv 5siva s1j s2k2 4sk.
s5kar ske2 s3ket s5key s3kier s5kiest sk5ily sk5ines 4sks sky3l 2sl4 slang5i
s1lat 3slau slav5eri s2le s5lea s3let s5ley s3lit slo3c slov5 s5luc 2s1m4
s3man smas4 s3men smi3g 3smith smo4d smu5tatio s1n2 s2na 2so. 2s3od sod3o
sody4 3soe 4s3oid s2ol sol3a so5lan sol4er so3lic 3solve solv5er 1so2m
soma5to 3some. so5mete so3mo s2ona son5at s4one son5or s2o2p 4sor3ie 5sorio
sor4it s5oriz sor3o s3ory sos4 4sose so5th 3sou sov5e so3vi spast4 spens5a
4speo 3sperm s5pero spers5a sph2 s3pha 3spher spic5ul s2pid sp5id. s5pier
spil4l s2pin sp3ing spi5ni spital5 s1pl sple2 s4ply s2po 5spom spon5gi
3spons 3spoon spru5d s4py s1r sre2 sreg5 srep5u sre4s 4ss s1sa s5sam2 s1sel
s5seng s3sent ssent5er ss3er. s5seri ss3ers s5seu ssev3 s3sia s1sic s1sif
ss1in ss4in. s4sine ss4is. s3s2it ss4ivi ss5li ss3m s4sn s1so ssol3u ssolu4b
s4sore ssor5ial ss5po s1su ss3w st2 4st. stab2 sta3bi 4stak s4tale stant5iv
s3tas. 5static st3c ste2 ste5ar ste5at s4teb s4tec 4s1ted s4tedl s4tedn
4stere ster4ia s4tern. s3tero st5est s1th s4tha s4thu s3ti3a 3stick s3ticu
stil5ler s4tily st3ing 5s4tir s5tiz 4stl st3ler st3li s4toe 3ston stone3
ston4ie s5torat stor5ian s4tose s2tou s4tray stre4 strep3 3struc stru5d
2st3s s1tu s4tud stu4m stur4e 4stw s4ty 1styl 4su. su5an su4b1 subt2 suct4
sud4a su3et suf3f sug3 3sui sui5c su5ing 1s2ul s4u2m sum3i sun4a su5pe
su3pin supra3 sur4as sur3c s4urg sur3pl su5su su5z 2s3v svers5a sves4
svest5i sw2 5swee swell5i 4swered 2swo s2y 4sy. sy4bi sy1c sy4ce sy4chr sy4d
1syl 3syn syn5e sy5pho syr5i 2ta. 2tab ta5blem 3tabli t2abo ta3bol ta4bou
t4a3ce ta5chom ta3chy ta4cid t5ade tad4i 5t2adj ta5dor tad2r tae5n taf4
tage5o ta5gog 3tagr 3tah 1tai 3tail 2tair t4ais 1tak tal2c tal5ent ta5lep
t4alia t4alin tal4l3a 5tallu t2alo4 ta3ly tam5ari 5ta3met tamorph5 tan5at
tand5er t4ane 5tanel tan5ie t5aniz tant5an ta4pa 1tard tar5ia. tark5i tar3n
3tarr tas3i t3asm 5tass tas4t ta3sta tast5i4c t4ateu 3tatis t4ato. tat4ou
tat4r tat3ut tau3to t5awa tawn4 t4ax 4t3b 2tc2 t1ca tcas4 tch5ett tch5u
4t1d4 4te. te5cha 5techn te3cr t4ed te5d2a 4tedd 4tedo 4teei te2g 5tegic
t3ego teg1r teg3u tei4 te2l 4teled tel5iz 1tell 4te3lo 3tels tem3a 4teme
te5mon ten4ag 4tenar 4tene t5enm 5tenna 4teno te5nog tent4a te2o teo5l 2tep
te3pe tep5i tera4c t4erag t4erato 3ter3b 5terd 2tere4 ter3eb ter5ec 5terel
te3reo 3teres4 1teri ter3ia ter5id ter5if t4erin ter5iorit ter3it ter5k
5ternit ter5no 3terr 2t2es 4tes. tesi4 t3esq t3ess. t5esses tes4t test3a
5teste test5er test5in test5or tes5tu teti4 tet1r tetr5o tew3ar 3tex 2t3f
t3g 2th. tha4 th5al. thal3m 4the. 4thea th5eas 4thed 1thei 3theo theo3l
t4her 5therap th5erc t5herd 4thered th3ern th3ery 4thi. t5hill 3think 5th4io
th4is. th5lo 2thm2 th4mi th3oli 4t5hoo 4thopt 4thores 3thot 5thoug 1th2r
2ths 5thur 5thym 3thyr thys4 4ti. 1ti2a ti3ab 2t3ib 5ti5bu t1ic t3ic. tic5as
t2ici tici5ar 3ti3cin t4icity ti3col tic1u 4ticule t3id. t4ida 3tidi ti3die
t5ids 3ti2en 1tif2 ti3fe 4tiff 4tific. 3tigi tigi5o 4tigm 5tigu ti4ka ti4let
5tilin t4ill til4l5ag t4ilt 1tim tim1a 5timet4 t1in 5ti5nad 4tined tin3et
ting5ing 3tinn 4tins t4int tin4te tin5ted tint5er tin3ue 1tio ti3oc tiol3a
ti5omo 4tionem 1tip ti5plex ti3pli ti4q ti5qua t3iris 2t1is 3tisan tis4c
tish5i 3tiss tis2t 5t4iste t4istr ti5t4an tith4e tit5il t3itis 3titl ti3tra
3tiu 2t1iv tiv5all t3ive tiv3is 2tl t1la tlant4 5tleb 5tledr 3tlef 3tlem
5tlen 5tletr 5tlew t1li tlin4 4t3m tmet2 tmo4t5 2t3n2 t4nere 2to. toas4 to1b
4tocc tode5c tod4i to5do 3toe 1tog 2t3oid 5tok 4toled tol4l tolu5 to5ly
tom3ac toma4n tomat5ol tom4b to4mog tom5os ton4e ton5ea 3tonn ton3s top4e
to5pia to4pos t1or to5rad 4tore tor5er tori4as tor5oi tor5p tor4q 3tos.
to3s4p tos4t to5str to5talis to5taliz to3tem tot5u tou4f 5tour t3ous 4tov
to3war t3p tr2 tra4co 4tradd 4traist tra5q trarch4 tra5ven tra5vers trav5est
3tray 4tre. 4tred tre4mo tren4 trend5i tre5pr tres4s 4trew t5ricl 3tricu
t2rie tri5fli trifu5ga 2tril tri3li tri3me t2rit 4trix t4rod tro5f 5troop
tro4pha tro3sp t2rot t5roto tro1v 3troy t4ruc tru3i 2t4ry trys4 4t1s t2sc
ts4h ts2i t4sil tstay4 2t1t4 tta4 t3tab t5tan t5tas t3ted t4tere t5terer
t5test t3ti tti3tu ttitud4 ttitu5di t3tler t3tli t5toi t5tor t3tos tt5s
t4tupe t2ty 4tu. tu1a tu4al5li tuari4 tu4bin tu5bu tu5den tud5ie tu5en 4tuf
tu1i tu4is 2tum. 3tumi 4tums 3tun tun4a tu4ne tun5it tup5let tup5lic tu5rac
t4uran turb3a tur4d turf5i 5turit tur4n 5tur5o 1tut 4tut4iv t1w t3wa4 t2wi
twi5li t3wit t3wo twon4 4ty. ty4a 5tych ty4let tyl5i ty5mi 1typ 3type 1tyr1
2tz2 t5zia t5zie 2ua2 ua3ci u2ag ua5h u1al ua5lu uan4o uant5is uant5it uar3a
uar2d uar3i uari4n uar5ters uar4t5i ua5tern uba4 ub5bly u1b2i u4bicu ub3lin
ub5lo ub3ra 4uc u1c2a uccen5 u4cend u4ch u5chr uc3l u4com uco5t uc2tr uc3ub
uc5ul u5cum u5dac ud1al ud4e ud5ep u4der udev4 ud4g udi4cin ud3ied u5dinis
udi3o u5ditio u2do u5doi ud5on u5dor ueb4 u4ed uen4o uen4ter uer3a ues4s
uest5rat ues5tri ue4t uf2 3ufa u3fl u4fo uft4 uga4c ug5lif ug2ni u4go ug3ul
ug3ura uhem3 2ui2 ui3al u2ic uicent5 uid5o uil4a uild5er ui3lib uil4t uinc5u
uin4s uint4 uin4ta ui5pr uis3er uis4t uisti4 uit5er ui5val5 ui3vo u2iz 4ul.
u1la u4lab 4ulac ul5ard u5lat ul4bo ul3ca ul4ch 5ulche 5ulchre 4ulea u5lee
u1len4 4ulenci u5lent ulet4 ul4ev ul2fa ul2i ul4ia u3line ul3ing ul5ish
u5liti u5lity 4ull ul4lat ul4l5ib ul4lis ul4lit ul3m u1lo u5lom ulph3i
ulph3o ulp5ing ul4po 2uls ul3sif u1lu ul1v4 u1ma um3am umar4 u5mas um4bar.
um2bi umen4t u1mi u4mic u2m5if umi4fy umi5lia umin4ar u4mined u4m3ing u4mora
u4mos um2p um4pa ump3er ump5li umpt4 ump5te u1mu umu4lo un1 u4n3a4 un5ab
unabu4 un4ae un4as. un2ce un4dal un3ded unde4t undeter5m undi4c un4die un3do
un4dus u3n2er unho5li un2i u1nic un4ie un3in un4ine uni5p uni3so un3ist
uni1v un3iz unk5eri un5ket un3kn 2unn un4nag un5o un5r un3s4 un5sh un2ti
until4 unu4 un3us uo3de uodent4 u5oros u3os uo5tatio u1ou 2up u1pat u1pe
u5pee uper3 u1ph u5pid up3ing u4po u5pol u2pr upre4 u5quet u4r ur1a 4ura.
ura4ci 4urae ura2g 4uranti uras5 urb5ing ur2c urc3a ur5den. ur5deni ur5die
ur4du ur3ea ur5ee ur1er ur3ers ur1e2t ur3ett ur2f ur3fa ur1i u5ri5cu ur4ie.
ur5ifie uril4 ur4ili ur5ion uri4os. url5er ur5lie url5ing ur1m4 urn3al
urn3er urn5s ur1o uro4d ur5o4m ur5ot uroti4 urpen5t urph4 ur2s urs5al urs5er
ur3sh urs3or ur5ta ur1te ur5tes urth2 ur3the urti4 ur1u ur4va u3sad us3ag
us3al us4ap us3at 2usc us4can ush5a us5ian usil5 u4s1in usk5er us1p us4pa
uss4e 4ust us3tac us5tan ust4ic us5tici ust5ig ust3il us1to4 us1tr us4tre
usur4e us5uri u3tane utch4e ut5eni u5teo u4tere ut2i u3tie ut3ing u5tini
u3tio ut5ism ut3ist 5u5tiz ut3le utli4 ut2o u4to5s u4t1ra uts2 ut5sm ut4tone
u3tu u4tul uu4 uv2 u4va uve2 uven3 uv5eri u5vin ux2o uy4a uy5er 4va. 2v3ab
5vac va1ca va5ceo vacu1 v4ad 3vag3a va4ge 4vaged vager4 vag5r v1al. 1vale
vali2 va5lie val4ise 5valu 5val4v vam4i va5mo 5vann vanta4 4vantl var4is
4vase vas5el5 v5a4so vast3a v4at. 5vatee vat4ina 4vatu 2ve. vect4 ve3g 3vei
2vel vel3at 4vele v3eler ve5line v1ell v4ella vel5ler vel3li vel5opi ven4al
ven4do ve1ne ve5nia vent5o ven4tr 4venu v5en5ue 5ve3o 5verb verde5v 4v4ere4
ver5ea ver3ei v5erie ver3m4 ver4ne 5verse 4ves. 4vi. 5vialit vi4atr vi1b4
vic2 vi4ca vi5cari vice3r 5vict2 5vicu 5vider vign3 vi4l vil3i 3vili4a
v5ilise v5ilize vil5lin vim4 5vime 2v1in vin4ac 3vinci vin2e 5vinit v5iniz
vint4 vin5ta 3vi1o viol3 vi5om 5vi3p vire4 vi5rid vir3u 5visecti 5visio
v3ism 2v5ist vi2t vit2a vi3tal vi5tel v5itie vit1r vi3tu v3ity viv5al viv5or
vi5zo 1vo 2vo. vo2l vo5litio vol4ubi volv4 4von vo5rac 3vorc 4vore 3voro
vo3tar 2vow vr4 v5ra4 v5ri v5ro vrot4 4vs v3ure 2vv2 v5ver v5vi 4vy 4wab
wag3o wais4 w3al. wall5er w3als wan5gli wank5er war5ded ward5er ward5r war4f
war4te war5thi wass4 was4t wa1te wav4ine w1b4 w4bon w5c w5die w3dr we4b w4ed
3weed 5wei weight5i weir4 wel3i weliz4 wel4izi wel4li went4 wes4 west3
w5est. w5f wh2 w5hid wi2 wid4e wi5er will5in wim2p win2e wing5er win4tr
3w4ise with5eri w3la wl1er wl1i wl4ie w1m 1wo wol4 wol5ver 3wom won2t word5i
wotch4 woun4 wp5in wra4 ws5ing w5ster wt4 w5te w3to wy2 wz4 x1a x4ach x4ade
x2ag x3agg xa5met x3ami xan5d xano4 x2as xas5p x3c4 xcav3 xcor5 xe4 x1ec
xec3r xe5cutio xecut5o xe2d x5edl x5edn x5eg x1em x3en xen4op x3er xer4g
xer3o x1h xhort4a x1i x3ia. x4ias xi4c x5ige xim3a x4ime ximet4 x3io xi4p
x4it. x4its x1o x4ode x5om xo4mat xo4n x4os xotrop4 x3p xpel4 xpo5n2 xpoun4
x1s2 x1t2 x4ted xtens5o xter3i xter4m3 xtern3 x4th xti4 xtra5d xtra3v xtre4
xu4o x1ur xur4b x5us x5w xx4 xys4 xy3t y1a2 y5ac 1y2ar 3yard yas4i 4y1b yb2i
yca5m y5chede ych5is y3cho y4chose yc1l yclam4 y4coli y4coll ycom4 y2cos
y1d4 yda4 yder4 ydro5s y4drou y3ee yel5o y3en y1er y3est. yes5te y5ett y5f
y1g ygi2 ygi5a y3gl ygo4i y1h y1i y3in yle2 ylin5de yllab5i yl3os yl5ou
y1me4 y3men y5met y5mia ym5in ymot4 ym4pha yn1 ynago4 ynand5 yn5ap4 yn5ast
yn4ci ynd4 yn2e yn3er yng4 yn4gol yni4c yn4y y1o2 yo3d yo4gis youn4 young5
2yp yp5al yper3 y5pere y4peri y4pero y4pet y2ph yph4e yph3i y4p1i yp1n ypo1
y4pox y2pr yp5ri yp4si yp5syf ypt3a y5pu y3rag yr3at yr3ic y5rig yr3is
yr3i4t yr5olo yr4r yr4s yr5u 4y2s ys5ag ys5at y3s2c y3sh ys1ic ys3in ysi4o
yso5 ys4so ys1t ys4to y3u yv4 y3w yz5er yzy4 z1a1 2za. za4bi za2i z4as za4te
zd4 zeb4 ze4d zen4a z5eng zer5a z3et4 z1i zib5 5zic4 z2ie zi5m zin4c3i z3ing
zing5i z4is 3zlem z3ler z3li 4zo. 5zoa zo3an 3zoo2 zo3ol zo3on zo5op zo5oti
zo5p zot2 z5s 5zum 4zy. zz2 z3zar z5zas z3zie zzo3 z5zot
  PATTERNS

  lang.exceptions <<-EXCEPTIONS
% Do NOT make any alterations to this list! --- DW
uni-ver-sity uni-ver-sit-ies how-ever ma-nu-script ma-nu-scripts
re-ci-pro-city through-out some-thing
  EXCEPTIONS
end
