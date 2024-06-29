

func standartBinarySearch(numbers: [Int], searchNumber: Int) -> Int {
  var start = 0
  var mid = numbers.count / 2
  var end = numbers.count - 1
  while start <= end {
    if numbers[mid] == searchNumber {
      return mid
    }
    if numbers[mid] < searchNumber {
      start = mid + 1
    } else {
      end = mid - 1
    }
    mid = (start + end) / 2
  }
  return -1
}

func recBinarySearch(numbers: [Int], searchNumber: Int) -> Int {
  func recBinarySearch(numbers: [Int], searchNumber: Int, start: Int, end: Int) -> Int {
    if start > end {
      return -1
    }
    
    let mid = (start + end) / 2
    
    if (numbers[mid] == searchNumber) {
      return mid
    } else if numbers[mid] < searchNumber {
      let newStart = mid + 1
      return recBinarySearch(numbers: numbers, searchNumber: searchNumber, start: newStart, end: end)
    } else if numbers[mid] > searchNumber {
      let newEnd = mid - 1
      return recBinarySearch(numbers: numbers, searchNumber: searchNumber, start: start, end: newEnd)
    }
    return -1
  }
  
  let start = 0
  let end = numbers.endIndex - 1
  
  return recBinarySearch(numbers: numbers, searchNumber: searchNumber, start: start, end: end)
}

standartBinarySearch(numbers: [1, 2, 4], searchNumber: 4)
recBinarySearch(numbers: [1, 2, 3, 4], searchNumber: 1)


