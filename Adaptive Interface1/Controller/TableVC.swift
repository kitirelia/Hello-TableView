//
//  TableVC.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 18/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit

class TableVC: UIViewController {

    //MARK: - IBoutles
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}


//MARK: - Extension
extension TableVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bioCell", for: indexPath) as? BioCell{
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
    
}
