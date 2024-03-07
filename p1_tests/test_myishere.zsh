# Run test to see if a file exists in a directory there is no specific command. Instead, you can use the -e option with the if statement to check if a file exists in a directory.

# Case 1: Base case: The file exist in the directory
    echo Creating test case 1: base case
    mkdir testdir
    touch testdir/testfile.txt
    # Check if the file exists in the directory with an if in terminal
    if [ -e "testdir/testfile.txt" ]; then
            echo "File testfile.txt is in directory testdir" > ishere.txt
            else
                echo "File testfile.txt is not in directory testdir" > ishere.txt
                fi
    # Compute with myishere command
    binaries/myishere.o testdir testfile.txt > myishere.txt
    # Compare with the diff command
    echo Testing case 1:
    diff ishere.txt myishere.txt > diff.txt
    # Compare to output a valid test:
    if [ -s diff.txt ]; then
            echo "Test failed :("
            else
                echo "Test passed :)"
                fi
    # Don't remove the testdir directory, as it will be used in the next test case.


# Case 2: The file does not exist in the directory
    echo Creating test case 2: The file does not exist in the directory
    # Remove the testfile.txt file
    rm testdir/testfile.txt
    # Check if the file exists in the directory with an if in terminal
    if [ -e "testdir/testfile.txt" ]; then
            echo "File testfile.txt is in directory testdir." > ishere.txt
            else
                echo "File testfile.txt is not in directory testdir" > ishere.txt
                fi
    # Compute with myishere command
    binaries/myishere.o testdir testfile.txt > myishere.txt
    # Compare with the diff command
    echo Testing case 2:
    diff ishere.txt myishere.txt > diff.txt
    # Compare to output a valid test:
    if [ -s diff.txt ]; then
            echo "Test failed :("
            else
                echo "Test passed :)"
                fi


# Case 3: Non-existing directory
    echo Creating test case 3: Non-existing directory
    # Remove the testdir directory
    rm -rf testdir
    # Check if the file exists in the directory with an if in terminal.
    # First check if the directory exist
    if [ -d "testdir" ]; then
        if [ -e "testdir/testfile.txt" ]; then
            echo "File testfile.txt is in directory $directory." > ishere.txt
            else
                echo "File testfile.txt is not in directory $directory." > ishere.txt
                fi
        else
            echo "opendir error: No such file or directory" > ishere.txt
            fi

    # Compute with myishere command: We should get an error message, therefore we redirect the error message to a file
    binaries/myishere.o testdir testfile.txt 2> myishere.txt
    # Compare with the diff command
    echo Testing case 3:
    diff ishere.txt myishere.txt > diff.txt
    # Compare to output a valid test:
    if [ -s diff.txt ]; then
        echo "Test failed :("
        else
            echo "Test passed :)"
            fi


# Finally remove the two .txt files that have been created
rm ishere.txt
rm myishere.txt
rm diff.txt
