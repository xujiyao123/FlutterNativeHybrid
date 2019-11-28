//
//  MainViewController.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/27.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import UIKit
import flutter_boost

class MainViewController: UIViewController {

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.barTintColor = UIColor.cyan

    }
    
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction3(_ sender: Any) {
        self.navigationController?.pushViewController(XYViewController(), animated: true)

    }
    @IBAction func buttonAction2(_ sender: Any) {
        
        self.navigationController?.pushViewController(PushViewController(), animated: true)
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        FlutterBoostPlugin.open("first", urlParams: ["name" : "xujiyao"], exts: ["title": "flutter page1"], onPageFinished: { (result) in
            
           
            self.label1.text = "message:\n" + (result as! [String : String]) ["result"]!
        }) { (f) in
            print(f)
        }
        
//        FlutterBoostPlugin.sharedInstance()?.addEventListener({ (name, parm) in
//
//            print(name);
//            print(parm)
//            self.label1.text = name! + "\n message:" + parm!.description
//
//        }, forName: "pageback1")
        

    }
    
 

}
