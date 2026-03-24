import Lean4Heapsort.Basic

def main : IO Unit := IO.println ""
  /-IO.println "WARMUP"
  runBenchmark 400000 10 (· < ·) (Array.replicate · 42)

  IO.println "\n\nSHUFFLED RANGE"

  IO.println "lt"
  runBenchmark 400000 50 (· < ·) Array.range

  IO.println "le"
  runBenchmark 400000 50 (· ≤ ·) Array.range

  IO.println "\nSAME VALUE"

  IO.println "lt"
  runBenchmark 400000 50 (· < ·) (Array.replicate · 42)

  IO.println "le"
  runBenchmark 400000 50 (· ≤ ·) (Array.replicate · 42)-/
