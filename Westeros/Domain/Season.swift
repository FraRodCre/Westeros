//
//  Season.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 28/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import Foundation

typealias Chapters = Set<Episode>

final class Season {
    
    // MARK: Properties
    let name: String
    let number: Int
    let premiereDate: Date
    private var _chapters: Chapters
    
    var sortedEpisodes: [Episode] {
        return _chapters.sorted()
    }
    
    // For format the broadcastDate (es_ES)
    private let _dateFormatter = DateFormatter()
    
    // MARK: Initializers (Markers)
    init(name: String = "Temporada", premiereDate: Date, number: Int) {
        self.name = "\(name) \(number)"
        self.number = number
        self.premiereDate = premiereDate
        self._chapters = Chapters()
    }
    
    // Method for convert date in string
    func dateFormatter(dateToFormatter: Date)-> String {
        _dateFormatter.locale = Locale(identifier: "es_ES")
        _dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        return _dateFormatter.string(from: dateToFormatter)
    }
    
    func premiereDateToString()-> String{
        return dateFormatter(dateToFormatter: premiereDate)
    }
}

extension Season {
    
    // Full information of a season
    var informationSeason: String {
        return "Season \(number): \(name). Date: \(dateFormatter(dateToFormatter: premiereDate))"
    }
}

extension Season {
    
    // Numbers of chapters a season
    var count: Int {
        return _chapters.count
    }
    
    // Add an episode in the season
    func add(chapter: Episode) {
        guard self == chapter.season else {
            return
        }
        _chapters.insert(chapter)
    }
    
    // Add episodes to the season
    func add(chapters: Episode...) {
        chapters.forEach{ add(chapter: $0) }
    }
}

extension Season {
    
    // This variable is used for know if 2 season are equals (Unambisguously)
    var proxyForEquality: String {
        return "\(number)\(name)\(dateFormatter(dateToFormatter: premiereDate)))".uppercased()
    }
    
    // This variable is used for compare 2 season and sort them by number season
    var proxyComparison: Int {
        return number
    }
}

// MARK: Protocolos

// This protocol is used for convert a Season in string
extension Season: CustomStringConvertible {
    var description: String {
        return "\(informationSeason), \(_chapters)"
    }
}

// This protocol is used for get the hashValue of a Season
extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// This protocol checks if 2 season are equals
extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// This protocol compare 2 seasons by number season
extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool{
        return lhs.proxyComparison < rhs.proxyComparison
    }
}


