#!/bin/bash

cd ..      
for j in 0.1
do
		a=0
		while [ $a -lt 2 ]
		do
		python generate_network.py -nw 50 -ner $j -es 1.4 -ne 6 -mp 7
		python write_config_single.py
		python determine_all_single_selectivities.py
		python generate_projections.py
        python combigen.py
		python computePlanCosts.py eventNodeRatio
		python generateEvaluationPlan.py
		a=`expr $a + 1`
		done
done
