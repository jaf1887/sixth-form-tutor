import Foundation

struct StudySubject: Identifiable {
    let id: String
    let title: String
    let symbol: String
    let description: String

    static let all: [StudySubject] = [
        .init(id: "cs", title: "Computer Science", symbol: "desktopcomputer", description: "Programming, algorithms and computer systems"),
        .init(id: "it", title: "Information Technology", symbol: "network", description: "IT systems, data and digital solutions"),
        .init(id: "business", title: "Business BTEC", symbol: "chart.bar", description: "Organisations, stakeholders and coursework")
    ]
}

struct StudyTask: Identifiable, Codable {
    var id: UUID = UUID()
    var subjectID: String
    var title: String
    var isComplete: Bool = false
}
