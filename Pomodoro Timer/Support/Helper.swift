import Foundation

func formatDuration(duration:Int) -> String {
    let minutes = duration / 60
    let seconds = duration % 60
    return String(format: "%d : %02d", minutes, seconds)
}
