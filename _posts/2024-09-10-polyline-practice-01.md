---
layout: post
title: Practicing with Polylines
published: true
description: "Getting Reps with polylines"
date:  2025-09-10 06:00:00 -0700
categories: [data-visualization]
tags: [polylines, mobility_networks]
permalink: /polyline-practice-again
---

This is a first pass at trying to do something interesting (repeatedly) with the same base primative, in this case, a "polyline". Read the rest of this post, understand what we're going for, then go to [part 2: get your own polyline from strava]({{ site.baseurl  }}{% link _posts/2024-09-16-polyline-practice-02-re-up-strava-auth.md %}). It's not trivial to get, but its interesting data, and you'll have an abundance of polylines, if you want them. 


The polyline in question I got from Strava, after recording a scooter ride.

This post should be interesting to programmers and non-programmers alike. A polyline is a way of encoding a bunch of latitude/longitude pairs, so it can be drawn in detail on a map. 

Here's what the polyline looks like, raw:

<pre>
u}pqFttt_S@NFNB?JA@@DIH@@CEEBAPAFBHK@@FEf@??FLEPA\?LD@CECDI?BBEH?DHLCT@BLBtB?@FADDDMADC@BJEIBAEMA@AC?HKACDDAHQEMA{@?e@BCR@FBJ?DBJAHB`@AF@LAHE~@?FEJLVC\?DNBA@BFBBAPMJAP@NCBE?CIO@Cn@Fl@Cj@BDEDBFALDN?^?HILCRHNAVD~@?XKz@k@HSBWHKVOD?b@VJBHA?KCQBi@n@Sp@e@`AMHIJDZB^?\KPKVYLq@f@i@Nm@L}@Cg@Q_AMWDH?CUa@g@YCEBGJQ`@]Eu@AA?HAG?f@CFSZITDHXXJPN`@BBAU}@s@_A][EEBAA?OEA}@JQL@F?EMAKLKBEFPd@Ma@QBA?D@EHKBKJKDILEGHe@@WAAEA@BBCADD@ABCK@UCW@IRO\GDGLABBF?TGD@TI^GX?@EDBJCNBFCLDHJLMBBBCL@NFDC@MH?JN@X@BD?NIJBh@SZ@HK@BVA@CDALDHHRAHBZBFEBYFO?MBSAECHDPANOIOC?CJIFDFB@DDEEA?DC?B@ALLKADACADC@AC@@GBAA?ECBARDPBKEHDA?IEA@@?C@F@AB?@FCKAF@D?C@@EC@A?BCC?E@P?CCB?GFAGB@CAA?BC?D??D@K?AAB@@AAC@@EDACD?CBBABCA@CADACB@CAC_@@UCKAABGAUAEICAEBa@FU@_@@ED?^BDA@IEQ?k@FCF?DBBGEOCWCAMAG]EAKBADGECECa@Bk@Dc@EaBDQE?CGD_@PIH@LHD?@BIFEEOAf@CDAAI@DBEF@IC?B?CFFDBBFF@LC@ICEQE?B?M@LCAD?EDAC@A@DA@FKACGCFBABCAEIHDB??DCABB@AEGDFEABFAC?CABECJHGBDXXPD`@L@HBDZ@NAJC@O?DOD@CM@BBABNAHEBI?GEKAM?QDDCL?RBJ?HIBKISR@CHBACBECDDG@BB?C@FCGKrC@\?BCABB@\?d@@@?C@H@AC?CF?\GFK?G@EA?CG?gABQFCFCn@Ft@JDT?BFBKNBEGGE?EGAMD@EJQBBFIJGB?@FAFC@B@ABHQ@BMN?H?KCA@@@A@@ABAAHEA?@B@GDCI@?BAEABCA?CB?CBBHGCB?CCBFC?@E?@BC?BCD@CC?BAA@?E@?@AC@AF@??C@G@LEEWFD??FHALD@DGF]CMR@SCAABDADDC@AEED@ADABDCBEA?@?CDAEB?NCCBEABBBDPXJFFDGJ?RGBEB@\R^LHJJ@d@Kb@E^MD?@@C@@IABDEDBj@?~@GNBJANDr@?TDXNNPPd@Fz@Gz@?f@BZAVBb@Cf@@HELG@?EDB@ADHBrBDz@KpA?~@Kv@a@|@_@Va@`@G?KES[KGKWGEa@CQEBDk@CYBKDc@XSAODUA]DSC[Bk@Ck@BUAUDIAAAUFQIYCIMK]MAODEDAGDBC?CIBUECE@DEACCFD@ACADE@AEFFGMFA?@IAI@AGBMCE@HBBKBG?DCDKLCG@@IBA@MZWA@?CGGCAAGKUAK@MCKIGM_@IA@KDEC?CHAAAD@BB?CA?B@CHJADBBCCC@CNGFBHJJMCC@DT?F?AF@FH?HGXBTFNKPFAAAG@CD?E@DH@@EAIDD?ACCFDDLGB?FELAAC?CMA?BJBMEKA?@A?DJHE?CCCFCAJED@ACA@@EHXFC?EEACKFQ?EEAM@AFC@L?LUHXD?ABCCCFAC@B@GKG?KOUAKKIq@RCD@DHB?@CBVUPo@D?A?BDNQCS@GDQHMCHDIJq@HMBMDI@KC??DBCH?EO?CBACKL_@HI?KCXICJMFS?GGCID@PPQA@GEE?HDHKHC^DBABGLENA@CFe@CMCk@CACD@BCAEIBMB@BGHCB@EM?KBI\CNBPYEGGB?MCCCLG?@CCHG@EE@CFA?DSFAJBEEDBXCF?V??@E@MFCOi@?KDCB@?FIB?BB`@CN?ADDHY@a@AAADEBAD@HFEC?@CEA@EB@AG@BPEJ@CGOGQ\AIDCA@EYBMFKH?E^BXAHAAGQFB@ACC?HHIDKC?@BDGB?@FGDE?CKCDAG?FHUYEIDBRHBDF?C?DAGBO?KD[KUEBIABDE@WAIBF?M?ADDv@D@FE?FHGJBBH?RDD@MGOGG?IB@C@@ABF@LHLJBFABKCIBJE@@BG@IJO@?BB?CDB\DVCDCME?@L@FAB?IFL@J?NEL@X?CCPCAADKAEBWOIBO?a@OG?OQQGG@ML@LEJCZ@@AD@AGJI`@EFCABA@BCH?CMJOBENIp@CDAHEDAAIDMH@@I@?B@AJF@PEFQDC?@@D?WHYRo@R?DQDKRQJG?UFIAm@HOEACDBABE??FIE@AJABKOJGNKACFFdBADG@@BEAZAp@KdCCRG@?AB@CDHLA^Dv@Gd@BNEDUJUBQDID?Ae@C?IBECCC@FGPDTKBIKVy@?UFQF]GMKK[QMAOFYVE?OHO@ULSRGBSb@^r@RXJDXD^ALBhAEDWCI?SC?EBCJ?JDEE@B@BCACC??BDEB@C@FC@CM@GFAABBNKFK@@G?KBIL@@XMDIGH@@BA?OMGMFGFYh@CNAAAEADIDIGSA[HUCGEQ_@_@Y_@q@c@NEDUD]LI?MC}@@e@GUAGDEXUXg@Xa@NGFc@AOBY?k@Ig@Fq@A]DCDc@AY@GGQD_@@GLC@eA@OCqCG}@HO?ICc@DYGMBEEM?MLSE_@?SDm@EO?IDGEG?KFFl@?n@K@QC]@OAKFAFFh@I\?HDBTCBCEAE@@F@B?Da@PJEKAACDAVWd@[??ALBFNIWHDA@FFA?GGABICC?@s@FSAj@@J@BFCEQCs@DLGH?GBF?C@F?EAB?C?BACAC@?CCBBDHBFAOABA?ACASDH?BBFA@CBBH?KGM@HAMABDF@ICB?EEDDC@?AFAGAB?AAC?D?AB@AO@JDcCP|BWF?DFCGAB@EDLEKFD?@IGF?ED?CAAFHAEA@ACCFECC@?CIDBEGGABBBJAH@@CSDREBMGJB@CAB@AAABBBCGABB??BCBUJFKB@C?CCTIYDEFFEZAICWJAKD@HEF@AB?EDDAHHKCGOJ?BHCENNM@EA?AAD?C@?C?D?E?B@AA??A?DH??BKC@C@DCE@D?EBBCCM@F?AAFBAA@?C@@BA?BCA?@??CA@@AA?@@?A?@@AA?@?CA@BGEI@ABR?KHB?ACF?CIFWIFADB?JEKHDDECDE@HIDFA?MABD?GNEDNQCC@@GDE?BAFA?BD?MBCBBAAAFKA@@FAA@C@BCBI@DEBAABB?@AAE?BC?@EB@GADD?@AA@BGSFRAA@A?H@AAECJEFFE@M?H@AAI@BDAG?@@AC?@CABB?A@?A@@EC??CC?F?CJB?CACB@?E?AGFECBEEHB@FABACJ@BCC@KKC@BGF@A@ACDFAF@DAI?@E@DGDA?@CBCAADBG?BAAAFEAF@AAEBB@?EC@P@BBI@EKBKC?AHBFCK?DBBHAGAADO@H??BD?C?@ADBCGD@YJXAIKBA?EGFBG?B@CA@AC?BC@CCDC?ADAEJB@ACC@B@CBN?EC?BGD?FBEI@B?@IM@G?NIH?DDIIHD?EAD?ICBIAHACDBBA?H@EBLAO?BAG?BCC@B@GED?ABFB?D@CEADEM?AABCDDKAL?CBBA@FEC?CI?B?A??EB@EALBABBC?BE@DAA?@@A@BAD?E@D?WDF?FE?BEAFBCABAA@ECDBCEEDB?ACD?ABDAIBD@AABAC?BAI@F?AGC??@DAC@DDA@BCCBE?AIH@@J@AADB@?KE?DFC?EEKCD?ADD@AA@AD?E@BAGCL?G?A@@ABBE?@EIAL@AB@BAG@@CAF@O?@@C?@@DA?CC@B?C?@A@?CB?EB?CAD?SAh@FK?MCMBF@?@B??EBCD?OABCNBKB?BH??CL@Q?@E@FC@HBI?AAE?HAAAGBFB?DB@GCBCEAH@G?B@CBDCA?BAAA??G@FA?CC@BAGAIBT@QBl@GKAO@B?A?F@UBD@BAI?FMCNBOEHDEKDJIMDFBWDTBDC@GAAB?ECF@EF@GCJBMCF@EAHACF@HCG?F@K?@DE?BMFDCAACUBRACBN@QDDACGBAI?H?C@B@?I[JH?A@NCKCS?P@VE@@@J[MJ?HFEDYAN?@E@@FCL?FCK?QBJ@O@b@@MIM@LDICJE@KA@@@AFG@DFE@@@E?AE@?CCBAI?FJF?E??ICEF?C??HCABC@F@CC??CE@FAAE?D@AC?@@F?G@@DC?AE@@?@@AGAH@A??C@?A?CBFEIB@?CED@AECHB?C?FCCAB?AB?CA?@@ADCARAG?BBIAD@A?DEIFFCG@BEB?E@?AEHDE?ECB?DBAG?DAA@B@@AEA?C@BEDD?@E?BBAAC?BC?AED@GDDE?BBC?BGCLGM@A?FACHEEBAE?D@A@D?A@?CD?M@F?A@HBCA@GCB?CC@D@C?@@A?@B?ADCICCDD@@CBHOAJAAAB?@EG@FNAA?EEAA@BCC?FACEB@E@BAAE?FCBJEC@B@SBLD?CEADDDCI?BA?CCA@??B@CB??BCB@AAAB@CAB?C@@CB@C@B?I?@?@BGAJIE?DEEAHFE@A?BCE@J?CAD?A?@AG?@@ECHDOB?BHDCA?G@?A@FAG@?@D@KJDEACBABC@@C?@BEAD@?@CABB@CK?HCKDB?A@BEB??@CABAAAEDHAGADA?CC@@@C?EB@?AABB@C@@C?BAAAJ@C?EADAEAA?F@EAD?IDDAEAD@A?@?@AE@BA?@C@B@ABEABCCADACBG?J?B?CA@?C?ACD@BAC@@ACA@BC?ECB@C@D@C@DAEAF?@@A@EA@CB@E?FAIDECE?ABCA@ANDBAEAD@CC@CC?D?E?EDNBC@@B?EEA?@B?G?DAADAA@CHA@@E?ABCABAA?DB?@CC@CBBE@D@CADAEA@EA?@@A@@HI@DIA??ED??BC@@CCABEACGDC?@A@BH@?DC@JBECDCGCBCG@IA@?C@@@BAACD?BCEABABBAHLB?GC@?FQCFA?ARFEBD?OAFACDCA@CG@F@C?CE@A?BD?C@AAH?@CK@D@FAACBA?CEBB@@AQADACDG?L?ACA?DBCFDBABJ?KEEEI@HADB@AACG@B?@@A?BAAANCB@E?AFE@B@E?JCCB@@CA@C@?A?BAAC@?I@?DI@BB@CCA@EEE@@?F@A?B@A?BDA?CA?@AK@B?DIE@BFB?EBBAC?D?BA?ACAB?C@D?@D?ICACBHDGDEAEGG?T@GI@?C@CAABF@DCE?D?A?@@C?D@BA@?A@C?@BE?BBA??@B@ACB@EA@AD@KAPBKE@??@C?DACCB@C??@DBEADDEA@BA@B?G?CCD?C@@CBAGCBAI@?BF@AC@@A@@AEAAEC?DBA??AA@D?BKOAPBM@LBC?D?K@L@C?@B@?CCJ?ICE@FAGAJ@O?@AC?BA@BF@M?AGCCD?OCA@DBNDEAAJ@A@BAEDBIGDA@@E?BDCEAD?AD?CA@ADFAGA?B@QMLFBBA@?AEBACHAG@@??B@C@@C@BB@CEB@EC?DABFEC?@@ACE?BACIAB??BAADCAC?BC@B@?@E@F?@@CEDAA@?CIAJ@A@E@J?K?D?C?PFMAFDJ@ECFA?AQMOH@?AE@BDAA?B@FCADB@C@A@?CBC@@GA@AABBCDDC@B?ACQ?H@?BC@E?PEAABAC?ABCCBECDHFMBBEK@C@@BPGD@Q@AF@@BCLSDAA?@@KBB?CD@AGBJAQ@DCRAI@CE@@GBD??EDAJDCFYCGCCBLCCC@BHAC@B?A@DECBB@CA@AAB@CA@B?AAABBA?@AA?@W@NCC?@?EFa@DFIAA`@??GPCEBBDCACBBAA?@?ACABB@?GCDB@C?@AF?M@BA@D?CC@HCCB@?AC@C?@BAI@DCMCE@BLB??FC@BCCQPGJ?EFMD@HFGCAF@MD?ABCH?S?@DDDBAG@@G@??EC@CAB??BFI@?EDE@@FFS@BCDG?CDCCJD?DCA@CCGBCDBCA?B@ELDCEHBGA?@D?EAEDBCAAC@?BEBMEREB@KDBCF?C@DCC?AE@DDGG?KFGALCB@AB?AB?G?F@ZGKAYHVGB?ODEAAJD@?FB@BCACEC@CABE?@CC?IMFVL??IE??@AA?@?EC?B??D?E?@@A?BCC@FBDAE?DB?GK@??@?AAA?B?C@?@NDCCFBEFEEGM??BD@A@E?FCMCE?J?@BBCI@HCD@I?ABD@?C?BCAF@M?ABBBFAAA@BBAC@?EBBCAIBBKDACA?@E?BBAEEDICNBO??CD?BBGBB@F@CCBCG?B?ADFFBCC@BI@@CCDDI@@ACAAGQFJADBDGB@ECC@PFGDIATCE@ICBCD@AAE?C@@@C?AAHAIILAJDQ@A?FBABQ@?DC?LA@KC@B?@?ACBAE?ABB@KBB?CAPAE?@AGAH@C@?DB?ACFAAEK?J@M?GBD?ADBAABHACEBAFDK@D@O@EC@AECHCJ@C?D?ACDAGFDB?ACCGB@@M?b@?I@DFD@?ED@CCH@Q@EA?A@@C@QESH?IJ?VEDIDCYBTGUJLADDCGBFA??DAEBECGCBHDJ@I?Gn@?YH?CEEBEA?ADAEFE@AAFEB?BFCFGHECEO@GNGCEGBC?FKJD@HDBV@HIKAOFIC?BHBBAI?DCACKGE@?@FBEFAKKMHAK?R?SCNB?BHNADB?BFFBD?c@GHEBEA@QAMBF?\JAEG@@CH?BEMAHIEBCK?BD@GTBDGGJGGBBC@??EFHYAHAA@BBPD?EKE?@ACB@CBBCA?@??CAB@@@AEA@?AB?CBBAC@DEABBC@BAA??GDDAB@GC??@?CCDBEBB?DCI@B?CABAC@@A?@??AAB@C?D?E?B@CA@B@C??A?@BAA??DC@@CC?BE
</pre>

That string is suuuuper long. The only way to get it on your clipboard is to _tripple_ click it, highlight the whole thing, `ctrl-c`. You could then paste it into this polyline decoder:
[](https://www.daftlogic.com/projects-convert-encoded-polyline-to-latitude-longitude-list.htm), and see all 3321 lat long points. Here's a snippet of what some of it might look like:

_update, using a different polyline than what I started this whole thing off with - it was maybe giving me issues._

```
39.72873,-105.00070
39.72877,-105.00071
39.72882,-105.00062
39.72894,-105.00062
39.72898,-105.00060
39.72904,-105.00051
39.72904,-105.00040
39.72908,-105.00035
39.72925,-105.00034
39.72929,-105.00030
39.72930,-105.00024
39.72932,-105.00038
39.72933,-105.00039
39.72951,-105.00032
39.72967,-105.00032
39.72971,-105.00027
39.72979,-105.00020
39.72992,-105.00015
39.72999,-105.00005
39.73016,-105.00005
39.73020,-105.00004
39.73031,-105.00007
39.73039,-105.00006
39.73043,-105.00002
39.73043,-104.99993
39.73040,-104.99989
39.73032,-104.99991
39.73033,-104.99996
39.73024,-105.00000
39.73018,-105.00000
39.73016,-104.99998
39.73023,-104.99993
39.73037,-104.99995
39.73037,-104.99992
39.73036,-104.99997
39.73033,-104.99999
39.73032,-105.00005
39.73030,-104.99999
39.73027,-105.00000
39.73029,-105.00001
39.73028,-105.00000
39.73029,-104.99998
39.73032,-104.99993

```
Those lat/long pairs are not super useful to look at, so to make a polyline 'useful'/viewable, you need a map.

One can pop the polyline into [Google's polyline decoding utility](https://developers.google.com/maps/documentation/routes/polylinedecoder) to see it rendered. Here's what the original polyline I was working with looks like. 

![polyline](/images/polyline-decoder.jpg)

If you plot the polyline above (triple-click, ctrl-c, paste) you might see activity data from Denver, I went on a multi-hour walk with my kid through the local park and botanic gardens. More about those later. 

If you _don't_ see that data, maybe there's some issues with the copying and pasting. 

Now, lets do something interactive, close to what google is doing there under the hood. 

I've used Leaflet before, and mapbox, a little, so I'm going to start with those. 

Lets render a bare map, but open it up to about where the polyline will go. I'm sorta writing this blog post top down. Lets add a map, and initialize it.

Following the [Leaflet quick start](https://leafletjs.com/examples/quick-start/) docs.

We sourced there css, then JS, then added a div for a map, did a tiny bit of styling, and minimum JS. Telling the map to open on Denver's approx lat/long.

```html
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
     integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
     crossorigin=""/>
<!-- Make sure you put this AFTER Leaflet's CSS -->
 <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
     integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
     crossorigin=""></script>

<div id="map"></div>

<style>
    #map { height: 180px; }
</style>

<script>
    var map = L.map('map').setView([39.742043, -104.991531], 13);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);)
```

And here's what that renders:

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
     integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
     crossorigin=""/>
<!-- Make sure you put this AFTER Leaflet's CSS -->
 <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
     integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
     crossorigin=""></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />

<div id="map1"></div>

<style>
    #map1 { height: 250px; }

    #map2 { height: 400px; } 
</style>

There we go! It worked! A basic map. Pinch and zoom and pan. Cool, huh? Lets add the polyline next. We'll assign to to a variable, and ask Leaflet to decode it and add it to the map.

_edit, that was really hard, what you're about to see is a much smaller version of what I'd planned to do. It's just a tiny fraction of the whole polyline, arbitrarily cut off at one end. I'll explain what I did below._

_bleh, I didn't even get the polyline directly encoded/decoded, I had to do an interstitial bit where I was working directly with lat/long pairs, as retreived from the decoder. Dang. I'm _



<div id="map2"></div>

<script>

     var map1 = L.map('map1').setView([39.742043, -104.991531], 13);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map1);

    var map2 = L.map('map2').setView([39.736532, -104.977459], 18);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 23,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map2);

    
    var latLngs = [
[39.72873,-105.00070],
[39.72877,-105.00071],
[39.72882,-105.00062],
[39.72894,-105.00062],
[39.72898,-105.00060],
[39.72904,-105.00051],
[39.72904,-105.00040],
[39.72908,-105.00035],
[39.72925,-105.00034],
[39.72929,-105.00030],
[39.72930,-105.00024],
[39.72932,-105.00038],
[39.72933,-105.00039],
[39.72951,-105.00032],
[39.72967,-105.00032],
[39.72971,-105.00027],
[39.72979,-105.00020],
[39.72992,-105.00015],
[39.72999,-105.00005],
[39.73016,-105.00005],
[39.73020,-105.00004],
[39.73031,-105.00007],
[39.73039,-105.00006],
[39.73043,-105.00002],
[39.73043,-104.99993],
[39.73040,-104.99989],
[39.73032,-104.99991],
[39.73033,-104.99996],
[39.73024,-105.00000],
[39.73018,-105.00000],
[39.73016,-104.99998],
[39.73023,-104.99993],
[39.73037,-104.99995],
[39.73037,-104.99992],
[39.73036,-104.99997],
[39.73033,-104.99999],
[39.73032,-105.00005],
[39.73030,-104.99999],
[39.73027,-105.00000],
[39.73029,-105.00001],
[39.73028,-105.00000],
[39.73029,-104.99998],
[39.73032,-104.99993]
]

var polyline = L.polyline(latLngs, {color: 'red'})
polyline.addTo(map2);

map2.panTo(new L.LatLng(39.73032,-104.99993), 25);

 
</script>

Here's what I did:

```javascript
var map2 = L.map('map2').setView([39.736532, -104.977459], 17);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
maxZoom: 23,
attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map2);

var latLngs = [
    [39.72873,-105.00070],
    [39.72877,-105.00071],
    [39.72882,-105.00062],
    // [lots more coordinate pairs here]
    [39.73032,-104.99993]
]

var polyline = L.polyline(latLngs, {color: 'red'})
polyline.addTo(map2);

map2.panTo(new L.LatLng(39.73032,-104.99993), 23);
```
I wasn't actually able to get the whole polyline decoded into lat/long coords, to make the issue smaller I used an [online tool](https://www.daftlogic.com/projects-convert-encoded-polyline-to-latitude-longitude-list.htm) to paste the polyline in and get the coords back, then handled it as an array in javascript directly.

It was super janky, but works. 

I realized I wasn't sure if the polyline was working right - on this map, after panning and zooming to the last given coord, the whole line was bottomed out at like the 0/0 position of the map. 

Soooo now it works.

Next time, might animate a marker moving along the line, something like [https://github.com/openplans/Leaflet.AnimatedMarker?tab=readme-ov-file](https://github.com/openplans/Leaflet.AnimatedMarker?tab=readme-ov-file), or maybe make the line blink, or see if we can give a sense of which direction the movement was happening in. 
