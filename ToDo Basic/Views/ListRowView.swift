//
//  ListRowView.swift
//  ToDo Basic
//
//  Created by Golyakovph on 20.04.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ListModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
                .font(.callout)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 3)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ListModel(title: "First", isCompleted: false)
    static var item2 = ListModel(title: "Second", isCompleted: true)

    static var previews: some View {
        Group {
            VStack {
                ListRowView(item: item1)
                ListRowView(item: item2)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
