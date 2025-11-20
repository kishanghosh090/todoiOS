//
//  ListView.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

internal import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewmodel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewmodel.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewmodel.items){item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.bouncy){
                                    listViewmodel.update(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewmodel.deleteItem)
                        .onMove(perform: listViewmodel.moveItems)
                
                }
            }
        }.navigationTitle("Todo List")
            .navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add", destination: AddView()))
        
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}
