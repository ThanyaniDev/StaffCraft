//
//  AdditionalInfoListViewModel.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/29.
//

import SwiftUI

class AdditionalInfoListViewModel: ObservableObject {
    @Published var additionalInfo: [AdditionalInfoList] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""
    
    @DependencyInjector
    private var additionalInfoListRepository: AdditionalInfoListRepository
    
    @MainActor
    func fetchAdditionalInfo() async {
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            let additionalInfoList = try await additionalInfoListRepository.fetchAdditionalInfoList()
            self.additionalInfo = additionalInfoList
        } catch {
            self.errorMessage = "An error occurred while processing your request. Please try again later."
        }
    }
    
    var filteredColors: [AdditionalInfoList] {
        if searchText.isEmpty {
            return additionalInfo
        } else {
            return additionalInfo.filter { additionalInfo in
                additionalInfo.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
