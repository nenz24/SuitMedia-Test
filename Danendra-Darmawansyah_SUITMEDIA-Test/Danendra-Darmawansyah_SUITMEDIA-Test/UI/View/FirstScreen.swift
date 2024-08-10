//
//  FirstScreen.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import SwiftUI

struct FirstScreen: View {
    @StateObject private var viewModel = FirstScreenModel()
    @State private var isImageView = false
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 12) {
                    Spacer()
                    Button(action: {
                        isImageView = true
                    }) {
                        HStack {
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 116, height: 116)
                                    .clipShape(Circle())
                            } else {
                                Image("ic_photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 116, height: 116)
                                    .clipShape(Circle())
                            }
                        }
                        .padding()
                        .foregroundColor(Color(.systemGray4))
                        .cornerRadius(10)
                    }

                    TextField("Name", text: $viewModel.name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .modifier(TextFieldModifier())

                    TextField("Palindrome", text: $viewModel.sentence)
                        .modifier(TextFieldModifier())
                        .disableAutocorrection(true)
                        .padding(.bottom)

                    Button("Check") {
                        viewModel.palindromeChecker()
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(
                            title: Text(viewModel.alertMessage == "isPalindrome" ? "Palindrome" : "Not Palindrome"),
                            message: Text(viewModel.alertMessage),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 310, height: 41)
                    .background(Color(hex: "#2B637B"))
                    .cornerRadius(12)

                    NavigationLink(destination: SecondScreen(viewModel: SecondScreenModel(name: viewModel.name))) {
                        Text("Next")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 41)
                            .background(Color(hex: "#2B637B"))
                            .cornerRadius(12)
                    }

                    Spacer()
                }
                .padding(.vertical)
                .sheet(isPresented: $isImageView) {
                    ImageView(image: $selectedImage)
                }
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
