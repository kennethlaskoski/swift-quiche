//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

public struct SQHeader {
  let type: SQType
  let version: SQQuicVersion
  let dcid: SQConnectionID
  let scid: SQConnectionID
  let token: SQToken?
  let versions: [SQQuicVersion]?
}
