import UIKit

//: # Home Work 8
 
/*:
 ## Задание 1
 1.1 Создайте базовый класс `Shape` со следующими вычисляемыми свойствами:
 
 - `area: Double`
 
 - `perimeter: Double`
 
 - `description: String`
 
 Свойство `description` должно возвращать сообщение следующего вида: «The area of <...> is <...>. Perimeter - <...>»
 */

class Shape {
  var area: Double {
    0.0
  }
  
  var perimetr: Double {
    0.0
  }
  final var description: String {
    "The area of \(self) is \(area). Perimeter - \(perimetr)"
  }
}

/*:
 1.2. Создайте классы `Circle` и `Rectangle`, унаследовав их от `Shape`. Переопределите свойства `area` и `perimeter` для каждого класса в соответствии с правилом расчета площади и периметра (длины) конкретной фигуры.
 */

let pi = 3.14

final class Circle : Shape {
  let radius: Double
  
  override var area: Double {
    pi * pow(radius, 2)
  }
  
  override var perimetr: Double {
    2 * pi * radius
  }
  
  init(radius: Double) {
    self.radius = radius
  }
}

class Rectangle : Shape {
  let width: Double
  let length: Double
  
  override var area: Double {
    width * length
  }
  
  override var perimetr: Double {
    2 * (width + length)
  }
  
  init(width: Double, length: Double) {
    self.width = width
    self.length = length
  }
}

/*:
 1.3. Создайте класс `Ellipse`, унаследовав его от `Rectangle`. Переопределите свойства `area` и `perimeter` в соответствии с правилом расчета площади и периметра эллипса (для расчета нужно использовать ширину и высоту).
 */

class Ellipse : Rectangle {
  override var area: Double {
    pi * width * length
  }
  
  override var perimetr: Double {
    let a = width / 2
    let b = length / 2
    let sumOfAxes = a + b
    let term1 = 3 * sumOfAxes
    let term2 = sqrt((3 * a + b) * (a + 3 * b))
    return pi * (term1 - term2)
  }
}

//: 1.4 Создайте по экземпляру каждого класса, кроме `Shape` и выведите значение свойства `description` на консоль.
var shapes: [Shape] = []

let circle = Circle(radius: 4)
let rectangle = Rectangle(width: 4, length: 8)
let ellipse = Ellipse(width: 4, length: 8)

shapes.append(circle)
shapes.append(rectangle)
shapes.append(ellipse)

shapes.forEach { shape in
  print(shape.description)
}

/*:
 ## Задание 2
 2.1 Создайте структуру `Car` со следующими свойствами:
 - `model: String`
 - `power: Int`
 - `description: String`
 
 Свойство `description` должно возвращать сообщение с названием автомобиля и его мощность в лошадиных силах.
 
 Так же необходимо реализовать метод `increasePower`, который должен увеличить мощность автомобиля на заданное количество лошадиных сил.
  */

struct Car {
  let model: String
  var power: Int
  var description: String {
    "\(model) with power = \(power)"
  }
  
  mutating func increasePower(hp: Int) {
    power += hp
  }
}

/*:
 2.2 Создайте экземпляр структуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `increasePower`. Снова выведите значение свойства `description` на консоль.
*/

var car = Car(model: "BMW", power: 350)
print(car.description)

car.increasePower(hp: 150)
print(car.description)
