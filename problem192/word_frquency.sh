#!/bin/bash
awk '{
for(i=1;i<=NF;i++) 
    a[$i]++} 
END {
    for(k in a) 
    print k,a[k]
}' words.txt | sort -nrk 2

#解法二(最佳)
awk 'BEGIN { 
    PROCINFO["sorted_in"] = "@val_num_desc"   # set array traversal to values in descending order
} { 
    for (i=1;i<=NF;i++) {   # take each word separately
        a[$i]++             # populate array a with word count incremented each time
    }
} END {
    for (i in a) {          # array traversal and print which will follow pre-set order
        print i,a[i]
    }
}' words.txt