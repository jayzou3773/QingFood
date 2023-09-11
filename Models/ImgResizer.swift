//
//  ImgResizer.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/29.
//

import Foundation
import UIKit

extension UIImage {
    //重设图片大小
    func reSizeImage(reSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(reSize, false, 0.0)
        self.draw(in: CGRectMake(0, 0, reSize.width, reSize.height))
        let reSizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return reSizeImage
    }
}
