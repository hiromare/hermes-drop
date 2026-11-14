#!/system/bin/sh
T=/data/data/com.termux/files/usr/tmp
B=/data/data/com.termux/files/usr/bin
F=/sdcard/Download/Flud
P=$F/A.Game.About.Digging.A.Hole-ISO
D=$P/SetupUnpacked
mkdir -p $D
rm -f $F/innoextract-win.zip
$B/innoextract --extract --output=$D --skip --overwrite --language=en $P/SETUP.exe >$T/ie.log 2>&1
echo IECRC=$? >>$T/ie.log
if grep -qiE 'not an Inno|error' $T/ie.log; then
  od -An -tx1 -N64 $P/SETUP.bin >$T/hex.bin.log 2>&1
  strings -a -n6 $P/SETUP.exe 2>/dev/null | grep -m10 -iE 'gog|innosetup|irfunut' >>$T/ie.log
  tail -4 $T/hex.bin.log >>$T/ie.log
fi
du -m $D 2>/dev/null | tail -1 >>$T/ie.log
find $D -maxdepth 3 2>/dev/null | head -10 >>$T/ie.log
echo ALLDONE >>$T/ie.log
