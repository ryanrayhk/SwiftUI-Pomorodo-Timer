import Foundation

enum TimerMode {
    case work
    case rest
}

enum TimerStatus {
    case new
    case run
    case stop
    case end
}

class TimerVM: ObservableObject {
    var item: Item
    var timer:Timer? = nil
    var timerMode:TimerMode = .work
    var duration: Int {
        timerMode == .work
        ? item.workTime
        : breakTime
    }
    var isLongBreak:Bool{
        cycle % 4 == 3
    }
    var breakTime: Int {
        isLongBreak ? item.longBreakTime : item.shortBreakTime
    }
    var notes:String{
        timerMode == .work
        ? item.workNotes
        : (isLongBreak ? item.longBreakNotes : item.shortBreakNotes)
    }
    @Published var endDate:Date = Date()
    @Published var remainDuration: Int = 0
    @Published var status: TimerStatus = .new
    
    var cycle = 0
    var finishedCycle = 0
    
    init(item: Item) {
        self.item = item
        self.cycle = item.cycle
        self.remainDuration = duration
    }

    func startTimer() {
        print("startTimer() called")
        if(status == .new || status == .end){
            timer?.invalidate()
            remainDuration = duration
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainDuration > 1 {
                self.remainDuration -= 1
            } else {
                self.end()
            }
        }
        endDate = Date(timeIntervalSinceNow: TimeInterval(duration))
        RunLoop.current.add(timer!, forMode: .common)
        status = .run
    }
    
    
    
    func end(){
        print("end() called")
        status = .end
        if timerMode == .rest{
            cycle+=1
        }
        switchMode()
        remainDuration = duration
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func switchMode(){
        timerMode = timerMode == .work
        ? .rest
        : .work
    }
    
    var timerModeString: String {
        timerMode == .work ? "Work" : "Rest"
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func pauseTimer() {
        timer?.invalidate()
        status = .stop
    }

    func resumeTimer() {
        startTimer()
    }
}
