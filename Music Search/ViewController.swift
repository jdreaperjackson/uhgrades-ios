//
//  ViewController.swift
//  Music Search
//
//  Created by John D. Jackson on 9/22/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var viewNoData: UIView!
    
    var arrSearchDataList: [SearchData] = [SearchData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewNoData.isHidden = false
        tblView.isHidden = true
        
        tblView.delegate = self
        tblView.dataSource = self
        
        txtSearch.delegate = self
        
//        self.txtSearch.addTarget(self, action: #selector(searchWorkersAsPerText(_ :)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func searchWorkersAsPerText(_ textfield:UITextField) {
//
//        callMemberAPI(search: txtSearch.text ?? "")
//    }

    
    // MARK: - TextField Delegate Methods
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            callMemberAPI(search: txtSearch.text ?? "")
            
            textField.resignFirstResponder()
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return true
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSearchDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let dicData = arrSearchDataList[indexPath.row]
        
        cell.lblTerms.text = "Term: \(dicData.term ?? "")"
        cell.lblsubject.text = "Subject: \(dicData.subject ?? "")"
        cell.lblcatalogNbr.text = "Catalog Numbbr: \(dicData.catalogNbr ?? "")"
        
        cell.lblcourseDescription.text = "Class Name: \(dicData.courseDescription ?? "")"
        cell.lblinstructorLast.text = "Instructor Last: \(dicData.instructorLast ?? "")"
        cell.lblinstructorFirst.text = "Instructor First: \(dicData.instructorFirst ?? "")"
        
        cell.lblaCount.text = "A: \(dicData.aCount ?? "")"
        cell.lblbCount.text = "B: \(dicData.bCount ?? "")"
        cell.lblcCount.text = "C: \(dicData.cCount ?? "")"
        cell.lbldCount.text = "D: \(dicData.dCount ?? "")"
        cell.lblfCount.text = "F: \(dicData.fCount ?? "")"
        
        cell.lblsatisfactory.text = "S: \(dicData.satisfactory ?? "")"
        cell.lbldropCount.text = "Dropped: \(dicData.dropCount ?? "")"
        cell.lblpercentA.text = "A Percentage: \(dicData.percentA ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        callMemberAPI(search: searchBar.text ?? "")
    }
    
    // MARK: - API Call
    func callMemberAPI(search: String) {
        
        let param = ["": ""]
        
        print(param)
        
        let url_ = "https://uhgradesapi.io/search/?search=\(search)".replacingOccurrences(of: " ", with: "?")
        
        APIClient.sharedInstance.MakeAPICallWithAuthHeaderGET(url_, parameters: param, completionHandler: { (response, error, statusCode) in
            
            if error == nil {
            //    print("STATUS CODE \(String(describing: statusCode))")
              //  print("Response \(String(describing: response))")
                
                APIClient.sharedInstance.hideIndicator()
                
                if statusCode == 200 {
                    
                    if let responseUser = response {
                        
                        let arrData = responseUser as? NSArray
                        
                        self.arrSearchDataList.removeAll()
                        for obj in arrData! {
                            let dicData = SearchData(fromDictionary: (obj as? NSDictionary)!)
                            self.arrSearchDataList.append(dicData)
                        }
                        
                        self.tblView.reloadData()
                        
                        if self.arrSearchDataList.count == 0
                        {
                            self.tblView.isHidden = true
                            self.viewNoData.isHidden = false
                        }
                        else
                        {
                            self.tblView.isHidden = false
                            self.viewNoData.isHidden = true
                        }
                        
                    } else {
                        self.arrSearchDataList.removeAll()
                        self.tblView.reloadData()
                        self.tblView.isHidden = true
                        self.viewNoData.isHidden = false
                        
                    }
                    
                } else {
                    self.arrSearchDataList.removeAll()
                    self.tblView.reloadData()
                    self.tblView.isHidden = true
                    self.viewNoData.isHidden = false
                }
                
            } else {
                self.arrSearchDataList.removeAll()
                self.tblView.reloadData()
                self.tblView.isHidden = true
                self.viewNoData.isHidden = false
                APIClient.sharedInstance.hideIndicator()
                print("Response \(String(describing: response))")
            }
        })
    }
    
}

