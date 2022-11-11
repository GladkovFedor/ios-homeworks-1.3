//
//  PostViewController.swift
//  Navigation
//
//  Created by Федор Гладков on 26.10.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titleFromPost: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        
        title = titleFromPost
        
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(infoButtonTapped(_:)))
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        // Do any additional setup after loading the view.
    }
    
//    Никак не получается сделать переход на InfoViewController при нажатии
//    rightBarButtonItem. Везде это делается через сториборд (надо написать
//    storyboard ID в interface builer), в том числе и в лекции.
//    Я вроде бы нашел как сделать переход без сегвэя (функция toInfoViewController()
//    ниже ),
    
    //        func toInfoViewController() {
    //            let storyboard = UIStoryboard(name: "Info", bundle: nil)
    //            guard let vc = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController else { return }
    //            show(vc, sender: nil)
    //        }
    
    
//    но и в нем надо написать имя сториборда, а задать это имя никак не
//    выходит.
    
//    Как назначить действие этой кнопке - нашел: #selector(infoButtonTapped(_:))
//    С этим действием получалось выводить сообщение на консоль, например.
    
//    Все сработало, кода добавил всего одну строку кода.
    
    //        self.navigationController?.pushViewController(InfoViewController(), animated: true)
    
//    Но теперь не получается сделать InfoViewController модальным по отношению к
//    PostViewController.
    
//    Удалось сделать модальный вызов InfoViewController, но через дефолтный
//    sheet-controller, котороый стал доступен в iOS 15. Такой вот костыль вышел.
    
    @objc func infoButtonTapped(_ sender: UIBarButtonItem) {
        
        let infoVC = InfoViewController()
        if let modalController = infoVC.sheetPresentationController {
            modalController.detents = [.large()]
        }
        present(infoVC, animated: true)
            
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
