
#!/usr/bin/bash
echo "а пока можно попить чайку... или проверить почту: дело это небыстрое"
mkdir ./OUT
find . -maxdepth 1 -name "IP*Avg.txt" | while read FILENAME;
do
echo "$FILENAME"
cat ./$FILENAME | sed '$d' | awk -F "\t" '{print $2"\t" $16"\t" $17}' | sed 's/ //g' | sed 's/\/2017/\/2017\//g' | sed 's/\/2018/\/2018\//g' | sed 's/AM//g' | sed 's/\.2018/\/2018\//g' | sed 's/\.2017/\/2017\//g' | while read line;
	do
        if [[ "$line" =~ '/12:' ]]
                then echo "$line" | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/1:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/1:/\/13:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/2:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/2:/\/14:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/3:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/3:/\/15:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/4:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/4:/\/16:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/5:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/5:/\/17:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/6:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/6:/\/18:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/7:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/7:/\/19:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/8:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/8:/\/20:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/9:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/9:/\/21:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/10:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/10:/\/22:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/11:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/11:/\/23:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ [0-9]\.[0-9][0-9]\/2 ]];
                then echo "$line" | sed 's/\./\//1' >> ./OUT/$FILENAME"OUT"
        else
                echo "$line" >> ./OUT/$FILENAME"OUT"

        fi
#	echo "$line" | sed 's/\/2017\/1\:/\/2017\/01\:/' >> ./OUT/$FILENAME"OUT"
	done

done


#! /usr/bin/gnuplot5-x11 
find ./OUT -maxdepth 1 -name "IP*Avg.txtOUT" -not -name "*GPKS*" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%m/%d/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"

done

find ./OUT -maxdepth 1 -name "IP*GPKS*Avg.txtOUT" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%d/%m/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"


done



find . -maxdepth 1 -name "SAT*Avg.txt" | while read FILENAME;
do
echo "$FILENAME"
cat ./$FILENAME | sed '$d' | awk -F "\t" '{print $2"\t" $12"\t" $14}' | sed 's/ //g' | sed 's/\/2017/\/2017\//g' | sed 's/\/2018/\/2018\//g' | sed 's/AM//g' | sed 's/\.2018/\/2018\//g' | sed 's/\.2017/\/2017\//g' | while read line;
	do
        if [[ "$line" =~ '/12:' ]]
                then echo "$line" | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/1:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/1:/\/13:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/2:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/2:/\/14:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/3:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/3:/\/15:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/4:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/4:/\/16:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/5:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/5:/\/17:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/6:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/6:/\/18:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/7:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/7:/\/19:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/8:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/8:/\/20:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/9:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/9:/\/21:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/10:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/10:/\/22:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/11:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/11:/\/23:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ [0-9]\.[0-9][0-9]\/2 ]];
                then echo "$line" | sed 's/\./\//1' >> ./OUT/$FILENAME"OUT"
        else
                echo "$line" >> ./OUT/$FILENAME"OUT"

        fi
#	echo "$line" | sed 's/\/2017\/1\:/\/2017\/01\:/' >> ./OUT/$FILENAME"OUT"
	done

done


#! /usr/bin/gnuplot5-x11 
find ./OUT -maxdepth 1 -name "SAT*Avg.txtOUT" -not -name "*GPKS*" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%m/%d/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"

done

find ./OUT -maxdepth 1 -name "SAT*GPKS*Avg.txtOUT" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%d/%m/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"


done



find . -maxdepth 1 -name "MESH*Avg.txt" | while read FILENAME;
do
echo "$FILENAME"
cat ./$FILENAME | sed '$d' | awk -F "\t" '{print $2"\t" $10"\t" $12}' | sed 's/ //g' | sed 's/\/2017/\/2017\//g' | sed 's/\/2018/\/2018\//g' | sed 's/AM//g' | sed 's/\.2018/\/2018\//g' | sed 's/\.2017/\/2017\//g' | while read line;
	do
        if [[ "$line" =~ '/12:' ]]
                then echo "$line" | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/1:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/1:/\/13:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/2:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/2:/\/14:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/3:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/3:/\/15:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/4:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/4:/\/16:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/5:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/5:/\/17:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/6:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/6:/\/18:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/7:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/7:/\/19:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/8:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/8:/\/20:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/9:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/9:/\/21:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/10:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/10:/\/22:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ '/11:' ]] && [[ "$line" =~ '00PM' ]]
                then echo "$line" | sed 's/\/11:/\/23:/' | sed 's/PM//' >> ./OUT/$FILENAME"OUT"
        elif [[ "$line" =~ [0-9]\.[0-9][0-9]\/2 ]];
                then echo "$line" | sed 's/\./\//1' >> ./OUT/$FILENAME"OUT"
        else
                echo "$line" >> ./OUT/$FILENAME"OUT"

        fi
#	echo "$line" | sed 's/\/2017\/1\:/\/2017\/01\:/' >> ./OUT/$FILENAME"OUT"
	done

done


#! /usr/bin/gnuplot5-x11 
find ./OUT -maxdepth 1 -name "MESH*Avg.txtOUT" -not -name "*GPKS*" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%m/%d/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"

done

find ./OUT -maxdepth 1 -name "MESH*GPKS*Avg.txtOUT" | while read FILENAME;
do
#set xdata time
#set timefmt "%m/%d/%Y/%H:%M:%S"
#set format x '%d.%m.%y'
#set term jpeg
#set output ./$FILENAME.jpeg

gnuplot5-x11 -e "set xdata time; set timefmt \"%d/%m/%Y/%H:%M:%S\"; set format x '%d.%m.%y'; set term jpeg size 1280,480; set output '$FILENAME.jpeg'; plot '$FILENAME' u 1:3 w l, '$FILENAME' u 1:2 w l"


done



















echo "ну вот собсна и все"
