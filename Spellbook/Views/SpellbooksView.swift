import SwiftUI
import SwiftData

struct SpellbooksView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\.createdAt, order: .reverse)])
    private var spellbooks: [Spellbook]
    @State private var isPresentingAdd = false
    @State private var newSpellbookName = ""

    var body: some View {
        NavigationStack {
            Group {
                if spellbooks.isEmpty {
                    ContentUnavailableView(
                        "No Spellbooks",
                        systemImage: "books.vertical",
                        description: Text("Create your first spellbook to start organizing spells.")
                    )
                } else {
                    List {
                        ForEach(spellbooks) { spellbook in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(spellbook.name)
                                    .font(.headline)
                                Text(spellbook.createdAt, style: .date)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .contextMenu {
                                Button(role: .destructive) {
                                    deleteSpellbook(spellbook)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .onDelete(perform: deleteSpellbooks)
                    }
                }
            }
            .navigationTitle("Spellbooks")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isPresentingAdd = true
                    } label: {
                        Label("New Spellbook", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAdd) {
                addSpellbookSheet
            }
        }
    }

    private var addSpellbookSheet: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Spellbook")
                .font(.title2)
            TextField("Name", text: $newSpellbookName)
                .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button("Cancel") {
                    dismissAddSpellbook()
                }
                Button("Create") {
                    createSpellbook()
                }
                .keyboardShortcut(.defaultAction)
                .disabled(newSpellbookName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(24)
        .frame(width: 360)
    }

    private func createSpellbook() {
        let trimmedName = newSpellbookName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else { return }
        let now = Date()
        let spellbook = Spellbook(name: trimmedName, createdAt: now, updatedAt: now)
        modelContext.insert(spellbook)
        dismissAddSpellbook()
    }

    private func dismissAddSpellbook() {
        newSpellbookName = ""
        isPresentingAdd = false
    }

    private func deleteSpellbook(_ spellbook: Spellbook) {
        modelContext.delete(spellbook)
    }

    private func deleteSpellbooks(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(spellbooks[index])
        }
    }
}

#Preview {
    SpellbooksView()
        .modelContainer(for: [Spellbook.self, SpellbookEntry.self], inMemory: true)
}
