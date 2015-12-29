//
//  InterfaceController.swift
//  WatchKitNext Extension
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var menuTable: WKInterfaceTable!
    
    //Menu table
    var newsMenu = MenuModel.init(menuTitle: "News", menuImage: "news_icon")
    var blogMenu = MenuModel.init(menuTitle: "Blog", menuImage: "blogs_icon")
    var featuredJobs = MenuModel.init(menuTitle: "Featured Jobs", menuImage: "featured_jobs_icon")
    var menus:[MenuModel] = []
    
    
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        menus.append(newsMenu!)
        menus.append(blogMenu!)
        menus.append(featuredJobs!)
        loadTableData()
    }
    
    private func loadTableData() {
        
        menuTable.setNumberOfRows(menus.count, withRowType: "menuTable")
        
        for (index, menu) in menus.enumerate() {
            
            let row = menuTable.rowControllerAtIndex(index) as! FeedsTableRow
            
            row.feedTitle.setText(menu.menuTitle)
            row.feedImage.setImage(UIImage(named: menu.menuImage))
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let feedType = rowIndex
        return feedType
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
