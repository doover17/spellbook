import SwiftUI
import SwiftData

@main
struct SpellbookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Spellbook.self, SpellbookEntry.self])
    }
}
