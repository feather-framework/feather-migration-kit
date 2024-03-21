//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

import FeatherComponent
import Logging

public struct Migrator {

    private let components: ComponentRegistry
    private let storage: MigrationEntryStorage
    private let logger: Logger

    public init(
        components: ComponentRegistry,
        storage: MigrationEntryStorage,
        logger: Logger = .init(label: "feather-migrator")
    ) {
        self.components = components
        self.storage = storage
        self.logger = logger
    }

    // MARK: - api

    public func perform(groups: [MigrationGroup]) async throws {
        var entries = try storage.load()
        for group in groups {
            for migration in group.migrations() {
                let entry = MigrationEntry(
                    id: type(of: migration).identifier,
                    groupId: type(of: group).identifier
                )
                guard !entries.contains(entry) else {
                    logger.trace(
                        "skipping migration",
                        metadata: [
                            "id": "\(entry.uniqueName)"
                        ]
                    )
                    continue
                }

                logger.trace(
                    "running migration",
                    metadata: [
                        "id": "\(entry.uniqueName)"
                    ]
                )
                try await migration.perform(components)
                entries.append(entry)
            }
        }

        try storage.save(entries)
    }

    public func revert(
        groups: [MigrationGroup],
        groupId: String
    ) async throws {
        let entries = try storage.load()
        let toKeep = entries.filter { $0.groupId != groupId }
        let toRevert = entries.filter { $0.groupId == groupId }

        for group in groups {
            for migration in group.migrations() {
                let entry = MigrationEntry(
                    id: type(of: migration).identifier,
                    groupId: type(of: group).identifier
                )
                guard toRevert.contains(entry) else {
                    logger.trace(
                        "keeping migration",
                        metadata: [
                            "id": "\(entry.uniqueName)"
                        ]
                    )
                    continue
                }

                logger.trace(
                    "reverting migration",
                    metadata: [
                        "id": "\(entry.uniqueName)"
                    ]
                )
                try await migration.revert(components)
            }
        }
        try storage.save(toKeep)
    }
}
