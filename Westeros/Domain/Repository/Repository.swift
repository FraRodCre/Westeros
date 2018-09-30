//
//  Repository.swift
//  Westeros
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import UIKit

final class Repository{
    // Save data of my App (Houses, Sigil, Person, Seasons...)
    static let local = LocalFactory()
}

// MARK: Protocols
protocol HouseFactory {
    // Filter for houses
    typealias FilterHouse = (House) -> Bool
    
    // Houses
    var houses: [House] { get }
    
    // Method for return the house passed by parameter
    func house (named: String) -> House?
    
    func house(named type: HouseType) -> House?
    
    func houses (filteredBy filter: FilterHouse) -> [House]
}

protocol SeasonFactory {
    // FIlter for season
    typealias FilterSeason = (Season) -> Bool
    
    // Seasons
    var seasons: [Season] { get }
    
    // Method for return the season passed by parameter
    func season (named: String) -> Season?
    
    func seasons (filteredBy filter: FilterSeason) -> [Season]
}

// Create class empty and is full with extension
final class LocalFactory{
    
}

// MARK: Protocols implementation
extension LocalFactory: HouseFactory {
    var houses: [House] {
        // Create sigils
        let arrynSigil = Sigil(description:"Águila Imperial", image:UIImage(named:"casa_arryn.jpg")!)
        let baratheonSigil = Sigil(description:"Ciervo Común", image: UIImage(named:"casa_baratheon.jpg")!)
        let greyjoySigil = Sigil(description: "Calamar Gigante", image:UIImage(named:"casa_greyjoy.jpg")!)
        let lannisterSigil = Sigil(description:"León Ranpante", image: UIImage(named:"casa_lannister.jpg")!)
        let starkSigil = Sigil(description:"Lobo Huargo", image:UIImage(named:"casa_stark.jpg")!)
        let targaryenSigil = Sigil(description: "Dragón Tricéfalo", image:UIImage(named:"casa_targaryen.jpg")!)
        let tullySigil = Sigil(description: "Dragón Tricéfalo", image:UIImage(named:"casa_tully.jpg")!)
        
        // Create URL with infomation about house
        let arrynUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Arryn")!
        let baratheonUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!
        let greyjoyUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
        let lannisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let targaryenUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        let tullyUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!
        
        // Create houses
        let arrynHouse = House(name:"Arryn", sigil: arrynSigil, words: "Tan alto como el honor", url: arrynUrl)
        let baratheonHouse = House(name:"Baratheon", sigil:baratheonSigil, words: "Nuestra es la fueria", url:baratheonUrl)
        let greyjoyHouse = House(name:"Greyjoy", sigil:greyjoySigil, words: "Fuego y Sangre", url:greyjoyUrl)
        let starkHouse = House(name:"Stark", sigil: starkSigil, words: "Se acerca el inivierno", url: starkUrl)
        let lannisterHouse = House(name:"Lannister", sigil:lannisterSigil, words: "Oye mi rugido", url:lannisterUrl)
        let targaryenHouse = House(name:"Targaryen", sigil:targaryenSigil, words: "Fuego y Sangre", url:targaryenUrl)
        let tullyHouse = House(name:"Tully", sigil:tullySigil, words: "Familia debe honor", url:tullyUrl)
        
        // Create characters
        let ronnel = Person(name: "Ronnel", alias: "Rey del valle", house: arrynHouse)
        let davos = Person(name: "Davos", alias: "El caballero de la cebolla", house: baratheonHouse)
        let asha = Person(name: "Asha", alias: "La Hija del Kraken", house: greyjoyHouse)
        let robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        let dani = Person(name: "Danierys", alias: "La madre de dragones", house: targaryenHouse)
        let bryden = Person(name: "Bryden", alias: "El pez negro", house: tullyHouse)
        
        // Add person in his house
        arrynHouse.add(person: ronnel)
        baratheonHouse.add(person: davos)
        greyjoyHouse.add(person: asha)
        starkHouse.add(persons: arya, robb)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        targaryenHouse.add(person: dani)
        tullyHouse.add(person: bryden)
        
        return [arrynHouse, baratheonHouse, greyjoyHouse, starkHouse, lannisterHouse, targaryenHouse, tullyHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        return houses.filter{$0.name.uppercased() == name.uppercased()}.first
    }
    
    func house(named type: HouseType) -> House? {
        return house(named: type.rawValue)
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
}

extension LocalFactory: SeasonFactory {
    var seasons: [Season] {
        
        // Variable for can formatter the premiere and broadcast date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        
        // Create season
        let season_1 = Season(premiereDate: dateFormatter.date(from: "17/04/2011")!, number: 1)
        let season_2 = Season(premiereDate: dateFormatter.date(from: "01/04/2012")!, number: 2)
        let season_3 = Season(premiereDate: dateFormatter.date(from: "31/03/2013")!, number: 3)
        let season_4 = Season(premiereDate: dateFormatter.date(from: "06/04/2014")!, number: 4)
        let season_5 = Season(premiereDate: dateFormatter.date(from: "12/04/2015")!, number: 5)
        let season_6 = Season(premiereDate: dateFormatter.date(from: "24/04/2016")!, number: 6)
        let season_7 = Season(premiereDate: dateFormatter.date(from: "16/07/2017")!, number: 7)
        
        // Episodes of the seaon 1
        let chapter_1x01 = Episode(season: season_1, number: 1, title: "Se acerca el invierno", broadcastDate: dateFormatter.date(from: "17/04/2011")!)
        let chapter_1x02 = Episode(season: season_1, number: 2, title: "El Camino Real", broadcastDate: dateFormatter.date(from: "24/04/2011")!)
        season_1.add(chapters: chapter_1x01, chapter_1x02)
        
        // Episodes of the seaon 2
        let chapter_2x01 = Episode(season: season_2, number: 1, title: "El Norte no olvida", broadcastDate: dateFormatter.date(from: "01/04/2012")!)
        let chapter_2x02 = Episode(season: season_2, number: 2, title: "Las tierras de la noche", broadcastDate: dateFormatter.date(from: "08/04/2012")!)
        season_2.add(chapters: chapter_2x01, chapter_2x02)
        
        // Episodes of the seaon 3
        let chapter_3x01 = Episode(season: season_3, number: 1, title: "Valar Dohaeris", broadcastDate: dateFormatter.date(from: "31/03/2013")!)
        let chapter_3x02 = Episode(season: season_3, number: 2, title: "Alas negras, palabras negras", broadcastDate: dateFormatter.date(from: "07/04/2013")!)
        season_3.add(chapters: chapter_3x01, chapter_3x02)
        
        // Episodes of the seaon 4
        let chapter_4x01 = Episode(season: season_4, number: 1, title: "Dos espadas", broadcastDate: dateFormatter.date(from: "06/04/2014")!)
        let chapter_4x02 = Episode(season: season_4, number: 2, title: "El león y la rosa", broadcastDate: dateFormatter.date(from: "13/04/2014")!)
        season_4.add(chapters: chapter_4x01, chapter_4x02)
        
        // Episodes of the seaon 5
        let chapter_5x01 = Episode(season: season_5, number: 1, title: "Las guerras venideras", broadcastDate: dateFormatter.date(from: "12/04/2015")!)
        let chapter_5x02 = Episode(season: season_5, number: 2, title: "La casa de negro y blanco", broadcastDate: dateFormatter.date(from: "19/04/2015")!)
        season_5.add(chapters: chapter_5x01, chapter_5x02)
        
        // Episodes of the seaon 6
        let chapter_6x01 = Episode(season: season_6, number: 1, title: "La mujer roja", broadcastDate: dateFormatter.date(from: "24/04/2016")!)
        let chapter_6x02 = Episode(season: season_6, number: 2, title: "A casa", broadcastDate: dateFormatter.date(from: "01/05/2016")!)
        season_6.add(chapters: chapter_6x01, chapter_6x02)
        
        // Episodes of the seaon 7
        let chapter_7x01 = Episode(season: season_7, number: 1, title: "Rocadragón", broadcastDate: dateFormatter.date(from: "16/07/2017")!)
        let chapter_7x02 = Episode(season: season_7, number: 2, title: "Nacido de la tormenta", broadcastDate: dateFormatter.date(from: "23/07/2017")!)
        season_7.add(chapters: chapter_7x01, chapter_7x02)
        
        
        return [season_1, season_2, season_3, season_4, season_5, season_6, season_7].sorted()
    }
    
    func season(named name: String) -> Season? {
        return seasons.first{$0.name.uppercased() == name.uppercased()}
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}

