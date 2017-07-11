
# Mobile Automation

This framework is used to automate our mobile retail banking app on Android and IOS mobile devices

## Getting Started

You will need to install the below packages and set up the framework.

### Prerequisites

* [python 2.7](https://www.python.org/download/releases/2.7.7/) - The automation framework used
* [Robotframework](https://github.com/robotframework/robotframework) - The automation framework used
* [AppiumLibrary](https://github.com/serhatbolsu/robotframework-appiumlibrary) - The mobile library used
* [Selenium2Library](https://github.com/robotframework/Selenium2Library) - The web library used
* [Appium Server](https://github.com/appium/appium-desktop)- Server used
* [Pycharm IDE](https://www.jetbrains.com/pycharm/)- Server used
* [Intellibot pycharm plugin](https://github.com/appium/appium-desktop)- Server used

### Structure
* Lib folder contains all the library py files.
* Resources folder contains robot files that are used with test cases.
* Results folder contains all the results. make sure to set -d in command to add the results in the folder.
* Tests folder contains all the test files for different devices and platform.
* Webdriver folder contains any dependencies.


### Running the tests
The easiest way to execute a test is to use the  * [pybot](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html) commands. See doc
* To excecute by Test name:
  pybot  -t   "test name"   -d   "Result by test name"   "/Users/lco/Documents/Mobile Retails_V3.0/TestSuite/Tests/iosTablet.robot"
  pybot  -t   "Login and Logout with correct UserID and Password"   -d   "Result by test name"   "/Users/photonqa/Desktop/framework/Mobility-Automation-master/TestSuite/Tests/SME_Android_Phone.robot"

* To excecute by Tag name:
  pybot  -i   "tag name"   -d   "Result by tags"   "/Users/lco/Documents/Mobile Retails_V3.0/TestSuite/Tests/iosTablet.robot"
* To excecute The entire suite:
  pybot   -d   "Full run result"    "/Users/lco/Documents/Mobile Retails_V3.0/TestSuite/Tests/iosTablet.robot"

### Conclusion

This is everything you need to know in order to run the tests.