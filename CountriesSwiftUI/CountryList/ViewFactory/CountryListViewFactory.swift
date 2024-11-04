//
//  CountryListViewFactory.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

final class CountryListViewFactory {
    static func buildView() -> CountryListView {
        let useCase = CountryListUseCase()
        let viewModel = CountryListViewModel(useCase: useCase)
        useCase.delegate = viewModel
        let view = CountryListView(viewModel: viewModel)
        return view
    }
}
