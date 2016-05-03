//
//  ViewController.swift
//  TodoApp
//
//  Created by Alumno on 30/03/16.
//  Copyright © 2016 ITESM. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemDelegate {
    var items: [ChecklistIttem]
    var  namelala = ""

    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistIttem]()
        super.init(coder: aDecoder)
        //loadCheckListItems()
    }
   // func loadCheckListItems(){
     //   let path = dataFilePath()
       // if NSFileManager.defaultManager().fileExistsAtPath(path){
         //   if let data = NSData(contentsOfFile: path){
           //     let unarchive = NSKeyedUnarchiver(forReadingWithData: data)
             //   items = unarchive.decodeObjectForKey("ChecklistItems") as! [ChecklistIttem]
              //  unarchive.finishDecoding()
            //}
        //}
    //}
    
     func buttonAdd(newItem: ChecklistIttem) {
        let nextItem = items.count
        
        items.append(newItem)
        let indexPath = NSIndexPath(forRow: nextItem , inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
      //  saveChecklistItems()
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
       
        let item = items[indexPath.row]
        label.text = item.text
        namelala = item.text
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        [self .performSegueWithIdentifier("gameDisplay", sender: self)]
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    func addItemDelegate(controller: AddItesmTableViewController, finishAddingItem item: ChecklistIttem) {
        buttonAdd(item)
        //saveChecklistItems()
        dismissViewControllerAnimated(true, completion: nil)
    }
    func addItemdelegateCancel(controller: AddItesmTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "additem"{
            let navigatorController = segue.destinationViewController as! UINavigationController
            let controller = navigatorController.topViewController as! AddItesmTableViewController
            controller.delegate = self
            if segue.identifier == "gameDisplay"{
               let desControl:ViewController = segue.destinationViewController as! ViewController
                desControl.nameTable = namelala
            }
            
        
        }
    }
    
    func documentsDirectory() ->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths [0]
    }
    func dataFilePath()->String{
        return(documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
    }
    //func saveChecklistItems(){
      //  let data = NSMutableData()
       // let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
       // archiver.encodeObject(items, forKey: "ChecklistItems")
       // archiver.finishEncoding()
        //data.writeToFile(dataFilePath(), atomically: true)
    //}
    
}

