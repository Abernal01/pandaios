//
//  ViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 10/24/22.
//

import UIKit
import SwiftUI

class Homecntrl: UIViewController {
    
    @IBOutlet weak var timerInput: UITextField!
    @IBOutlet weak var coinValueLbl: UILabel!
    
    @IBOutlet var characterHome: UIImageView!
    @IBOutlet var carHome: UIImageView!
    @IBOutlet var homeBG: UIImageView!
    
    @IBAction func StartButton(_ sender: Any) {
        UserDefaults.standard.set(timerInput.text, forKey: "time")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setResources()
        
        coinValueLbl.text = UserDefaults.standard.integer(forKey: "CoinsTotal").formatted()
        
        if let DefaultTime = UserDefaults.standard.string(forKey: "time"){
            timerInput.text = DefaultTime
            
        }
    }
    
    func setResources(){
        let a = UserDefaults.standard.bool(forKey: "foxBool")
        let b = UserDefaults.standard.bool(forKey: "nightBool")
        let c = UserDefaults.standard.bool(forKey: "convertBool")
        
        if (a){
            characterHome.loadGif(asset: "foxHome")
        }else{
            characterHome.loadGif(asset: "pandahome")
        }
        if(b){
            homeBG.image = UIImage(named: "nightHome")
        }
        if(c){
            carHome.image = UIImage(named: "convertMain")
        }
    }
    
    
    
}
