//
//  ViewController.swift
//  HitList
//
//  Created by Christopher Myers on 9/20/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " \"The List\" "
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel!.text = names[indexPath.row]
        
        return cell!
    }

    @IBAction func addHit(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action:UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.names.append(textField!.text!)
            self.tableView.reloadData()
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
            (action : UIAlertAction) -> Void in
            }
        
        alert.addTextFieldWithConfigurationHandler {(textField : UITextField) -> Void in
        
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }

}

