//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import SwiftQuiche

final class SQHeaderTests: XCTestCase {
  func testHeaderInfo() throws {
    let buffer: [UInt8] = []
    XCTAssertThrowsError(try sqHeaderInfo(buffer: buffer, localConnectionIDLength: 0, tokenLength: 0))
  }

  func testInitialHeader() throws {
    let buffer: [UInt8] = [196, 186, 186, 186, 186, 16, 163, 214, 77, 36, 170, 214, 89, 13, 11, 225, 153, 47, 230, 111, 112, 105, 16, 196, 133, 135, 130, 141, 213, 75, 24, 163, 179, 17, 56, 242, 102, 108, 188, 0, 65, 33, 146, 38, 133, 210, 4, 99, 36, 174, 238, 201, 64, 164, 197, 23, 146, 193, 30, 189, 238, 71, 51, 227, 87, 47, 147, 49, 103, 20, 192, 168, 149, 243, 108, 208, 177, 23, 107, 205, 212, 129, 78, 133, 4, 80, 163, 167, 38, 106, 57, 61, 95, 108, 53, 209, 139, 169, 167, 133, 242, 77, 86, 161, 237, 217, 131, 4, 173, 173, 185, 36, 31, 235, 212, 33, 232, 239, 169, 95, 74, 7, 36, 6, 49, 140, 225, 107, 96, 31, 66, 137, 153, 77, 130, 44, 110, 61, 91, 81, 208, 150, 232, 135, 52, 183, 189, 81, 255, 253, 166, 85, 149, 58, 184, 89, 216, 177, 160, 166, 92, 81, 206, 61, 131, 38, 211, 203, 166, 77, 53, 23, 18, 127, 81, 66, 241, 228, 76, 151, 188, 110, 228, 146, 166, 77, 121, 129, 208, 212, 42, 80, 138, 232, 13, 85, 92, 182, 228, 50, 140, 6, 220, 228, 143, 234, 228, 97, 239, 160, 205, 99, 215, 90, 220, 128, 191, 5, 97, 191, 177, 44, 189, 75, 108, 172, 254, 251, 215, 53, 201, 132, 9, 101, 219, 29, 52, 13, 232, 207, 78, 162, 193, 102, 143, 229, 192, 194, 159, 37, 90, 99, 188, 177, 13, 3, 187, 24, 221, 163, 49, 79, 143, 251, 119, 134, 113, 137, 33, 110, 199, 191, 89, 90, 235, 152, 232, 157, 109, 169, 32, 184, 6, 125, 188, 173, 170, 241, 53, 37, 126, 43, 94, 200, 150, 65, 225, 32, 176, 106, 46, 72, 41, 15, 252, 85, 178, 105, 56, 99, 156, 104, 120, 37, 191, 202, 173, 42, 167, 167, 88, 31, 217, 211, 119, 239, 57, 61, 252, 197, 160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var type: SQType

    (type, _, _, _, _) = try sqHeaderInfo(buffer: buffer, localConnectionIDLength: 20, tokenLength: 0)
    XCTAssertEqual(type, SQType.initial)
  }
}
