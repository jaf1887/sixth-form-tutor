import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DashboardView()
            }
            .tabItem { Label("Home", systemImage: "house") }

            NavigationStack {
                SubjectListView()
            }
            .tabItem { Label("Subjects", systemImage: "books.vertical") }

            NavigationStack {
                TasksView()
            }
            .tabItem { Label("Tasks", systemImage: "checklist") }
        }
    }
}
