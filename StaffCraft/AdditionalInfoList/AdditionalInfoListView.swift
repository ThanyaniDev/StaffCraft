//
//  AdditionalInfoListView.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import SwiftUI

struct AdditionalInfoListView: View {
    
    @StateObject private var viewModel = AdditionalInfoListViewModel()
    @State private var showErrorStatusView = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    if let errorMessage = viewModel.errorMessage {
                        StatusView(status: .failure, headline: "Error", subheadline: errorMessage)
                    } else {
                        
                        HStack(alignment: .firstTextBaseline){
                            Spacer()
                            Text("Select a Preferred Color")
                                .font(.headline)
                                .padding(.top)
                            Spacer()
                        }
                        
                        VStack {
                            TextField("Find a preferred color", text: $viewModel.searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            List(viewModel.filteredColors) { additionalInfo in
                                Button(action: {
                                    userData.selectedPreferredColor = additionalInfo.name
                                    userData.selectedPreferredHexColor = additionalInfo.color
                                    
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack() {
                                        HexColorCircle(hexColor:  additionalInfo.color)
                                            .padding()
                                        
                                        VStack(alignment: .leading) {
                                            Text(additionalInfo.name)
                                                .font(.headline)
                                        }
                                    }
                                }
                                
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchAdditionalInfo()
            }
        }
    }
}

#Preview {
    AdditionalInfoListView()
}
