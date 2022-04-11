# 🎉 Carthage iOS sample 

### This iOS application will show you how to use Contentsquare SDK with Carthage. <br />

## Prerequisites

You must have [Carthage](https://github.com/Carthage/Carthage). The simplest way to install it is `brew install carthage`, and make sure you're using `carthage` 0.38.0 or up.

## Running the app
* Clone this [repository](https://github.com/ContentSquare/iOS-sample-app)
* Run `carthage update --platform iOS --use-xcframeworks` in the "Carthage Sample" folder
* You should now be able to run the application
* You should see logs from the SDK in the Xcode console or the Console app as below

<pre>$ CSLIB ℹ️ Info: Contentsquare SDK v4.12.0 starting in app: com.your.bundle.identifier</pre>

<pre>💡 Quick tips: Contentsquare SDK autostarts by itself </pre>

## 🚀 What's Next?

Head over to `Showcases/Screen Views` to learn how to send Contentsquare screen views in situations such as:
*  Displaying controllers implemented in code
*  Displaying controllers implemented in storyboards
*  Changing the page of a paged scroll view
*  Displaying or dismissing a modal


## 📚 Docs

If you wish to learn more about the Contentsquare SDK you can find the documentation [here](https://docs.contentsquare.com/ios/)