#!/usr/bin/env bash
read N
let sum=0
for ((i=N; i > 0; i--)); do
	read n
	((sum+=n))
done
awk "BEGIN {printf(\"%.3f\", $sum/$N)}"
