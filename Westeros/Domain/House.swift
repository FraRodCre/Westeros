//
//  House.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 26/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>



// Model House
final class House{
    
    // MARK: Properties
    let name: String
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    private var _members: Members
    
    var sortedMembers: [Person] {
        return _members.sorted()
    }
    
    // MARK: Initializers (Markers)
    init(name: String, sigil: Sigil, words: Words, url:URL) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        self._members = Members()
    }
}

extension House{
    
    // Number of persons of a house
    var count: Int {
        return _members.count
    }
    
    // Method for add a person to the house
    func add(person: Person){
        // Check if exist the person and add it to the house if not exist(Safe unpacked)
        guard self == person.house else {
            return
        }
        _members.insert(person)
    }
    
    // Method for add persons to the house
    func add(persons: Person...){
        persons.forEach{ add(person: $0) }
    }
}

extension House{
    
    // This variable is used for know if 2 houses are equals
    var proxyForEquality: String{
        return "\(name)\(words)\(count)"
    }
    
    // This variable is used for compare 2 house2 and sort them by name
    var proxyForComparison: String {
        return name.uppercased()
    }
}

// MARK: Protocols

// Return house hashvalue
extension House: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Check if 2 house are equals
extension House: Equatable{
    static func == (lhs: House, rhs: House) -> Bool{
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// Compare 2 house for name (Alphabetic order)
extension House: Comparable{
    static func < (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}


