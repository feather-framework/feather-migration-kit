//
//  File.swift
//
//
//  Created by Tibor Bodecs on 03/12/2023.
//

import FeatherComponent

public protocol Migration {

    static var identifier: String { get }

    func perform(_ components: ComponentRegistry) async throws
    func revert(_ components: ComponentRegistry) async throws
}

extension Migration {

    public static var identifier: String {
        String(reflecting: self)
    }
}
