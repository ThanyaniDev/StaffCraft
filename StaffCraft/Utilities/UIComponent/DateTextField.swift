//
//  DateTextField.swift
//  StaffCraft
//
//  Created by Tshikonwani, Thanyani TR on 2024/05/28.
//

import SwiftUI

struct DateTextField: View {
    @Binding var date: Date?
    @State private var showDatePicker = false
    private var dateFormatter: DateFormatter
    
    init(date: Binding<Date?>) {
        self._date = date
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField("", text: Binding(
                get: { date != nil ? dateFormatter.string(from: date!) : "Date of Birth"},
                set: { _ in }
            ))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Color.black, lineWidth: 1)
            )
            .onTapGesture {
                withAnimation {
                    showDatePicker.toggle()
                }
            }
           
            if showDatePicker {
                DatePicker(
                    "",
                    selection: Binding(
                        get: { date ?? Date() },
                        set: { date = $0 }
                    ),
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(Color.black, lineWidth: 1)
                )
                .transition(.opacity)
                .onChange(of: date) { _ in
                    withAnimation {
                        showDatePicker = false
                    }
                }
            }
        }
        .padding()
    }
}
