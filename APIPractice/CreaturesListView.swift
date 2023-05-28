//
//  CreaturesListView.swift
//  APIPractice
//
//  Created by 강성찬 on 2023-05-27.
//

import SwiftUI

struct CreaturesListView: View {
    
    @StateObject var creaturesVM = CreaturesListViewModel()
    
    var body: some View {
        NavigationStack {
            List(creaturesVM.creaturesArray, id: \.self) { creature in
                Text(creature.name)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .task {
            await creaturesVM.getData()
        }
    }
}

struct CreaturesListView_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesListView()
    }
}
