//
//  CountryDataModel.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

struct CountryDataModel: Decodable {
    let commonName: String?
    let officialName: String?
    let capital: [String]
    let flagURl: String?

    let region: String?
    let subRegion: String?
    let languages: [String: String]
    let currencies: [String: [String: String]]
    let population: Double?
    let carDriverSide: String?
    let coatOfArmsURL: String?

    enum CodingKeys: String, CodingKey {
        case commonName = "common"
        case officialName = "official"
        case capital
        case name
        case flags
        case png

        case region
        case subRegion = "subregion"
        case languages
        case currencies
        case population
        case car = "car"
        case side
        case coatOfArmsURL = "coatOfArms"
    }
}
extension CountryDataModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .name)
        let commonName = try name.decodeIfPresent(String.self, forKey: .commonName)
        self.commonName = commonName
        let officialName = try name.decodeIfPresent(String.self, forKey: .officialName)
        self.officialName = officialName
        let capital = try container.decodeIfPresent([String].self, forKey: .capital)
        self.capital = capital ?? []
        let flags = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .flags)
        let flagPng = try flags.decodeIfPresent(String.self, forKey: .png)
        self.flagURl = flagPng

        let region = try container.decodeIfPresent(String.self, forKey: .region)
        self.region = region

        let subRegion = try container.decodeIfPresent(String.self, forKey: .subRegion)
        self.subRegion = subRegion

        let languages = try container.decodeIfPresent([String:String].self, forKey: .languages)
        self.languages = languages ?? [:]

        let currencies = try container.decodeIfPresent([String:[String:String]].self, forKey: .currencies)
        self.currencies = currencies ?? [:]

        let population = try container.decodeIfPresent(Double.self, forKey: .population)
        self.population = population

        let car = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .car)
        let carSide = try car.decodeIfPresent(String.self, forKey: .side)
        self.carDriverSide = carSide

        let coatOfArms = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .coatOfArmsURL)
        let coatOfArmsPng = try coatOfArms.decodeIfPresent(String.self, forKey: .png)
        self.coatOfArmsURL = coatOfArmsPng
    }
}
extension CountryDataModel {
    static func mapper(data: [CountryDataModel]) -> [CountryBusinessModel] {
        data.map {
            CountryBusinessModel(
                commonName: $0.commonName ?? "",
                officialName: $0.officialName ?? "",
                capital: $0.capital.first ?? "",
                flagURl: $0.flagURl ?? "",
                region: $0.region ?? "",
                subRegion: $0.subRegion ?? "",
                languages: $0.languages.map {
                    $0.value
                },
                currencies: $0.currencies.map {
                    let valueDict = $0.value
                    return Currencies(shortName: $0.key, name: valueDict["name"] ?? "")
                },
                population: String($0.population ?? 0),
                carDriverSide: $0.carDriverSide ?? "",
                coatOfArms: $0.coatOfArmsURL ?? ""
            )
        }
    }
}
