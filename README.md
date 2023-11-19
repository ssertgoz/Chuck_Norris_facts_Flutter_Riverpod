
## Flutter Chuck Norris App

### Persönliche Daten

This Flutter application utilizes Chuck Norris API to provide a Chuck Norris joke browsing experience. Below, you will find detailed information on the app's features, navigation, state management, and additional functionalities.

### Project Structure

The project adheres to a clean and organized structure for clarity and maintainability:

![screen shot](/screen_shots/Screenshot 2023-11-20 at 00.18.20.png)

![screen shot](screen_shots/Screenshot 2023-11-20 at 00.20.04.jpg)

Components includes app features. each component has Data layer, Application Layer and presentation layer, Hence, screens and other UI widgets can use this components easily. This structure also enable us to remove and add features without difficulty. The reason why I exclude screens and some other widgets from features is that we are using features on the screens or in another words inside a widget. so we can use multiple features in a widget or in a screen. so if we put a screen to inside of a feature, we need to communicate with between features. But in this way we are communication on the screens with which feature we want and removing communication between features. This enable us more flexibility when we want to remove or add feature to a screen in the future.    

### Navigation

The application uses the `GoRouter` library for navigation. The navigation structure includes the following screens:

-   Category List
-   Random Joke by Category (navigates from the Category List)
-   Joke Detail (navigates from the Search List or Favorite List)
-   Search
-   Favorites

### Bottom Navigation Bar

A bottom navigation bar is implemented with buttons for Categories, Search, and Favorites. 

### State Management

State management is implemented using the `Riverpod` library. It provides a scalable and maintainable solution for managing the app's state.

### Loading State

A loading indicator is displayed when fetching data to enhance the user experience. The `LoadingIndicator` component is utilized for this purpose.


### Error Handling

Error handling is implemented to prioritize displaying API errors when available. 

### Animations
Animations are implemented throughout the app to provide a more engaging user experience. Lottie animations are used for this purpose and Bottom Navigation buttons and like button is animated. 

## Features:

* You can browse available categories on the Categories Screen
![screen shot](screen_shots/Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.46.41.jpg)


* You can browse random Chuck Norris fact by selecting a category from Categories Screen.
![screen shot](screen_shots/Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.46.51.jpg)


*  You can search Chuck Norris facts on the Search Screen
![screen shot](screen_shots/Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.47.24.jpg)


*  You can browse Chuck Norris fact on the web by clicking "See on the web" button on Random Joke Screen and Details Screen. And also you can add current joke to your favorite list here.
![screen shot](screen_shots/Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.46.51.jpg)


*  You can browse all your favorite facts on the Favorites Screen, you can clear your favorites by clicking clear all button. Favorites are permanent even if you close the app so that you can see your list later again.
![screen shot](Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.47.05.jpg)


*  You can beautiful Lottie animations on error states or empty states. 
![screen shot](Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.47.37.jpg) ![screen shot](Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.47.48.jpg)![screen shot](Simulator Screenshot - iPhone 15 Pro Max - 2023-11-19 at 23.45.48.jpg) 

### Used Libraries

 1. flutter_launcher_icons: ^0.13.1
 2. flutter_native_splash: ^2.3.5
 3. flutter_riverpod: ^2.4.6
 4. flutter_spinkit: ^5.2.0
 5. go_router: ^12.1.1
 6. google_fonts: ^6.1.0
 7. http: ^1.1.0
 8. like_button: ^2.0.5
 9. lottie: ^2.7.0
 10. path: ^1.8.3
 11. path_provider: ^2.1.1
 12. sqflite: ^2.3.0
 13. url_launcher: ^6.2.1

### How to Run the App

1.  Clone the repository: `git clone https://github.com/ssertgoz/Chuck_Norris_facts_Flutter_Riverpod.git`
2.  Navigate to the project directory: `cd chuck_norris`
3.  Install dependencies: `flutter pub get`
4.  Run the app: `flutter run`

Feel free to explore the codebase and provide any feedback or suggestions for improvement.
