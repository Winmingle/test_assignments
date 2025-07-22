#!/bin/bash
# Test script for solution.sh

# Set initial values
total=0
passed=0

run_test() {
  input1=$1
  input2=$2
  expected=$3
  ((total++))
  output=$(bash solution.sh "$input1" "$input2")
  if [ "$output" == "$expected" ]; then
    echo "✅ Test $total passed"
    ((passed++))
  else
    echo "❌ Test $total failed: Expected $expected but got $output"
  fi
}

# Test cases
run_test 2 3 5
run_test 10 15 25
run_test 0 0 0
run_test -5 7 2

# Final result
score=$((passed * 100 / total))
echo "📊 Score: $score%"
exit 0
