import Lean4Heapsort.Basic

def main : IO Unit :=
  runBenchmark 400000 10
