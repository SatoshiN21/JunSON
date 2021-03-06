//
//  ViewController.swift
//  JUNSON
//
//  Created by SatoshiN21 on 09/29/2016.
//  Copyright (c) 2016 SatoshiN21. All rights reserved.
//

import UIKit
import JUNSON

class ViewController: UITableViewController {

    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard
            let path = Bundle.main.path(forResource: "star_wars", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return
        }
        
        let json = JUNSON(data: data)
        persons = json["results"].toArray().map({$0.decode()})
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = persons[indexPath.row].name
        return cell
    }
}

