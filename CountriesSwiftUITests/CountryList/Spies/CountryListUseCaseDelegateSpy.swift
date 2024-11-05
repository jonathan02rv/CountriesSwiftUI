//
//  CountryListUseCaseDelegateSpy.swift
//  CountriesSwiftUITests
//
//  Created by JHONATAHAN RIVERA on 11/5/24.
//

import Foundation

@testable import CountriesSwiftUI

class CountryListUseCaseDelegateSpy: CountryListUseCaseDelegate {

    var reloadCountryListCalled = false

    func reloadCountryList(countries: [CountryBusinessModel]) {
        reloadCountryListCalled = true
    }

    var handleCountryErrorListCalled = false

    func handleCountryErrorList(errorType: ErrorType) {
        handleCountryErrorListCalled = true
    }

}
