//
//  SecondViewController.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/27.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var param : [String : Any]?
    var isHiden : Bool = false
    
    init(_ param : [String : Any]?, _ ishiden : Bool) {
        super.init(nibName: nil, bundle: nil)
        self.param = param
        self.isHiden = ishiden
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (isHiden) {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let p = param {
            self.label.text = p["result"] as! String
        }
        
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonAction1(_ sender: Any) {
        
        FlutterBoostPlugin.open(boostflag + "Second", urlParams: ["result" : "新ios页面"], exts: ["title": "new ios page"], onPageFinished: { (result) in
             }) { (f) in
             }
    }
    @IBAction func buttonAction2(_ sender: Any) {

        self.isHiden = true
        FlutterBoostPlugin.open("push", urlParams: ["name" : "从iospush过去的页面"], exts: ["title": "flutter page1"], onPageFinished: { (result) in
          }) { (f) in
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
