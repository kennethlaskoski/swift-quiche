//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public typealias SQQuicVersion = UInt32

public let sqQuicVersion = SQQuicVersion(QUICHE_PROTOCOL_VERSION)

public func isSQSupported(version: SQQuicVersion) -> Bool {
  quiche_version_is_supported(version)
}

public func sqHeaderInfo(buffer: [UInt8]) throws -> (SQType?, SQQuicVersion, SQConnectionID, SQConnectionID, SQToken) {
  var type: UInt8 = 0
  var version: UInt32 = 0

  var scid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var scid_len = SQConnectionID.maxLength

  var dcid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var dcid_len = SQConnectionID.maxLength

  var token = [UInt8](repeating: 0, count: SQToken.maxLength)
  var token_len = SQToken.maxLength

  let rc = quiche_header_info(buffer, buffer.count, SQConnectionID.maxLength, &version,
                              &type, &scid, &scid_len, &dcid, &dcid_len,
                              &token, &token_len);
  if (rc < 0) {
    throw SQError.invalidPacket
  }

  return (
    SQType(rawValue: type),
    SQQuicVersion(version),
    SQConnectionID(bytes: scid),
    SQConnectionID(bytes: dcid),
    SQToken(bytes: token)
  )
}
