//
//  MapViewController.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/28.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.navigationController?.setNavigationBarHidden(false, animated: true)
       }
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         self.navigationController?.setNavigationBarHidden(true, animated: true)
     }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let map = MKMapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.view.addSubview(map)
        
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
