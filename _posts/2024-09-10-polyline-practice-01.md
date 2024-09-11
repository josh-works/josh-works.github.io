---
layout: post
title: Practicing with Polylines
published: true
description: "Getting reps with polylines"
date:  2025-09-04 06:00:00 -0700
categories: [data-visualization]
tags: [polylines, mobility_networks]
permalink: /polyline-practice-again
---

This is a first pass at trying to do something interesting (repeatedly) with the same base primative, in this case, a "polyline".

The polyline in question I got from Strava, after recording a scooter ride.

This post should be interesting to programmers and non-programmers alike. A polyline is a way of encoding a bunch of latitude/longitude pairs, so it can be drawn in detail on a map. 

Here's what the polyline looks like, raw:

<pre>
w_qqFxyt_SDJ?EAHBGAEABBC@FEB?G?BEDAH@JDHLBZC\FNHJ@J?^KPAPB
f@?r@BH@FDBJ?tADzA@bAEtEGrBApADn@DxC@zBBzACpA@hBDd@LZJHJBz
@Kl@BbCCXBf@G|@Ct@@rACfADDDzAEh@Dh@EfCAVBDBFTArCC`@BtA?x@C
p@En@FfBCrBD|AA|A@pGGX?tAKv@I|AEXDt@@pHGlJF|@@bAEvEF`DAtAF
jDCjBCJAADvA?fBBHCf@CNGLJZAnFMr@IL]^e@`@uC`B{@t@CAIFITAN?~
@RjDFBl@Cj@ETE\IXSXKnAcAh@WTGTAr@B`AV^@FBFHD`@@rCFRJHHBTBV
Cd@@jCGv@BDb@CxCFvGBNHH`@H~@@bCCpC@tBAjBBLN@P@|D@f@@HDBbBC
l@E`@DbACn@HJDL@t@GfBC`CBJF@PG|AD@LAD@DFFXFj@HTDDF?PEJF@DA
?E?BMA?@WCQ?BKBFABBG?MY?F?GC@AE@CE@AACb@B^AFIPMBaCEmAF}@?w
AE}@B}A@iBEICOQCYA}B@}@?_HDGJGzB@bBE^BBCNAPMDWCoAGEMJEX@DH
@ASGQECGFJHEICB@DKCDBEC?@?ABBCAB@CCBBECB?C@@EAD@GC?DPEA?CB
?A?M@?GLK?RADACA@ACE?FFEGBDBACICDAEBBCC@BAC@BAADBEEBFFFAE@
XESDDEG?HACB@@MBBC??B?A?BAAAP?K@L?KCFEAA@Fb@@IAJ@GM?BFHCEB
?@BEC@@?@FCA@EAF?C??CAFEEFB_@EKBEAACBHE?^D[GX@MFOAG@DCEDW@
??HLCBCCIEAU?KJG@CCSCuBCa@Gc@Fe@CEGEw@E]BIDa@CIi@BOGIAKGWD
KC@HIDg@AED]AWEC??BIA]Ie@BCAGQMGA@@@@A?DMBCBKBM?Ie@?CCEF?G
M@DCC@@AEBFCADFAAE?BCDD?EAAB@AFDEA@?CAFAC?@EEA@?CBCBBCPCF?
FLN?RNJP@DBVCR?F@BZA`BBD`@CHDLIVABD\?DBXB^Of@AZJJALEb@E@CX
DJATJFABE^FXE?BPBV@RC@Bf@CJDX@HRD@?KAABDCBACHC?CHNG?CDEEBD
BCC?KN[QE@ENH@JJAN@JDFABECB??C?BAM@LAe@EGBOEKDEL@?DBABCAQC
H@B?CIDBA?DABF??@B@IADQHE@@Pa@@U?{AD[CYCaBBgAGyA?oA@g@ASCG
GC]?e@C{CBs@CECCDsA@sBEaA@a@D[A[D}BAs@DoBAs@GcDRU?c@Ag@EII
EO?iAFm@@k@GcBFqDGs@WeAG{@@qBC}A@sAGgABu@Ay@BOCq@FYImCAwBC
OGIQIgBAmAGq@ACCEKASBaBEqAB_@DI@??HCW?mBCk@@_@Aw@@MGqDDiAE
eAAmCBgBCq@?SLc@Fc@Bs@HK@GGmAAyABcFDgBCg@?UG_@DmB?iEBQBIGo
AAsKCgAF{ACSAoB@eAES?IHMAQBEIs@Cq@D{CCoDC]IEmCiABiAAGCCGCA
kAJwBEgCLyAAsBDg@Ai@@KKDBBCGCBDIDGGEOA{@CKGCIHMFY?QE]DMKEI
?uAFGCMKICKIAKBa@RI?UQG?MDEAKBCMCC@BBC@U?B?AIMHK?MC@@@BA?@
?A?EIMC??CAAKJ@RIFA?AEJFSKK?UIQBACBEBA?`@JAFBHLLFA?F?IIKAJ
HE??@@?CCF?MGCJJGLBOBFAF@UAKET@FCMB@CYBMEB?AABERFC@@AFF 
</pre>

And, converted to lat/long pairs, this makes 757 points, here's the first few:

```
39.74156,-104.96941
39.74153,-104.96947
39.74153,-104.96944
39.74154,-104.96949
39.74152,-104.96945
39.74153,-104.96942
39.74154,-104.96944
39.74152,-104.96942
39.74151,-104.96946
39.74154,-104.96948
```



One can pop it into [Google's polyline decoding utility](https://developers.google.com/maps/documentation/routes/polylinedecoder) to see it rendered. Here's what it looks like:

![polyline](/images/polyline-decoder.jpg)

Now, lets do something interactive, close to what google is doing there under the hood. 

I've used Leaflet before, and mapbox, a little, so I'm going to start with those. 

Lets rander a bare map, but open it up to about where the polyline will go. I'm sorta writing this blog post top down. Lets add a map, and initialize it.

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

<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script type="text/javascript" src="https://rawgit.com/jieter/Leaflet.encoded/master/Polyline.encoded.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />

<div id="map1"></div>

<style>
    #map1 { height: 250px; }

    #map2 { height: 400px; } 
</style>

There we go! It worked! A basic map. Pinch and zoom and pan. Cool, huh? Lets add the polyline next. We'll assign to to a variable, and ask Leaflet to decode it and add it to the map.



<div id="map2"></div>

<script>

     var map1 = L.map('map1').setView([39.742043, -104.991531], 13);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map1);

    var map2 = L.map('map2').setView([39.742043, -104.991531], 13);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map2);



    var line = 'w_qqFxyt_SDJ?EAHBGAEABBC@FEB?G?BEDAH@JDHLBZC\FNHJ@J?^KPAPBf@?r@BH@FDBJ?tADzA@bAEtEGrBApADn@DxC@zBBzACpA@hBDd@LZJHJBz@Kl@BbCCXBf@G|@Ct@@rACfADDDzAEh@Dh@EfCAVBDBFTArCC`@BtA?x@Cp@En@FfBCrBD|AA|A@pGGX?tAKv@I|AEXDt@@pHGlJF|@@bAEvEF`DAtAFjDCjBCJAADvA?fBBHCf@CNGLJZAnFMr@IL]^e@`@uC`B{@t@CAIFITAN?~@RjDFBl@CpABj@ETE\IXSXKnAcAh@WTGTAr@B`AV^@FBFHD`@@rCFRJHHBTBVCd@@jCGv@BDb@CxCFvGBNHH`@H~@@bCCpC@tBAjBBLN@P@|D@f@@HDBbBCl@E`@DbACn@HJDL@t@GfBC`CBJF@PG|AD@LAD@DFFXFj@HTDDF?PEJF@DA?E?BMA?@WCQ?BKBFABBG?MY?F?GC@AE@CE@AACb@B^AFIPMBaCEmAF}@?wAE}@B}A@iBEICOQCYA}B@}@?_HDGJGzB@bBE^BBCNAPMDWCoAGEMJEX@DH@ASGQECGFJHEICB@DKCDBEC?@?ABBCAB@CCBBECB?C@@EAD@GC?DPEA?CB?A?M@?GLK?RADACA@ACE?FFEGBDBACICDAEBBCC@BAC@BAADBEEBFFFAE@XESDDEG?HACB@@MBBC??B?A?BAAAP?K@L?KCFEAA@Fb@@IAJ@GM?BFHCEB?@BEC@@?@FCA@EAF?C??CAFEEFB_@EKBEAACBHE?^D[GX@MFOAG@DCEDW@??HLCBCCIEAU?KJG@CCSCuBCa@Gc@Fe@CEGEw@E]BIDa@CIi@BOGIAKGWDKC@HIDg@AED]AWEC??BIA]Ie@BCAGQMGA@@@@A?DMBCBKBM?Ie@?CCEF?GM@DCC@@AEBFCADFAAE?BCDD?EAAB@AFDEA@?CAFAC?@EEA@?CBCBBCPCF?FLN?RNJP@DBVCR?F@BZA`BBD`@CHDLIVABD\?DBXB^Of@AZJJALEb@E@CXDJATJFABE^FXE?BPBV@RC@Bf@CJDX@HRD@?KAABDCBACHC?CHNG?CDEEBDBCC?KN[QE@ENH@JJAN@JDFABECB??C?BAM@LAe@EGBOEKDEL@?DBABCAQCH@B?CIDBA?DABF??@B@IADQHE@@Pa@@U?{AD[CYCaBBgAGyA?oA@g@ASCGGC]?e@C{CBs@CECCDsA@sBEaA@a@D[A[D}BAs@DoBAs@GcDRU?c@Ag@EIIEO?iAFm@@k@GcBFqDGs@WeAG{@@qBC}A@sAGgABu@Ay@BOCq@FYImCAwBCOGIQIgBAmAGq@ACCEKASBaBEqAB_@DI@??HCW?mBCk@@_@Aw@@MGqDDiAEeAAmCBgBCq@?SLc@Fc@Bs@HK@GGmAAyABcFDgBCg@?UG_@DmB?iEBQBIGoAAsKCgAF{ACSAoB@eAES?IHMAQBEIs@Cq@D{CCoDC]IEmC?iABiAAGCCGCAkAJwBEgCLyAAsBDg@Ai@@KKDBBCGCBDIDGGEOA{@CKGCIHMFY?QE]DMKEI?uAFGCMKICKIAKBa@RI?UQG?MDEAKBCMCC@BBC@U?B?AIMHK?MC@@@BA?@?A?EIMC??CAAKJ@RIFA?AEJFSKK?UIQBACBEBA?`@JAFBHLLFA?F?IIKAJHE??@@?CCF?MGCJJGLBOBFAF@UAKET@FCMB@CYBMEB?AABERFC@@AFF'
    
    var polyline = L.Polyline(line)
 
</script>

Er, lets do it again, now with a poly line on it.

Next time, might animate a marker moving along the line, something like [https://github.com/openplans/Leaflet.AnimatedMarker?tab=readme-ov-file](https://github.com/openplans/Leaflet.AnimatedMarker?tab=readme-ov-file)

