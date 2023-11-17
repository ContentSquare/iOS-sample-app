# 🎉 Swift Package Manager iOS sample 

### This iOS application will show you how to use Contentsquare SDKs with [SPM](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app). <br />

## Prerequisites

Apple's [documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app) will show you how to add a dependency to your project with SPM.

## Running the app
* Clone this [repository](https://github.com/ContentSquare/iOS-sample-app)
* You should now be able to run the application
* You should see logs from the SDK in the Xcode console or the Console app as below

<pre>$ CSLIB ℹ️ Info: Contentsquare SDK v4.27.0 starting in app: com.your.bundle.identifier</pre>
<pre>$ CSLIB ℹ️ Info: Contentsquare Error Analysis v4.27.0 starting in app: com.your.bundle.identifier</pre>

<pre>💡 Quick tips: Contentsquare SDK autostarts by itself </pre>

## 🚀 What's Next?

Head over to `Showcases/Screen Views` to learn how to send Contentsquare screen views in situations such as:
*  Displaying controllers implemented in code
*  Displaying controllers implemented in storyboards
*  Changing the page of a paged scroll view
*  Displaying or dismissing a modal

- `Privacy` to test the Contentsquare's user consent API:
* Opt-in, opt-out, or forget the user
* Resume and pause data collection

- `Custom Variables` to see how custom variables are sent along with the screen views to provide additional information about the screen, the user or the session.

- `Dynamic Variables` to see how to send dynamic variables to provide additional information about the session in order to segment sessions later.

- `Transactions` to see how user purchases can be tracked by sending them using the Contentsquare API.

- `Masking` to see how to use the different Contentsquare API masking methods in order to customize your personal information masking rules for Session Replay.

- `Error Analysis` to test the Contentsquare Error Analysis SDK API.

## 📚 Docs

If you wish to learn more about the Contentsquare SDK you can find the documentation [here](https://docs.contentsquare.com/ios/)

If you wish to learn more about the Error Analysis SDK you can find the documentation [here](https://docs.contentsquare.com/ios-sdk-error-analysis/)
