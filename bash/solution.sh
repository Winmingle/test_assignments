#!/bin/bash

if [[ -z "$STUDENT_SCRIPT" ]]; then
  echo "❌ STUDENT_SCRIPT environment variable not set"
  exit 1
fi

pass_count=0
fail_count=0

run_test() {
  expected="$3"
  output=$(bash "$STUDENT_SCRIPT" "$1" "$2")
  if [[ "$output" == "$expected" ]]; then
    echo "✅ Test Passed: $1 + $2 = $expected"
    ((pass_count++))
  else
    echo "❌ Test Failed: $1 + $2 expected $expected but got $output"
    ((fail_count++))
  fi
}

run_test 2 3 5
run_test 5 10 15
run_test 0 0 0
run_test 7 8 15

echo ""
echo "Tests Passed: $pass_count"
echo "Tests Failed: $fail_count"

# Exit with 1 if any tests failed
if [[ $fail_count -gt 0 ]]; then
  exit 1
fi

exit 0
