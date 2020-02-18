//
//  ViewController.swift
//  TableViewDropdownExperiment
//
//  Created by IKRAMUZZAMAN MUNTASIR on 18/2/20.
//  Copyright © 2020 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let operatorStrings = ["Grameenphone", "Robi", "BanglaLink", "Airtel"]
    let operatorImages = [ #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.46.00 AM") , #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.38 AM"), #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.42 AM"), #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.49 AM") ]
    @IBOutlet weak var chooseOperatorButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        nextViewButton.layer.cornerRadius = 5
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = !(self.tableView.isHidden)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operatorImages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        //cell.imageView?.image = operatorImages[indexPath.row]
        //cell.textLabel?.text = operatorStrings[indexPath.row]
        cell.cellImageView.image = operatorImages[indexPath.row]
        cell.cellLabel.text = operatorStrings[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chooseOperatorButton.setTitle(tableView.cellForRow(at: indexPath)?.textLabel?.text, for: .normal)  
    }
    
    
}

