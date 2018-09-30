//
//  Person.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 26/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import Foundation

final class Person{
    
    // MARK: Properties
    let name: String
    let house: House
    private var _alias: String?
    
    // Create method get for variable alias/_alias
    var alias: String{
        get{
            return _alias ?? "" // Return alias if exist unless return empty string ("")
        }
    }
    
    // MARK: Initializers (Markers)
    init(name: String, alias: String? = nil, house: House){
        self.name = name
        self._alias = alias
        self.house = house
    }
}

extension Person{
    // This variable contain the full name of a person
    var fullName: String{
        return "\(name) \(house.name)"
    }
}

extension Person{
    // This variable is used for know if 2 person are equals (Unambisguously)
    var proxyForEquality: String{
        return "\(house.name)\(name)\(alias)".uppercased()
    }
    
    // This variable is used for compare 2 person and sort them by name
    var proxyComparison: String{
        return fullName.uppercased()
    }
}

// Return person hashvalue
extension Person: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Check if 2 person are equals
extension Person: Equatable{
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// Compare 2 person by name (Alphabetic order)
extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyComparison < rhs.proxyComparison
    }
}
