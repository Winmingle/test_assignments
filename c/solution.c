from grade import run_c_test  # assuming run_c_test is in grade.py

c_code = """
#include <stdio.h>

int main() {
    int num, sum = 0;
    scanf("%d", &num);

    while (num > 0) {
        sum += num % 10;
        num /= 10;
    }

    printf("%d\\n", sum);
    return 0;
}
"""

test_cases = [
    {"input": "1234\n", "expected": "10"},
    {"input": "0\n", "expected": "0"},
    {"input": "999\n", "expected": "27"},
    {"input": "1001\n", "expected": "2"},
    {"input": "45\n", "expected": "9"},
]

run_c_test(c_code, "solution.c", test_cases)
