//
//  SecondScreen.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import SwiftUI

struct SecondScreen: View {
    @ObservedObject var viewModel: SecondScreenModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome")
                    .padding(.top, 20)
                    .padding(.leading, 20)
                Text(viewModel.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            VStack{
                Text("\(viewModel.selectedUser?.firstName ?? "") \(viewModel.selectedUser?.lastName ?? "Selected User Name")")
                    .font(.title)
                    .fontWeight(.bold)
            
                Spacer()

                NavigationLink(
                    destination: ThirdScreen(viewModel: ThirdScreenModel(), selectedUser: $viewModel.selectedUser),
                    label: {
                        Text("Choose a User")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 310, height: 41)
                            .background(Color(hex: "#2B637B"))
                            .cornerRadius(12)
                    }
                )
                .padding(.bottom, 20)
            }
            .navigationTitle("Second Screen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen(viewModel: SecondScreenModel(name: "No Name"))
    }
}

