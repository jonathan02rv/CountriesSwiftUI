//
//  CountryDetailViewFactory.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/30/24.
//

import Foundation

final class CountryDetailViewFactory {
    static func buildView(model: CountryBusinessModel) -> CountryDetailView {
        var currenciesStr: [String] = []
        model.currencies.forEach {
            currenciesStr.append("\($0.shortName) (\($0.name))")
        }
        let detailModel = CountryDetailModel(
            commonName: model.commonName,
            officialName: model.officialName,
            capital: model.capital,
            flagURl: URL(string: model.flagURl),
            region: model.region,
            subRegion: model.subRegion,
            languages: model.languages.joined(separator: ", "),
            currencies: currenciesStr.joined(separator: ", "),
            population: model.population,
            carDriverSide: model.carDriverSide,
            coatOfArms: URL(string: model.coatOfArms)
        )
        let viewModel = CountryDetailViewModel(countryDetail: detailModel)
        let view = CountryDetailView(viewModel: viewModel)
        return view
    }
}
