//
//  CountryListModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

struct CountryModel: Identifiable {
    let id = UUID()
    let commonName: String
    let officialName: String
    let capital: String
    let flagURl: URL?
}
