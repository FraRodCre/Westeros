//
//  PersonTest.swift
//  WesterosTests
//
//  Created by Fco_Javier_Rodriguez on 29/9/18.
//  Copyright © 2018 Fco_Javier_Rodriguez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {

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
    
    // Create characters
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
    
    // Check character(Person) existence
    func testCharacterExistence(){
        XCTAssertNotNil(ronnel)
        XCTAssertNotNil(davos)
        XCTAssertNotNil(asha)
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
        XCTAssertNotNil(tyrion)
        XCTAssertNotNil(cersei)
        XCTAssertNotNil(jaime)
        XCTAssertNotNil(dani)
        XCTAssertNotNil(bryden)
    }
    
    // Check full name of a person
    func testPersonFullName(){
        XCTAssertEqual(ronnel.fullName, "Ronnel Arryn")
        XCTAssertEqual(davos.fullName, "Davos Baratheon")
        XCTAssertEqual(asha.fullName, "Asha Greyjoy")
        XCTAssertEqual(robb.fullName, "Robb Stark")
        XCTAssertEqual(arya.fullName, "Arya Stark")
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
        XCTAssertEqual(cersei.fullName, "Cersei Lannister")
        XCTAssertEqual(jaime.fullName, "Jaime Lannister")
        XCTAssertEqual(dani.fullName, "Danierys Targaryen")
        XCTAssertEqual(bryden.fullName, "Bryden Tully")
    }
    
    func testPersonEqulity(){
        // 1.Identity (Check the identity of a person)
        XCTAssertEqual(bryden, bryden)
        
        // 2.Equality (Check if 2 persons are the same)
        let danierys = Person(name: "Danierys", alias: "La madre de dragones", house: targaryenHouse)
        XCTAssertEqual(dani, danierys)
        
        // 3.Inequality (Check if 2 persons aren't the same)
        XCTAssertNotEqual(ronnel, davos)
    }
    
    func testPersonHasable(){
        XCTAssertNotNil(ronnel.hashValue)
    }
    
    func testPersonComparison(){
        XCTAssertLessThan(dani, tyrion)
        XCTAssertGreaterThan(cersei, bryden)
    }
}
