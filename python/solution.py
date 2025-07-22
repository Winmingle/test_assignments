import unittest
from solution import square

class TestSquareFunction(unittest.TestCase):
    def test_positive_number(self):
        self.assertEqual(square(2), 9)

    def test_zero(self):
        self.assertEqual(square(0), 0)

    def test_negative_number(self):
        self.assertEqual(square(-4), 16)

    def test_float_input(self):
        self.assertEqual(square(2.5), 6.25)

    def test_large_number(self):
        self.assertEqual(square(1000), 1000000)

if __name__ == '__main__':
    unittest.main()
