//
//  CountryListRepository.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import Foundation

protocol ApiClient {
    func fetchAllCountries(path: String) async throws -> [CountryDataModel]
}

class CountryListRepository: CountryListRepositoryProtocol {

    let apiClient: ApiClient

    init(apiClient: ApiClient = CountryListDataSource()) {
        self.apiClient = apiClient
    }

    func fetchAllCountries() async throws -> [CountryBusinessModel] {
        do {
            let path = "/all"
            let data = try await apiClient.fetchAllCountries(path: path)
            return CountryDataModel.mapper(data: data)
        } catch {
            guard let errorResponse = (error as? ErrorRequest) else {
                throw ErrorRequest.unknown.getTypeError()
            }
            throw errorResponse.getTypeError()
        }
    }

}
