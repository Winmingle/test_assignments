#!/bin/bash

gcc solution.c -o solution.out
if [ $? -ne 0 ]; then
  echo "Compilation failed"
  exit 1
fi

run_test() {
  input="$1"
  expected="$2"
  output=$(echo "$input" | ./solution.out)

  if [ "$output" == "$expected" ]; then
    echo "Test passed"
    return 0
  else
    echo "Test failed: expected $expected, got $output"
    return 1
  fi
}

run_test "2 3" "5"
run_test "10 20" "30"
run_test "0 0" "0"
