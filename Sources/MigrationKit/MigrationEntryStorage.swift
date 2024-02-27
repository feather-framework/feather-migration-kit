//
//  File.swift
//
//
//  Created by Tibor Bodecs on 06/01/2024.
//

public protocol MigrationEntryStorage {
    func load() throws -> [MigrationEntry]
    func save(_ logs: [MigrationEntry]) throws
}
