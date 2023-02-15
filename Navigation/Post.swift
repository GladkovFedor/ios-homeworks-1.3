//
//  Post.swift
//  Navigation
//
//  Created by Федор Гладков on 31.10.2022.
//

import Foundation

struct Post {
    
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

struct Photo {
    
    let name: String
    
}

class DataStore {
    
    var posts = [Post]()
    
    var photoGallery = [Photo]()
    
    static let shared = DataStore()
    
    private init() {
        
        posts = [
            
            Post(author: "Hipster Cat",
                 description: "Зацени эти модные солнцезащитные очечки! Даже если на улице будет темно как безлунной ночью, я все равно их не сниму, как и свою шапку. Стиль - это моё главное качество. Второе главное качество - сексуальность.",
                 image: "hipster cat",
                 likes: 25,
                 views: 123),
            Post(author: "Онлайн-кинотеатр START",
                 description: "В сети вышел трейлер нового сезона сериала «Вампиры средней полосы» — о необычной семье из Смоленска. Его премьера состоится 13 декабря. За визуальную составляющую продолжения нашумевшего сериала отвечают оператор Максим Миханюк и художник-постановщик Юрий Карасик, а режиссером выступил Дмитрий Грибанов. Постановщику «очень понравилась эта история, и то, что это наши вампиры, мистические персонажи, которые при этом живут максимально обычно. Во время просмотра начинаешь задумываться, что даже твой сосед вполне мог бы быть вампиром, и эта легкая бытовушность, непринужденность нравится зрителю. Он смотрит историю не как сказку, а скорее как быль. Я хотел бы сохранить эту атмосферу. В новом сезоне будет больше экшена, драк, замечательных шуток и комичных ситуаций, но самое главное — наши персонажи продолжат существовать в реальности, а не в сказке. Многие фанаты обрадуются появлениям и возвращениям некоторых героев. Круг наших вампиров расширится, а поклонники смогут найти нового любимого, либо нелюбимого персонажа. Главное, чтобы этот персонаж вызывал сильные эмоции. Самое главное для нас — чтобы зритель не остался равнодушным».",
                 image: "Вампиры",
                 likes: 117,
                 views: 549),
            Post(author: "Чемпионат",
                 description: "Футболисты сборной Японии со счетом 2:1 обыграли команду Испании в матче третьего тура группового этапа чемпионата мира в Катаре. По ходу группового этапа сборная Японии обыграла команду Германии (2:1) и уступила костариканцам (0:1). Игры с немцами и испанцами развивалась для японцев по аналогичному сценарию.",
                 image: "Японский футболист",
                 likes: 18,
                 views: 78),
            Post(author: "Lenta.ru",
                 description: "Современная технология, которая находится в стадии разработки, поможет пациентам с ограниченными возможностями снова легко двигаться и общаться.  «Долгосрочная цель Neuralink - создание системы для преобразования импульсов всего мозга в действия», - заявил Маск. «Чисто гипотетически я мог бы имплантировать устройство Neuralink вам прямо сейчас, и вы бы даже не узнали», — пошутил Маск.",
                 image: "Mask",
                 likes: 39,
                 views: 192)
        ]
        
        photoGallery = [
        
            Photo(name: "IMG_0659"),
            Photo(name: "IMG_3440"),
            Photo(name: "IMG_4066"),
            Photo(name: "IMG_4542-2"),
            Photo(name: "IMG_9642"),
            
            Photo(name: "IMG_2118"),
            Photo(name: "IMG_4872"),
            Photo(name: "IMG_6198"),
            Photo(name: "IMG_8607"),
            Photo(name: "IMG_9284"),
            
            Photo(name: "IMG_9457"),
            Photo(name: "IMG_2100"),
            Photo(name: "IMG_6830"),
            Photo(name: "IMG_9322"),
            Photo(name: "IMG_1645"),
            
            Photo(name: "IMG_0693"),
            Photo(name: "IMG_5083"),
            Photo(name: "IMG_3625 (ретушь)"),
            Photo(name: "IMG_6791"),
            Photo(name: "IMG_9251"),
        ]
    }
}
