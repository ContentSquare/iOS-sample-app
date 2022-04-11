# 🎉 Static Framework iOS sample 

### This iOS application will show you how to use Contentsquare SDK with Static framework dependency. <br />

## Prerequisites

Go to [Contentsquare github](https://github.com/ContentSquare/CS_iOS_SDK/releases), under Assets you should be able to find `ContentsquareModuleDynamicManually.xcframework.zip` file, please download it.

Once you open the zip file on your computer, you should have two directories named `ContentsquareModule.xcframework` and `SwiftProtobuf.xcframework`.

Copy both of them and paste it inside `ContentsquareModule` folder of the [current project](https://github.com/ContentSquare/iOS-sample-app/tree/mobile-4115/Improve-sample-apps/Static%20Framework%20Sample/ContentsquareModule).

## Running the app
* Clone this [repository](https://github.com/ContentSquare/iOS-sample-app)
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