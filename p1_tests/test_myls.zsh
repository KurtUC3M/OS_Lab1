# Run test for the myls program, use the ls-f-1 command to compare the output.
# For each test done, echo the number and type of the test and then use the diff command
# to compare the output of the two programs.Then remove the .txt files created for the test


# Case 1: Directory with files and subdirectories.
    echo Creating test case 1:
    mkdir test
    touch test/file1.txt
    touch test/file2.py
    mkdir test/subdir1
    # Create the two .txt to compare
    ls -f -1 test > f1ls.txt
    binaries/myls.o test > f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 1:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt
    # Remove the test directory created for this test.
    rm -rf test


# Case 2: Directory with only one file
    echo Creating test case 2:
    mkdir test
    touch test/file1.txt
    # Create the two .txt to compare
    ls -f -1 test > f1ls.txt
    binaries/myls.o test > f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 2:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt
    # Remove the test directory created for this test.
    rm -rf test

# Case 3: Empty directory
    echo Creating test case 3:
    mkdir test
    # Create the two .txt to compare
    ls -f -1 test > f1ls.txt
    binaries/myls.o test > f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 3:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt
    # Remove the test directory created for this test.
    rm -rf test

# Case 4: Pass a file as an argument
    echo Creating test case 4:
    touch test.txt

    # Create the two .txt to compare for the STDOUT
    ls -f -1 test.txt > f1ls.txt
    binaries/myls.o test.txt > f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 4 STDOUT:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            cat diff.txt
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt

    # Test the expected errors STDERR
    echo Testing case 4 STDERR:
    ls -f -1 test.txt 2> f1ls.txt
    binaries/myls.o test.txt 2> f1myls.txt
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            cat diff.txt
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt
    # Remove the test file created for this test.
    rm test.txt

    # For this case we see that the usualls command will show the file name,while the myls command will output an error. We can check that with the 2> to redirect the stderror of the command to a file and then compare the two files.

# Case 5: Pass a non existing directory as an argument
    echo Creating test case 5:

    # Create the two .txt to compare the STDOUT
    ls -f -1 test > f1ls.txt
    binaries/myls.o test > f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 5 STDOUT:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            cat diff.txt
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt

    # Compare the STDERR
    ls -f -1 test 2> f1ls.txt
    binaries/myls.o test 2> f1myls.txt
    # Compare the two .txt files and remove them when finished
    echo Testing case 5 STDERR:
    diff f1ls.txt f1myls.txt > diff.txt
    #Output a message if the diff is successful
    if [ -s diff.txt ]; then
            echo "Test failed :("
            cat diff.txt
            else
                echo "Test passed :)"
                fi
    rm f1ls.txt f1myls.txt


# Delete the diff.txt file created for the tests
rm diff.txt
