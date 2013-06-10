#!/bin/bash

selec[1]="elite"
selec[2]="roulette"
selec[3]="tourney"
selec[4]="boltzmann"
selec[5]="mixed1(a = 0.5)"
selec[6]="mixed2(a = 0.5)"
selec[7]="mixed1(a = 0.9)"
selec[8]="mixed2(a = 0.9)"
selec[9]="mixed1(a = 0.1)"
selec[10]="mixed2(a = 0.1)"

echo
printf "%19s | %14s | %14s | %14s | %14s\n" "Method" "avgMeanErrors" "avgBestErrors" "bestMeanErrors" "bestBestErrors"
echo "---------------------------------------------------------------------------------------"

i=0

for outDec in 7 10 11 18 8 9 20 21 23 24; do

    let i=i+1

    Best=""
    Mean=""

    for outUnit in 1 2 3; do

        file="output${outDec}${outUnit}/output_0.txt"
        best=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[0-9.]+$" | sort | head -n 1`
        cant=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[0-9.]+$" | wc -l`
        mean=`cat "${file}" 2> /dev/null | grep ").fitness" | grep -Eo "[0-9.]+$" | tr "\n" "+"`
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

    printf "%19s | %14s | %14s | %14s | %14s\n" "${selec[$i]}:" "${AvgMean}" "${AvgBest}" "${BestMean}" "${BestBest}"
done

