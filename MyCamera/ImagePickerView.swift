//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by みねた on 2022/02/04.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    //UIImagePickerController(写真撮影画面)が表示されているかを管理
    @Binding var isShowSheet: Bool
    //撮影した写真を格納する変数
    //UIImageクラスは画像を管理するクラス。撮影後の画像をUIImage型で宣言する。
    @Binding var captureImage: UIImage?
    
    //Coordinatorでコントローラのdelegateを管理
    class Coordinate: NSObject,
                      UINavigationControllerDelegate,
                      UIImagePickerControllerDelegate {
        //ImagePickerView型の定数を用意
        let parent: ImagePickerView
        //イニシャライザ
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info:
                                   [UIImagePickerController.InfoKey : Any]) {
            
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage {
                parent.captureImage = originalImage
            }
            
            parent.isShowSheet = false
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    }
    
}

