import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var store: StudyStore

    private var progress: Double {
        guard !store.tasks.isEmpty else { return 0 }
        return Double(store.completedCount) / Double(store.tasks.count)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your study dashboard")
                        .font(.title2.bold())
                    Text("One focused task at a time. You've got this.")
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Revision progress")
                        .font(.headline)
                    ProgressView(value: progress)
                    Text("\(store.completedCount) of \(store.tasks.count) tasks complete")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 16))

                Text("Your subjects")
                    .font(.title3.bold())

                ForEach(StudySubject.all) { subject in
                    NavigationLink {
                        SubjectDetailView(subject: subject)
                    } label: {
                        HStack(spacing: 14) {
                            Image(systemName: subject.symbol)
                                .font(.title2)
                                .frame(width: 36)
                            VStack(alignment: .leading) {
                                Text(subject.title).font(.headline)
                                Text("\(store.completedCount(for: subject.id))/\(store.tasks(for: subject.id).count) complete")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 16))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Sixth Form Tutor")
    }
}
