#!/bin/bash

# Path to the student's script
STUDENT_SCRIPT="./solution.sh"

# Define test cases
tests_passed=0
tests_failed=0

run_test() {
  input1=$1
  input2=$2
  expected=$3

  # Run the student script with inputs
  result=$(bash "$STUDENT_SCRIPT" "$input1" "$input2")

  if [ "$result" -eq "$expected" ]; then
    echo "✅ Test Passed: $input1 + $input2 = $expected"
    tests_passed=$((tests_passed + 1))
  else
    echo "❌ Test Failed: $input1 + $input2 expected $expected but got $result"
    tests_failed=$((tests_failed + 1))
  fi
}

# Test cases
run_test 2 3 5
run_test 5 10 15
run_test 0 0 0
run_test 7 8 15

# Final result
echo ""
echo "Tests Passed: $tests_passed"
echo "Tests Failed: $tests_failed"

# Exit code for grader: 0 if all passed, 1 otherwise
if [ "$tests_failed" -eq 0 ]; then
  exit 0
else
  exit 1
fi
