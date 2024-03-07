#Run test for the mywc program. Use the wc command to verify the results. However the wc command has more spaces than the mywc command (wc command uses tabs). In order to solve this the command tr -d "[:blank:]" will be used. This command removes all whitespaces so that the results can be compared with a simple diff.

#Create the file that will be used.
touch file.txt

# Case 1: File with some text in it
    echo Creating test case 1: base case:
    echo "This is a test \n another line \n line 3" > file.txt
    # Create the two .txt to compare and errase spaces using tr
    wc file.txt | tr -d "[:blank:]" > outwc.txt
    binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 1:
    diff outwc.txt outmywc.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
        else
            echo "Test passed :)"
        fi
    rm outwc.txt outmywc.txt
    # Remove the file created for this test.
    rm -rf file.txt


# Case 2: Empty file
    echo Creating test case 2:
    touch file.txt
    # Create the two .txt to compare and errase spaces using tr
    wc file.txt | tr -d "[:blank:]" > outwc.txt
    binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 2: empty file:
    diff outwc.txt outmywc.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
        else
            echo "Test passed :)"
        fi
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
    echo Testing case 3: one letter:
    diff outwc.txt outmywc.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
        else
            echo "Test passed :)"
        fi
    rm outwc.txt outmywc.txt
    # Remove the test directory created for this test.
    rm -rf file.txt


# Case 4: File with only one word
    echo Creating test case 4: One word:
    touch file.txt
    echo "word" > file.txt
    # Create the two .txt to compare and errase spaces using tr
    wc file.txt | tr -d "[:blank:]" > outwc.txt
    binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 4:
    diff outwc.txt outmywc.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
        else
            echo "Test passed :)"
        fi
    rm outwc.txt outmywc.txt
    # Remove the test directory created for this test.
    rm -rf file.txt


# Case 5: File with only one line in it
    echo Creating test case 5: one line
    echo "This is a test" > file.txt
    # Create the two .txt to compare and errase spaces using tr
    wc file.txt | tr -d "[:blank:]" > outwc.txt
    binaries/mywc.o file.txt | tr -d "[:blank:]" > outmywc.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 5:
    diff outwc.txt outmywc.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
        echo "Test failed :("
        else
            echo "Test passed :)"
            fi
    rm outwc.txt outmywc.txt
    # Remove the file created for this test.
    rm -rf file.txt


# Delete the diff.txt file
rm diff.txt
