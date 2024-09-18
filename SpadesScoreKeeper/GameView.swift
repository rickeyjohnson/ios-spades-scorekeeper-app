//
//  ContentView.swift
//  SpadesScoreKeeper
//
//  Created by Rickey Johnson on 3/28/24.
//

import SwiftUI

struct GameView: View {
    // all the stagnic vars
    let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    
    // @State vars
    @State var teamAScore = 0
    @State var teamBScore = 0
    @State var selectedBid = 8
    @State var selectedTricksWon = 8
    @State var selectedTeam: String = "teamA"
    
    // closures
    var points: Int {
        if (selectedTricksWon >= selectedBid) {
            return selectedBid * 10 + (selectedTricksWon - selectedBid)
        }
        
        return -selectedBid * 10
    }
    
    func addPointsToSelectedTeam(selectedTeam: String) {
        if (selectedTeam == "teamA") {
            teamAScore += points
            return
        }
        
        teamBScore += points
        return
    }
    
    
    var body: some View {
        ZStack {
            mainColor
            
            VStack {
                
                Spacer()
                
                HeaderView()
                
                Spacer()
                
                HStack() {
                    Spacer()
                    TeamScoreView(name: "teamA", score: teamAScore)
                    Spacer()
                        .frame(width: 120)
                    
                    TeamScoreView(name: "teamB", score: teamBScore)
                    Spacer()
                }
                .padding(.top)
                .foregroundColor(.white)
                
                VStack {
                    Text("bid")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    Picker("team select", selection: $selectedTeam) {
                        Text("team A").tag("teamA")
                        Text("team B").tag("teamB")
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    Picker("bid", selection: $selectedBid) {
                        ForEach(nums, id: \.self) { num in
                            Text("\(num)").tag(num)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 300, height: 150)
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.white)

                    HStack {
                        VStack {
                            Text("tricks")
                            Text("won:")
                        }
                        .padding()
                        .foregroundColor(.black)
                        Picker("tricks", selection: $selectedTricksWon) {
                            ForEach(nums, id: \.self) { num in
                                Text("\(num)").tag(num)
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 100)
                    }
                    .padding()
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    addPointsToSelectedTeam(selectedTeam: selectedTeam)
                }, label: {
                    Text("Add")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                })
                .padding()
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Spacer()
                
                Button("reset") {
                    teamAScore = 0
                    teamBScore = 0
                }
                
                Spacer()

            }
            .background(mainColor)
            
            Spacer()
        }
    }
    
}

struct HeaderView: View {
    var body: some View {
        Text("Spades")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .kerning(1.0)
        Text("score keeper")
            .font(.title2)
            .tracking(4.0)
            .fontWeight(.medium)
            .foregroundStyle(.white)
    }
}

struct TeamScoreView: View {
    var name: String
    var score: Int
    
    var body: some View {
        VStack {
            Text("\(name)")
                .font(.title3)
            
            Text("\(score)")
                .font(.system(size: 75, weight: .bold))
        }
    }
}

#Preview {
    GameView()
}

