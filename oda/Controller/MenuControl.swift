//
//  MenuControl.swift
//  oda
//
//  Created by Stine Marie Vørner on 18/10/2021.
//

import Foundation
import UIKit

//struct MenuControl: UIViewRepresentable {
//    var numberOfPages: Int
//    @Binding var currentPage: Int
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> UIPageControl {
//        let control = UIPageControl()
//        control.numberOfPages = numberOfPages
//        control.addTarget(
//            context.coordinator,
//            action: #selector(Coordinator.updateCurrentPage(sender:)),
//            for: .valueChanged)
//
//        return control
//    }
//
//    func updateUIView(_ uiView: UIPageControl, context: Context) {
//        uiView.currentPage = currentPage
//    }
//
//    class Coordinator: NSObject {
//            var control: MenuControl
//
//            init(_ control: MenuControl) {
//                self.control = control
//            }
//
//            @objc
//            func updateCurrentPage(sender: UIPageControl) {
//                control.currentPage = sender.currentPage
//            }
//        }
//}
