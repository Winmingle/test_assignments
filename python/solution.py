import unittest
from solution import square

class TestSquare(unittest.TestCase):
    def test_positive(self):
        self.assertEqual(square(4), 16)

    def test_zero(self):
        self.assertEqual(square(0), 0)

    def test_negative(self):
        self.assertEqual(square(-5), 25)

if __name__ == "__main__":
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(TestSquare)

    total_tests = suite.countTestCases()
    results = unittest.TestResult()
    suite.run(results)

    passed = total_tests - len(results.failures) - len(results.errors)
    score = (passed / total_tests) * 100

    print(f"✅ Passed: {passed}/{total_tests}")
    print(f"📊 Score: {score:.0f}%")

    exit(0 if score == 100 else 1)
