//
//  FirstViewController.swift
//  ExamApp
//
//  Created by Iman Zarrabian on 07/06/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // use of undeclared type People, why ???
    var peoplesArray: [People] = []
    
    var dataOffset: Int {
        return peoplesArray.count
    }
    
    @IBOutlet weak var peopleTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTV.estimatedRowHeight = 200.0
        peopleTV.rowHeight = UITableViewAutomaticDimension
        
        displayItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayItems() {
        People.getRemoteCharacters(dataOffset) { (response) in
                
            switch response.result {
                case .Success:
                    if let dict = response.result.value as? [String : AnyObject] {
                        if let dataDict = dict["data"] {
                            
                            if let array = dataDict["results"] as? Array<AnyObject>  {
                                
                                self.comicsArray += array.map
                                    { Comic(dict: $0 as! [String: AnyObject]) }
                                
                                self.peopleTV.reloadData()
                            }
                        }
                    }
                    
                case .Failure(let error):
                    print(error)
                }
            }
        }
    }


