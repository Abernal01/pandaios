//
//  DriveViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 10/24/22.
//

import UIKit

class DriveViewController: UIViewController {
    
    //sets countdown equal to user time input * 60 so its in mintues
    var countdown = UserDefaults.standard.integer(forKey: "time") * 60
    var timer = Timer()
    var counter = 0
   
    @IBOutlet var driveScreenBG: UIImageView!
    
    
    @IBOutlet weak var countDownLbl: UILabel!
    
    @IBOutlet var driver: UIImageView!
    @IBOutlet var bg: UIImageView!
    @IBOutlet var driveScreenCar: UIImageView!
    @IBOutlet var passenger: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setPassenger()
        setResources()
        
        
        //sets countdown timer to corect formant upon loading
        countDownLbl.text =  timeString(time: TimeInterval(countdown))
       
        // tracks if app is moved into background
        let notificationCenter = NotificationCenter.default
         notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
       
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 29, repeats: true, block: { _ in
            self.coinCounter()
           })
        
       
    }
    func setResources(){
        let a = UserDefaults.standard.bool(forKey: "foxBool")
        let b = UserDefaults.standard.bool(forKey: "convertBool")
        let c = UserDefaults.standard.bool(forKey: "nightBool")
        
        if (a){
            driver.image = UIImage(named: "headFox")
        }
        if(b) {
            driveScreenCar.loadGif(asset: "convertDrive")
        }else{
            driveScreenCar.loadGif(asset: "taxiDriveScreen")
        }
        if(c){
            driveScreenBG.loadGif(asset: "drivingNight")
        }else{
            driveScreenBG.loadGif(asset: "drivingDay")
        }
    }
    
    //randomizes the passenger in the car
    func setPassenger(){
        let x = Int.random(in: 1..<4)
       
        if x == 1{
            passenger.image = UIImage(named: "headPen")
        }else if(x==2){
            passenger.image = UIImage(named: "headLion")
        }else if (x == 3){
            passenger.image = UIImage(named: "headCat")
        }
        print(x)
    }
    
    //adds 1 coin 
    func coinCounter(){
                counter += 100
        UserDefaults.standard.set(counter, forKey: "CoinsEarnedFromTimer")
        print("coin +=1", counter)
        
    }
    
    //formats timer corectly 
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    // updates timer
    @objc func countDownMethod(){
        //timer countdown by 1 sec
        countdown -= 1
        countDownLbl.text = timeString(time: TimeInterval(countdown))
        
        //timer stops when it hits 0
        if countdown == 0{
            timer.invalidate()
            
            counter = 0
            UserDefaults.standard.set(counter, forKey: "CoinsEarnedFromTimer")
            print(counter)
            
            
           // sends user to Finish Screen when timer ends
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Finish") as! FinishViewController
            self.present(nextViewController, animated:true, completion:nil)
            
            
            
        }
    }
    
    
    

    //if app moves to background this method excecutes
    @objc func appMovedToBackground() {
        print("App moved to background!")
        
        timer.invalidate()
        self.timer.invalidate()
        
        //sends user to crash screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Crash") as! CrashViewController
        self.present(nextViewController, animated:true, completion:nil)
       
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
