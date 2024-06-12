//
//  Item.swift
//  Pomodoro Timer
//
//  Created by Ray Chow on 18/4/2024.
//

import Foundation
import SwiftData

@Model
final class Item : Identifiable, ObservableObject, Hashable{
    var timestamp: Date
    @Attribute var name: String
    static let defaultNamePrefix = "Timer"
    
    let id = UUID()
    
    var workTime: Int
    var shortBreakTime:Int
    var longBreakTime: Int
    var cycle: Int
    var breakArray: [TimeInterval]
    var editHistory:[String]
    var order: Int
    var workNotes: String
    var shortBreakNotes: String
    var longBreakNotes: String
    
    init(timestamp: Date = .now, nameSuffix: Int, order: Int, notes: String = "") {
        self.timestamp = timestamp
        self.name = "\(Item.defaultNamePrefix)\(nameSuffix)"
        self.workTime = 25*60
        self.shortBreakTime = 5*60
        self.longBreakTime = 25*60
        self.cycle = 4
        self.breakArray = []
        self.editHistory = []
        self.order = order
        self.workNotes = notes
        self.shortBreakNotes = ""
        self.longBreakNotes = ""
    }
    
    func changeTimeForTest(){
        self.workTime = 1
        self.shortBreakTime = 2
        self.longBreakTime = 3
    }
}
