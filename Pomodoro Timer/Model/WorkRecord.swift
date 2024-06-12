import Foundation
import SwiftData

@Model
final class WorkRecord: Identifiable, ObservableObject {
    @Attribute var id: UUID
    @Attribute var task: Task
    @Attribute var startTime: Date
    @Attribute var endTime: Date
    @Attribute var note: String

    init(task: Task, startTime: Date, endTime: Date, note: String) {
        self.id = UUID()
        self.task = task
        self.startTime = startTime
        self.endTime = endTime
        self.note = note
    }
}