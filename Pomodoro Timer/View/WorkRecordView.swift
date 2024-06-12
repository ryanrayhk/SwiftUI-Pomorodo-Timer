import SwiftUI
import CoreData

struct WorkRecordView: View {
    @AppStorage("workRecordSelectedTab") private var tabTag = 2
    // if i need to view records of a task, use below code
    // @FetchRequest(
    //     entity: WorkRecord.entity(),
    //     sortDescriptors: [NSSortDescriptor(keyPath: \WorkRecord.startTime, ascending: true)],
    //     predicate: NSPredicate(format: "task == %@", yourTaskObject)
    // ) private var workRecords: FetchedResults<WorkRecord>

    var body: some View {
//        TabView(selection: $tabTag) {
//            LazyVStack {
//                ForEach(workRecords, id: \.id) { workRecord in
//                    Text(workRecord.note) // Display the note of each work record
//                }
//            }.tabItem { Text("Today") }.tag(1)
//            LazyVStack {
//                ForEach(workRecords, id: \.id) { workRecord in
//                    Text(workRecord.note) // Display the note of each work record
//                }
//            }.tabItem { Text("All") }.tag(2)
//        }
        Text("hi")
    }
}

#Preview {
    WorkRecordView()
}
