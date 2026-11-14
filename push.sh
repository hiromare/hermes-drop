#!/system/bin/sh
T=/data/data/com.termux/files/usr/tmp
B=/data/data/com.termux/files/usr/bin
F=/sdcard/Download/Flud
P=$F/A.Game.About.Digging.A.Hole-ISO
D=$P/SetupUnpacked
mkdir -p $D
rm -f $F/innoextract-win.zip
$B/innoextract -vv --set-extract=skip --output=$D --language=en $P/SETUP.exe >$T/ie.log 2>&1
echo IECRC=$? >>$T/ie.log
if grep -q 'not an Inno' $T/ie.log; then
  od -An -tx1 -N96 $P/SETUP.bin >$T/hex.bin.log 2>&1
  od -An -tx1 -j262144 -N96 $P/SETUP.bin >$T/hex.bin2.log 2>&1
  strings -a -n8 $P/SETUP.exe 2>/dev/null | grep -m8 -iE 'gog|setup|version' >>$T/ie.log
fi
du -m $D 2>/dev/null | tail -1 >>$T/ie.log
find $D -maxdepth 3 2>/dev/null | head -10 >>$T/ie.log
echo ALLDONE >>$T/ie.log
