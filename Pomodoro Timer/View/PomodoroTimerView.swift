import SwiftUI
import SwiftData

struct PomodoroTimerView: View {
    @Bindable var item: Item
    @State var editable = false
    var timerVM: TimerVM {
        TimerVM(item: item)
    }
    
    var body: some View {
        VStack() {
            if editable {
                PomodoroTimerEditView(item: item)
            }else{
//                NavigationLink(destination: ){
//                    VStack{
//                        Text(timerVM.timerModeString)
//                        Text(formatDuration(duration: timerVM.duration))
//                        Spacer()
//                            .frame(height: 40.0)
//                        if(!item.notes.isEmpty){
//                            Text(item.notes)
//                            Spacer()
//                                .frame(height: 40.0)
//                        }
//                        Text("Click anywhere to start")
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .padding(20)
//                }
                TimerRunningView(timerVM: TimerVM(item: item))
                
//                Button (action: {
//                    NavigationLink(destination: ) {
//                        Text("Start Timer")
//                    }
//                }){
//                    
//                }
            }
        }
        .navigationTitle(item.name)
        .toolbar {
            if editable {
                getToolbarSaveButton()
            } else {
                getToolbarEditButton()
            }
        }
    }
    
    func getToolbarEditButton() -> some View{
        let title = "Edit"
        let iconName = "pencil"
        
        return Button(action: {
            editable = true
        }) {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: iconName) }
            )
        }
    }
    
    func getToolbarSaveButton() -> some View{
        let title = "Save"
        let iconName = "rectangle.portrait.and.arrow.forward"
        
        return Button(action: {
            editable = false
        }) {
            Label(
                title: { Text(title) },
                icon: { Image(systemName: iconName) }
            )
        }
    }
    
    
    
}
