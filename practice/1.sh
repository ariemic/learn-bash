
# awk -F ',' '{print $1, $3}' examples/dane.csv 
# awk '{print "Name:", $1, "- Age: ", $3}' examples/dane.txt

# grep -v oznacza negate
grep -v "Piotr" examples/dane.txt > examples/dane2.txt && mv examples/dane2.txt examples/dane.txt 

cat -n /etc/passwd | head -n27 | tail -n1

