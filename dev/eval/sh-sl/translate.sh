# Generate the translation
cat ../story1_hr.txt | apertium -d ../../../ sh-sl > story1.sh-sl.txt

# Generate the analyses, chunker, interchunk and postchunk
cat ../story1_hr.txt | apertium -d ../../../ sh-sl-morph > story1.sh-sl-morph.txt
cat ../story1_hr.txt | apertium -d ../../../ sh-sl-chunker > story1.sh-sl-chunker.txt
cat ../story1_hr.txt | apertium -d ../../../ sh-sl-interchunk > story1.sh-sl-interchunk.txt
cat ../story1_hr.txt | apertium -d ../../../ sh-sl-postchunk > story1.sh-sl-postchunk.txt

# Generate the CG output
cat ../story1_hr.txt | apertium -d ../../../ sh-sl-constraints > story1.sh-sl-constraints.txt
