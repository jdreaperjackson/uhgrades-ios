//
//  APIClient.swift
//  Surveilant Resident
//
//  Created by John D. Jackson on 9/22/21.
//

import Foundation
import Alamofire
import SVProgressHUD
import UIKit

class APIClient: NSObject {
    
    class var sharedInstance: APIClient {
        
        struct Static {
            static let instance: APIClient = APIClient()
        }
        return Static.instance
    }
    
    var responseData: NSMutableData!
    
    func showLogoutAlert(completion:@escaping ((_ tapped:Bool)->Void))
    {
        
    }
    
    
    
    func MakeAPICallWithAuthHeaderGET(_ url: String, parameters: [String: Any], completionHandler:@escaping (NSArray?, Error?, Int?) -> Void) {
        
        print("url = \(url)")
        
        if NetConnection.isConnectedToNetwork() == true
        {
        
            let headers: HTTPHeaders = ["":""]
            
            print("Header = \(headers)")
            
            AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .methodDependent), headers: headers).responseJSON { response in
                
                switch(response.result) {
                
                case .success:
                    if response.value != nil{
                        
                        if let responseDict = ((response.value as AnyObject) as? NSArray) {
                            completionHandler(responseDict, nil, response.response?.statusCode)
                        }
                    }
                    
                case .failure:
                    print(response.error!)
                    print("Http Status Code: \(String(describing: response.response?.statusCode))")
                    completionHandler(nil, response.error, response.response?.statusCode )
                }
            }
        }
        else
        {
            print("No Network Found!")
            showLogoutAlert { (true) in
                
            }
            // pushNetworkErrorVC()
            SVProgressHUD.dismiss()
        }
    }
        
    
    
    func showIndicator(){
        SVProgressHUD.show()
    }
    
    func hideIndicator(){
        SVProgressHUD.dismiss()
    }
    
    func showSuccessIndicator(message: String){
        SVProgressHUD.showSuccess(withStatus: message)
    }
}

