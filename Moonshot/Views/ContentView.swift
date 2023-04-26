//
//  ContentView.swift
//  Moonshot
//
//  Created by pat on 4/24/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridContentView(astronauts: astronauts, missions: missions)
                        .background(.darkBackground)
                } else {
                    ListContentView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationBarTitle("Moonshot")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Image(systemName: showingGrid ? "list.star" : "square.grid.2x2")
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    }
                }
            }
//            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
