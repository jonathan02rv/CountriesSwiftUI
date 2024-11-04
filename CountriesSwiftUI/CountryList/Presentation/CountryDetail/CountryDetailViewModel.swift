//
//  CountryDetailViewModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/30/24.
//

import Foundation
import UIKit
import SwiftUI

class CountryDetailViewModel {

    enum CountryDetailItems: String {
        case countryTitle
        case capital = "Capital - "
        case region = "Region - "
        case subregion = "Subregion - "
        case languages = "Languages - "
        case currencies = "Currencies - "
        case population = "Population - "
        case carDriverSide = "Car Drive Side - "
        case coatArms = "Coat Of Arms"
    }

    var countryDetail: CountryDetailModel

    init(countryDetail: CountryDetailModel) {
        self.countryDetail = countryDetail
    }

    func getCustomTitleDetail(detailItem: CountryDetailItems) -> AttributedString {
        var textListData = [CustomTextFont]()
        let prefixText = CustomTextFont(text: detailItem.rawValue, font: .system(size: 13, weight: .heavy, design: .default), color: .gray)
        textListData.append(prefixText)
        switch detailItem {
        case .countryTitle:
            textListData = []
            let styleCountryTitle = CustomTextFont(text: "\(countryDetail.commonName)  ", font: .system(size: 20, weight: .bold, design: .default), color: .black)
            let styleCountryOfficialName = CustomTextFont(text: countryDetail.officialName, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCountryTitle)
            textListData.append(styleCountryOfficialName)
        case .capital:
            let styleCapital = CustomTextFont(text: countryDetail.capital, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .region:
            let styleCapital = CustomTextFont(text: countryDetail.region, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .subregion:
            let styleCapital = CustomTextFont(text: countryDetail.subRegion, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .languages:
            let styleCapital = CustomTextFont(text: countryDetail.languages, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .currencies:
            let styleCapital = CustomTextFont(text: countryDetail.currencies, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .population:
            let styleCapital = CustomTextFont(text: countryDetail.population, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        case .carDriverSide:
            let styleCapital = CustomTextFont(text: countryDetail.carDriverSide, font: .system(size: 12, weight: .semibold, design: .default), color: .gray)
            textListData.append(styleCapital)
        default:
            break
        }
        return Utils.getCustomText(textListData: textListData)
    }
}
