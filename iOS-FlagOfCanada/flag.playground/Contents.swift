import UIKit

//References of Flag Spec : https://zh.wikipedia.org/wiki/%E5%8A%A0%E6%8B%BF%E5%A4%A7%E5%9C%8B%E6%97%97

var rect = CGRect(x: 0, y: 0, width: 400, height: 200)

let backgroundView = UIView(frame:rect)
backgroundView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

rect = CGRect(x: 0, y: 0, width: 100, height: 200)
let leftRect = UIView(frame: rect)
leftRect.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
backgroundView.addSubview(leftRect)


rect = CGRect(x: 300, y: 0, width: 100, height: 200)
let rightRect = UIView(frame: rect)
rightRect.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
backgroundView.addSubview(rightRect)


//建立楓葉座標，因為是對稱的所以只需建立一半座標即可
var maplePointA = CGPoint(x: 200, y: 20)
var maplePointB = CGPoint(x: 185, y: 46)
var maplePointC = CGPoint(x: 170, y: 40)
var maplePointD = CGPoint(x: 175, y: 85)
var maplePointE = CGPoint(x: 153, y: 64.5)
var maplePointF = CGPoint(x: 147, y: 76)
var maplePointG = CGPoint(x: 124, y: 70)
var maplePointH = CGPoint(x: 130, y: 98)
var maplePointI = CGPoint(x: 122, y: 104)
var maplePointJ = CGPoint(x: 160, y: 137)
var maplePointK = CGPoint(x: 155, y: 150)
var maplePointL = CGPoint(x: 197, y: 136)
var maplePointM = CGPoint(x: 195, y: 190)
var maplePointN = CGPoint(x: 200, y: 190)

var maplePoints: [CGPoint] = [maplePointA,maplePointB,maplePointC,maplePointD,maplePointE,maplePointF,maplePointG,maplePointH,maplePointI,maplePointJ,maplePointK,maplePointL,maplePointM,maplePointN]

rect = CGRect(x: 0, y: 0, width: 400, height: 200)
let mapleView = UIView(frame: rect)
mapleView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)

let maplePath = UIBezierPath()
let maplePoint = maplePoints[0]
maplePath.move(to: maplePoint)

for i in 0..<maplePoints.count {
    maplePath.addLine(to: maplePoints[i])
}
//畫另一半國旗楓葉
for j in 0..<maplePoints.count{
    maplePoints[j].x = (200 - maplePoints[j].x) + 200
    maplePath.addLine(to: maplePoints[j])
}
maplePath.close()


let mapleLayer = CAShapeLayer()
mapleLayer.path = maplePath.cgPath
mapleView.layer.mask = mapleLayer

backgroundView.addSubview(mapleView)

