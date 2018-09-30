//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Fco_Javier_Rodriguez on 26/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    // Create data for check tests
    // Sigils
    var arrynSigil: Sigil!
    var baratheonSigil: Sigil!
    var greyjoySigil: Sigil!
    var lannisterSigil: Sigil!
    var starkSigil: Sigil!
    var targaryenSigil: Sigil!
    var tullySigil: Sigil!
    
    // Houses
    var arrynHouse:House!
    var baratheonHouse: House!
    var greyjoyHouse: House!
    var starkHouse: House!
    var lannisterHouse: House!
    var targaryenHouse: House!
    var tullyHouse: House!
    
    // Characters
    var ronnel: Person!
    var davos: Person!
    var asha: Person!
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    var cersei: Person!
    var jaime: Person!
    var dani: Person!
    var bryden: Person!
    
    
    
    override func setUp() {
        // Data initializaion for tests
        // Sigil
        arrynSigil = Sigil(description:"Águila Imperial", image:UIImage(named:"casa_arryn.jpg")!)
        baratheonSigil = Sigil(description:"Ciervo Común", image: UIImage(named:"casa_baratheon.jpg")!)
        greyjoySigil = Sigil(description: "Calamar Gigante", image:UIImage(named:"casa_greyjoy.jpg")!)
        lannisterSigil = Sigil(description:"León Ranpante", image: UIImage(named:"casa_lannister.jpg")!)
        starkSigil = Sigil(description:"Lobo Huargo", image:UIImage(named:"casa_stark.jpg")!)
        targaryenSigil = Sigil(description: "Dragón Tricéfalo", image:UIImage(named:"casa_targaryen.jpg")!)
        tullySigil = Sigil(description: "Dragón Tricéfalo", image:UIImage(named:"casa_tully.jpg")!)
        
        // Wiki URL
        let arrynUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Arryn")!
        let baratheonUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Baratheon")!
        let greyjoyUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
        let lannisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let targaryenUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        let tullyUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Tully")!
        
        // Houses
        arrynHouse = House(name:"Arryn", sigil: arrynSigil, words: "Tan alto como el honor", url: arrynUrl)
        baratheonHouse = House(name:"Baratheon", sigil:baratheonSigil, words: "Nuestra es la fueria", url: baratheonUrl)
        greyjoyHouse = House(name:"Greyjoy", sigil:greyjoySigil, words: "Fuego y Sangre", url: greyjoyUrl)
        starkHouse = House(name:"Stark", sigil: starkSigil, words: "Se acerca el inivierno", url: starkUrl)
        lannisterHouse = House(name:"Lannister", sigil:lannisterSigil, words: "Oye mi rugido", url: lannisterUrl)
        targaryenHouse = House(name:"Targaryen", sigil:targaryenSigil, words: "Fuego y Sangre", url: targaryenUrl)
        tullyHouse = House(name:"Tully", sigil:tullySigil, words: "Familia debe honor", url: tullyUrl)
        
        // Persons
        ronnel = Person(name: "Ronnel", alias: "Rey del valle", house: arrynHouse)
        davos = Person(name: "Davos", alias: "El caballero de la cebolla", house: baratheonHouse)
        asha = Person(name: "Asha", alias: "La Hija del Kraken", house: greyjoyHouse)
        robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        cersei = Person(name: "Cersei", house: lannisterHouse)
        jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        dani = Person(name: "Danierys", alias: "La madre de dragones", house: targaryenHouse)
        bryden = Person(name: "Bryden", alias: "El pez negro", house: tullyHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Check if exits the House
    func testHouseExistence(){
        XCTAssertNotNil(arrynHouse)
        XCTAssertNotNil(baratheonHouse)
        XCTAssertNotNil(greyjoyHouse)
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
        XCTAssertNotNil(targaryenHouse)
        XCTAssertNotNil(tullyHouse)
    }
    
    // Check if exits the Sigil
    func testSigilExistence(){
        XCTAssertNotNil(arrynSigil)
        XCTAssertNotNil(baratheonSigil)
        XCTAssertNotNil(greyjoyHouse)
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
        XCTAssertNotNil(targaryenHouse)
        XCTAssertNotNil(tullyHouse)
    }
    
    // Given - When -Then
    // Check if the people number for a house is correct (add only one person at a time)
    func testHouseAddPersonsReturnTheCorrectCounOfPeson(){
        // Arryn House
        XCTAssertEqual(arrynHouse.count, 0)
        // Add the same person repeatedly for check that only is add once
        arrynHouse.add(person: ronnel)
        arrynHouse.add(person: ronnel)
        arrynHouse.add(person: ronnel)
        XCTAssertEqual(arrynHouse.count, 1)
        
        // Baratheon House
        XCTAssertEqual(baratheonHouse.count, 0)
        baratheonHouse.add(person: davos)
        XCTAssertEqual(baratheonHouse.count, 1)
        
        // Greyjoy House
        XCTAssertEqual(greyjoyHouse.count, 0)
        greyjoyHouse.add(person: asha)
        XCTAssertEqual(greyjoyHouse.count, 1)
        
        
        // Stark House
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        // Lannister House
        XCTAssertEqual(lannisterHouse.count, 0)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        XCTAssertEqual(lannisterHouse.count, 3)
        
        // Targaryen House
        XCTAssertEqual(targaryenHouse.count, 0)
        targaryenHouse.add(person: dani)
        XCTAssertEqual(targaryenHouse.count, 1)
        
        // Tully House
        XCTAssertEqual(tullyHouse.count, 0)
        tullyHouse.add(person: bryden)
        XCTAssertEqual(tullyHouse.count, 1)
        
        // Check isn't possible add a person in other house
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: davos)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    
    // Check if the people number for a house is correct (add only one or more person at a time)
    func testHouseAddPersonsAtATimeReturnsTheCorrectCountOfPersons(){
        // Arryn House
        XCTAssertEqual(arrynHouse.count, 0)
        // Add the same person repeatedly for check that only is add once
        arrynHouse.add(persons: ronnel, ronnel)
        XCTAssertEqual(arrynHouse.count, 1)
        
        // Baratheon House
        XCTAssertEqual(baratheonHouse.count, 0)
        baratheonHouse.add(persons: davos)
        XCTAssertEqual(baratheonHouse.count, 1)
        
        // Stark House
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(persons: robb, arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        // Lannister House
        XCTAssertEqual(lannisterHouse.count, 0)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        lannisterHouse.add(person: cersei)
        XCTAssertEqual(lannisterHouse.count, 3)
        
        // Check isn't possible add a person in other house
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(persons: davos, bryden)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testHouseEquality() {
        // 1.Identity (Check the identity of a house)
        XCTAssertEqual(starkHouse, starkHouse)
        
        // 2.Equality (Check if 2 houses are the same)
        let myStarkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let myHouseStark = House(name: "Stark", sigil: starkSigil, words: "Se acerca el inivierno", url: myStarkUrl)
        XCTAssertEqual(starkHouse, myHouseStark)
        
        // 3.Inequality (Check if 2 houses aren't the same)
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHouseHaseable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
}
