def run_c_test(code, filename, test_cases=None, timeout=5):
    import subprocess, tempfile, os

    if test_cases is None:
        test_cases = []

    passed = 0
    total = len(test_cases)

    with tempfile.TemporaryDirectory() as tmp:
        source_path = os.path.join(tmp, filename)
        exe_path = os.path.join(tmp, 'a.exe')

        with open(source_path, 'w') as f:
            f.write(code)

        compile_result = subprocess.run(
            ['gcc', source_path, '-o', exe_path],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )

        if compile_result.returncode != 0:
            print("❌ Compilation failed:\n", compile_result.stderr)
            return 0

        for i, case in enumerate(test_cases, start=1):
            try:
                result = subprocess.run(
                    [exe_path],
                    input=case["input"],
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    text=True,
                    timeout=timeout
                )

                actual_output = result.stdout.strip()
                expected_output = case["expected"].strip()

                if actual_output == expected_output:
                    print(f"✅ Test {i}: Passed")
                    passed += 1
                else:
                    print(f"❌ Test {i}: Failed")
                    print(f"   Input: {case['input'].strip()}")
                    print(f"   Expected: {expected_output}")
                    print(f"   Got: {actual_output}")

            except subprocess.TimeoutExpired:
                print(f"⏰ Test {i}: Timed out")
            except Exception as e:
                print(f"⚠️ Test {i}: Runtime error - {e}")

    score = round((passed / total) * 100)
    print(f"🎯 Final Score: {score}%")
    return score
