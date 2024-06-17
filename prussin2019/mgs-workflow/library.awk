BEGIN {
# Print the header to the output file
     print "library,sample" > "libraries.csv"
}

{
# For each line, print the third column followed by a comma and then the second column
print $3 "," $2 >> "libraries.csv"
}

