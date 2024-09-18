//
//  TeamModel.swift
//  SpadesScoreKeeper
//
//  Created by Rickey Johnson on 3/29/24.
//

import SwiftUI

struct TeamModel: Identifiable {
    var id = UUID()
    var name: String
    var score: Int
    var bags: Int
}
