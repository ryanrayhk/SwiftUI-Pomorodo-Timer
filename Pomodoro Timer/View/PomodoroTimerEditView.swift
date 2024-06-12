//
//  PomodoroTimerEditView.swift
//  Pomodoro Timer
//
//  Created by Ray Chow on 2/5/2024.
//

import SwiftUI
import SwiftData

struct PomodoroTimerEditView: View {
    @Bindable var item: Item
#if os(iOS)
    var pickerStyle = WheelPickerStyle()
#else
    var pickerStyle = DefaultPickerStyle()
#endif
    var workTimeOptions = [15, 20, 25, 30, 35]
    var shortBreakTimeOptions = 5...10
    var longBreakTimeOptions = 20...30
    @State private var showingAlert = false
    
    var body: some View {
        Form {
            LabeledContent("Name") {
                TextField("Name", text: $item.name)
                .multilineTextAlignment(.trailing)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("This name already exists."), dismissButton: .default(Text("OK")))
                }
            }
            Section("Time", content: {
                HStack {
                    VStack {
                        Text("Work")
                        Picker(selection: $item.workTime, label: Text("Work Time")) {
                            ForEach(workTimeOptions, id: \.self) { index in
                                Text("\(index)").tag(index*60)
                            }
                        }
                        .pickerStyle(pickerStyle)
                    }
                    VStack {
                        Text("Short Break")
                        Picker(selection: $item.shortBreakTime, label: Text("Short Break Time")) {
                            ForEach(shortBreakTimeOptions, id: \.self) { index in
                                Text("\(index)").tag(index*60)
                            }
                        }
                        .pickerStyle(pickerStyle)
                    }
                    VStack {
                        Text("Long Break")
                        Picker(selection: $item.longBreakTime, label: Text("Long Break Time")) {
                            ForEach(longBreakTimeOptions, id: \.self) { index in
                                Text("\(index)").tag(index*60)
                            }
                        }.pickerStyle(pickerStyle)
                    }
                }
            })
            Section("Work Notes", content: {
                TextEditor(text: $item.workNotes)
            })
            Section("Short Break Notes", content: {
                TextEditor(text: $item.shortBreakNotes)
            })
            Section("Long Break Notes", content: {
                TextEditor(text: $item.longBreakNotes)
            })
        }
    }
}
