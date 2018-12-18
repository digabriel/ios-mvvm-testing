//
//  RepositorySpec.swift
//  iOS-SampleTests
//
//  Created by Dimas on 17/12/18.
//  Copyright © 2018 Dimas Gabriel. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import iOS_Sample

class RepositorySpec: QuickSpec {
    
    override func spec() {
        
        describe("RepositorySpec") {
            
            context("when decoding from JSON") {
                
                let bundle = Bundle(for: RepositorySpec.self)
                let decoder = JSONDecoder.iso8601Decoder
                
                it("should succeed initializing from valid JSON") {
                    
                    let path = bundle.path(forResource: "repository", ofType: "json")!
                    let jsonData = NSData(contentsOfFile: path)! as Data
                    
                    expect { try decoder.decode(Repository.self, from: jsonData) }
                        .notTo(throwError())
                    
                    let rep = try! decoder.decode(Repository.self, from: jsonData)
                    expect(rep.name) == "Tetris"
                    expect(rep.id) == 3081286
                    expect(rep.isPrivate) == false
                    expect(rep.url) == "https://api.github.com/repos/dtrupenn/Tetris"
                }
                
                it("should fail initializing from invalid JSON") {
                    
                    let path = bundle.path(forResource: "repository_invalid", ofType: "json")!
                    let jsonData = NSData(contentsOfFile: path)! as Data
                    
                    expect { try decoder.decode(Repository.self, from: jsonData) }
                        .to(throwError())
                }
            }
            
            context("when comparing") {

                it("should compare the id property") {

                    let repo0 = Repository.fake(id: 0)
                    let repo1 = Repository.fake(id: 1)

                    expect(repo0 == repo1) == false
                    expect(repo0 == repo0) == true
                }
            }
        }
    }
}
