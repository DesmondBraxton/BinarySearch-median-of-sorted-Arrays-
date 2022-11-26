import UIKit

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    if nums1.count < nums2.count {
        findMedianSortedArrays(nums2, nums1)
    }
    
    var x = nums1.count
    var y = nums2.count
    var left = 0
    var right = x
    
    while left <= right {
        let pivotX = (left + right)/2
        let pivotY = (x+y+1)/2 - pivotX
        
        let leftX = pivotX == 0 ? Int.min : nums1[pivotX - 1]
        let leftY = pivotY == 0 ? Int.min : nums2[pivotY - 1]
        let rightX = pivotX == x ? Int.max : nums1[pivotX]
        let rightY = pivotY == y ? Int.max : nums2[pivotY]
        
        if leftX <= rightY && leftY <= rightX {
            if (x+y) % 2 == 0 {
                return (Double(max(leftX, leftY)) + Double(min(rightY, rightX))) / 2
            } else {
               return Double(max(leftX, leftY))
            }
        }
        
        if leftX > rightY {
            right = pivotX - 1
        } else {
             left = pivotX + 1
        }
    }

    return 0.0
}



