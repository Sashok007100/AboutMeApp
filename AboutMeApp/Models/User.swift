//
//  User.swift
//  AboutMeApp
//
//  Created by Alexandr Artemov (Mac Mini) on 08.06.2025.
//

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getMockResponse() -> User {
        User(
            username: "Aleksandr",
            password: "1",
            person: .getPerson()
        )
    }
    
}

struct Person {
    let title: String
    let image: String
    let firstName: String
    let secondName: String
    let city: String
    let bio: String
    
    static func getPerson() -> Person {
        Person(
            title: "Александр Артемов",
            image: "IMG_0720",
            firstName: "Александр",
            secondName: "Артемов",
            city: "Москва",
            bio: "Мне 26 лет. Родился и живу в Москве. В 2021 году окончил РТУ МИРЭА по направлению \"Программная инженерия\". В 2022 году устроился работать на склад на Горбушке. В 2024 году сменил работу, и теперь работаю в Президентской Академии (ранее РАНХиГС)."
        )
    }
}
