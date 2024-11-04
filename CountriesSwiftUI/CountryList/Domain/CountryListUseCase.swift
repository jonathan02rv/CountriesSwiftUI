//
//  CountryListUseCase.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

enum ErrorType: String, Error {
    case badURL
    case parseError
    case netWorkError
    case generic
}

protocol CountryListUseCaseDelegate: AnyObject {
    func reloadCountryList(countries: [CountryBusinessModel])
    func handleCountryErrorList(errorType: ErrorType)
}

protocol CountryListUseCaseProtocol {
    func fetchAllCountries()
    func searchCountrySelected(name: String) -> CountryBusinessModel
}

class CountryListUseCase: CountryListUseCaseProtocol {

    var countries = [CountryBusinessModel]()

    let repository: CountryListRepositoryProtocol
    weak var delegate: CountryListUseCaseDelegate?

    init(repository: CountryListRepositoryProtocol = CountryListRepository()) {
        self.repository = repository
    }

    @MainActor
    func fetchAllCountries() {
        Task {
            do {
                let moviesModel = try await repository.fetchAllCountries()
                countries = moviesModel
                print("moviesModel Domain: \(moviesModel)")
                delegate?.reloadCountryList(countries: moviesModel)
            } catch {
                let errorType = (error as? ErrorType)
                delegate?.handleCountryErrorList(errorType: errorType ?? .generic)
            }
        }
    }

    func searchCountrySelected(name: String) -> CountryBusinessModel {
        let country = countries.first {
            $0.commonName == name
        } ?? CountryBusinessModel()
        return country
    }

}
