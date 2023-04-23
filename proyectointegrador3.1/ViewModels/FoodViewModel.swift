//
//  FoodViewModel.swift
//  proyectointegrador3
//
//  Created by Jose A Meza Mendoza on 4/23/23.
//

import Foundation
import Combine
import FirebaseFirestore

class FoodViewModel: ObservableObject {
    
    @Published var food: Food
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(food: Food = Food(title: "", employee: "", status: "")) {
        self.food = food
        self.$food
            .dropFirst()
            .sink{ [weak self] food in
                self?.modified = true
                
            }
            .store(in: &self.cancellables)

    }
    //Firstore
    
    private var db = Firestore.firestore()
    
    private func addFood(_ food: Food) {
        do {
            let _ = try db.collection("foodlist").addDocument(from: food)
        }
        catch {
            print(error)
        }
    }
}
