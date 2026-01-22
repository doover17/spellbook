import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            SpellsView()
                .tabItem {
                    Label("Spells", systemImage: "book")
                }

            SpellbooksView()
                .tabItem {
                    Label("Spellbooks", systemImage: "books.vertical")
                }
        }
        .frame(minWidth: 640, minHeight: 480)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Spellbook.self, SpellbookEntry.self], inMemory: true)
}
