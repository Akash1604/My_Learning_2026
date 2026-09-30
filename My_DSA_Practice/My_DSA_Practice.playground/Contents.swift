import UIKit
import Foundation

// MARK: Sorted array removing duplicates
func removeDuplicates(sortedArr: inout [Int]) {
    // Edge case: An empty array has no duplicates
    guard !sortedArr.isEmpty else { return }
    
    var i = 1
    var k = 0
    
    while i < sortedArr.count {
        if sortedArr[k] != sortedArr[i] {
            k = k + 1
            sortedArr[k] = sortedArr[i]
        }
        i = i + 1
    }
    
    // CRITICAL FIX: Remove the leftover elements from index k + 1 to the end
    sortedArr.removeSubrange((k + 1)..<sortedArr.count)
    
    
    // Below raw Looping to remove trailing duplicate elements
    
//    var startRemoveIndex = k
//    print("startRemoveIndex_start: \(startRemoveIndex)")
//    while true {
//        if startRemoveIndex >= sortedArr.count {
//            break;
//        }
//        if startRemoveIndex < sortedArr.count {
//            sortedArr.removeLast()
//            startRemoveIndex = k + 1;
//            print("startRemoveIndex: \(startRemoveIndex)")
//        }
//    }
    
}

var sortedArr = [1, 1, 2, 3, 3, 4, 4, 5, 6, 7]

//removeDuplicates(sortedArr: &sortedArr)
//var setArray = Set(sortedArr).sorted()
//print("Unique Array: \(setArray)")
// Output: Unique Array: [1, 2, 3, 4, 5, 6, 7]

