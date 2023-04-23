//
//  FoodsViewModel.swift
//  proyectointegrador3
//
//  Created by Jose A Meza Mendoza on 4/23/23.
//

import Foundation
import Combine
import FirebaseFirestore

class FoodsViewModel: ObservableObject {
    @Published var foods = [Food]()
    
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit {
        unsubscribe()
    }
    
    func unsubscribe() {
        if listenerRegistration != nil {
            listenerRegistration?.remove()
            listenerRegistration = nil
        }
    }
    
    func suscribe(){
        if listenerRegistration == nil {
            listenerRegistration = db.collection("foodlist").addSnapshotListener {(QuerySnapshot, error) in guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
                self.foods = documents.compactMap {queryDocumentSnapshot in try? queryDocumentSnapshot.data(as: Food.self)}
            }
        }
    }
}
