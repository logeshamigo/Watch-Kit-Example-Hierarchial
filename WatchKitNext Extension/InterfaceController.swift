//
//  InterfaceController.swift
//  WatchKitNext Extension
//
//  Created by Logesh K on 24/12/15.
//  Copyright © 2015 innoppl. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {

    @IBOutlet weak var menuTable: WKInterfaceTable!
    
    //Menu table
    var newsMenu = MenuModel.init(menuTitle: "News", menuImage: "news_icon")
    var blogMenu = MenuModel.init(menuTitle: "Blog", menuImage: "blogs_icon")
    var featuredJobs = MenuModel.init(menuTitle: "Featured Jobs", menuImage: "featured_jobs_icon")
    var menus:[MenuModel] = []
    
    
    var session : WCSession!
    
    
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
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        sendMessageToPhone()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func sendMessageToPhone() {
    
        let applicationData = ["testValue":"My test message"]
        
        session.sendMessage(applicationData, replyHandler: { reply in
            //self.statusLabel.setText(reply["status"] as? String)
            print(reply["Key1"])
            }, errorHandler: { error in
                print("error: \(error)")
        })
    }
    
    

}
