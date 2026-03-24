import Lean4Heapsort.Basic

def main : IO Unit := do
  IO.println "SHUFFLED"
  IO.println "lt"
  runBenchmark 400000 10 (· < ·) Array.range
  IO.println "le"
  runBenchmark 400000 10 (· ≤ ·) Array.range
  IO.println "\nSAME VALUE"
  IO.println "lt"
  runBenchmark 400000 10 (· < ·) (Array.replicate · 42)
  IO.println "le"
  runBenchmark 400000 10 (· ≤ ·) (Array.replicate · 42)
