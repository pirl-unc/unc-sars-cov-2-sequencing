
if [ -e combined.fa ]; then
	echo "Deleting old combined FASTA: combined.fa";
	rm 'combined.fa'
fi

for f in `grep -c '>' *.fasta`; do  
	filename=`cut -d':' -f1 <<< $f`; 
        num=`cut -d':' -f2 <<< $f`;
	if [ $num == "1" ]; then 
		echo $filename
		echo ">$filename" >>combined.fa
	
		cat $filename | grep -v ">"  >>combined.fa 
	fi
done
