import Foundation
import SwiftData

@Model
final class Spellbook {
    @Attribute(.unique) var id: UUID
    var name: String
    var createdAt: Date
    var updatedAt: Date
    @Relationship(deleteRule: .cascade, inverse: \SpellbookEntry.spellbook)
    var entries: [SpellbookEntry]

    init(name: String, createdAt: Date = Date(), updatedAt: Date = Date(), entries: [SpellbookEntry] = []) {
        self.id = UUID()
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.entries = entries
    }
}
