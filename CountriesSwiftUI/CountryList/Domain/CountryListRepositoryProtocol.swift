//
//  CountryListRepositoryProtocol.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

protocol CountryListRepositoryProtocol {
    func fetchAllCountries() async throws -> [CountryBusinessModel]
}
