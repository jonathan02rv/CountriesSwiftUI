//
//  CountryListViewModelTest.swift
//  CountriesSwiftUITests
//
//  Created by JHONATAHAN RIVERA on 11/5/24.
//

import XCTest
@testable import CountriesSwiftUI

final class CountryListViewModelTest: XCTestCase {

    private var sut: CountryListViewModel!
    private var useCaseSpy: CountryListUseCaseSpy!
    private var useCaseDelegateSpy: CountryListUseCaseDelegateSpy!

    override func setUp() {
        super.setUp()
        useCaseDelegateSpy = CountryListUseCaseDelegateSpy()
        useCaseSpy = CountryListUseCaseSpy()
        useCaseSpy.delegate = useCaseDelegateSpy
        sut = CountryListViewModel(useCase: useCaseSpy)
    }

    override func tearDown() {
        sut = nil
        useCaseSpy = nil
        useCaseDelegateSpy = nil
        super.tearDown()
    }

    func test_fetchCountries() {
        // GIVEN
        useCaseSpy.resultIsError = false

        // WHEN
        sut.fetchCountries()

        // THEN
        XCTAssertTrue(useCaseSpy.fetchAllCountriesCalled)
        XCTAssertTrue(useCaseDelegateSpy.reloadCountryListCalled)
    }

}
