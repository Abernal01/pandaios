//
//  FinishViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 11/3/22.
//

import UIKit

class FinishViewController: UIViewController {

    var timerCoins = UserDefaults.standard.integer(forKey:  "CoinsEarnedFromTimer");
    var collected = false
    
    @IBOutlet var finishBG: UIImageView!
    @IBOutlet var finishCharcater: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setResources()
        finishBG.loadGif(asset: "finishBG")
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        
    }
    
    func setResources(){
        let a = UserDefaults.standard.bool(forKey: "foxBool")
        if (a){
            finishCharcater.loadGif(asset: "foxFinish")
        }else{
            finishCharcater.loadGif(asset: "pandaFinish")
        }
    }
    
    
    
    
    
    @IBAction func Cllct(_ sender: UIButton) {
        sender.isHidden = true
        increment()
        collected = true
    }
    
    // if collect button has not been clicked and user naviagtes elsewhere coins will still be collected 
    @IBAction func homeButton(_ sender: UIButton){
        if(!collected){
            increment()
        }
    }
    @IBAction func breakButton(_ sender: UIButton){
        if(!collected){
            increment()
        }
    }
    
    @IBAction func driveButton(_ sender:UIButton){
        if(!collected){
            increment()
        }
    }
    
    
    @IBOutlet weak var coinValueLbl: UILabel!
    
  
    
    
    
    func increment(){
        var coins = UserDefaults.standard.integer(forKey: "CoinsTotal")
        coins = coins + timerCoins
        UserDefaults.standard.set(coins, forKey: "CoinsTotal")
        
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        timerCoins = timerCoins * 0
        UserDefaults.standard.set(timerCoins, forKey: "CoinsEarnedFromTimer")
        
        
        
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
