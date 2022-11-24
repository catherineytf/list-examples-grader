# Create your grading script here

#set -e

CPATH=":lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission

score=0

# check the existence of the file 
FILE=student-submission/ListExamples.java
SUBMISSION_FILE=ListExamples.java
if [[ -f "$FILE" ]]; then
    echo "$SUBMISSION_FILE is submitted successfully. [1 piont]"
    ((score+=1))
else
    echo "$SUBMISSION_FILE is not found."
    echo "Grade:[$score/4]"
    exit
fi



cp TestListExamples.java student-submission/
cd /Users/tongfeiyang/Documents/GitHub/list-examples-grader/


# check if file compiles
javac -cp .$CPATH *.java 2> compile_error.txt
if [[ $? -eq 0]];then
    echo "$SUBMISSION_FILE compiled succssfully. [1 point]"
    ((score+=1))

else
    echo "compile error"
    cat compile_error.txt
    echo "Grade:[$score/4]"
    exit
fi

# java -cp .$CPATH org.junit.runner.JUnitCore TestListExamples 2 > error.txt

#javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

#run tests
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test_result.txt
if [[ $? -eq 0 ]];then
    echo "All tests passed. [1 point]"
    ((score+=1))
    exit 0
else
    echo "Some tests failed."
    exit 1
fi

echo "Grade: [$score/4]"



