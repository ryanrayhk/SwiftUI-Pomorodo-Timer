import Foundation
import SwiftData

@Model
final class Task: Identifiable, ObservableObject {
    @Attribute var id: UUID
    @Attribute var name: String
    @Attribute var completionDate: Date
    @Attribute var note: String

    init(name: String, completionDate: Date, note: String) {
        self.id = UUID()
        self.name = name
        self.completionDate = completionDate
        self.note = note
    }
}