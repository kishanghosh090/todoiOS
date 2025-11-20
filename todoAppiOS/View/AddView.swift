//
//  AddView.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

internal import SwiftUI

struct AddView: View {
    
    // dismiss view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textFieldText: String = ""
    @State var aleartTitle: String = ""
    @State var showAleart: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something here...",
                          text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 0.6, saturation: 0.048, brightness: 0.916))
                .cornerRadius(10)
                
                Button(action: saveButtonTapped){
                    
                       Text("save")
                           .foregroundStyle(.white)
                           .font(.headline)
                           .frame(width: 250, height: 40,alignment: .center)
                           .background(Color.accentColor)
                           .cornerRadius(20)
                           
                   
                }
            }.padding(16)
        }.navigationTitle("Add and Item")
            .alert(isPresented: $showAleart, content: getAleart)
    }
    func saveButtonTapped(){
        if textValid(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textValid() -> Bool{
        if textFieldText.count < 3 {
            aleartTitle = "your todo item should contain atleast 3 characters"
            showAleart.toggle()
            return false
        }
        return true
    }
    func getAleart() -> Alert {
        return Alert(title: Text(aleartTitle))
    }
}

#Preview {
    AddView()
}
