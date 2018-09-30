//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    // Create data for check tests
    // Seasons
    var season_1: Season!
    var season_2: Season!
    var season_3: Season!
    var season_4: Season!
    var season_5: Season!
    var season_6: Season!
    var season_7: Season!
    
    // Episodes of the seaon 1
    var chapter_1x01: Episode!
    var chapter_1x02: Episode!
    
    // Episodes of the seaon 2
    var chapter_2x01: Episode!
    var chapter_2x02: Episode!
    
    // Episodes of the seaon 3
    var chapter_3x01: Episode!
    var chapter_3x02: Episode!
    
    // Episodes of the seaon 4
    var chapter_4x01: Episode!
    var chapter_4x02: Episode!
    
    // Episodes of the seaon 5
    var chapter_5x01: Episode!
    var chapter_5x02: Episode!
    
    // Episodes of the seaon 6
    var chapter_6x01: Episode!
    var chapter_6x02: Episode!
    
    // Episodes of the seaon 1
    var chapter_7x01: Episode!
    var chapter_7x02: Episode!
    
    // Variable for can formatter the premiere and broadcast date
    var dateFormatter:DateFormatter!
    
    override func setUp() {
        dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/YYYY")
        
        // Data initializaion for tests
        // Create season
        season_1 = Season(premiereDate: dateFormatter.date(from: "17/04/2011")!, number: 1)
        season_2 = Season(premiereDate: dateFormatter.date(from: "01/04/2012")!, number: 2)
        season_3 = Season(premiereDate: dateFormatter.date(from: "31/03/2013")!, number: 3)
        season_4 = Season(premiereDate: dateFormatter.date(from: "06/04/2014")!, number: 4)
        season_5 = Season(premiereDate: dateFormatter.date(from: "12/04/2015")!, number: 5)
        season_6 = Season(premiereDate: dateFormatter.date(from: "24/04/2016")!, number: 6)
        season_7 = Season(premiereDate: dateFormatter.date(from: "16/07/2017")!, number: 7)
        
        // Episodes of the seaon 1
        chapter_1x01 = Episode(season: season_1, number: 1, title: "Se acerca el invierno", broadcastDate: dateFormatter.date(from: "17/04/2011")!)
        chapter_1x02 = Episode(season: season_1, number: 2, title: "El Camino Real", broadcastDate: dateFormatter.date(from: "24/04/2011")!)
        
        // Episodes of the seaon 2
        chapter_2x01 = Episode(season: season_2, number: 1, title: "El Norte no olvida", broadcastDate: dateFormatter.date(from: "01/04/2012")!)
        chapter_2x02 = Episode(season: season_2, number: 2, title: "Las tierras de la noche", broadcastDate: dateFormatter.date(from: "08/04/2012")!)
        
        // Episodes of the seaon 3
        chapter_3x01 = Episode(season: season_3, number: 1, title: "Valar Dohaeris", broadcastDate: dateFormatter.date(from: "31/03/2013")!)
        chapter_3x02 = Episode(season: season_3, number: 2, title: "Alas negras, palabras negras", broadcastDate: dateFormatter.date(from: "07/04/2013")!)
        
        // Episodes of the seaon 4
        chapter_4x01 = Episode(season: season_4, number: 1, title: "Dos espadas", broadcastDate: dateFormatter.date(from: "06/04/2014")!)
        chapter_4x02 = Episode(season: season_4, number: 2, title: "El león y la rosa", broadcastDate: dateFormatter.date(from: "13/04/2014")!)
        
        // Episodes of the seaon 5
        chapter_5x01 = Episode(season: season_5, number: 1, title: "Las guerras venideras", broadcastDate: dateFormatter.date(from: "12/04/2015")!)
        chapter_5x02 = Episode(season: season_5, number: 2, title: "La casa de negro y blanco", broadcastDate: dateFormatter.date(from: "19/04/2015")!)
        
        // Episodes of the seaon 6
        chapter_6x01 = Episode(season: season_6, number: 1, title: "La mujer roja", broadcastDate: dateFormatter.date(from: "24/04/2016")!)
        chapter_6x02 = Episode(season: season_6, number: 2, title: "A casa", broadcastDate: dateFormatter.date(from: "01/05/2016")!)
        
        // Episodes of the seaon 7
        chapter_7x01 = Episode(season: season_7, number: 1, title: "Rocadragón", broadcastDate: dateFormatter.date(from: "16/07/2017")!)
        chapter_7x02 = Episode(season: season_7, number: 2, title: "Nacido de la tormenta", broadcastDate: dateFormatter.date(from: "23/07/2017")!)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(chapter_1x01)
        XCTAssertNotNil(chapter_1x02)
        XCTAssertNotNil(chapter_2x01)
        XCTAssertNotNil(chapter_2x02)
        XCTAssertNotNil(chapter_3x01)
        XCTAssertNotNil(chapter_3x02)
        XCTAssertNotNil(chapter_4x01)
        XCTAssertNotNil(chapter_4x02)
        XCTAssertNotNil(chapter_5x01)
        XCTAssertNotNil(chapter_5x02)
        XCTAssertNotNil(chapter_6x01)
        XCTAssertNotNil(chapter_6x02)
        XCTAssertNotNil(chapter_7x01)
        XCTAssertNotNil(chapter_7x02)
    }
    
    func testEpisodeCustomStringConverible(){
        XCTAssertNotNil(chapter_1x01.description)
        XCTAssertNotNil(chapter_1x02.description)
        XCTAssertNotNil(chapter_2x01.description)
        XCTAssertNotNil(chapter_2x02.description)
        XCTAssertNotNil(chapter_3x01.description)
        XCTAssertNotNil(chapter_3x02.description)
        XCTAssertNotNil(chapter_4x01.description)
        XCTAssertNotNil(chapter_4x02.description)
        XCTAssertNotNil(chapter_5x01.description)
        XCTAssertNotNil(chapter_5x02.description)
        XCTAssertNotNil(chapter_6x01.description)
        XCTAssertNotNil(chapter_6x02.description)
        XCTAssertNotNil(chapter_7x01.description)
        XCTAssertNotNil(chapter_7x02.description)
    }
    
    func testEpisoseInformationChapter(){
        XCTAssertEqual(chapter_1x01.informationChapter, "Season 1 - Episode 1: Se acerca el invierno. Date: 27/12/2010")
        
    }
    
    func testEpisodeEquality(){
        // 1.Identity (Check the identity of a season)
        XCTAssertEqual(chapter_1x01, chapter_1x01)
        
        // 2.Equality (Check if 2 seasons are the same)
        let myEpisode = Episode(season: season_7, number: 2, title: "Nacido de la tormenta", broadcastDate: dateFormatter.date(from: "23/07/2017")!)
        XCTAssertEqual(chapter_7x02, myEpisode)
        
        // 3.Inequality (Check if 2 seasons aren't the same)
        XCTAssertNotEqual(chapter_1x01, chapter_7x02)
    }
    
    
    func testEpisodeHaseable(){
        XCTAssertNotNil(chapter_1x01.hashValue)
    }
    
    func testSeaonComparison(){
        XCTAssertLessThan(chapter_1x02, chapter_3x02)
        XCTAssertGreaterThan(chapter_5x01, chapter_2x02)
    }
}
