//
//  MissionView.swift
//  Moonshot
//
//  Created by pat on 4/25/23.
//

import SwiftUI

struct MissionView: View {
    
    
    var mission: Mission
    var crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.6)
                            .padding(.top)
                        Text(mission.formattedLaunchDate)
                            .font(.headline)
                        
                        VStack (alignment: .leading) {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.lightBackground)
                                .padding(.vertical)
                            
                            Text("Mission Highlights")
                                .font(.title.bold())
                                .padding(.bottom, 5)
                            
                            Text(mission.description)
                            
                            Text("Crew")
                                .font(.title.bold())
                                .padding(.vertical, 5)
                        }
                        .padding([.bottom, .horizontal])
                        
                       CrewView(crew: crew)
                    }
                }
                .navigationTitle(mission.displayName)
                .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
