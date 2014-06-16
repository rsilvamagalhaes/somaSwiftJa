//
//  ViewController.swift
//  somaSwiftJa
//
//  Created by Rodrigo Magalhaes on 09/06/14.
//  Copyright (c) 2014 magalhaes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var text1: UITextField
    @IBOutlet var text2: UITextField
    @IBOutlet var tableView : UITableView
    var items: String[] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    @IBAction func somar(sender : AnyObject) {
        let valor1:Double? = text1.text.bridgeToObjectiveC().doubleValue
        let valor2:Double? = text2.text.bridgeToObjectiveC().doubleValue
        var soma = valor1! + valor2!
        var item:String = "\(self.getHour())      # A soma foi: \(soma)"
        
        self.items = self.mergeItemInItems(self.items, item: item)

        self.tableView.reloadData()
        self.limparText()
        self.text1.becomeFirstResponder()
        self.view.endEditing(true)
    }
   
    func getOldItemsString(arrayParam: String[]) -> String[] {
        var arrayResult: String[] = []
        for var index = 0; index < arrayParam.count; index++ {
            arrayResult.append(arrayParam[index])
        }
        return arrayResult
    }
    
    func mergeItemInItems(arrayParam : String[], item : String) -> String[] {
        var arrayResult: String[] = []

        var oldItems : String[] = []
        oldItems = self.getOldItemsString(arrayParam)
        self.items.removeAll()
        
        arrayResult.append(item)
        for var index = 0; index < oldItems.count; index++ {
            arrayResult.append(oldItems[index])
        }
        
        
        return arrayResult
    }
    
    func getHour() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.stringFromDate(NSDate())
    }
    
    func limparText() {
        text1.text = ""
        text2.text = ""
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = self.items[indexPath.row]
        return cell
    }
    
    
    
}

