//
//  File.swift
//
//
//  Created by Tibor Bodecs on 03/12/2023.
//

public protocol MigrationGroup {

    static var identifier: String { get }

    func migrations() -> [Migration]
}

extension MigrationGroup {

    public static var identifier: String {
        String(reflecting: self)
    }
}
