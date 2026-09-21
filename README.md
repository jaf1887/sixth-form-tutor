# Sixth Form Tutor 🎓

A SwiftUI iOS study companion for Computer Science, Information Technology and Business BTEC.

## Features in this starter

- Home dashboard with study progress
- Subject-specific revision tasks
- Mark tasks complete/incomplete
- Saves task completion locally between launches using `UserDefaults`

## Run it in Xcode

1. Open Xcode on a Mac and choose **File → New → Project → iOS → App**.
2. Set the product name to **SixthFormTutor**, interface **SwiftUI**, language **Swift**, and deployment target **iOS 17.0** or newer.
3. Remove the generated `ContentView.swift` and `SixthFormTutorApp.swift` from the project (choose **Move to Trash** only for these generated files).
4. Drag every `.swift` file from this repository's `SixthFormTutor/` folder into the Xcode project. Ensure **Add to target: SixthFormTutor** is checked.
5. Run in the iOS Simulator or on your iPhone/iPad using your Apple development signing team.

> This repository contains the SwiftUI source starter, **not** a generated `.xcodeproj` file. Xcode creates that project and its signing settings on your Mac.

## Repository structure

```
SixthFormTutor/
  SixthFormTutorApp.swift
  StudyModels.swift
  StudyStore.swift
  ContentView.swift
  DashboardView.swift
  SubjectViews.swift
  TasksView.swift
.gitignore
README.md
```

## Next steps

- Add custom tasks and study reminders
- Add quizzes and flashcards
- Add a calendar and study streaks
- Add optional cloud sync and AI tutoring **only after** building a secure backend; never put API keys in an iOS app or a public repo

## Privacy

The starter stores checklist completion only on the device. It does not send study information to a server.
