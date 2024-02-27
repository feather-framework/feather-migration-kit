//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

public struct MigrationEntryStorageEphemeral: MigrationEntryStorage {
    public init() {}
    public func load() throws -> [MigrationEntry] { [] }
    public func save(_ logs: [MigrationEntry]) throws {}
}
