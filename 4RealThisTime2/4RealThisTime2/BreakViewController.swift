//
//  BreakViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 11/3/22.
//

import UIKit

class BreakViewController: UIViewController {
    
    @IBOutlet weak var countdownBreakLbl: UILabel!
    
    @IBOutlet weak var SkipButtonTxt: UIButton!
    
    @IBOutlet var breakBG: UIImageView!
    
    var timer = Timer()
    var timerValue = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setResources()
       
        
        countdownBreakLbl.text =  timeString(time: TimeInterval(timerValue))

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
        
        
    }
    
    func setResources(){
        let a = UserDefaults.standard.bool(forKey: "foxBool")
        if (a){
            breakBG.loadGif(asset: "foxBreakScreen")
        }else{
            breakBG.loadGif(asset: "pandaBreakScreen")
        }
    }
    
    @objc func countDownMethod(){
        //timer countdown by 1 sec
        timerValue -= 1
        countdownBreakLbl.text = timeString(time: TimeInterval(timerValue))
        
        //timer stops when it hits 0
        if timerValue == 0{
            timer.invalidate()
            SkipButtonTxt.setTitle("Lets Drive!", for: .normal)
            
        }
    }
        
        func timeString(time:TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

