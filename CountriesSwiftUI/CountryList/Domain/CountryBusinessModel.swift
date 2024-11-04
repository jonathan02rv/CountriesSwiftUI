//
//  CountryBusinessModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

struct CountryBusinessModel {
    let commonName: String
    let officialName: String
    let capital: String
    let flagURl: String

    let region: String
    let subRegion: String
    let languages: [String]
    let currencies: [Currencies]
    let population: String
    let carDriverSide: String
    let coatOfArms: String

    init(commonName: String = "",
         officialName: String = "",
         capital: String = "",
         flagURl: String = "",
         region: String = "",
         subRegion: String = "",
         languages: [String] = [],
         currencies: [Currencies] = [],
         population: String = "",
         carDriverSide: String = "",
         coatOfArms: String = ""
    ) {
        self.commonName = commonName
        self.officialName = officialName
        self.capital = capital
        self.flagURl = flagURl
        self.region = region
        self.subRegion = subRegion
        self.languages = languages
        self.currencies = currencies
        self.population = population
        self.carDriverSide = carDriverSide
        self.coatOfArms = coatOfArms
    }
}

struct Currencies {
    let shortName: String
    let name: String
}
