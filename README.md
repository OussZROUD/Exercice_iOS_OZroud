# Exercice_iOS_OZroud

## ABOUT THIS APPLICATION
 
## constraints

| Topic                | demands               | done |
| :--------------------|:-------------------------------------------:| --------------------------------:|
| Application          | Universal                                   | :white_check_mark: iphone + ipad |
| Architecture         | Apply "Single responsabilty principle"      | :white_check_mark: VIPER         |
| UI (only code)       | :no_entry_sign: [Storyboard, Xib, SwuiftUI] | :white_check_mark: check         |
| Language             | Swift                                       | :white_check_mark: check         |
| Libraries            | :no_entry_sign:                             | :white_check_mark: check         |
| Project compatibility| iOS 11+                                     | :white_check_mark: check         |
---

# Screen shots:
I made an universal app that give a different experience from iphone to ipad.
## iPhone 

<img src ="https://i.ibb.co/SJjBFNF/Simulator-Screen-Shot-i-Phone-11-2020-10-07-at-21-56-03.png" width="200" height="400"> <img src ="https://i.ibb.co/Dgxnbyb/Simulator-Screen-Shot-i-Phone-11-2020-10-07-at-21-56-05.png" width="200" height="400"> <img src ="https://i.ibb.co/mHLdpJ0/Simulator-Screen-Shot-i-Phone-11-2020-10-07-at-21-56-13.png" width="200" height="400"> <img src ="https://i.ibb.co/bsQ5gfx/Simulator-Screen-Shot-i-Phone-11-2020-10-07-at-21-56-34.png" width="200" height="400"> 

## iPad
 + Profile
 
<img src ="https://i.ibb.co/PCpkJWJ/Simulator-Screen-Shot-ipad-i-OS11-2020-10-07-at-22-04-02.png" width="300" height="500"> <img src ="https://i.ibb.co/02SGzRP/Simulator-Screen-Shot-ipad-i-OS11-2020-10-07-at-22-04-06.png" width="300" height="500">
 
 + Landscape 
 
<img src ="https://i.ibb.co/68sZND1/Simulator-Screen-Shot-ipad-i-OS11-2020-10-07-at-22-04-24.png" width="500" height="300"> <img src ="https://i.ibb.co/NshhgXq/Simulator-Screen-Shot-ipad-i-OS11-2020-10-07-at-22-04-28.png" width="500" height="300">

As we can see in the list of items some cells have an orange border and an orange filled circule :orange_circle: "that's made to mark urgent articls form none urgent once.

---

# Architecture :

## VIPER, what is it ?
VIPER is the backronym for View, Interactor, Presenter, Entity, and Router. It is the application of **clean architecture** to iOS apps. Unlike most other patterns which are more like UI patterns, Viper thinks about the whole architecture. Designed via distinct layers it separates the application logic from the domain model logic creating a clean framework for better management of the code.

## diagram of VIPER
<img src = "https://i.ibb.co/tBVDwDc/1-Mfew6qv-LQ-t-DSOk-Y23-Aw.png" width="1000" height="500">

+ **VIEW** : </br>
Is the class that holds all the code to show on the app's interface to the user and then records their interaction with them. It communicates through the protocol with the presenter that is at a higher level than that of the UI classes. The view and presenter use separate structures to share data amongst each other.

+ **INTERACTOR** : </br>
This is considered to be the backbone of the app as it contains the business logic as defined by the user. It handles data fetching and abstracts the data store.

+ **PRESENTER** : </br>
Nucleus of a module. It gets user response from the View and work accordingly. Only class to communicate with all the other components. Calls the router for routing, Interactor to fetch data (network calls or local data calls), view to update the UI.

+ **ENTITIES** : </br> 
This holds the basic model objects used by the interactor. It is the smallest element inside VIPER.

+ **ROUTER** : </br>
It inputs data from the presenter and executes that action. This class contains all the navigation logic describing the screens that need to be shown. It also decides the actual order of navigation.


> VIPER fulfills the single responsibility principle with the separation that it creates between various classes thus providing the developer base to write good maintainable code to keep up with constantly evolving the iOS platform.

## Benefits of *VIPER*: 

* Isolation and independent modules. 
* Maintains low coupling.
* Better testability.
* More adapted for updating modules.
* Easier to track and fix bugs (due to the Single Responsibility Principle).
* Collaboration Friendly, less conflicts with the rest of the development team.
* Easy to iterate on and adding new features.
* Cleaner code, more compact and reusable.

---

# *Also in this project*

* Use of **XCTest** for Unit testing.
* Perform **the open/closed principle** using extensions.
* Perform **The interface segragation principle** using specified protocols.
* Respecting Swift P.O.P **Protocol Oriented Programming**.
* Use of **Dependency injection**, **adapter** and d**elegation** design patterns.

---




