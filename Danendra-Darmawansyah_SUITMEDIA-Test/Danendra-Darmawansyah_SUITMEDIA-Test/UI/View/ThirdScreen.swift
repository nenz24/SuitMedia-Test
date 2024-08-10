//
//  ThirdScreen.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 11/08/24.
//

import SwiftUI

struct ThirdScreen: View {
    @ObservedObject var viewModel: ThirdScreenModel
    @Binding var selectedUser: User?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if viewModel.users.isEmpty {
                Spacer()
                Text("Pull Down to Refresh")
                    .foregroundColor(.gray)
                    .padding()
                List(viewModel.users) { user in
                    Button(action: {
                        selectedUser = user
                    }) {
                        HStack {
                            AsyncImage(url: URL(string: user.avatar)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            VStack(alignment: .leading) {
                                Text("\(user.firstName) \(user.lastName)")
                                Text("\(user.email)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            } else {
                List(viewModel.users) { user in
                    Button(action: {
                        selectedUser = user
                        // Optionally, reload data if needed
                        // viewModel.loadData()
                    }) {
                        HStack {
                            AsyncImage(url: URL(string: user.avatar)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            VStack(alignment: .leading) {
                                Text("\(user.firstName) \(user.lastName)")
                                Text("\(user.email)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .onAppear {
            if viewModel.users.isEmpty {
                viewModel.loadData()
            }
        }
        .refreshable {
            viewModel.loadData()
        }
        .navigationTitle("Third Screen")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen(
            viewModel: ThirdScreenModel(),
            selectedUser: .constant(User(id: 1, email: "example@example.com", firstName: "example", lastName: "example", avatar: ""))
        )
    }
    
}
