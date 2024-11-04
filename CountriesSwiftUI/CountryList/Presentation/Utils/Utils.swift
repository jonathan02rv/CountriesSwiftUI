//
//  Utils.swift
//  CountriesSwiftUI
//
//  Created by JHONATAHAN RIVERA on 11/3/24.
//

import Foundation
import SwiftUI

public typealias CustomTextFont = (text: String, font: Font, color: Color)

class Utils {
    public static func getCustomText(textListData: [CustomTextFont]) -> AttributedString {
        var customAttributedString = AttributedString("")
        textListData.forEach {
            var attributedString = AttributedString($0.text)
            attributedString.font = $0.font //.boldSystemFont(ofSize: 40)
            attributedString.foregroundColor = $0.color //.pink
            customAttributedString.append(attributedString)
        }
        return customAttributedString
    }
}
