#!/system/bin/sh
T=/data/data/com.termux/files/usr/tmp
B=/data/data/com.termux/files/usr/bin
F=/sdcard/Download/Flud
P=$F/A.Game.About.Digging.A.Hole-ISO
D=$P/SetupUnpacked
$B/pkg install -y unrar innoextract >$T/pi.log 2>&1
echo PI=$? >>$T/pi.log
curl -fsS --max-time 300 -o $F/innoextract-win.zip https://github.com/sffxzzp/innoextract-build/releases/download/6e9e34e/innoextract.zip >>$T/pi.log 2>&1
echo IEXRC=$? >>$T/pi.log
$B/unrar l -p1198 $P/SETUP.bin >$T/rl.log 2>&1
echo LRC=$? >>$T/rl.log
$B/innoextract -e -d $D --overwrite $P/SETUP.exe >$T/ie.log 2>&1
echo IECRC=$? >>$T/ie.log
du -m $D 2>/dev/null | tail -1 >>$T/ie.log
find $D -maxdepth 3 2>/dev/null | head -10 >>$T/ie.log
echo ALLDONE >>$T/ie.log
