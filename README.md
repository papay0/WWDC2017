# WWDC2017

A Playground application that create the WWDC17 logo from any B&W image.
For this example, the input file is a Black & White Apple logo, and the output file is the following image.

![alt tag](http://img4.hostingpics.net/pics/580199ScreenShot20170410at101621.png)

### Basic idea
I have a set of 21 images named Layer{1...21}.png.
I loop over the input file, everytime I see a black pixel, I paste a random layer in my view.

![alt tag](https://media.giphy.com/media/xUPGcpO74kLVoTuTok/giphy.gif)
