//
//  math.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/9/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import Foundation

// MARK: Math

func ComputeTrainingMax(value: Int) -> Int {
    let training_max_double = Double(value) * 0.90
    return RoundToNearestFive(training_max_double)
    
}
func RoundToNearestFive(value: Double) -> Int {
    return 5 * Int(round(value / 5.0))
    
}
