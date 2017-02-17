//
//  StopWatch.swift
//  Timer
//
//  Created by siyuan on 2/16/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import Foundation
class StopWatch {


    var hr = 00
    var mut = 00
    var sec = 00
    func increaseUnitTime() {
        sec += 1
    }
    func setZero() {
        hr = 00
        mut = 00
        sec = 00
    }
    func getHr() -> Int {
        return hr
    }
    func getMut() -> Int {
        return mut
    }
    func getSec() -> Int {
        return sec
    }
}
