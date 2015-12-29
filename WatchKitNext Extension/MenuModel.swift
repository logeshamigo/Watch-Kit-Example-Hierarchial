//
//  MenuModel.swift
//  WatchKitHierachial
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit

class MenuModel: NSObject {
    var menuTitle: String = ""
    var menuImage: String = ""
    
    init?(menuTitle: String, menuImage: String) {
        self.menuTitle = menuTitle
        self.menuImage = menuImage
    }
}
