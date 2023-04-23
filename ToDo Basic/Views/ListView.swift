//
//  ListView.swift
//  ToDo Basic
//
//  Created by Golyakovph on 20.04.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
        
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listViewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)

                }
            }
        }
        .navigationTitle("ToDo list 🌵")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }.environmentObject(ListViewModel())
    }
}

