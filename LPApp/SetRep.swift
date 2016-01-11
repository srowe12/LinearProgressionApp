//
//  SetRep.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/2/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import Foundation

class LiftList {
    let bench_heavy = BenchHeavy()
    let squats = Squats()
    let ohp = Ohp()
    let deadlifts = Deadlifts()
    let bench_light = BenchLight()
    var rep_dictionary =  [String : [Int]]() // = ["Squats": squats.reps]
    var percent_dictionary = [String : [Double]]() // ["Squats": squats.percents
    init() {
        rep_dictionary["Bench"] = bench_heavy.reps
        rep_dictionary["Squats"] = squats.reps
        rep_dictionary["OHP"] = ohp.reps
        rep_dictionary["Bench Hypertrophy"] = bench_light.reps
        rep_dictionary["Deadlifts"] = deadlifts.reps
        
        percent_dictionary["Bench"] =      bench_heavy.percents
        percent_dictionary["Squats"] =  squats.percents
        percent_dictionary["OHP"] = ohp.percents
        percent_dictionary["Bench Hypertrophy"] = bench_light.percents
        percent_dictionary["Deadlifts"] = deadlifts.percents
        
        
    }
    // MARK: Properties
    //SetRep should contain ...not sure.
}

class BenchLight {
    let reps:[Int] = [8,6,4,4,4,5,6,7,8]
    let percents:[Double] =  [0.65, 0.75, 0.85, 0.85, 0.85, 0.80, 0.75, 0.70, 0.65] //Find percents later
    
}

class Squats {
    let reps:[Int] = [5,3,1,3,3,3,5,5,5]
    let percents:[Double] = [0.75, 0.85, 0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.65]
}

class Ohp {
    let reps:[Int] = [5,3,1,3,3,3,5,5,5]
    let percents:[Double] = [0.75, 0.85, 0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.65]
}

class Deadlifts {
    let reps:[Int] = [5,3,1,3,3,3,3,3,3]
    let percents:[Double] = [0.75, 0.85, 0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.65]
}


class BenchHeavy {
    let reps:[Int] = [5,3,1,3,5,3,5,3,5]
    let percents:[Double] = [0.75, 0.85, 0.95, 0.90, 0.85, 0.80, 0.75, 0.70, 0.65]
}
