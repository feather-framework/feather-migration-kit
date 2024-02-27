//
//  File.swift
//
//
//  Created by Tibor Bodecs on 03/12/2023.
//

public protocol MigrationGroup {

    var identifier: String { get }

    func migrations() -> [Migration]
}

extension MigrationGroup {

    public var identifier: String {
        String(describing: self).replacingOccurrences(of: "()", with: "")
    }
}
