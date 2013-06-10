#!/bin/bash

cross[1]="annular"
cross[2]="doublePoint"
cross[3]="singlePont"
cross[4]="uniform"

echo
printf "%15s | %14s | %14s | %14s | %14s\n" "Method" "avgMeanErrors" "avgBestErrors" "bestMeanErrors" "bestBestErrors"
echo "-----------------------------------------------------------------------------------"

i=0

for outDec in 1 2 3 4; do

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

    printf "%15s | %14s | %14s | %14s | %14s\n" "${cross[$i]}:" "${AvgMean}" "${AvgBest}" "${BestMean}" "${BestBest}"
done

