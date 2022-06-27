//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public enum SQError: Error {
}

public enum SQConfigError: Error {
  case initFailure
  case loadCertChainFromPEMFileFailure
  case loadPrivKeyFromPEMFileFailure
  case loadVerifyLocationsFromFileFailure
  case loadVerifyLocationsFromDirectoryFailure
  case setApplicationProtosFailure
  case setCCAlgorithmFailure
}
