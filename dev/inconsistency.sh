TMPDIR=/tmp

if [[ $1 = "sl-sh" ]]; then

lt-expand ../apertium-sh-sl.sl.dix | grep -v '<prn><enc>' | grep -v 'REGEX' | grep -e ':>:' -e '\w:\w' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-sh-sl.sl-sh.t1x  ../sl-sh.t1x.bin  ../sl-sh.autobil.bin |
        apertium-interchunk ../apertium-sh-sl.sl-sh.t2x  ../sl-sh.t2x.bin |
        apertium-postchunk ../apertium-sh-sl.sl-sh.t3x  ../sl-sh.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../sl-sh.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $1 = "sh-sl" ]]; then

lt-expand ../apertium-sh-sl.sh.dix | grep -v '<prn><enc>' | grep -v 'REGEX' | grep -e ':>:' -e '\w:\w' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-sh-sl.sh-sl.t1x  ../sh-sl.t1x.bin  ../sh-sl.autobil.bin |
        apertium-interchunk ../apertium-sh-sl.sh-sl.t2x  ../sh-sl.t2x.bin |
        apertium-postchunk ../apertium-sh-sl.sh-sl.t3x  ../sh-sl.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../sh-sl.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "bash inconsistency.sh <direction>";
fi
