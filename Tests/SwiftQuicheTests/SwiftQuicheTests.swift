//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import SwiftQuiche

final class SwiftQuicheTests: XCTestCase {
  func testCurrentVersionSupport() throws {
    XCTAssertTrue(isSupported(version: sqVersion))
  }
}
