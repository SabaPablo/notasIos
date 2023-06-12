//
//  ViewModel.swift
//  Notas
//
//  Created by Pablo Nicolas Sabaliauskas on 2023-03-26.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateItem: Notas?
    
    // CoreData
    
    func saveData(context: NSManagedObjectContext){
        
        let newNota = updateItem ?? Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do {
            try context.save()
            print("Guardado")
            show.toggle()

            resetData()
        } catch let error as NSError {
            // una alerta.
            print("No guardo", error.localizedDescription)
        }
    }
    
    
    func resetData(){
        updateItem = nil
        nota = ""
        fecha = Date()
        show = false
    }
    
    func deleteData(item:Notas,context: NSManagedObjectContext){
        context.delete(item)
        do {
            try context.save()
        } catch let error as NSError {
            print("No Elimino", error.localizedDescription)
        }
    }
    
    func sendData(item: Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    
}
