//
//  FilterItemsTest.swift
//  Exercice_iOS_OZroudTests
//
//  Created by Oussama Zroud on 10/7/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import XCTest
@testable import Exercice_iOS_OZroud

class ListItemsAdapterTest: XCTestCase {
    
    var numberFormatter = NumberFormatter()
    var dateFormatter = DateFormatter()
    var products: [Product] = []
    var categories : [CategoryItem] = []
    
    let itemDTO1 = ProductDTO(identifier: 1, categoryID: 3, title: nil, description: nil, price: 34.555, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    let itemDTO2 = ProductDTO(identifier: 1, categoryID: 2, title: nil, description: nil, price: 6.6, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    let itemDTO3 = ProductDTO(identifier: 1, categoryID: 5, title: nil, description: nil, price: 1.0, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    let itemDTO4 = ProductDTO(identifier: 1, categoryID: 8, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    let itemDTO5 = ProductDTO(identifier: 1, categoryID: nil, title: nil, description: nil, price: 33.454, imageUrlDto: nil, creationDate: "2019-11-05T15:56:59+0000", isUrgent: true, siret: nil)
    
    let categoryDTO1 = CategoryItemDTO(identifier: 5, name: "category1")
    let categoryDTO2 = CategoryItemDTO(identifier: 3, name: "category2")
    let categoryDTO3 = CategoryItemDTO(identifier: 2, name: "category3")
    
    
    var date: String = ""
    var price1: Double = 0.0
    var price2: Double = 0.0
    var price3: Double = 0.0

    override func setUpWithError() throws {
        
        categories = [ CategoryItem(categoryItemDTO: categoryDTO1),
                       CategoryItem(categoryItemDTO: categoryDTO2),
                       CategoryItem(categoryItemDTO: categoryDTO3)]
        
        products = [Product(productDTO: itemDTO1),
                 Product(productDTO: itemDTO2),
                 Product(productDTO: itemDTO3),
                 Product(productDTO: itemDTO4),
                 Product(productDTO: itemDTO5)]
        
        date = "2019-11-05T15:56:59+0000"
        
        price1 = 0.0
        price2 = 23.89
        price3 = 456.789
    }

    override func tearDownWithError() throws {
        products = []
        categories = []
        date = ""
        price1 = 0.0
        price2 = 0.0
        price3 = 0.0
    }

    func test_format_double_price_string_currency() throws {
        let convertedPrice1 = price1.formatToPriceCurrency(currencyFormatter: numberFormatter)
        let convertedPrice2 = price2.formatToPriceCurrency(currencyFormatter: numberFormatter)
        let convertedPrice3 = price3.formatToPriceCurrency(currencyFormatter: numberFormatter)
        XCTAssertEqual(convertedPrice1, "0,00 €")
        XCTAssertEqual(convertedPrice2, "23,89 €")
        XCTAssertNotEqual(convertedPrice3, "456,789 €")
        XCTAssertEqual(convertedPrice3, "456,79 €")
    }
    
    func test_adapting_categoryID_to_category() {
       let adaptedList = ProductListAdapterManager().adapteItems(products: products, categories: categories)
        XCTAssertEqual(adaptedList[0].category.name, categoryDTO2.name, "category name conform to item category id ")
        XCTAssertEqual(adaptedList[1].category.name, categoryDTO3.name, "category name conform to item category id ")
        XCTAssertEqual(adaptedList[2].category.name, categoryDTO1.name, "category name conform to item category id ")
        XCTAssertEqual(adaptedList[3].category.name, Constants.CategoryAll.name, "unfound categoryID takes default category")
        XCTAssertEqual(adaptedList[4].category.name, Constants.CategoryAll.name, "categoryID nil item take default category")
        XCTAssertEqual(adaptedList.count, products.count)
        
    }
    
    func test_date_medium_style_convertion() {
        let date = self.date.formatStringToDate(formatter: dateFormatter)
        let dateFormatted = date?.convertToString(style: .medium)
        XCTAssertEqual(dateFormatted, "5 nov. 2019 à 15:56")
    }
    
    func test_date_full_style_convertion() {
        let date = self.date.formatStringToDate(formatter: dateFormatter)
        let dateFormatted = date?.convertToString(style: .full)
        XCTAssertEqual(dateFormatted, "mardi 5 novembre 2019 à 15:56")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
