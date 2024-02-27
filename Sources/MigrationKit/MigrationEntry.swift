//
//  File.swift
//
//
//  Created by Tibor Bodecs on 04/01/2024.
//

import Foundation

public struct MigrationEntry: Codable, Equatable {

    public let id: String
    public let groupId: String
    public let createdAt: Date

    public init(
        id: String,
        groupId: String,
        createdAt: Date = .init()
    ) {
        self.id = id
        self.groupId = groupId
        self.createdAt = createdAt
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && rhs.groupId == lhs.groupId
    }

    public var uniqueName: String {
        [
            groupId,
            id,
        ]
        .joined(separator: "_")
    }
}
