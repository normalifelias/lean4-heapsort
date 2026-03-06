def par := fun i => (i-1) / 2 --calculate relatives to a node by using its index
def lCh := (· * 2 + 1)
def rCh := (· * 2 + 2)

def Array.swap! [Inhabited α] (xs : Array α) (i j : Nat) : Array α := --swaps without index safety
  let tmp := xs[i]!
  (xs.set! i xs[j]!).set! j tmp

partial def siftDown [Inhabited α] (le : α → α → Bool) (heap : Array α) (i heapsize : Nat): Array α := --starts a a certain node and works its way down, resoring the max-heap property
  if (lCh i < heapsize) ∧ (le heap[i]! heap[lCh i]!) then --left child?
    if (rCh i < heapsize) ∧ (le heap[i]! heap[rCh i]!) then --right child?
      if le heap[lCh i]! heap[rCh i]! then --both exist and don't fit => which is larger?
        siftDown le (heap.swap! (rCh i) i) (rCh i) heapsize --right one is largest
      else
        siftDown le (heap.swap! (lCh i) i) (lCh i) heapsize --left one is largest
    else
      siftDown le (heap.swap! (lCh i) i) (lCh i) heapsize --right child does not exist, but left child does not fit
  else
    if (rCh i < heapsize) ∧ (le heap[i]! heap[rCh i]!) then --right child?
      siftDown le (heap.swap! (rCh i) i) (rCh i) heapsize ----left child does not exist, but right child does not fit
    else
      heap --no children or both fit

def cH_helper [Inhabited α] (le : α → α → Bool) (xs : Array α) (i : Nat): Array α := --works its way up the heap restoring max-heap property downwards
  if i = 0 then --finished?
    siftDown le xs 0 xs.size --one last time
  else
    cH_helper le (siftDown le xs i xs.size) (i-1) --do it for every node

def createHeap [Inhabited α] (le : α → α → Bool) (xs : Array α) : Array α := --calls helper to build heap
  cH_helper le xs (xs.size/2) --can start at half, because the other half is leaves

def mHS_helper [Inhabited α] (le : α → α → Bool) (heap : Array α) (heapsize : Nat): Array α := --sorts a heap by extracting the max element and moving it to the end of the array
  if heapsize = 0 then heap --finished => return
  else
    mHS_helper le (siftDown le (heap.swap! 0 (heapsize - 1)) 0 (heapsize-1)) (heapsize - 1) --swap with last element of heap, make the heap one element samller and restore max-heap property

def myHeapSort [Inhabited α] (xs : Array α) (le : α → α → Bool): Array α := --creates heap and calls helper to sort
  mHS_helper le (createHeap le xs) xs.size

def testValues2 : Array Nat := #[47, 13, 82, 6, 91, 34, 57, 23, 76, 41, 88, 3, 65, 29, 54, 17, 72, 39, 84, 11, 63, 28, 95, 42, 7, 56, 31, 78, 19, 67, 44, 90, 25, 58, 14, 83, 37, 62, 9, 71, 48, 26, 93, 15, 52, 38, 77, 22, 69, 4, 86, 33, 61, 18, 45, 79, 12, 57, 35, 81, 24, 68, 43, 96, 8, 53, 27, 74, 16, 89, 41, 64, 30, 55, 20, 73, 46, 85, 10, 60, 36, 92, 21, 49, 66, 32, 75, 5, 87, 40, 59, 28, 70, 38, 94, 50, 80, 2, 97, 44]
def le_Nat (x y : Nat): Bool := x ≤ y
#eval myHeapSort testValues2 le_Nat
