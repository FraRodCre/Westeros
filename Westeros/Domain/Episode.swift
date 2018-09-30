//
//  Episode.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 28/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import Foundation

final class Episode {
    
    // MARK: Properties
    let title: String
    let broadcastDate: Date
    let number: Int
    weak var season: Season?
    
    // For format the broadcastDate (es_ES)
    private var _dateFormatter = DateFormatter()
    
    // MARK: Initializers (Markers)
    init (season: Season, number: Int, title: String, broadcastDate:Date){
        self.title = title
        self.broadcastDate = broadcastDate
        self.season = season
        self.number = number
    }
    
    // Method for convert date in string
    func dateFormatter(dateToFormatter: Date)-> String {
        _dateFormatter.locale = Locale(identifier: "es_ES")
        _dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        return _dateFormatter.string(from: dateToFormatter)
    }
    
    func broadcastDateToString()-> String{
        return dateFormatter(dateToFormatter: broadcastDate)
    }
}


extension Episode {
    
    // Full information of a episode
    var informationChapter: String {
        return "Season \(season!.number) - Episode \(number): \(title). Date: \(dateFormatter(dateToFormatter: broadcastDate))"
    }
}


extension Episode {
    // This variable is used for know if 2 episodes are the same (Unambisguously)
    var proxyForEquality: String {
        return "\(season!.name)\(season!.number)\(number)\(title)\(dateFormatter(dateToFormatter: broadcastDate))".uppercased()
    }
    
    // This variable is used for compare 2 season and sort them by date
    var proxyComparison: Date {
        return broadcastDate
    }
}

// MARK: Protocolos

// This protocol is used for convert a Episode in string
extension Episode: CustomStringConvertible {
    var description: String {
        return "\(informationChapter)"
    }
}

// This protocol is used for get the hashValue of a Episode
extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// This protocol checks if 2 Episodes are the same
extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// This protocol compare 2 episodes by date
extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxyComparison < rhs.proxyComparison
    }
}
