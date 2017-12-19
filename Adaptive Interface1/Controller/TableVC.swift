//
//  TableVC.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 18/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit
import SVProgressHUD


class TableVC: UIViewController {

    //MARK: - IBoutles
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variable
   
    let service = DataService.instance
    var contentArray = [ImageContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableView.dataSource = self
        tableView.delegate = self
        
        SVProgressHUD.setDefaultMaskType(.black)
        
        service.getRawHTML(hashTag: "japan") { (success, responseMsg, responseData) in
            SVProgressHUD.show()
            if success{
                if responseData != nil{
                    SVProgressHUD.showSuccess(withStatus: responseMsg)
                    SVProgressHUD.dismiss(withDelay: 0.3)
                    self.contentArray = responseData!
                   self.tableView.reloadData()
                }else{
                    SVProgressHUD.showError(withStatus: responseMsg)
                }
            }else{
                SVProgressHUD.showError(withStatus: responseMsg)
            }
        }
        
       tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
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
            print("to return \(contentArray.count)")
            return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as? WorkCell{
            cell.configureCell(content: contentArray[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }//end cellForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WorkCell else {return}
        
        var work = contentArray[indexPath.row]
        
        cell.moreInfoTextView.text = work.caption
        cell.moreInfoTextView.textAlignment = .left
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        //tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
        //print(work.caption)
    }
    
}
