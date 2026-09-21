import SwiftUI

@main
struct SixthFormTutorApp: App {
    @StateObject private var store = StudyStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
