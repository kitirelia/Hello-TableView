//
//  HiddenLabelVC.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 19/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit

class HiddenLabelVC: UIViewController {

    @IBOutlet weak var withDealLbl: UILabel!
    @IBOutlet weak var withDealNumLbl: UILabel!
    @IBOutlet weak var youSaveLbl: UILabel!
    @IBOutlet weak var youSaveNumLbl: UILabel!
    @IBOutlet weak var pinkLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func runitTapped(_ sender: Any) {
        self.withDealLbl.isHidden = !self.withDealLbl.isHidden
        self.withDealNumLbl.isHidden = !self.withDealNumLbl.isHidden
        
        self.youSaveLbl.isHidden = !self.youSaveLbl.isHidden
        
        self.youSaveNumLbl.isHidden = !self.youSaveNumLbl.isHidden
        
        self.pinkLbl.isHidden = !self.pinkLbl.isHidden

    }
    
}
