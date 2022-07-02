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

  func testRawRepresentable() throws {
    let bytes: [UInt8] = [1,2,3]
    XCTAssertEqual(SQConnectionID(rawValue: bytes).rawValue, bytes)
  }

  func testDescription() throws {
    XCTAssertEqual("2a101b", SQConnectionID(bytes: [42,16,27]).description)
  }
}
