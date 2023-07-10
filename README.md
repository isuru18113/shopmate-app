# shopmate
ShopMate is a user-friendly app designed to simplify the grocery shopping experience by ensuring that users never miss an item from their shopping list. With ShopMate, users can effortlessly create and manage their grocery lists, making it easier to remember what they need to buy when they visit the store. The app provides a convenient platform where users can add items to their list by simply clicking item's picture.

## The goal of the application
The application starts with the "Home" screen, which serves as the central hub for users to manage their grocery shopping experience. From the home screen, users can access of the saved lists and button to create new list (🖊️).
To begin creating a new list, users can navigate to the "Grocery List" screen by clicking (🖊️) button. Here, they can choose items from a comprehensive list of grocery products or add custom items as needed. As users select items, a temporary list of the chosen items dynamically appears at the bottom of the screen, allowing users to review their selections before proceeding.
Once users have finalized their grocery list, they can proceed to the "Selected List" screen by clicking (>) button. In this view, all the chosen items are displayed, providing users with a clear overview of their selections. To remove an item from the selected list, users can swipe it to the left, offering a convenient deletion option.
Upon satisfaction with the selected items, users can save the list by clicking the check icon button(✔️). The saved list is then stored in the application's database for future reference. Returning to the home screen, users can see all their created lists, making it easy to access and manage multiple lists. By clicking (⚙️) button, user able to go to the settings and change the app language. By clicking app theme button, user can switch from dark mode to light mode.
By selecting one of the created lists from the home screen, users are directed to the corresponding "Check List" screen. This screen presents all the added items, providing users with a comprehensive checklist to refer to while shopping. Users can mark off items as they are placed in their cart, ensuring they don't overlook anything during the shopping trip.


## How to compile and run the application
Before compiling a Flutter app in Android Studio, it is necessary to set up the Flutter plugin.
The Flutter plugin provides the necessary tools and functionality to develop and run Flutter
applications within Android Studio. Please refer below links for more info:
- [Setup editor for flutter development](https://docs.flutter.dev/get-started/editor?tab=androidstudio)
- [Run the flutter application](https://docs.flutter.dev/tools/android-studio)


## How to run tests for the application
The test files for the Flutter application are typically stored in the test/ directory within the project structure.
By navigating to this directory in Android Studio, you can access the various test files containing unit tests for
different components of your application. Clicking on a specific unit test file allows you to verify and validate the functionality of that particular component, ensuring its correctness and expected behavior.

## overall architecture of the application
In the ShopMate application, the architecture incorporates different types of files to organize the codebase effectively.

- Model files: Model files represent the data structures.

- Screens files: Screen files correspond to the different screens or UI views in the application.

- Service files: Service files handle the communication and interaction with external and internal data sources, such as database and asset files.

- Utils files: Utils files contain utility functions that provide common functionality and reusable code snippets.

- Widget files: Widget files contain custom UI widgets and reusable widgets.

## Other notes

I downloaded the app logo for ShopMate from the Flaticon website. The logo can be found at the following URL [flaticon](https://www.flaticon.com/free-icon/shopping-bag_3514242?term=grocery&page=1&position=5&origin=search&related_id=3514242)

Furthermore, I downloaded grocery images for the application from the website [FreePNGImg](https://freepngimg.com)

google_fonts: ^4.0.4: The google_fonts package version 4.0.4 was utilized to add a unique app name.

http: ^1.1.0: The http package version 1.1.0 was used to establish communication with the Firebase Realtime Database.

provider: ^6.0.5: The provider package version 6.0.5 was used to implement a ChangeNotifier in the app. In this package, the selected items list was made globally accessible.

intl: ^0.18.1: The intl package version 0.18.1 was used to format date and time.

flutter_launcher_icons: ^0.13.1: The flutter_launcher_icons package version 0.13.1 was utilized to generate launcher icons for ShopMate App.

flutter_localizations: package that provides localization and internationalization support for Flutter applications.

mockito: ^5.4.2:  package used for create mock objects for testing.