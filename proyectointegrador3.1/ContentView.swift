//
//  ContentView.swift
//  proyectointegrador3
//
//  Created by Jose A Meza Mendoza on 4/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FoodsViewModel() //FoodViewMode.Swift
    private var addButton: some View {
        Button(action:{}) {
            Image(systemName: "plus")
        }
    }
    
    private func foodRowView(food: Food) -> some View {
        NavigationLink(destination: FoodDetailsView()) {
            VStack(alignment: .leading) {
                Text(food.employee)
                    .font(.headline)
                //Text(food.status)
                // .font(.subheadline)
                Text(food.title)
                    .font(.subheadline)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach (viewModel.foods) {food in foodRowView(food: food)
                }
            }
            .navigationBarTitle("FoodOrder")
            .navigationBarItems(trailing: addButton)
            .onAppear() {
                print("FoodListView appears. Subscribing to data updates")
                self.viewModel.suscribe()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
