//
//  FirstScreenModel.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import Foundation
import Combine

class FirstScreenModel: ObservableObject {
    @Published var name: String = ""
    @Published var sentence: String = ""
    @Published var showAlert = false
    @Published var alertMessage: String = ""

    func palindromeChecker() {
        let filteredText = sentence.lowercased().filter { $0.isLetter }
        let palindrome = filteredText == String(filteredText.reversed())
        alertMessage = palindrome ? "isPalindrome" : "not palindrome"
        showAlert = true
    }
}

