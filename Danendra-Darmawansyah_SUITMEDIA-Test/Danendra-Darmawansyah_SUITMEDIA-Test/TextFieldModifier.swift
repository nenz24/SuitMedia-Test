//
//  TextFieldModifier.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .frame(width: 310, height: 47)
            .cornerRadius(12)
            .padding(.horizontal,24)
    }
}
