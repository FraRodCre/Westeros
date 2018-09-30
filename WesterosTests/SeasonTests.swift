//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
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
    
    // Check if exist the Season
    func testSeasonExistence(){
        XCTAssertNotNil(season_1)
        XCTAssertNotNil(season_2)
        XCTAssertNotNil(season_3)
        XCTAssertNotNil(season_4)
        XCTAssertNotNil(season_5)
        XCTAssertNotNil(season_6)
        XCTAssertNotNil(season_7)
    }
    
    // Given - When -Then
    // Check if the chapters number for a season is correct (add only one chapter at a time)
    func testHouseAddPersonsReturnTheCorrectCounOfPeson(){
        // Season 1
        XCTAssertEqual(season_1.count, 0)
        // Add the same chapter repeatedly for check that only is add once
        season_1.add(chapter: chapter_1x01)
        season_1.add(chapter: chapter_1x01)
        season_1.add(chapter: chapter_1x02)
        XCTAssertEqual(season_1.count, 2)
        
        // Season 2
        XCTAssertEqual(season_2.count, 0)
        season_2.add(chapter: chapter_2x01)
        season_2.add(chapter: chapter_2x02)
        XCTAssertEqual(season_2.count, 2)
        
        // Season 3
        XCTAssertEqual(season_3.count, 0)
        season_3.add(chapter: chapter_3x01)
        season_3.add(chapter: chapter_3x02)
        XCTAssertEqual(season_3.count, 2)
        
        // Season 4
        XCTAssertEqual(season_4.count, 0)
        season_4.add(chapter: chapter_4x01)
        season_4.add(chapter: chapter_4x02)
        XCTAssertEqual(season_4.count, 2)
        
        // Season 5
        XCTAssertEqual(season_5.count, 0)
        season_5.add(chapter: chapter_5x01)
        season_5.add(chapter: chapter_5x02)
        XCTAssertEqual(season_5.count, 2)
        
        // Season 6
        XCTAssertEqual(season_6.count, 0)
        season_6.add(chapter: chapter_6x01)
        season_6.add(chapter: chapter_6x02)
        XCTAssertEqual(season_1.count, 2)
        
        // Season 7
        XCTAssertEqual(season_7.count, 0)
        season_7.add(chapter: chapter_7x01)
        season_7.add(chapter: chapter_7x02)
        XCTAssertEqual(season_7.count, 2)
        
        // Check isn't possible add a chapter in other season
        XCTAssertEqual(season_7.count, 2)
        season_7.add(chapter: chapter_1x01)
        XCTAssertEqual(season_7.count, 2)
        
    }
    
    // Check if the chapter number for a season is correct (add only one or more chapters at a time)
    func testHouseAddPersonsAtATimeReturnsTheCorrectCountOfPersons(){
        // Season 1
        XCTAssertEqual(season_1.count, 0)
        // Add the same chapter repeatedly for check that only is add once
        season_1.add(chapters: chapter_1x01, chapter_1x01, chapter_1x02)
        XCTAssertEqual(season_1.count, 2)
        
        // Season 2
        XCTAssertEqual(season_2.count, 0)
        season_2.add(chapters: chapter_2x01,chapter_2x02)
        XCTAssertEqual(season_2.count, 2)
        
        // Season 3
        XCTAssertEqual(season_3.count, 0)
        season_3.add(chapters: chapter_3x01, chapter_3x02)
        XCTAssertEqual(season_3.count, 2)
        
        // Season 4
        XCTAssertEqual(season_4.count, 0)
        season_4.add(chapters: chapter_4x01, chapter_4x02)
        XCTAssertEqual(season_4.count, 2)
        
        // Season 5
        XCTAssertEqual(season_5.count, 0)
        season_5.add(chapters: chapter_5x01, chapter_5x02)
        XCTAssertEqual(season_5.count, 2)
        
        // Season 6
        XCTAssertEqual(season_6.count, 0)
        season_6.add(chapters: chapter_6x01, chapter_6x02)
        XCTAssertEqual(season_1.count, 2)
        
        // Season 7
        XCTAssertEqual(season_7.count, 0)
        season_7.add(chapters: chapter_7x01, chapter_7x02)
        XCTAssertEqual(season_7.count, 2)
        
        // Check isn't possible add a chapter in other season
        XCTAssertEqual(season_7.count, 2)
        season_7.add(chapters: chapter_1x01, chapter_5x02)
        XCTAssertEqual(season_7.count, 2)
    }
    
    func testSeasonCustomStringConverible(){
        XCTAssertNotNil(season_1.description)
        XCTAssertNotNil(season_2.description)
        XCTAssertNotNil(season_3.description)
        XCTAssertNotNil(season_4.description)
        XCTAssertNotNil(season_5.description)
        XCTAssertNotNil(season_6.description)
        XCTAssertNotNil(season_7.description)
    }
    
    func testSeasonEquality(){
        // 1.Identity (Check the identity of a season)
        XCTAssertEqual(season_7, season_7)
        
        // 2.Equality (Check if 2 seasons are the same)
        let mySeason = Season(premiereDate: dateFormatter.date(from: "01/04/2012")!, number: 2)
        XCTAssertEqual(season_2, mySeason)
        
        // 3.Inequality (Check if 2 seasons aren't the same)
        XCTAssertNotEqual(season_1, season_7)
    }
    
    
    func testSeasonHaseable(){
        XCTAssertNotNil(season_1.hashValue)
    }
    
    func testSeaonComparison(){
        XCTAssertLessThan(season_1, season_2)
    }
    
}
