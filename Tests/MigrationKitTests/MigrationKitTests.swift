//
//  File.swift
//
//
//  Created by Tibor Bodecs on 21/03/2024.
//

import FeatherComponent
import MigrationKit
import XCTest

enum Foo {
    enum Bar {
        struct V1: Migration {

            func perform(
                _ components: ComponentRegistry
            ) async throws {

            }

            func revert(
                _ components: ComponentRegistry
            ) async throws {

            }
        }

    }
}

final class MigrationKitTests: XCTestCase {

    func testIdentifier() async throws {
        XCTAssertEqual(Foo.Bar.V1.identifier, "MigrationKitTests.Foo.Bar.V1")
    }
}
