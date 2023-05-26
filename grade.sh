CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
rm -rf student-submission
rm -rf grading-area


mkdir grading-area
# cloning the data
git clone $1 student-submission 
if [[ $? -gt 0 ]]
then
    echo 'No submission detected'
    exit 1
fi
echo 'Finished cloning'
# checking is file inserted is correct
file=`find student-submission -name "*.java"`

if [[ -f $file ]] && [[ $file == *ListExamples.java ]] 
then
    echo 'Correct file submitted'
else 
    echo 'File not found'
    exit 1
fi

# copying files to correct directory
cp $file grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

# runing javac 
cd grading-area
javac ListExamples.java 

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
