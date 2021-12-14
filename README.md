# iOS-sample-app

Welcome! this app showcases how to use the Contentsquare SDK in an iOS application.

Head over to `Showcases/Screen Views` to learn how to send Contentsquare screen views in situations such as:
*  Displaying controllers implemented in code
*  Displaying controllers implemented in storyboards
*  Changing the page of a paged scroll view
*  Displaying or dismissing a modal

## Get it running

### Using Carthage

#### Prerequisites
You must have [Carthage](https://github.com/Carthage/Carthage). The simplest way to install it is `brew install carthage`. And make sure you're using `carthage` 0.38.0 or up.

#### Running the app
* Clone this repo
* Run `carthage update --platform iOS --use-xcframeworks` in the "Carthage Sample" folder
* You should now be able to run the app
* You should see logs from the SDK in the Xcode console or the Console app

### Using CocoaPods

#### Prerequisites
You must have [CocoaPods](https://cocoapods.org). The simplest way to install it is `sudo gem install cocoapods`.

#### Running the app
* Clone this repo
* Run `pod update` in the "Pod Sample" folder
* You should now be able to run the app
* You should see logs from the SDK in the Xcode console or the Console app
