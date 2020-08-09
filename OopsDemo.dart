import 'dart:math';
double square(double num) {
    return num * num;
}
abstract class BasicOperation {
    
    Object add(Object o);

    Object minus(Object o);

    Object product(Object o);
}

class Animal {
    String name;
    int age; 

    Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    void shoutOut() {
        print('My name is $name and age is $age');
    }
}

class Person extends Animal {
    String address;

    Person(String name, int age) : super(name, age);

    void shoutOut() {
        super.shoutOut();
        print('my address is $address');
    }
}
class Point implements BasicOperation {

    double x = 0;
    double y = 0;

    Point.origin() {
      x = 0;
      y = 0;
    }

    double get area => x * y;

    set mirrorX(double value) => x = -value;

    set mirrorY(double value) => y = -value;

    Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    @override
    Object add(Object o) {
        Point p = o as Point; 
        return new Point(p.x + x, p.y + y);
    }

    @override
    Object minus(Object o) {
        Point p = o as Point; 
        return new Point(x - p.x, y - p.y);
    }

    @override 
    Object product(Object o) {
        Point p = o as Point; 
        return new Point(p.x * x, p.y * y);
    }

    double distanceSquare(Point p) {
        return square(this.x - p.x) + square(this.y - p.y); 
    }

    double distance(Point p) {
        return sqrt(distanceSquare(p));
    }
    
    @override
    String toString() {
        return '($x, $y)';
    }
}


void main() {
    Point p = new Point(3, 4);
    Point origin = Point.origin();
    print('distance between $p and $origin ${p.distance(origin)}');
    print('$p area is ${p.area}');
    p.mirrorX = -12;
    p.mirrorY = -13;
    print('new point is $p');
    Point p2 = new Point(4, 5);
    Point paddp2 = p.add(p2) as Point;
    Point pminusp2 = p.minus(p2) as Point;
    Point pproductp2 = p.product(p2) as Point;
    print('$p + $p2 = $paddp2');
    print('$p - $p2 = $pminusp2');
    print('$p * $p2 = $pproductp2');

    Person person = new Person("Anwesh", 28);
    person.address = "Bengaluru";
    person.shoutOut();
}