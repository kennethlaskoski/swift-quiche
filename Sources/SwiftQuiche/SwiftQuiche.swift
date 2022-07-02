//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public let sqVersion = SQVersion(rawValue: UInt32(QUICHE_PROTOCOL_VERSION))
public func isSupported(version: SQVersion) -> Bool {
  quiche_version_is_supported(version.rawValue)
}

public func sqHeaderInfo<Token: SQAddressToken>(buffer: [UInt8]) throws -> (SQType?, SQVersion, SQConnectionID, SQConnectionID, Token) {
  var type: UInt8 = 0
  var version: UInt32 = 0

  var scid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var scid_len = SQConnectionID.maxLength

  var dcid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var dcid_len = SQConnectionID.maxLength

  var token = [UInt8](repeating: 0, count: Token.maxLength)
  var token_len = Token.maxLength

  let rc = quiche_header_info(buffer, buffer.count, SQConnectionID.maxLength, &version,
                              &type, &scid, &scid_len, &dcid, &dcid_len,
                              &token, &token_len);
  if (rc < 0) {
    throw SQError.invalidPacket
  }

  return (
    SQType(rawValue: type),
    SQVersion(rawValue: version),
    SQConnectionID(bytes: scid),
    SQConnectionID(bytes: dcid),
    Token(bytes: token)
  )
}
