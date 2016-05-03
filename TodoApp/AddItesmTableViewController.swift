//
//  AddItesmTableViewController.swift
//  TodoApp
//
//  Created by Alumno on 11/04/16.
//  Copyright © 2016 ITESM. All rights reserved.
//

import UIKit

protocol AddItemDelegate: class{
    func addItemdelegateCancel( controller: AddItesmTableViewController)
    func addItemDelegate( controller: AddItesmTableViewController,finishAddingItem item: ChecklistIttem)
}

class AddItesmTableViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     

    
    @IBAction func CancelAction(sender: AnyObject) {
        delegate?.addItemdelegateCancel(self)
    }
    
    @IBAction func DoneAcction(sender: AnyObject) {
        let item = ChecklistIttem()
        item.text = textField.text!
        
        delegate?.addItemDelegate(self, finishAddingItem: item)
    }
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }

   
}
