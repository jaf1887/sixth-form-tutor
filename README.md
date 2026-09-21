# Sixth Form Tutor 🎓

A native **SwiftUI iPhone and iPad app** for Computer Science, Information Technology and Business BTEC revision.

## Current features

- Dashboard with completed/total revision tasks
- Subject pages for Computer Science, Information Technology and Business BTEC
- Tap-to-complete revision checklists
- On-device persistence using `UserDefaults`; no account or backend required

## Open and run it on a Mac

1. Install **Xcode** on your Mac.
2. Download or clone this repository: `git clone https://github.com/jaf1887/sixth-form-tutor.git`.
3. Open **`SixthFormTutor.xcodeproj`** in Xcode.
4. Choose the shared **SixthFormTutor** scheme and an iPhone/iPad simulator, then press **Run ▶**.

You do **not** need to make a second Xcode project or manually import the Swift files.

## Install on your own iPhone or iPad

1. Connect your device to your Mac or pair it with Xcode for wireless development.
2. In Xcode select the **SixthFormTutor** project → **SixthFormTutor** target → **Signing & Capabilities**.
3. Enable **Automatically manage signing** and select your Apple development team / Personal Team. If prompted, sign in with your Apple ID under Xcode Settings → Accounts.
4. Set a unique bundle identifier if `com.jaf1887.sixthformtutor` is unavailable to your team.
5. Select your device as the run destination and press **Run ▶**. Enable Developer Mode on the device if iOS/Xcode requests it.

A free Apple ID can normally be used for personal development builds with limitations; distributing to other people via TestFlight or the App Store requires Apple Developer Program enrolment and a separate release process.

## Build in GitHub Actions

The [Build iOS apps](../../actions/workflows/ios-build.yml) workflow runs on pushes to `main` and can also be started using **Run workflow** on GitHub. After a successful run, there are two downloadable artifacts:

- **SixthFormTutor-iOS-Simulator**: a zipped `SixthFormTutor.app` that runs **only in the iOS Simulator**.
- **SixthFormTutor-unsigned-iPhone-iPad-IPA**: a compiled physical-device IPA that is **not signed**.

**Neither artifact can be installed directly on a physical iPhone or iPad as-is.** The device IPA must first be signed with a valid Apple development/distribution certificate and provisioning profile. For running on your own device, the easiest route is to open the project in Xcode and use your Apple team with automatic signing. Do not upload Apple signing credentials or private keys to this public repository.

## Project layout

```text
SixthFormTutor.xcodeproj/
  project.pbxproj
  xcshareddata/xcschemes/SixthFormTutor.xcscheme
SixthFormTutor/
  SixthFormTutorApp.swift
  StudyModels.swift
  StudyStore.swift
  ContentView.swift
  DashboardView.swift
  SubjectViews.swift
  TasksView.swift
.github/workflows/ios-build.yml
.gitignore
README.md
```

## Privacy and future AI tutoring

Study-task completion is stored on the device. No cloud account is used by this starter. Future AI tutoring should use a secure backend: do not commit API keys or embed secret API keys in a public iOS application.

> Build status: The first iOS Simulator compilation succeeded on GitHub Actions. Device builds and later changes should be checked in Actions for their own result.
