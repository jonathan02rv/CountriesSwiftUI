//
//  CountriesSwiftUIApp.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 10/24/24.
//

import SwiftUI

@main
struct CountriesSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListViewFactory.buildView()
        }
    }
}
