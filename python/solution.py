import unittest
from solution import sum_of_digits

class TestSumOfDigits(unittest.TestCase):
    def test_cases(self):
        self.assertEqual(sum_of_digits(1234), 10)
        self.assertEqual(sum_of_digits(99), 18)
        self.assertEqual(sum_of_digits(0), 0)
        self.assertEqual(sum_of_digits(10001), 2)
        self.assertEqual(sum_of_digits(567), 18)

if __name__ == '__main__':
    unittest.main()
