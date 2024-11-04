//
//  CountryListViewModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

class CountryListViewModel: ObservableObject {

    @Published var countriesModel = [CountryModel]()
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false

    var filteredCountries: [CountryModel] {
        filterCountries()
    }

    let useCase: CountryListUseCaseProtocol

    init(useCase: CountryListUseCaseProtocol) {
        self.useCase = useCase
    }

    func getDetailView(countryName: String) -> CountryDetailView {
        let countrySelected = useCase.searchCountrySelected(name: countryName)
        return CountryDetailViewFactory.buildView(model: countrySelected)
    }

    func fetchCountries() {
        isLoading = true
        useCase.fetchAllCountries()
    }

    func filterCountries() -> [CountryModel] {
        guard searchText.count > 2 else { return countriesModel }
        return countriesModel.filter {
            (
                $0.commonName.lowercased().contains(searchText.lowercased()) ||
                $0.officialName.lowercased().contains(searchText.lowercased()) ||
                $0.capital.lowercased().contains(searchText.lowercased())
            )
        }
    }

}

extension CountryListViewModel: CountryListUseCaseDelegate {
    
    func reloadCountryList(countries: [CountryBusinessModel]) {
        isLoading = false
        print("Countries VM: \(countries)")
        countriesModel = countries.map {
            CountryModel(
                commonName: $0.commonName,
                officialName: $0.officialName,
                capital: $0.capital,
                flagURl: URL(string: $0.flagURl)
            )
        }
    }
    
    func handleCountryErrorList(errorType: ErrorType) {
        print("ErrorType VM: \(errorType)")
    }

}
