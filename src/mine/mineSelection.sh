#!/bin/bash

selec[1]="elite"
selec[2]="roulette"
selec[3]="tourney"
selec[4]="rank"
selec[5]="boltzmann(f=1)"
selec[6]="boltzmann(f=0.5)"
selec[7]="boltzmann(f=0.1)"
selec[8]="universal"
selec[9]="mixed1(a = 0.1)"
selec[10]="mixed1(a = 0.2)"
selec[11]="mixed2(a = 0.1)"
selec[12]="mixed2(a = 0.2)"

echo
printf "%20s | %14s | %14s | %14s | %14s\n" "Method" "avgMeanErrors" "avgBestErrors" "bestMeanErrors" "bestBestErrors"
echo "---------------------------------------------------------------------------------------"

i=0

for outDec in 50 51 52 53 54 55 56 57 58 59 60 61; do

    let i=i+1

    if ((i == 4)); then continue; fi

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

    printf "%20s | %14s | %14s | %14s | %14s\n" "${selec[$i]}:" "${AvgMean}" "${AvgBest}" "${BestMean}" "${BestBest}"
done

