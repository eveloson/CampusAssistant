//
//  CampusAssistantUITests.m
//  CampusAssistantUITests
//
//  Created by 吴斌 on 17/4/13.
//  Copyright © 2017年 wubin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CampusAssistantUITests : XCTestCase

@end

@implementation CampusAssistantUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLogin {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"\u6821\u56ed\u52a9\u624b"].element tap];
    
    XCUIElement *textField = app.textFields[@"\u5b66\u53f7"];
    [textField tap];
    [textField typeText:@"1512401013"];
    
    XCUIElement *secureTextField = app.secureTextFields[@"\u5bc6\u7801"];
    [secureTextField tap];
    
    XCUIElement *moreKey = app.keys[@"more"];
    [moreKey tap];
    [moreKey tap];
    [secureTextField typeText:@"1234"];
    XCUIElement *button = app.buttons[@"\u767b\u5f55"];
    [button tap];
    [textField tap];
    [textField tap];
    XCUIElement *deleteKey = app.keys[@"Delete"];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [textField typeText:@"11111"];
    [button tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [textField typeText:@"1512401013"];
    [secureTextField tap];
    XCUIElement *deleteKey2 = app.keys[@"delete"];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [button tap];
    [moreKey tap];
    [moreKey tap];
    [secureTextField typeText:@"123"];
    [textField tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [button tap];
    [textField typeText:@"1512401013"];
    [secureTextField tap];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [deleteKey2 tap];
    [moreKey tap];
    [moreKey tap];
    [secureTextField typeText:@"112233"];
    [button tap];
    
}

@end
