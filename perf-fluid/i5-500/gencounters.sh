cat animate-counters | sed 's/:/ /' | grep -v '^#' | grep -v '^$' | awk '{print $2 " " $1}' > animate.cnt
cat fanimate-counters | sed 's/:/ /' | grep -v '^#' | grep -v '^$' | awk '{print $2 " " $1}' > fanimate.cnt
join fanimate.cnt animate.cnt | awk '{print $1 " & \\numprint{"$2 "} & \\numprint{" $3 "} & " $3/$2 "\\\\ \hline"}' > counters.tex
