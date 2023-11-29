CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f "student-submission/ListExamples.java" ]] 
then
    echo 'File Exists! We found the treasure :D'
else
    echo 'File does not exist, we are lost in the Forest of files and folders :|'
fi

cp student-submission/ListExamples.java TestListExamples.java Server.java GradeServer.java grading-area
cp -r lib grading-area
cd grading-area

javac -cp $CPATH *.java 2> Grading.txt
if [ $? -eq 0 ]
then
    echo "Compiled! Hooray, You deserve an ice cream cone :)" 
else
    echo "Compiling Error! Compiler Died :("
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > Code.txt

grep "OK" code.txt > /dev/null
if [ $? -eq 0 ]
then
    echo "FULL PASS! YOU GET AN A!!!"
else
    echo "ERROR BEEP BOOP :P"
fi



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
