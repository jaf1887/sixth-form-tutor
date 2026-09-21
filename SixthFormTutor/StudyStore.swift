import Foundation
import Combine

final class StudyStore: ObservableObject {
    @Published private(set) var tasks: [StudyTask] = [] {
        didSet { save() }
    }

    private let storageKey = "sixthFormTutor.tasks.v1"

    init() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([StudyTask].self, from: data) {
            tasks = saved
        } else {
            tasks = [
                StudyTask(subjectID: "cs", title: "Practise binary and hexadecimal conversions"),
                StudyTask(subjectID: "cs", title: "Review algorithms and pseudocode"),
                StudyTask(subjectID: "it", title: "Revise data security and networking"),
                StudyTask(subjectID: "business", title: "Review Apple stakeholder notes"),
                StudyTask(subjectID: "business", title: "Review British Heart Foundation notes")
            ]
            save()
        }
    }

    var completedCount: Int { tasks.filter(\.isComplete).count }

    func tasks(for subjectID: String) -> [StudyTask] {
        tasks.filter { $0.subjectID == subjectID }
    }

    func completedCount(for subjectID: String) -> Int {
        tasks(for: subjectID).filter(\.isComplete).count
    }

    func toggle(_ id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isComplete.toggle()
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(tasks) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }
}
