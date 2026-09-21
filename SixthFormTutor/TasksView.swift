import SwiftUI

struct TasksView: View {
    @EnvironmentObject private var store: StudyStore

    var body: some View {
        List {
            ForEach(StudySubject.all) { subject in
                Section(subject.title) {
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
        }
        .navigationTitle("Revision tasks")
    }
}
