#Run test for the mywc program. Use the wc command to verify the results. However the wc command has more spaces than the mywc command (wc command uses tabs). In order to solve this the command tr -d "[:blank:]" will be used. This command removes all whitespaces so that the results can be compared with a simple diff.


# Case 1: File with some text in it
echo Creating test case 1:
touch file.txt
echo "This is a test" > file.txt
# Create the two .txt to compare and errase spaces using tr
wc file.txt | tr -d "[:blank:]" > outwc.txt
binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
# Compare the two .txt files and remove them when finished
echo Testing case 1:
diff outwc.txt outmywc.txt
rm outwc.txt outmywc.txt
# Remove the test directory created for this test.
rm -rf file.txt

# Case 2: Empty file
echo Creating test case 2:
touch file.txt
# Create the two .txt to compare and errase spaces using tr
wc file.txt | tr -d "[:blank:]" > outwc.txt
binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
# Compare the two .txt files and remove them when finished
echo Testing case 2:
diff outwc.txt outmywc.txt
rm outwc.txt outmywc.txt
# Remove the test directory created for this test.
rm -rf file.txt

# Case 3: File with only one letter
echo Creating test case 3:
touch file.txt
echo "a" > file.txt
# Create the two .txt to compare and errase spaces using tr
wc file.txt | tr -d "[:blank:]" > outwc.txt
binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
# Compare the two .txt files and remove them when finished
echo Testing case 3:
diff outwc.txt outmywc.txt
rm outwc.txt outmywc.txt
# Remove the test directory created for this test.
rm -rf file.txt
