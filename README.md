# PhotoViewer

A simple photo viewer made in Swift 3.

## Disclaimer

The following app is made only for demo purposes. No commercial use is intended.

## Instalation

This project uses CocoaPods as its package manager. Just go to the parent directory of your project from your terminal and install pods.

    cd path/to/folder
    pod install
    
You might encounter a problem with your Pods Specs file not being updated. 
In that case, run the following code in your terminal.

    cd path/to/folder
    pod repo update

And you are done! Run the .xcworkspace file and you are good to go!

## Features

This project has been done in just 2 days, so it is limited to the following features:

* Search for photos from the web (specifically, the Flickr Web API)
* Check your search results in different sections in a fancy UICollectionView
* Tap a photo to see it in better quality and be able to share it.

## Your project looks clean...

No. More than the UI, the aim of this project was to demonstrate one of the many types of structuring your project.
As many of us are already used to MVC, I thought it would be better to use a new approach.
In this case, the Clean Swift architecture (based on the VIPER architecture) was used. For more details, go to: 
* http://clean-swift.com/
