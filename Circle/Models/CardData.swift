//
//  CardData.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 23/10/25.
//

import Foundation

class CardData: Identifiable {
    let id = UUID()
    let text1: String
    let text2: String
    let text3: String?
    
    init(text1: String, text2: String, text3: String?) {
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
    }
}
