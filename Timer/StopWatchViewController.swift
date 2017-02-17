//
//  StopWatchViewController.swift
//  Timer
//
//  Created by siyuan on 2/16/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    var isStopped = 1
    var stpw: StopWatch?
    var keepCalling: Timer?
    var nowPos = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var ShowTime: UILabel!
    @IBAction func StartPressed(_ sender: UIButton) {
        if (isStopped == 0) {return};
        if (nowPos != 0) {
            keepCalling = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                               selector: #selector(StopWatchViewController.callSomeMethodWithParams(_:)),
                                               userInfo: nil,
                                               repeats: true)
            isStopped = 0
            nowPos = 1
            return
        }
        stpw = StopWatch()
        keepCalling = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                               selector: #selector(StopWatchViewController.callSomeMethodWithParams(_:)),
                                               userInfo: nil,
                                               repeats: true)
        isStopped = 0
        nowPos = 1
        return
    }
    @IBAction func StopPressed(_ sender: UIButton) {
        if (isStopped == 1) {//the timer is off
            
            ShowTime.text = "00:00:00"
            stpw!.setZero()
            keepCalling!.invalidate()
            nowPos = 0
        } else {//the timer is on
            keepCalling!.invalidate()
            isStopped = 1
            nowPos = 1
        }
        
    }
    
    func callSomeMethodWithParams(_ timer: Timer) {
        stpw!.increaseUnitTime()
        showTimeToText(stpw!.getHr(), stpw!.getMut(), stpw!.getSec())
    }
    func showTimeToText(_ hr: Int, _ mut: Int, _ sec: Int) {
        let str1 = String(hr)
        let str2 = String(mut)
        let str3 = String(sec)
        let theStr = str1+":"+str2+":"+str3
        ShowTime.text = theStr
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
