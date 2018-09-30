//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import XCTest
@testable import Westeros

var localHouses: [House]!
var localSeasons: [Season]!

class RepositoryTests: XCTestCase {

    override func setUp() {
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLocalRepositoryExistence(){
        XCTAssertNotNil(Repository.local)
    }
    
    // Check houses number created
    func testLocalRepositoryHousesCreation(){
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 7)
    }
    
    // Check seasons number created
    func testLocalRepositorySeasonsCreation(){
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localHouses.count, 7)
    }
    
    // Check the sort of houses
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    // Check the sort of seasons
    func testLocalRepositoryReturnsSortedArrayOfSeasons(){
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTaRk")
        
        XCTAssertEqual(stark?.name, "Stark")
        
        let myRepository = Repository.local.house(named: "My Repository")
        XCTAssertNil(myRepository)
    }
    
    func testLocalRepositoryReturnsSeasonByNameCaseInsensitively(){
        let season_1 = Repository.local.season(named: "TempoRada 1")
        
        XCTAssertEqual(season_1?.name, "Temporada 1")
        
        let myRepository = Repository.local.house(named: "My Repository")
        XCTAssertNil(myRepository)
    }
    
    func testLocalRepositoryHouseFiltering(){
        var filtered = Repository.local.houses { $0.count == 1}
        XCTAssertEqual(filtered.count, 5)
        
        filtered = Repository.local.houses{$0.count == 100}
        XCTAssertTrue(filtered.isEmpty)
        
    }
    
    func testLocalRepositorySeasonFiltering(){
        var filtered = Repository.local.seasons (filteredBy: { $0.count == 2})
        XCTAssertEqual(filtered.count, 7)
        
        filtered = Repository.local.seasons{$0.count == 100}
        XCTAssertTrue(filtered.isEmpty)
        
    }
    
    // Check if 2 houses are the same type or not
    func testReturnHouseType(){
        let tullyHouse = Repository.local.house(named: .tully)
        let lannisterHouse = Repository.local.house(named: .lannister)
        
        XCTAssertEqual("Tully", tullyHouse?.name)
        XCTAssertNotEqual(tullyHouse?.name, lannisterHouse?.name)
    }
}
