//
//  CountryListUseCaseSpy.swift
//  CountriesSwiftUITests
//
//  Created by JHONATAHAN RIVERA on 11/5/24.
//

import Foundation

@testable import CountriesSwiftUI

class CountryListUseCaseSpy: CountryListUseCaseProtocol {

    var resultIsError = false
    var delegate: CountryListUseCaseDelegate?

    var fetchAllCountriesCalled = false

    func fetchAllCountries() {
        fetchAllCountriesCalled = true
        if !resultIsError {
            delegate?.reloadCountryList(countries: [CountryBusinessModel]())
        } else {
            delegate?.handleCountryErrorList(errorType: .generic)
        }
    }

    var searchCountrySelectedCalled = false

    func searchCountrySelected(name: String) -> CountryBusinessModel {
        searchCountrySelectedCalled = true
        return CountryBusinessModel()
    }
    

}
