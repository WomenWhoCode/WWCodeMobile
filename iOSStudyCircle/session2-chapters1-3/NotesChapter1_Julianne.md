<!--
http://github.com/iosjulianne
Asynchronous Programming with SwiftUI and Combine
by Peter Friese
Chapter 1 Notes 
-->


# Ch 1 SwiftUI: A New Beginning

### SwiftUI Principles

**Declarative v. Imperative**<br>
*Imperative* - you have to implement everything yourself (layout, behavior, data binding)<br>
Imperative is like cooking your own meal<br>

*Declarative* - you tell the framework what to do and it takes care of everything<br>
Declarative is like ordering off a menu at a restaurant and a delicious meal is returned to you 

**State Management**<br>
Data binding<br>
*SwiftUI* - native framework for keeping your data model and UI in sync  comes with a number of tools to help you build UIs that reflect the state of your model at all times and keep in sync across your entire app
*Combine* - Apple’s own reactive framework, making it possible to express the flow of data in your apps as a stream of events over time

**Composition over Inheritance**<br>
UIKit is used to minimizing UI elements, whereas in SwiftUI, elements are so lightweight, you don’t have to worry about using extra views.

**Everything is a View — Except that It Isn’t**<br>
In SwiftUI everything is called a View, but this is not an equivalent of UIView. It’s more like a view description.
“Everything is a view description”

**UIs are a function of their State**<br>
“In SwiftUI, the UI is a function of the model’s state”
Every time a change is made the model, SwiftUI automatically updates the UI to reflect the change
