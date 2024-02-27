//
//  File.swift
//
//
//  Created by Tibor Bodecs on 03/12/2023.
//

import FeatherComponent

public protocol Migration {

    var identifier: String { get }

    func perform(_ components: ComponentRegistry) async throws
    func revert(_ components: ComponentRegistry) async throws
}

extension Migration {

    public var identifier: String {
        String(describing: type(of: self))
            .replacingOccurrences(of: "()", with: "")
    }
}
