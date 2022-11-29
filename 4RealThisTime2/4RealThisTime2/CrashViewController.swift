//
//  CrashViewController.swift
//  4RealThisTime2
//
//  Created by Milksteaks on 11/3/22.
//

import UIKit

class CrashViewController: UIViewController {

    @IBOutlet var crashBG: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        crashBG.loadGif(asset: "Crash")
        // Do any additional setup after loading the view.
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
