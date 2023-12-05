enum ApiError: Error {
    case unknownError(error: Error?)
    case invalidUrl
    case decoding(error: Error?)
    case general
}
