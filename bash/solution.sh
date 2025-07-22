#!/bin/bash

# Test cases
inputs=("2" "0" "-4")
expected_outputs=("4" "0" "16")

# Counters
total=${#inputs[@]}
passed=0

for i in "${!inputs[@]}"; do
    output=$(echo "${inputs[$i]}" | bash solution.sh)
    expected="${expected_outputs[$i]}"

    if [ "$output" == "$expected" ]; then
        echo "✅ Test $((i+1)): Passed"
        ((passed++))
    else
        echo "❌ Test $((i+1)): Failed (Expected: $expected, Got: $output)"
    fi
done

# Final score
score=$((passed * 100 / total))

echo "✅ Passed: $passed/$total"
echo "📊 Score: $score%"

# Exit 0 if perfect, else 1
if [ $score -eq 100 ]; then
    exit 0
else
    exit 1
fi
