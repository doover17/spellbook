import Foundation
import SwiftData

@Model
final class SpellbookEntry {
    var id: UUID
    var spellId: String
    var spellName: String
    var addedAt: Date
    var spellbook: Spellbook?

    init(spellId: String, spellName: String, addedAt: Date = Date(), spellbook: Spellbook? = nil) {
        self.id = UUID()
        self.spellId = spellId
        self.spellName = spellName
        self.addedAt = addedAt
        self.spellbook = spellbook
    }
}
