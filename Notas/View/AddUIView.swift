//
//  AddUIView.swift
//  Notas
//
//  Created by Pablo Nicolas Sabaliauskas on 2023-03-26.
//

import SwiftUI



struct AddUIView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    var body: some View {
        VStack{
            Text("Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer()
            Button(action: {
                model.saveData(context: context)
            }){
                Label(
                    title: {Text("Guardar").foregroundColor(.white).bold()},
                    icon: {Image(systemName: "plus").foregroundColor(.blue)})
            }.padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}
