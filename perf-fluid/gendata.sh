INPUT_FILE=$1
grep -v cache ${INPUT_FILE} | grep -v tbb | grep -v fanimate | awk '{print $2 " " $3}' > animate.seq.dat
cat animate.seq.dat | awk '{print $1 " " $2/$1}' > animate.seq.norm.dat
grep -v cache ${INPUT_FILE} | grep -v tbb | grep fanimate | awk '{print $2 " " $3}' > fanimate.seq.dat
cat fanimate.seq.dat | awk '{print $1 " " $2/$1}' > fanimate.seq.norm.dat
join animate.seq.dat fanimate.seq.dat | awk '{print $1 " " $3/$2}' > speedup.seq.dat
join animate.seq.norm.dat fanimate.seq.norm.dat | awk '{print $1 " " $3/$2}' > speedup.seq.norm.dat

grep -v cache ${INPUT_FILE} | grep tbb | grep -v fanimate | grep "tbb 8" | awk '{print $3 " " $4}' > animate.tbb.8.dat
cat animate.tbb.8.dat | awk '{print $1 " " $2/$1}' > animate.tbb.8.norm.dat
grep -v cache ${INPUT_FILE} | grep tbb | grep fanimate | grep "tbb 8" | awk '{print $3 " " $4}' > fanimate.tbb.8.dat
cat fanimate.tbb.8.dat | awk '{print $1 " " $2/$1}' > fanimate.tbb.8.norm.dat
join animate.tbb.8.dat fanimate.tbb.8.dat | awk '{print $1 " " $3/$2}' > speedup.tbb.8.dat
join animate.tbb.8.norm.dat fanimate.tbb.8.norm.dat | awk '{print $1 " " $3/$2}' > speedup.tbb.8.norm.dat

grep -v cache ${INPUT_FILE} | grep tbb | grep -v fanimate | grep " 500 " | grep -v " 64 " | awk '{print $2 " " $4}' > animate.tbb.it500.dat
grep -v cache ${INPUT_FILE} | grep tbb | grep fanimate | grep " 500 " | grep -v " 64 " | awk '{print $2 " " $4}' > fanimate.tbb.it500.dat
