//
//  ControllerConfig.swift
//  flutter_ios_navative
//
//  Created by 徐继垚 on 2019/11/28.
//  Copyright © 2019 徐继垚. All rights reserved.
//

import Foundation
import UIKit


var boostflag = "_ios_"

@objc
class BoostControllerConfig : NSObject {

    @objc
    static var controllers : [String : BoostModel] {
        return [ boostflag + "main" : BoostModel({_,_,_ in MainViewController()}),
                 boostflag + "Second" : BoostModel({ (_, param, _) -> UIViewController in
                    return SecondViewController(param , true)
                 }),
                 boostflag + "map" : BoostModel({_,_,_ in MapViewController()})]
    }
    
    
}
@objc
class BoostModel : NSObject {
    @objc
    var BoostBlockSwift : ((String , [String: Any] ,[String : Any]) -> UIViewController)?
    
    init(_ block : @escaping ((String , [String: Any] ,[String : Any]) -> UIViewController)) {
        super.init()
        
        self.BoostBlockSwift = {(name , param , exits) in
            return block(name , param , exits)
        }
    }
}
