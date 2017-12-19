//
//  DataService.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 18/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class DataService{
    
    static let instance = DataService()
    
    
    func getRawHTML(hashTag:String,completion:@escaping ServiceCompletion){
        Alamofire.request("https://www.instagram.com/explore/tags/\(hashTag)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: INIT_HEADER).responseString { (response) in
         
            let  rawHtml:String = response.description
            if  let startSub = rawHtml.range(of: "window._sharedData = "),let endSub = rawHtml.range(of: ";</script>")
                {
                    let substring = rawHtml[startSub.upperBound..<endSub.lowerBound]
                    let jsonString = String(substring)
                    var finalJSON = JSON(parseJSON: jsonString)
                    let entry_data = finalJSON["entry_data"]["TagPage"][0]["graphql"]["hashtag"]["edge_hashtag_to_media"]["edges"]
                        
                    if(entry_data != nil){
                        var dataArray = [ImageContent]()
                        
                        for (_,subJson):(String, JSON) in entry_data {
        
                            let item = subJson
                            
                            let owner = item["node"]["owner"]["id"].stringValue
                            let caption = item["node"]["edge_media_to_caption"]["edges"][0]["node"]["text"].stringValue
                            let displayUrl = item["node"]["display_url"].stringValue
                            let thumbUrl = item["node"]["thumbnail_src"].stringValue
                            
//                            print("owner \(owner)")
//                             print("caption \(caption)")
//                             print("displayUrl \(displayUrl)")
//                             print("thumbUrl \(thumbUrl)")
//                            print("--")
                            let imageContent = ImageContent(caption: caption, displayUrl: displayUrl, thumbUrl: thumbUrl, owner: owner)
                            dataArray.append(imageContent)
                        }
                        
                        if dataArray.count > 0{
                            return completion(true, "Success", dataArray)
                        }else{
                            return completion(false, "No Data", nil)
                        }
                        
                    }else{
                        return completion(false, "Missing Some Data", nil)
                    }
                    
            }else{
                return completion(false, "Cannont Parse Data", nil)
            }
        }
    }
    
    func getHomePage(hashTag:String,completion:@escaping CompletionHandler){
        Alamofire.request("https://www.instagram.com/explore/tags/\(hashTag)/?__a=1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {
                    debugPrint(response.result.error as Any)
                    return completion(false)
                }//end guard
                
                if let json = JSON(data:data).dictionary{
                    print("\n\n-----")
                    print(json["graphql"])
                   
                    print("\n\n-----")
                }//end unwrapped json
                
                
            }//end if error == nil
            else{
                debugPrint(response.result.error as Any)
                return completion(false)
            }//end else
        }//end alamofire req
    }//end func
    
}
