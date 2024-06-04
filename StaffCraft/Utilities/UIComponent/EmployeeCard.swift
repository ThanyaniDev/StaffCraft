//
//  EmployeeCard.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct EmployeeCard: View {
    var imageUrl: String?
    var employeeName: String?
    var employeeEmail: String?
    @Binding var isShowingEmployeeList: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
                .frame(height: 60)
                .padding(.horizontal, 16)

            HStack {
                AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                    } else if phase.error == nil {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding()
                    }
                }

                VStack(alignment: .leading) {
                    if let name = employeeName, !name.isEmpty {
                        Text(name)
                            .font(.headline)
                    } else {
                        Text("Full Name")
                            .font(.headline)
                    }
                    
                    if let email = employeeEmail, !email.isEmpty {
                        Text(email)
                            .font(.subheadline)
                    } else {
                        Text("Email")
                            .font(.subheadline)
                    }
                }
                .padding()

                Spacer()

                Button(action: {
                    isShowingEmployeeList = true
                }) {
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .sheet(isPresented: $isShowingEmployeeList) {
                    EmployeeListView()
                        .environmentObject(UserData())
                }
            }
            .padding()
        }
    }
}
