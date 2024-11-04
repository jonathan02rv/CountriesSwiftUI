//
//  CountryDetailView.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/30/24.
//

import SwiftUI

struct CountryDetailView: View {
    let viewModel: CountryDetailViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: viewModel.countryDetail.flagURl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 90, height: 50)
            Text(viewModel.getCustomTitleDetail(detailItem: .countryTitle))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .capital))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .region))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .subregion))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .languages))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .currencies))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .population))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .carDriverSide))
                .lineLimit(1)
            Text(viewModel.getCustomTitleDetail(detailItem: .coatArms))
                .lineLimit(1)
            AsyncImage(url: viewModel.countryDetail.coatOfArms) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 35, height: 35)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(viewModel.countryDetail.commonName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CountryDetailView(
        viewModel: CountryDetailViewModel(countryDetail: CountryDetailModel.buildEmpty())
    )
}
