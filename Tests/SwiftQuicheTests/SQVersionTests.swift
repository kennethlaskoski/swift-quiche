//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import SwiftQuiche

final class SQVersionTests: XCTestCase {
  func testCurrentVersion() throws {
    XCTAssertTrue(sqSupports(version: sqVersion))
    XCTAssertEqual(sqVersion, sqVersion1)
  }

  func testVersionSupport() throws {
    XCTAssertTrue(sqSupports(version: sqVersion1))
    XCTAssertTrue(sqSupports(version: sqVersionDraft27))
    XCTAssertTrue(sqSupports(version: sqVersionDraft28))
    XCTAssertTrue(sqSupports(version: sqVersionDraft29))
  }
}
