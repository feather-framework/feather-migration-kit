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
    enum Bar: MigrationGroup {

        func migrations() -> [Migration] {
            []
        }

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
        XCTAssertEqual(Foo.Bar.identifier, "MigrationKitTests.Foo.Bar")
        XCTAssertEqual(Foo.Bar.V1.identifier, "MigrationKitTests.Foo.Bar.V1")
    }
}
