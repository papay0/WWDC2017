import UIKit
import PlaygroundSupport

/*:
# Welcome to my WWDC17 submission
 
Please wait until the playground has finished running, and enjoy the preview of the variable **preview**.
 */


let logo = UIImage(named: "Apple.png")!
let pixelData = logo.cgImage!.dataProvider!.data
let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

let size = logo.size
let logoWidth = size.width
let logoHeight = size.height

let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size:size))
view.backgroundColor = UIColor.white

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

let bodyText: String = "Technology alone is not enough. \n Technology must intersect with the liberal arts and the humanities, to create new ideas and experiences that push society forward. This summer we bring together thousands of brilliant minds representing many diverse perspectives, passions, and talents to help us change the world."
let welcomeText: String = "Welcome to"
let titleText: String = " WWDC17"
let locationText: String = "San Jose, CA, June 5-9"


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

func displayLoading(loading: CGFloat) {
    print("~ " + (NSString(format: "%.01f", loading) as String) + "% loading")
}

func createLabel(text: String, width: CGFloat, height: CGFloat, yCenter: CGFloat, fontSize: CGFloat, color: UIColor) -> UILabel {
    let label = UILabel(frame: CGRect(x: logoWidth/2, y: logoHeight/2, width: width, height: height))
    label.textColor = color
    label.backgroundColor = UIColor.white
    label.numberOfLines = 0
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.text = text
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.center = view.center
    label.center.y = yCenter
    return label
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
var subviews: [UIImageView] = []

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
    displayLoading(loading: (y/size.height)*100)
}


let bodyLabel = createLabel(text: bodyText, width: 730, height: 500, yCenter: logoHeight/2+50, fontSize: 35, color: .gray)
let welcomeLabel = createLabel(text: welcomeText, width: 636, height: 50, yCenter: 6*logoHeight/8-85, fontSize: 40, color: .black)
let titleLabel = createLabel(text: titleText, width: 636, height: 75, yCenter: 6*logoHeight/8, fontSize: 75, color: .black)
let locationLabel = createLabel(text: locationText, width: 636, height: 50, yCenter: 6*logoHeight/8+75, fontSize: 40, color: .black)


view.addSubview(bodyLabel)
view.addSubview(welcomeLabel)
view.addSubview(titleLabel)
view.addSubview(locationLabel)

let preview = view
 
