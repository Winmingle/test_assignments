from solution import add

def run_tests():
    assert add(2, 3) == 5, "Test 1 Failed"
    assert add(-1, 1) == 0, "Test 2 Failed"
    assert add(0, 0) == 0, "Test 3 Failed"
    print("All Python tests passed!")

if __name__ == "__main__":
    run_tests()
