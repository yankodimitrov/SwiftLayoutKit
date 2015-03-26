# SwiftLayoutKit
An elegant and simple way to build your auto layout constraints. 

You use **SwiftLayoutKit** to produce your auto layout constraints by expressing the relations between the layout attributes of your views or by using the visual format language.

Keep in mind that **SwiftLayoutKit** will not set the <code>setTranslatesAutoresizingMaskIntoConstraints</code> to <code>false</code> on your views and will not install the constraints automatically for you.

![SwiftLayoutKit UML class diagram](https://raw.githubusercontent.com/yankodimitrov/SwiftLayoutKit/master/class-diagram.jpg "Figure 1. SwiftLayoutKit UML class diagram")

*Figure 1: SwiftLayoutKit UML class diagram*

## Installation

#### Manually

Copy the contents of the <code>SwiftLayoutKit</code> folder to your project:

- <code>LayoutAttribute.swift</code>
- <code>AutoLayoutAttribute.swift</code>
- <code>Layout.swift</code>
- <code>LayoutOperators.swift</code>
- <code>ViewExtensions.swift</code>

## Usage

The **SwiftLayoutKit** supports all of the available layout attributes including the new ones introduced in **iOS 8**.

To start using it, call the <code>attribute</code> method on your <code>UIView</code> instance and pass in the <code>NSLayoutAttribute</code> type that you wish to use, for example:

```swift
...

// let's assume that boxView is a subview of view

boxView.attribute(.Width) == 200
boxView.attribute(.Height) == 200
boxView.attribute(.CenterX) == view.attribute(.CenterX)
boxView.attribute(.CenterY) == view.attribute(.CenterY)

...
```

The code above will produce four constraints, but will not add them to the constraints of the parent view. We can use the custom *add constraint/s* operator <code>+|</code> to add the produced constraints to the parent view:

```swift
...

view +| boxView.attribute(.Width) == 200
view +| boxView.attribute(.Height) == 200
view +| boxView.attribute(.CenterX) == view.attribute(.CenterX)
view +| boxView.attribute(.CenterY) == view.attribute(.CenterY)

...
```

You are not forced to use the <code>+|</code> operator, instead you can  call the <code>addConstraint</code> method on the parent view:

```swift
...

view.addConstraint( boxView.attribute(.Width) == 200 )

...
```

### Layout Functions

#### Constraints with visual format

Sometimes its easier and faster to generate constraints using the visual format language. The **SwiftLayoutKit** comes with a helper wrapper function for the <code>NSLayoutConstraint.constraintsWithVisualFormat</code> class method. The function expects a visual format string and a dictionary with views by leaving the *options* and *metrics* as an optional arguments: 

```swift
...

let views = ["title": titleLabel]

let constraints = constraintsWith(format: "|-[title]-|", forViews: views)

...
```

#### Constraints with align to attribute

The following function allows you to align multiple views to a view by a given <code>NSLayoutAttribute</code>:

```swift
...

let constraints = constraintsWith(align: .CenterY, toView: parentView, forViews: viewA, viewB)

...
```

The above code will set the <code>CenterY</code> attribute for the <code>viewA</code> and <code>viewB</code> to be equal to the <code>CenterY</code> attribute of <code>parentView </code>.

### Operators

Here is the list with all **SwiftLayoutKit** operators:

Operator | Description
---------|-------------------
+&#124; | Adds constraint/s to a view |
~        | Sets the constraint priority on the left layout attribute |
==       | Produces a constraint with Equal relation between two layout attributes or between an attribute and a number |
>=       | Produces a constraint with GreaterThanOrEqual relation between two layout attributes or between an attribute and a number |
<=       | Produces a constraint with LessThanOrEqual relation between two layout attributes or between an attribute and a number |
+        | Increments the constraint constant with a given number |
-        | Decrements the constraint constant by a given number |
*        | Sets the constraint multiplier to a given number |
/        | Divides the constraint multiplier by a given number (the default multiplier is set to 1) |

```swift
...

view +| viewA.attribute(.Width) == 200
view +| viewA.attribute(.Height) ~ 600 == 50

view +| viewA.attribute(.Top) ~ 500 == viewB.attribute(.Top) + 20
view +| viewA.attribute(.Leading) == viewB.attribute(.Trailing) / 2 + 40

view +| viewC.attribute(.Top) == viewB.attribute(.Top) * 2 - 10
view +| viewC.attribute(.CenterX) == viewB.attribute(.CenterX)

view +| viewC.attribute(.Width) >= viewB.attribute(.Width)
view +| viewC.attribute(.Height) <= 200

...
```

## Tests?
Yes, you can find them in the <code>SwiftLayoutKitTests</code> folder.

## Inspiration

This project was inspired by [Robb Böhnke's](https://github.com/robb) work on [Cartography](https://github.com/robb/Cartography).

## License
SwiftLayoutKit is released under the MIT license. See the LICENSE.txt file for more info.