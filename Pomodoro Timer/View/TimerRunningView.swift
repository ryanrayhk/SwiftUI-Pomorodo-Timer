import SwiftUI

struct TimerRunningView: View {
    @ObservedObject var timerVM: TimerVM
    
    var timeSpentPercentage:CGFloat{
        CGFloat(timerVM.duration - timerVM.remainDuration)/CGFloat(timerVM.duration)
    }
    
    var statusImageName:String{
        timerVM.timerMode == .work
        ?"sun.max.fill"
        :"powersleep"
    }

    var body: some View {
            VStack{
                Spacer()
                ZStack{
                    Circle()
                        .trim(from: 0.00, to: 1)
                        .stroke(Color.secondary, lineWidth: 10)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(270))
                    Circle()
                        .trim(from: 0.00, to: timeSpentPercentage)
                        .stroke(Color.primary, lineWidth: 10)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(270))
                    VStack{
                        Image(systemName: statusImageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(formatDuration(duration:timerVM.remainDuration))
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                }
                .animation(.default)
                Spacer()
                Text(timerVM.notes)
                Spacer()
                HStack{
                    Text("photo to record what you have done")
                    timerVM.status != .run
                    ?Button(action: {
                        timerVM.startTimer()
                    }) {
                        Image(systemName: "play.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.secondary)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    :Button(action: {
                        timerVM.pauseTimer()
                    }) {
                        Image(systemName: "stop.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.secondary)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    Text("you finish the work so quick and skip this work time and rest")
                }
            }
        
    }
}

#Preview {
    TimerRunningView(timerVM: TimerVM(item: Item(nameSuffix:1, order:0, notes: "notes")))
}
