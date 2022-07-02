//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public struct SQHeader {
  public let type: SQType
  public let version: SQVersion
  public let dcid: SQConnectionID
  public let scid: SQConnectionID
  public let token: [UInt8]?
  public let versions: [SQVersion]?
}

public func sqHeaderInfo(
  packet: [UInt8],
  localConnectionIDLength: Int,
  tokenLength: Int
) throws -> SQHeader {
  var type: UInt8 = 0
  var version: UInt32 = 0

  var scid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var scid_len = SQConnectionID.maxLength

  var dcid = [UInt8](repeating: 0, count: SQConnectionID.maxLength)
  var dcid_len = SQConnectionID.maxLength

  var token = [UInt8](repeating: 0, count: tokenLength)
  var token_len = tokenLength

  let rc = quiche_header_info(
    packet, packet.count,
    localConnectionIDLength,
    &version,
    &type,
    &scid, &scid_len,
    &dcid, &dcid_len,
    &token, &token_len
  )

  guard rc >= 0 else {
    throw SQError.invalidPacket
  }

  return SQHeader(
    type: SQType(rawValue: type)!,
    version: SQVersion(rawValue: version),
    dcid: SQConnectionID(bytes: dcid[0..<dcid_len]),
    scid: SQConnectionID(bytes: scid[0..<scid_len]),
    token: token_len > 0 ? [UInt8](token[0..<token_len]) : nil,
    versions: nil
  )
}
