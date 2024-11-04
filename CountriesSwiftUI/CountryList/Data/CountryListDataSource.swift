//
//  CountryListDataSource.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

enum ErrorRequest: String, Error {
    case badURL
    case parseError
    case netWorkError
    case unknown

    func getTypeError() -> ErrorType {
        return ErrorType(rawValue: self.rawValue) ?? .generic
    }
}

class CountryListDataSource: ApiClient {
    
    let urlSession = URLSession.shared
    let baseUrl = "https://restcountries.com/v3.1"

    func fetchAllCountries(path: String) async throws -> [CountryDataModel] {

        let urlRequest = baseUrl + path
        guard let url = URL(string: urlRequest) else {
            throw ErrorRequest.badURL
        }
        do {
            let (data, _) = try await urlSession.data(from: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print("jsonObject: \(jsonObject)")
            if let moviesResponse = try? JSONDecoder().decode([CountryDataModel].self, from: data) {
                return moviesResponse
            } else {
                print("parseError")
                throw ErrorRequest.parseError
            }
        } catch {
            print("NetworkError")
            throw ErrorRequest.netWorkError
        }
    }

}
