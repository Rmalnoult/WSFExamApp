//
//  People.swift
//  MarvellousApp
//
//  Created by Iman Zarrabian on 20/05/16.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import Foundation
import Alamofire

struct People {

    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let url: String
    
    //Constructeur prenant en entrée un Dictionary
    init(dict: Dictionary<String, AnyObject>) {
        
        //Les infos de base
        name = dict["name"] as! String
        height = dict["height"] as! String
        mass = dict["mass"] as! String
        hair_color = dict["hair_color"] as! String
        skin_color = dict["skin_color"] as! String
        eye_color = dict["eye_color"] as! String
        gender = dict["gender"] as! String
        homeworld = dict["homeworld"] as! String
        birth_year = dict["birth_year"] as! String
        url = dict["url"] as! String
    }
    
    static func getRemoteCharacters(offset: Int, completionHandler: Response<AnyObject, NSError> -> Void
        ) {
        
        Alamofire.request(.GET, "http://swapi.co/api/people", parameters: []).responseJSON { response in
            
            completionHandler(response)
        }
    }
}
