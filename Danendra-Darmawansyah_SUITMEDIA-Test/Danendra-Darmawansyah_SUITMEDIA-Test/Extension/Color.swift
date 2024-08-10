//
//  Color.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String){
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
