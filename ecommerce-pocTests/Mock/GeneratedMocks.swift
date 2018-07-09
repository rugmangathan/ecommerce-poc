import Cuckoo
@testable import ecommerce_poc

import Alamofire
import Foundation
import RxAlamofire
import RxSwift

class MockCommonApiProtocol: CommonApiProtocol, Cuckoo.ProtocolMock {
    typealias MocksType = CommonApiProtocol
    typealias Stubbing = __StubbingProxy_CommonApiProtocol
    typealias Verification = __VerificationProxy_CommonApiProtocol
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "retrieveProducts", "returnSignature": " -> Observable<ProductsResponse>", "fullyQualifiedName": "retrieveProducts() -> Observable<ProductsResponse>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<ProductsResponse>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func retrieveProducts()  -> Observable<ProductsResponse> {
        
            return cuckoo_manager.call("retrieveProducts() -> Observable<ProductsResponse>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_CommonApiProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func retrieveProducts() -> Cuckoo.ProtocolStubFunction<(), Observable<ProductsResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCommonApiProtocol.self, method: "retrieveProducts() -> Observable<ProductsResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CommonApiProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func retrieveProducts() -> Cuckoo.__DoNotUse<Observable<ProductsResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("retrieveProducts() -> Observable<ProductsResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CommonApiProtocolStub: CommonApiProtocol {
    

    

    
     func retrieveProducts()  -> Observable<ProductsResponse> {
        return DefaultValueRegistry.defaultValue(for: Observable<ProductsResponse>.self)
    }
    
}


class MockCommonApi: CommonApi, Cuckoo.ClassMock {
    typealias MocksType = CommonApi
    typealias Stubbing = __StubbingProxy_CommonApi
    typealias Verification = __VerificationProxy_CommonApi
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "retrieveProducts", "returnSignature": " -> Observable<ProductsResponse>", "fullyQualifiedName": "retrieveProducts() -> Observable<ProductsResponse>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<ProductsResponse>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func retrieveProducts()  -> Observable<ProductsResponse> {
        
            return cuckoo_manager.call("retrieveProducts() -> Observable<ProductsResponse>",
                parameters: (),
                superclassCall:
                    
                    super.retrieveProducts()
                    )
        
    }
    

	struct __StubbingProxy_CommonApi: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func retrieveProducts() -> Cuckoo.ClassStubFunction<(), Observable<ProductsResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCommonApi.self, method: "retrieveProducts() -> Observable<ProductsResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CommonApi: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func retrieveProducts() -> Cuckoo.__DoNotUse<Observable<ProductsResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("retrieveProducts() -> Observable<ProductsResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CommonApiStub: CommonApi {
    

    

    
     override func retrieveProducts()  -> Observable<ProductsResponse> {
        return DefaultValueRegistry.defaultValue(for: Observable<ProductsResponse>.self)
    }
    
}


import Cuckoo
@testable import ecommerce_poc

import Foundation
import RxSwift

class MockCachedRepository: CachedRepository, Cuckoo.ProtocolMock {
    typealias MocksType = CachedRepository
    typealias Stubbing = __StubbingProxy_CachedRepository
    typealias Verification = __VerificationProxy_CachedRepository
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getCategories", "returnSignature": " -> Observable<FetchEvent<[LocalCategory]>>", "fullyQualifiedName": "getCategories() -> Observable<FetchEvent<[LocalCategory]>>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<FetchEvent<[LocalCategory]>>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCategories()  -> Observable<FetchEvent<[LocalCategory]>> {
        
            return cuckoo_manager.call("getCategories() -> Observable<FetchEvent<[LocalCategory]>>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getProducts", "returnSignature": " -> Observable<FetchEvent<[RemoteCategory]>>", "fullyQualifiedName": "getProducts() -> Observable<FetchEvent<[RemoteCategory]>>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<FetchEvent<[RemoteCategory]>>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getProducts()  -> Observable<FetchEvent<[RemoteCategory]>> {
        
            return cuckoo_manager.call("getProducts() -> Observable<FetchEvent<[RemoteCategory]>>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_CachedRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCategories() -> Cuckoo.ProtocolStubFunction<(), Observable<FetchEvent<[LocalCategory]>>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCachedRepository.self, method: "getCategories() -> Observable<FetchEvent<[LocalCategory]>>", parameterMatchers: matchers))
	    }
	    
	    func getProducts() -> Cuckoo.ProtocolStubFunction<(), Observable<FetchEvent<[RemoteCategory]>>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCachedRepository.self, method: "getProducts() -> Observable<FetchEvent<[RemoteCategory]>>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CachedRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCategories() -> Cuckoo.__DoNotUse<Observable<FetchEvent<[LocalCategory]>>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCategories() -> Observable<FetchEvent<[LocalCategory]>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getProducts() -> Cuckoo.__DoNotUse<Observable<FetchEvent<[RemoteCategory]>>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getProducts() -> Observable<FetchEvent<[RemoteCategory]>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CachedRepositoryStub: CachedRepository {
    

    

    
     func getCategories()  -> Observable<FetchEvent<[LocalCategory]>> {
        return DefaultValueRegistry.defaultValue(for: Observable<FetchEvent<[LocalCategory]>>.self)
    }
    
     func getProducts()  -> Observable<FetchEvent<[RemoteCategory]>> {
        return DefaultValueRegistry.defaultValue(for: Observable<FetchEvent<[RemoteCategory]>>.self)
    }
    
}


import Cuckoo
@testable import ecommerce_poc

import RxSwift

class MockLocalRepository: LocalRepository, Cuckoo.ProtocolMock {
    typealias MocksType = LocalRepository
    typealias Stubbing = __StubbingProxy_LocalRepository
    typealias Verification = __VerificationProxy_LocalRepository
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getCategories", "returnSignature": " -> Observable<[LocalCategory]>", "fullyQualifiedName": "getCategories() -> Observable<[LocalCategory]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[LocalCategory]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getCategories()  -> Observable<[LocalCategory]> {
        
            return cuckoo_manager.call("getCategories() -> Observable<[LocalCategory]>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getProduts", "returnSignature": " -> Observable<[Product]>", "fullyQualifiedName": "getProduts(_: Int, orderBy: String) -> Observable<[Product]>", "parameterSignature": "_ categoryId: Int, orderBy: String", "parameterSignatureWithoutNames": "categoryId: Int, orderBy: String", "inputTypes": "Int, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "categoryId, orderBy", "call": "categoryId, orderBy: orderBy", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "categoryId", type: "Int", range: CountableRange(267..<284), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: Optional("orderBy"), name: "orderBy", type: "String", range: CountableRange(286..<301), nameRange: CountableRange(286..<293))], "returnType": "Observable<[Product]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getProduts(_ categoryId: Int, orderBy: String)  -> Observable<[Product]> {
        
            return cuckoo_manager.call("getProduts(_: Int, orderBy: String) -> Observable<[Product]>",
                parameters: (categoryId, orderBy),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getSubCategories", "returnSignature": " -> Observable<[LocalCategory]>", "fullyQualifiedName": "getSubCategories(for: Int) -> Observable<[LocalCategory]>", "parameterSignature": "for categoryId: Int", "parameterSignatureWithoutNames": "categoryId: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "categoryId", "call": "for: categoryId", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "categoryId", type: "Int", range: CountableRange(351..<370), nameRange: CountableRange(351..<354))], "returnType": "Observable<[LocalCategory]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getSubCategories(for categoryId: Int)  -> Observable<[LocalCategory]> {
        
            return cuckoo_manager.call("getSubCategories(for: Int) -> Observable<[LocalCategory]>",
                parameters: (categoryId),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getChildCategories", "returnSignature": " -> Observable<[LocalCategory]>", "fullyQualifiedName": "getChildCategories(for: Int) -> Observable<[LocalCategory]>", "parameterSignature": "for categories: Int", "parameterSignatureWithoutNames": "categories: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "categories", "call": "for: categories", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "categories", type: "Int", range: CountableRange(429..<448), nameRange: CountableRange(429..<432))], "returnType": "Observable<[LocalCategory]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getChildCategories(for categories: Int)  -> Observable<[LocalCategory]> {
        
            return cuckoo_manager.call("getChildCategories(for: Int) -> Observable<[LocalCategory]>",
                parameters: (categories),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getChildCategories", "returnSignature": " -> Observable<[LocalCategory]>", "fullyQualifiedName": "getChildCategories(with: Int) -> Observable<[LocalCategory]>", "parameterSignature": "with subCategoryId: Int", "parameterSignatureWithoutNames": "subCategoryId: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "subCategoryId", "call": "with: subCategoryId", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("with"), name: "subCategoryId", type: "Int", range: CountableRange(507..<530), nameRange: CountableRange(507..<511))], "returnType": "Observable<[LocalCategory]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getChildCategories(with subCategoryId: Int)  -> Observable<[LocalCategory]> {
        
            return cuckoo_manager.call("getChildCategories(with: Int) -> Observable<[LocalCategory]>",
                parameters: (subCategoryId),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "filterProductsBy", "returnSignature": " -> Observable<FetchEvent<[Product]>>", "fullyQualifiedName": "filterProductsBy(_: Int, _: Int, _: Int, _: String) -> Observable<FetchEvent<[Product]>>", "parameterSignature": "_ category: Int, _ subCategory: Int, _ childCategory: Int, _ orderBy: String", "parameterSignatureWithoutNames": "category: Int, subCategory: Int, childCategory: Int, orderBy: String", "inputTypes": "Int, Int, Int, String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "category, subCategory, childCategory, orderBy", "call": "category, subCategory, childCategory, orderBy", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "category", type: "Int", range: CountableRange(587..<602), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: nil, name: "subCategory", type: "Int", range: CountableRange(604..<622), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: nil, name: "childCategory", type: "Int", range: CountableRange(624..<644), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: nil, name: "orderBy", type: "String", range: CountableRange(646..<663), nameRange: CountableRange(0..<0))], "returnType": "Observable<FetchEvent<[Product]>>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func filterProductsBy(_ category: Int, _ subCategory: Int, _ childCategory: Int, _ orderBy: String)  -> Observable<FetchEvent<[Product]>> {
        
            return cuckoo_manager.call("filterProductsBy(_: Int, _: Int, _: Int, _: String) -> Observable<FetchEvent<[Product]>>",
                parameters: (category, subCategory, childCategory, orderBy),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "getVariants", "returnSignature": " -> Observable<[Variant]>", "fullyQualifiedName": "getVariants(for: Int) -> Observable<[Variant]>", "parameterSignature": "for productId: Int", "parameterSignatureWithoutNames": "productId: Int", "inputTypes": "Int", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "productId", "call": "for: productId", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("for"), name: "productId", type: "Int", range: CountableRange(721..<739), nameRange: CountableRange(721..<724))], "returnType": "Observable<[Variant]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getVariants(for productId: Int)  -> Observable<[Variant]> {
        
            return cuckoo_manager.call("getVariants(for: Int) -> Observable<[Variant]>",
                parameters: (productId),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_LocalRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCategories() -> Cuckoo.ProtocolStubFunction<(), Observable<[LocalCategory]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getCategories() -> Observable<[LocalCategory]>", parameterMatchers: matchers))
	    }
	    
	    func getProduts<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ categoryId: M1, orderBy: M2) -> Cuckoo.ProtocolStubFunction<(Int, String), Observable<[Product]>> where M1.MatchedType == Int, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, String)>] = [wrap(matchable: categoryId) { $0.0 }, wrap(matchable: orderBy) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getProduts(_: Int, orderBy: String) -> Observable<[Product]>", parameterMatchers: matchers))
	    }
	    
	    func getSubCategories<M1: Cuckoo.Matchable>(for categoryId: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: categoryId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getSubCategories(for: Int) -> Observable<[LocalCategory]>", parameterMatchers: matchers))
	    }
	    
	    func getChildCategories<M1: Cuckoo.Matchable>(for categories: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: categories) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getChildCategories(for: Int) -> Observable<[LocalCategory]>", parameterMatchers: matchers))
	    }
	    
	    func getChildCategories<M1: Cuckoo.Matchable>(with subCategoryId: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: subCategoryId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getChildCategories(with: Int) -> Observable<[LocalCategory]>", parameterMatchers: matchers))
	    }
	    
	    func filterProductsBy<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ category: M1, _ subCategory: M2, _ childCategory: M3, _ orderBy: M4) -> Cuckoo.ProtocolStubFunction<(Int, Int, Int, String), Observable<FetchEvent<[Product]>>> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == Int, M4.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int, Int, String)>] = [wrap(matchable: category) { $0.0 }, wrap(matchable: subCategory) { $0.1 }, wrap(matchable: childCategory) { $0.2 }, wrap(matchable: orderBy) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "filterProductsBy(_: Int, _: Int, _: Int, _: String) -> Observable<FetchEvent<[Product]>>", parameterMatchers: matchers))
	    }
	    
	    func getVariants<M1: Cuckoo.Matchable>(for productId: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<[Variant]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: productId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getVariants(for: Int) -> Observable<[Variant]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_LocalRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCategories() -> Cuckoo.__DoNotUse<Observable<[LocalCategory]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCategories() -> Observable<[LocalCategory]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getProduts<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ categoryId: M1, orderBy: M2) -> Cuckoo.__DoNotUse<Observable<[Product]>> where M1.MatchedType == Int, M2.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, String)>] = [wrap(matchable: categoryId) { $0.0 }, wrap(matchable: orderBy) { $0.1 }]
	        return cuckoo_manager.verify("getProduts(_: Int, orderBy: String) -> Observable<[Product]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getSubCategories<M1: Cuckoo.Matchable>(for categoryId: M1) -> Cuckoo.__DoNotUse<Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: categoryId) { $0 }]
	        return cuckoo_manager.verify("getSubCategories(for: Int) -> Observable<[LocalCategory]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getChildCategories<M1: Cuckoo.Matchable>(for categories: M1) -> Cuckoo.__DoNotUse<Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: categories) { $0 }]
	        return cuckoo_manager.verify("getChildCategories(for: Int) -> Observable<[LocalCategory]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getChildCategories<M1: Cuckoo.Matchable>(with subCategoryId: M1) -> Cuckoo.__DoNotUse<Observable<[LocalCategory]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: subCategoryId) { $0 }]
	        return cuckoo_manager.verify("getChildCategories(with: Int) -> Observable<[LocalCategory]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func filterProductsBy<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ category: M1, _ subCategory: M2, _ childCategory: M3, _ orderBy: M4) -> Cuckoo.__DoNotUse<Observable<FetchEvent<[Product]>>> where M1.MatchedType == Int, M2.MatchedType == Int, M3.MatchedType == Int, M4.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Int, Int, String)>] = [wrap(matchable: category) { $0.0 }, wrap(matchable: subCategory) { $0.1 }, wrap(matchable: childCategory) { $0.2 }, wrap(matchable: orderBy) { $0.3 }]
	        return cuckoo_manager.verify("filterProductsBy(_: Int, _: Int, _: Int, _: String) -> Observable<FetchEvent<[Product]>>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getVariants<M1: Cuckoo.Matchable>(for productId: M1) -> Cuckoo.__DoNotUse<Observable<[Variant]>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: productId) { $0 }]
	        return cuckoo_manager.verify("getVariants(for: Int) -> Observable<[Variant]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class LocalRepositoryStub: LocalRepository {
    

    

    
     func getCategories()  -> Observable<[LocalCategory]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[LocalCategory]>.self)
    }
    
     func getProduts(_ categoryId: Int, orderBy: String)  -> Observable<[Product]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Product]>.self)
    }
    
     func getSubCategories(for categoryId: Int)  -> Observable<[LocalCategory]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[LocalCategory]>.self)
    }
    
     func getChildCategories(for categories: Int)  -> Observable<[LocalCategory]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[LocalCategory]>.self)
    }
    
     func getChildCategories(with subCategoryId: Int)  -> Observable<[LocalCategory]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[LocalCategory]>.self)
    }
    
     func filterProductsBy(_ category: Int, _ subCategory: Int, _ childCategory: Int, _ orderBy: String)  -> Observable<FetchEvent<[Product]>> {
        return DefaultValueRegistry.defaultValue(for: Observable<FetchEvent<[Product]>>.self)
    }
    
     func getVariants(for productId: Int)  -> Observable<[Variant]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Variant]>.self)
    }
    
}


import Cuckoo
@testable import ecommerce_poc

import Foundation
import ecommerce_poc

class MockSpyableCategoriesView: SpyableCategoriesView, Cuckoo.ClassMock {
    typealias MocksType = SpyableCategoriesView
    typealias Stubbing = __StubbingProxy_SpyableCategoriesView
    typealias Verification = __VerificationProxy_SpyableCategoriesView
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "showProgress", "returnSignature": "", "fullyQualifiedName": "showProgress(_: Bool)", "parameterSignature": "_ show: Bool", "parameterSignatureWithoutNames": "show: Bool", "inputTypes": "Bool", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "show", "call": "show", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "show", type: "Bool", range: CountableRange(279..<291), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func showProgress(_ show: Bool)  {
        
            return cuckoo_manager.call("showProgress(_: Bool)",
                parameters: (show),
                superclassCall:
                    
                    super.showProgress(show)
                    )
        
    }
    
    // ["name": "showFetchFailedMessgae", "returnSignature": "", "fullyQualifiedName": "showFetchFailedMessgae(_: Bool)", "parameterSignature": "_ show: Bool", "parameterSignatureWithoutNames": "show: Bool", "inputTypes": "Bool", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "show", "call": "show", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "show", type: "Bool", range: CountableRange(326..<338), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func showFetchFailedMessgae(_ show: Bool)  {
        
            return cuckoo_manager.call("showFetchFailedMessgae(_: Bool)",
                parameters: (show),
                superclassCall:
                    
                    super.showFetchFailedMessgae(show)
                    )
        
    }
    
    // ["name": "showCategories", "returnSignature": "", "fullyQualifiedName": "showCategories(_: [LocalCategory])", "parameterSignature": "_ categories: [LocalCategory]", "parameterSignatureWithoutNames": "categories: [LocalCategory]", "inputTypes": "[LocalCategory]", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "categories", "call": "categories", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "categories", type: "[LocalCategory]", range: CountableRange(365..<394), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func showCategories(_ categories: [LocalCategory])  {
        
            return cuckoo_manager.call("showCategories(_: [LocalCategory])",
                parameters: (categories),
                superclassCall:
                    
                    super.showCategories(categories)
                    )
        
    }
    
    // ["name": "showNoCategories", "returnSignature": "", "fullyQualifiedName": "showNoCategories(_: Bool)", "parameterSignature": "_ show: Bool", "parameterSignatureWithoutNames": "show: Bool", "inputTypes": "Bool", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "show", "call": "show", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "show", type: "Bool", range: CountableRange(423..<435), nameRange: CountableRange(0..<0))], "returnType": "Void", "isOptional": false, "stubFunction": "Cuckoo.ClassStubNoReturnFunction"]
     override func showNoCategories(_ show: Bool)  {
        
            return cuckoo_manager.call("showNoCategories(_: Bool)",
                parameters: (show),
                superclassCall:
                    
                    super.showNoCategories(show)
                    )
        
    }
    

	struct __StubbingProxy_SpyableCategoriesView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func showProgress<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.ClassStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableCategoriesView.self, method: "showProgress(_: Bool)", parameterMatchers: matchers))
	    }
	    
	    func showFetchFailedMessgae<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.ClassStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableCategoriesView.self, method: "showFetchFailedMessgae(_: Bool)", parameterMatchers: matchers))
	    }
	    
	    func showCategories<M1: Cuckoo.Matchable>(_ categories: M1) -> Cuckoo.ClassStubNoReturnFunction<([LocalCategory])> where M1.MatchedType == [LocalCategory] {
	        let matchers: [Cuckoo.ParameterMatcher<([LocalCategory])>] = [wrap(matchable: categories) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableCategoriesView.self, method: "showCategories(_: [LocalCategory])", parameterMatchers: matchers))
	    }
	    
	    func showNoCategories<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.ClassStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpyableCategoriesView.self, method: "showNoCategories(_: Bool)", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_SpyableCategoriesView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func showProgress<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return cuckoo_manager.verify("showProgress(_: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showFetchFailedMessgae<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return cuckoo_manager.verify("showFetchFailedMessgae(_: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showCategories<M1: Cuckoo.Matchable>(_ categories: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [LocalCategory] {
	        let matchers: [Cuckoo.ParameterMatcher<([LocalCategory])>] = [wrap(matchable: categories) { $0 }]
	        return cuckoo_manager.verify("showCategories(_: [LocalCategory])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showNoCategories<M1: Cuckoo.Matchable>(_ show: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: show) { $0 }]
	        return cuckoo_manager.verify("showNoCategories(_: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class SpyableCategoriesViewStub: SpyableCategoriesView {
    

    

    
     override func showProgress(_ show: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func showFetchFailedMessgae(_ show: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func showCategories(_ categories: [LocalCategory])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     override func showNoCategories(_ show: Bool)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}

