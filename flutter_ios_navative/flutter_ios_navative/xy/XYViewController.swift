//
//  XYViewController.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/28.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import UIKit

class XYViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationController?.setNavigationBarHidden(false, animated: true)
      }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBOutlet weak var scrollerView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)
        self.navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.90, blue:0.07, alpha:1.00)
        self.scrollerView.showsVerticalScrollIndicator = false
        addImageOnViewWithImage()
        // Do any additional setup after loading the view.
    }

    func addImageOnViewWithImage(){

        let image = UIImage(named: "11.png")!
        let imageh = image.size.height * UIScreen.main.bounds.width / image.size.width
     
        self.scrollerView.contentSize = CGSize(width: 0, height: imageh)
        let iamgeView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: imageh))
//        iamgeView.contentMode = .scaleAspectFit
        iamgeView.image = image
        self.scrollerView.addSubview(iamgeView)
        
        let button = UIButton(frame: self.view.frame);
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.scrollerView.addSubview(button)
 
        
    }

    @objc func buttonAction() {
        FlutterBoostPlugin.open( "XY1", urlParams: ["result" : "新ios页面"], exts: ["title": "new ios page"], onPageFinished: { (result) in
                     }) { (f) in
                 }
    }
  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
