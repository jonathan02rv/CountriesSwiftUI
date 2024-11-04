//
//  CountryDetailModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/30/24.
//

import Foundation

struct CountryDetailModel {
    let commonName: String
    let officialName: String
    let capital: String
    let flagURl: URL?
    let region: String
    let subRegion: String
    let languages: String
    let currencies: String
    let population: String
    let carDriverSide: String
    let coatOfArms: URL?
}

extension CountryDetailModel {
    static func buildEmpty() -> CountryDetailModel {
        CountryDetailModel(
            commonName: "CommonName",
            officialName: "",
            capital: "",
            flagURl: nil,
            region: "",
            subRegion: "",
            languages: "",
            currencies: "",
            population: "",
            carDriverSide: "",
            coatOfArms: nil
        )
    }
}
