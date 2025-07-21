# import IMPORT_FILENAME  # Will be replaced with actual filename, e.g., "multiply"
from IMPORT_FILENAME import add

def test():
    assert add(2, 3) == 5, "Test 1 Failed"
    assert add(5, 5) == 10, "Test 2 Failed"
    assert add(0, 10) == 10, "Test 3 Failed"
    print("All Python tests passed!")

test()
