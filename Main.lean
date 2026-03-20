import Lean4Heapsort.Basic

def main : IO Unit :=
  runBenchmark 1000000 10
