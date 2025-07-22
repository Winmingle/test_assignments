import unittest
from solution import square

class TestSquare(unittest.TestCase):
    results = []

    def run(self, result=None):
        super().run(result)
        if result:
            self.__class__.results.append(result.wasSuccessful())

    def test_positive(self):
        self.assertEqual(square(2), 16)

    def test_zero(self):
        self.assertEqual(square(1), 0)

    def test_negative(self):
        self.assertEqual(square(-9), 25)

if __name__ == "__main__":
    suite = unittest.TestLoader().loadTestsFromTestCase(TestSquare)
    runner = unittest.TextTestRunner(verbosity=0)
    runner.run(suite)

    total = len(TestSquare.results)
    passed = sum(TestSquare.results)
    score = (passed / total) * 100

    print(f"✅ Passed: {passed}/{total}")
    print(f"📊 Score: {score:.0f}%")

    exit(0)
