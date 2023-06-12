//
//  HomeUIView.swift
//  Notas
//
//  Created by Pablo Nicolas Sabaliauskas on 2023-03-26.
//

import SwiftUI

struct HomeUIView: View {
    
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)], animation: .spring()) var result: FetchedResults<Notas>
    @Environment(\.managedObjectContext) var context

    var body: some View {
        NavigationView{
            List{
                ForEach(result){ item in
                    VStack(alignment: .leading){
                        Text(item.nota ?? "Sin Nota")
                            .font(.title)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date  )
                    }.contextMenu(menuItems: {
                        Button(action:{
                            model.sendData(item: item)
                        }){
                            Label(title: {
                                Text("Editar")
                            }, icon: {
                              Image(systemName: "pencil")
                            })
                        }
                        Button(action:{
                            model.deleteData(item: item, context: context)
                        }){
                            Label(title: {
                                Text("Eliminar")
                            }, icon: {
                              Image(systemName: "trash")
                            })
                        }
                    })
                    
                }
            }.navigationBarTitle("Notas")
                .navigationBarItems(trailing:
                                        Button(action: {
                    model.show.toggle()
                }){
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                
                
                
                ).sheet(isPresented: $model.show, content: {
                    AddUIView(model:model)
                })
            
        }
    }
}


