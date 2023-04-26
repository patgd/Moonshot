//
//  ListContentView.swift
//  Moonshot
//
//  Created by pat on 4/25/23.
//

import SwiftUI

struct ListContentView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                HStack {
                    Spacer()
                    VStack {
                        Text(mission.displayName)
                            .font(.title2.bold())
                        Text(mission.formattedLaunchDate)
                            .font(.caption.bold())
//                            .foregroundColor(.white.opacity(0.5))
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Spacer()
                    
                }
                .padding(.vertical)
            }
            .background(.lightBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .listStyle(.plain)
        .listRowBackground(Color.darkBackground)
//        .background(.darkBackground)
        .scrollContentBackground(.hidden)
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
//            .background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}
