//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import SwiftQuiche

final class SQConnectionIDTests: XCTestCase {
  func testLength() throws {
    XCTAssertEqual(SQConnectionID(bytes: [0]).length, 1)
  }

  // THIS MAY CHANGE
  func testMaxLength() throws {
    XCTAssertEqual(SQConnectionID.maxLength, 20)
  }
}
