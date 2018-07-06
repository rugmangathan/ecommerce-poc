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
    

	struct __StubbingProxy_LocalRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCategories() -> Cuckoo.ProtocolStubFunction<(), Observable<[LocalCategory]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalRepository.self, method: "getCategories() -> Observable<[LocalCategory]>", parameterMatchers: matchers))
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
	    
	}

}

 class LocalRepositoryStub: LocalRepository {
    

    

    
     func getCategories()  -> Observable<[LocalCategory]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[LocalCategory]>.self)
    }
    
}

