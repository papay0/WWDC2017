//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let logo = UIImage(named: "Apple.png")!
let pixelData = logo.cgImage!.dataProvider!.data
let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

let size = logo.size
let logoWidth = size.width
let logoHeight = size.height

let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size:size))
view.backgroundColor = UIColor.white
UIGraphicsBeginImageContextWithOptions(size, false, 0)

let layer1 = UIImage(named: "Layer 1.png")!
let layer2 = UIImage(named: "Layer 2.png")!
let layer3 = UIImage(named: "Layer 3.png")!
let layer4 = UIImage(named: "Layer 4.png")!
let layer5 = UIImage(named: "Layer 5.png")!
let layer6 = UIImage(named: "Layer 6.png")!
let layer7 = UIImage(named: "Layer 7.png")!
let layer8 = UIImage(named: "Layer 8.png")!
let layer9 = UIImage(named: "Layer 9.png")!
let layer10 = UIImage(named: "Layer 10.png")!
let layer11 = UIImage(named: "Layer 11.png")!
let layer12 = UIImage(named: "Layer 12.png")!
let layer13 = UIImage(named: "Layer 13.png")!
let layer14 = UIImage(named: "Layer 14.png")!
let layer15 = UIImage(named: "Layer 15.png")!
let layer16 = UIImage(named: "Layer 16.png")!
let layer17 = UIImage(named: "Layer 17.png")!
let layer18 = UIImage(named: "Layer 18.png")!
let layer19 = UIImage(named: "Layer 19.png")!
let layer20 = UIImage(named: "Layer 20.png")!
let layer21 = UIImage(named: "Layer 21.png")!
let images = [layer1, layer2, layer3, layer4, layer5, layer6, layer7, layer8, layer9, layer10, layer11, layer12, layer13, layer14, layer15, layer16, layer17, layer18, layer19, layer20, layer21]


func isPixelWhite(_ pos: CGPoint) -> Bool {
    let pixel = getPixelColor(pos)
    return pixel.r > 254 && pixel.g > 254 && pixel.b > 254
}

func getPixelColor(_ pos: CGPoint) -> (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) {
    let pixelInfo: Int = ((Int((logoWidth)) * Int(pos.y)) + Int(pos.x)) * 4
    let r = CGFloat((data[pixelInfo]))
    let g = CGFloat((data[pixelInfo+1]))
    let b = CGFloat((data[pixelInfo+2]))
    let a = CGFloat(0)
    
    return (r: r, g: g, b: b, a: a)
}

func displayLoading(loading: String) {
    print("~ " + loading + "% loading")
}

var y : CGFloat = 0.0
var x : CGFloat = 0.0
var currentHeight : CGFloat = 0.0
var currentWidth : CGFloat = 0.0
var maxHeight : CGFloat = 0.0
var loading : CGFloat = 0.0
let minimumValue : CGFloat = 5
var image: UIImage
var imageView: UIImageView

while (y < size.height) {
    x = 0.0
    maxHeight = 0.0
    while (x < size.width) {
        if isPixelWhite(CGPoint(x: x, y: y)) {
            image = images[Int(arc4random_uniform(UInt32(images.count)))]
            imageView = UIImageView(image: image)
            currentWidth = image.size.width
            currentHeight = image.size.height
            imageView.frame = CGRect(x: x, y: y, width: currentWidth, height: currentHeight)
            view.addSubview(imageView)
        }
        x += currentWidth + minimumValue
        maxHeight = max(maxHeight, currentHeight)
    }
    y += maxHeight + minimumValue
    displayLoading(loading: NSString(format: "%.01f", (y/size.height)*100) as String)
}

view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
UIGraphicsEndImageContext()

let bodyLabel = UILabel(frame: CGRect(x: logoWidth/2, y: logoHeight/2, width: 730, height: 500))
bodyLabel.textColor = UIColor.gray
bodyLabel.backgroundColor = UIColor.white
bodyLabel.numberOfLines = 0
bodyLabel.textAlignment = .center
bodyLabel.lineBreakMode = .byWordWrapping
bodyLabel.text = "Technology alone is not enough. \n Technology must intersect with the liberal arts and the humanities, to create new ideas and experiences that push society forward. This summer we bring together thousands of brilliant minds representing many diverse perspectives, passions, and talents to help us change the world."
bodyLabel.font = UIFont.systemFont(ofSize: 35)
bodyLabel.center = view.center
bodyLabel.center.y = logoHeight/2+50

let welcomeLabel = UILabel(frame: CGRect(x: logoWidth/2, y: 3*logoHeight/4, width: 636, height: 50))
welcomeLabel.textColor = UIColor.black
welcomeLabel.backgroundColor = UIColor.white
welcomeLabel.numberOfLines = 0
welcomeLabel.textAlignment = .center
welcomeLabel.lineBreakMode = .byWordWrapping
welcomeLabel.text = "Welcome to"
welcomeLabel.font = UIFont.systemFont(ofSize: 40)
welcomeLabel.center = view.center
welcomeLabel.center.y = 6*logoHeight/8-85

let titleLabel = UILabel(frame: CGRect(x: logoWidth/2, y: 3*logoHeight/4, width: 636, height: 70))
titleLabel.textColor = UIColor.black
titleLabel.backgroundColor = UIColor.white
titleLabel.numberOfLines = 0
titleLabel.textAlignment = .center
titleLabel.lineBreakMode = .byWordWrapping
titleLabel.text = " WWDC17"
titleLabel.font = UIFont.boldSystemFont(ofSize: 75)
titleLabel.center = view.center
titleLabel.center.y = 6*logoHeight/8

let locationLabel = UILabel(frame: CGRect(x: logoWidth/2, y: 3*logoHeight/4, width: 636, height: 50))
locationLabel.textColor = UIColor.black
locationLabel.backgroundColor = UIColor.white
locationLabel.numberOfLines = 0
locationLabel.textAlignment = .center
locationLabel.lineBreakMode = .byWordWrapping
locationLabel.text = "San Jose, CA, June 5-9"
locationLabel.font = UIFont.systemFont(ofSize: 40)
locationLabel.center = view.center
locationLabel.center.y = 6*logoHeight/8+75


view.addSubview(bodyLabel)
view.addSubview(welcomeLabel)
view.addSubview(titleLabel)
view.addSubview(locationLabel)

let preview = view
 