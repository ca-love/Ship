import Foundation
import APIKit

public struct RequestProxy<R: Request>: RequestProxyProtocol {
    public typealias Request = R
    public typealias Response = R.Response

    public var request: R
    public var baseURL: URL
    public var headerFields: [String: String]
    public var dependency: Dependency

    public init(request: Request, dependency: Dependency) {
        self.request = request
        self.dependency = dependency

        let url = dependency.buildBaseURL(request)
        baseURL = request.basePath.map(url.appendingPathComponent) ?? url
        headerFields = dependency.buildHeaderFields(request)
    }

    public func intercept(urlRequest: URLRequest) throws -> URLRequest {
        let urlRequest = try dependency.intercept(request: request, urlRequest: urlRequest)
        return try request.intercept(urlRequest: urlRequest)
    }

    public func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        let object = try dependency.intercept(request: request, object: object, urlResponse: urlResponse)
        return try request.intercept(object: object, urlResponse: urlResponse)
    }
}

private extension Request {
    var basePath: String? {
        return basePathComponent?.basePath
    }
}
