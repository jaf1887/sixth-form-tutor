import SwiftUI

struct SubjectListView: View {
    var body: some View {
        List(StudySubject.all) { subject in
            NavigationLink {
                SubjectDetailView(subject: subject)
            } label: {
                Label {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(subject.title)
                        Text(subject.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                } icon: {
                    Image(systemName: subject.symbol)
                }
            }
        }
        .navigationTitle("Subjects")
    }
}

struct SubjectDetailView: View {
    @EnvironmentObject private var store: StudyStore
    let subject: StudySubject

    var body: some View {
        List {
            Section("About") {
                Text(subject.description)
            }
            Section("Revision tasks") {
                ForEach(store.tasks(for: subject.id)) { task in
                    Button {
                        store.toggle(task.id)
                    } label: {
                        Label(task.title, systemImage: task.isComplete ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(task.isComplete ? .secondary : .primary)
                    }
                    .accessibilityLabel("\(task.title), \(task.isComplete ? "completed" : "not completed")")
                }
            }
        }
        .navigationTitle(subject.title)
    }
}
