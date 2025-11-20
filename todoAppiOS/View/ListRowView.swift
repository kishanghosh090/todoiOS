//
//  ListRowView.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

internal import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

#Preview {
    var item1 = ItemModel(Id: "ietm2", Title: "my title", IsCompleted: false)
    ListRowView(item: item1)
}
