//
//  ViewController.swift
//  todo_ios
//
//  Created by Raiyan Khan on 21/9/19.
//  Copyright © 2019 Raiyan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let array : [String] = ["Item1", "Item2", "Item3", "Item4", "Item5"]
    
    let cellReuseIdentifier = "itemCell"

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }


    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        
        
        cell?.textLabel?.text = array[indexPath.row]
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

