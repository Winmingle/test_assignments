#!/bin/bash

# This script tests the student's add function

pass_count=0
fail_count=0

run_test() {
  input1=$1
  input2=$2
  expected=$3
  output=$(bash "$STUDENT_SCRIPT" "$input1" "$input2")

  if [[ "$output" == "$expected" ]]; then
    echo "✅ Test Passed: $input1 + $input2 = $expected"
    ((pass_count++))
  else
    echo "❌ Test Failed: $input1 + $input2 expected $expected but got $output"
    ((fail_count++))
  fi
}

# Path to student file (the grading script sets this env variable)
if [[ -z "$STUDENT_SCRIPT" ]]; then
  echo "❌ STUDENT_SCRIPT environment variable not set"
  exit 1
fi

# Run tests
run_test 2 3 5
run_test 5 10 15
run_test 0 0 0
run_test 7 8 15

# Summary
echo ""
echo "Tests Passed: $pass_count"
echo "Tests Failed: $fail_count"

# Exit with code 0 only if all tests pass
if [[ $fail_count -eq 0 ]]; then
  exit 0
else
  exit 1
fi
