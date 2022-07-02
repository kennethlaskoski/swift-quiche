//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public struct SQHeader {
  let type: SQType
  let version: SQVersion
  let dcid: SQConnectionID
  let scid: SQConnectionID
  let token: [UInt8]?
  let versions: [SQVersion]?
}

public func sqHeaderInfo(buffer: [UInt8], localConnectionIDLength: Int, tokenLength: Int) throws -> (SQType, SQVersion, SQConnectionID, SQConnectionID, [UInt8]) {
  var type: UInt8 = 0
  var version: UInt32 = 0

  var scid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var scid_len = SQConnectionID.maxLength

  var dcid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var dcid_len = SQConnectionID.maxLength

  var token = [UInt8](repeating: 0, count: tokenLength)
  var token_len = tokenLength

  let rc = quiche_header_info(buffer, buffer.count, localConnectionIDLength, &version,
                              &type, &scid, &scid_len, &dcid, &dcid_len,
                              &token, &token_len)
  guard rc >= 0 else {
    throw SQError.invalidPacket
  }

  return (
    SQType(rawValue: type)!,
    SQVersion(rawValue: version),
    SQConnectionID(bytes: scid),
    SQConnectionID(bytes: dcid),
    token
  )
}
