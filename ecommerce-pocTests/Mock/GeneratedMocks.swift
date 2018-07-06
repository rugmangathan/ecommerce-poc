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

