//
//  FeedsInterfaceController.swift
//  WatchKitHierachial
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation


class FeedsInterfaceController: WKInterfaceController {
     @IBOutlet weak var newsTable: WKInterfaceTable!
    
    
    //News feeds
    var playingAidGame = FeedModel.init(feedTitle: "Playing the Aid game", feedImage: "PAG", feedDescription: "Full description")
    
    var moreGrads = FeedModel.init(feedTitle: "More grads have Excessive debt", feedImage: "news", feedDescription: "Full description")
    
    var firedOver = FeedModel.init(feedTitle: "Fired over a Phallus?", feedImage: "FOP", feedDescription: "Full description")
    
    var mandatoryDrug = FeedModel.init(feedTitle: "Mandatory Drug Testing", feedImage: "news", feedDescription: "Full description")
    
    var tighterReins = FeedModel.init(feedTitle: "Tighter Reins on Accreditor", feedImage: "news", feedDescription: "Full description")
    
    
    var news:[FeedModel] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let feedType = context as? Int {
           
            switch feedType
            {
            case 0:
                 self.setTitle("News")
            case 1:
                 self.setTitle("Blog")
            case 2:
                 self.setTitle("Featured Jobs")
            default:
                print("Something else")
            }
        }
        
        // Configure interface objects here.
        news.append(playingAidGame!)
        news.append(moreGrads!)
        news.append(firedOver!)
        news.append(tighterReins!)
        news.append(mandatoryDrug!)
        loadTableData()
    }

    private func loadTableData() {
        
        newsTable.setNumberOfRows(news.count, withRowType: "feedsRow")
        
        for (index, feed) in news.enumerate() {
            
            let row = newsTable.rowControllerAtIndex(index) as! FeedsTableRow
            
            row.feedTitle.setText(feed.feedTitle)
            row.feedImage.setImage(UIImage(named: feed.feedImage))
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let feed = news[rowIndex]
        return feed
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
