# Create your grading script here

set -e

# CPATH=:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar
rm -rf student-submission
git clone $1 student-submission

FILE=student-submission/ListExamples.java
if [[ -f "$FILE" ]]; then
    echo "$FILE is submitted successfully."
else
    echo "$FILE is not found."
fi

cp TestListExamples.java student-submission/
cd /Users/tongfeiyang/Documents/GitHub/list-examples-grader/


# javac -cp .$CPATH *.java

# java -cp .$CPATH org.junit.runner.JUnitCore TestListExamples 2 > error.txt

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples

