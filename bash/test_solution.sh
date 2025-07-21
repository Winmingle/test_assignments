#!/bin/bash

run_test() {
  input1=$1
  input2=$2
  expected=$3
  output=$(bash solution.sh $input1 $input2)

  if [ "$output" == "$expected" ]; then
    echo "Test passed"
    return 0
  else
    echo "Test failed: expected $expected, got $output"
    return 1
  fi
}

run_test 2 3 5
run_test 7 8 15
run_test 0 0 0
