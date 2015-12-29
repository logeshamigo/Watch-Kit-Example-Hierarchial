//
//  FeedModel.swift
//  WatchKitEx2
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit

class FeedModel: NSObject {
    
    var feedTitle: String = ""
    var feedImage: String = ""
    var feedDescription: String = ""
    
    init?(feedTitle: String, feedImage: String, feedDescription: String) {
        
        self.feedTitle = feedTitle
        self.feedImage = feedImage
        self.feedDescription = feedDescription
    }
}
