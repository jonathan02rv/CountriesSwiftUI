//
//  CountryListView.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import SwiftUI

struct CountryListView: View {

    @ObservedObject var viewModel: CountryListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.filteredCountries) { country in
                        NavigationLink {
                            viewModel.getDetailView(countryName: country.commonName)
                        } label: {
                            HStack {
                                AsyncImage(url: country.flagURl) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 70, height: 50)
                                VStack(alignment: .leading) {
                                    Text(country.commonName)
                                        .font(.headline)
                                        .lineLimit(1)
                                    Text(country.officialName)
                                        .font(.caption)
                                        .lineLimit(1)
                                    Text(country.capital)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                        .bold()
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Countries")
                .searchable(text: $viewModel.searchText)
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                }
            }
        }
        .onAppear {
            viewModel.fetchCountries()
        }
    }
}

#Preview {
    CountryListView(viewModel: CountryListViewModel(useCase: CountryListUseCase()))
}
