#!/bin/bash

selec[1]="first(elite)"
selec[2]="second(elite|mixed1)"
selec[3]="second(mixed1|elite)"
selec[4]="second(tourney|elite)"
selec[5]="second(roulette|elite)"
selec[6]="third(elite|mixed1)"
selec[7]="third(mixed1|elite)"
selec[8]="third(tourney|elite)"
selec[9]="third(roulette|elite)"

echo
printf "%22s | %14s | %14s | %14s | %14s\n" "Method" "avgMeanErrors" "avgBestErrors" "bestMeanErrors" "bestBestErrors"
echo "---------------------------------------------------------------------------------------"

i=0

for outDec in 29 30 31 32 33 34 35 36 37; do

    let i=i+1

    Best=""
    Mean=""

    for outUnit in 1 2 3; do

        file="output${outDec}${outUnit}/output_0.txt"
        e04="s/\([0-9]\).\([0-9]*\)e-04/0.000\1\2/"
        best=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[-e0-9.]+$" | sed "${e04}" | sort | head -n 1`
        cant=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[-e0-9.]+$" | sed "${e04}" | wc -l`
        mean=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[-e0-9.]+$" | sed "${e04}" | tr "\n" "+"`
        mean=`bc -l <<< "\"0\";scale=5;(${mean}0)/${cant}"`

        Best="${Best} ${best}"
        Mean="${Mean} ${mean}"
    done

    Best=`echo "${Best}" | sed "s/^ *//"`
    Mean=`echo "${Mean}" | sed "s/^ *//"`

    cant=`echo "${Best}" | tr " " "\n" | wc -l`

    BestBest=`echo "${Best}" | tr " " "\n" | sort | head -n 1`
    BestMean=`echo "${Mean}" | tr " " "\n" | sort | head -n 1`

    Best=`echo "${Best}" | tr " " "+"`
    Mean=`echo "${Mean}" | tr " " "+"`

    AvgBest=`bc -l <<< "\"0\";scale=5;(${Best})/${cant}"`
    AvgMean=`bc -l <<< "\"0\";scale=5;(${Mean})/${cant}"`

    printf "%22s | %14s | %14s | %14s | %14s\n" "${selec[$i]}:" "${AvgMean}" "${AvgBest}" "${BestMean}" "${BestBest}"
done

