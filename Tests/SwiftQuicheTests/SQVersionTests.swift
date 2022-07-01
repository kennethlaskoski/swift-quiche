//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import SwiftQuiche

final class SQVersionTests: XCTestCase {
  func testCurrentVersion() throws {
    XCTAssertEqual(sqVersion, .version1)
  }

  func testVersionSupport() throws {
    XCTAssertTrue(isSupported(version: .version1))
    XCTAssertTrue(isSupported(version: .versionDraft27))
    XCTAssertTrue(isSupported(version: .versionDraft28))
    XCTAssertTrue(isSupported(version: .versionDraft29))
  }

  func testDescription() throws {
    XCTAssertEqual("0x1", SQVersion.version1.description )
  }
}
