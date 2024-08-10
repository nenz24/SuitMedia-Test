//
//  SecondScreenModel.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 11/08/24.
//

import Foundation
import Combine

class SecondScreenModel: ObservableObject {
    @Published var name: String
    @Published var selectedUser: User?

    init(name: String) {
        self.name = name
    }
}
