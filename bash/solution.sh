#!/bin/bash

pass_count=0
fail_count=0

run_test() {
  input="$1"
  expected="$2"
  output=$(echo "$input" | bash solution.sh)
  if [ "$output" = "$expected" ]; then
    echo "✅ Passed: $input → $expected"
    ((pass_count++))
  else
    echo "❌ Failed: $input → expected $expected, got $output"
    ((fail_count++))
  fi
}

run_test "1234" "10"
run_test "99" "18"
run_test "0" "0"
run_test "10001" "2"
run_test "567" "18"

total=$((pass_count + fail_count))
score=$((100 * pass_count / total))
echo "✅ Score: $score% ($pass_count passed, $fail_count failed)"
