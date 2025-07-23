# test_solution.py

import unittest
from subtraction import subtract

class TestSubtractFunction(unittest.TestCase):
    def test_positive_numbers(self):
        self.assertEqual(subtract(10, 3), 7)

    def test_negative_result(self):
        self.assertEqual(subtract(3, 10), -7)

    def test_zero(self):
        self.assertEqual(subtract(0, 0), 0)

    def test_negative_numbers(self):
        self.assertEqual(subtract(-5, -3), -2)

    def test_mixed_signs(self):
        self.assertEqual(subtract(5, -3), 8)
        self.assertEqual(subtract(-5, 3), -8)

    def test_float_values(self):
        self.assertAlmostEqual(subtract(5.5, 2.2), 3.3, places=1)

    def test_large_numbers(self):
        self.assertEqual(subtract(1_000_000, 999_999), 1)

if __name__ == '__main__':
    unittest.main()
