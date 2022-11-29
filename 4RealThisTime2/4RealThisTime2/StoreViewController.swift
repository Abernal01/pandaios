//
//  StoreViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 11/15/22.
//

import UIKit

class StoreViewController: UIViewController {
    var pandaBool = true
    var dayBool = true
    var taxiBool = true
    
    var foxBool = false
    var nightBool = false
    var convertBool = false
    
    @IBOutlet var pandaOut: UISwitch!
    @IBOutlet var foxOut: UISwitch!
    
    @IBOutlet var dayOut: UISwitch!
    @IBOutlet var nightOut: UISwitch!
    
    @IBOutlet var taxiOut: UISwitch!
    @IBOutlet var convertOut: UISwitch!
    
    @IBOutlet var coinValueLbl: UILabel!
    
    @IBOutlet var buyBtn: UIButton!
    @IBOutlet var buyNightBtn: UIButton!
    @IBOutlet var buyConvertBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwicthes()
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pandaSwicth(_ sender: UISwitch) {
        if(sender.isOn){
            pandaBool = true
            foxBool = false
            
            foxOut.setOn(false, animated: true)
            UserDefaults.standard.set(pandaBool, forKey: "pandaBool")
            UserDefaults.standard.set(foxBool, forKey: "foxBool")
            
        }
    }
    
    @IBAction func buybtnACT(_ sender: Any) {
        let foxCost = 2
        let coins = UserDefaults.standard.integer(forKey: "CoinsTotal")
        
        let newtotal = coins - foxCost
        UserDefaults.standard.set(newtotal, forKey: "CoinsTotal")
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        
        buyBtn.isHidden = true 
    }
    
    @IBAction func buyNightAct(_ sender: Any) {
        let nightCost = 3
        let coins = UserDefaults.standard.integer(forKey: "CoinsTotal")
        
        let newtotal = coins - nightCost
        UserDefaults.standard.set(newtotal, forKey: "CoinsTotal")
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        
        buyNightBtn.isHidden = true
    }
    
    @IBAction func buyConvertAct(_ sender: Any) {
        let convertCost = 4
        let coins = UserDefaults.standard.integer(forKey: "CoinsTotal")
      
        let newtotal = coins - convertCost
        UserDefaults.standard.set(newtotal, forKey: "CoinsTotal")
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        print(newtotal)
        
        buyConvertBtn.isHidden = true
    }
    
    @IBAction func daySwitch(_ sender: UISwitch) {
        if(sender.isOn){
            dayBool = true
            nightBool = false
            
            nightOut.setOn(false, animated: true)
            UserDefaults.standard.set(dayBool, forKey: "dayBool")
            UserDefaults.standard.set(nightBool, forKey: "nightBool")
        }
    }
    
    @IBAction func taxiSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            taxiBool = true
            convertBool = false
            
            convertOut.setOn(false, animated: true)
            UserDefaults.standard.set(taxiBool, forKey: "taxiBool")
            UserDefaults.standard.set(convertBool, forKey: "convertBool")
        }
    }
    
    @IBAction func foxSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            pandaBool = false
            foxBool = true
            
            pandaOut.setOn(false, animated: true)
            UserDefaults.standard.set(pandaBool, forKey: "pandaBool")
            UserDefaults.standard.set(foxBool, forKey: "foxBool")
            
        }
        
    }
    
    
    @IBAction func nightSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            nightBool = true
            dayBool = false
            
            dayOut.setOn(false, animated: true)
            UserDefaults.standard.set(dayBool, forKey: "dayBool")
            UserDefaults.standard.set(nightBool, forKey: "nightBool")
        }
    }
    
    @IBAction func convertSwitch(_ sender: UISwitch) {
        if(sender.isOn){
            convertBool = true
            taxiBool = false
            
            taxiOut.setOn(false, animated: true)
            UserDefaults.standard.set(taxiBool, forKey: "taxiBool")
            UserDefaults.standard.set(convertBool, forKey: "convertBool")
        }
    }
    
    func setSwicthes(){
        let a = UserDefaults.standard.bool(forKey: "pandaBool")
        let b = UserDefaults.standard.bool(forKey: "foxBool")
        let c = UserDefaults.standard.bool(forKey: "dayBool")
        let d = UserDefaults.standard.bool(forKey: "nightBool")
        let e = UserDefaults.standard.bool(forKey: "taxiBool")
        let f = UserDefaults.standard.bool(forKey: "convertBool")
        
        if(a) {
            pandaOut.isOn = true
            foxOut.isOn = false
        }else if(b){
            pandaOut.isOn = false
            foxOut.isOn = true
        }
        if(c){
            dayOut.isOn = true
            nightOut.isOn = false
        }else if (d){
            dayOut.isOn = false
            nightOut.isOn = true
        }
        if(e){
            taxiOut.isOn = true
            convertOut.isOn = false
        }else if (f){
            taxiOut.isOn = false
            convertOut.isOn = true
        }
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
