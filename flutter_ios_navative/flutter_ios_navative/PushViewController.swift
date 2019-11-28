//
//  PushViewController.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/28.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          self.navigationController?.setNavigationBarHidden(false, animated: true)
      }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func pushAction(_ sender: Any) {
        FlutterBoostPlugin.open("push2", urlParams: ["result" : "新ios页面"], exts: ["title": "new ios page"], onPageFinished: { (result) in
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
