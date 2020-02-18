//
//  SecondViewController.swift
//  TableViewDropdownExperiment
//
//  Created by IKRAMUZZAMAN MUNTASIR on 19/2/20.
//  Copyright © 2020 IKRAMUZZAMAN MUNTASIR. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let tableView = UITableView()
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    let operatorStrings = ["Grameenphone", "Robi", "BanglaLink", "Airtel"]
    let operatorImages = [ #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.46.00 AM") , #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.38 AM"), #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.42 AM"), #imageLiteral(resourceName: "Screenshot 2020-02-18 at 12.45.49 AM") ]
    
    var dropDownVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customiseButton()
        customiseTableView()
        
    }
    
    func customiseButton() {
        
        dropDownButton.layer.cornerRadius = 10
        
    }
    
    func customiseTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let frame = dropDownButton.frame
        
        tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        
        view.addSubview(tableView)
        
    }
    
    
    @IBAction func dropDownButtonPressed(_ sender: UIButton) {
        
        let frame = dropDownButton.frame
        
        UIView.animate(withDuration: 0.3, animations: {
            
            if self.dropDownVisible {
                
                self.tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)

            } else {
                
                self.tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 200)
            }
            
        })
        
        
        
        dropDownVisible = !dropDownVisible
    
    }
    

}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operatorImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        cell.cellImageView.image = operatorImages[indexPath.row]
        cell.cellLabel.text = operatorStrings[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let frame = dropDownButton.frame
        dropDownButton.titleLabel?.text = operatorStrings[indexPath.row]
        
        self.tableView.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: frame.width, height: 0)
        dropDownVisible = false
    }
    
    
    
}
