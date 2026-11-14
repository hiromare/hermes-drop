#!/system/bin/sh
T=/data/data/com.termux/files/usr/tmp
B=/data/data/com.termux/files/usr/bin
F=/sdcard/Download/Flud
P=$F/A.Game.About.Digging.A.Hole-ISO
D=$P/SetupUnpacked
echo TRY=$(date +%s) >>$T/ie2.log
echo V4MARK >>$T/ie2.log
$B/innoextract --output=$D --skip --overwrite --download=none --cache=$T $P/SETUP.exe >>$T/ie2.log 2>&1
echo E1=$? >>$T/ie2.log
$B/innoextract --version >>$T/ie2.log 2>&1
$B/innoextract --extract-only=data --output=$D $P/SETUP.exe >>$T/ie2.log 2>&1
echo E2=$? >>$T/ie2.log
du -m $D 2>/dev/null | tail -1 >>$T/ie2.log
find $D -maxdepth 3 2>/dev/null | head -12 >>$T/ie2.log
od -An -tx1 -j32768 -N64 $P/SETUP.bin >>$T/ie2.log 2>&1
tail -c 256 $P/SETUP.bin | od -An -tx1 >>$T/ie2.log
echo ALLDONE >>$T/ie2.log
