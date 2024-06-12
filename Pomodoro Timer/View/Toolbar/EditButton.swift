import SwiftUI

struct myEditButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Label(
                title: { Text("Edit") },
                icon: { Image(systemName: "pencil") }
            )
            
        }
    }
}

#Preview {
    myEditButton(action: {})
}
