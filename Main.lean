import Lean4Heapsort.Basic

def main : IO Unit :=
  runBenchmark 100000 10
