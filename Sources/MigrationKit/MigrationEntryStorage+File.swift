//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

import Foundation

public struct MigrationEntryStorageFile: MigrationEntryStorage {
    let path: String

    public init(path: String) {
        self.path = path
    }

    public func load() throws -> [MigrationEntry] {
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let logs = try decoder.decode(
                [MigrationEntry].self,
                from: data
            )
            return logs
        }
        catch {
            return []
        }
    }

    public func save(_ logs: [MigrationEntry]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [
            .prettyPrinted
        ]
        let data = try encoder.encode(logs)
        let url = URL(fileURLWithPath: path)
        try data.write(to: url)
    }
}
