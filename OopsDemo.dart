double square(double num) {
    return num * num;
}

class Point {

    double x = 0;
    double y = 0;

    Point.origin() {
      x = 0;
      y = 0;
    }

    Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    double distanceSquare(Point p) {
        return square(this.x - p.x) + square(this.y - p.y); 
    }
    
    @override
    String toString() {
        return '($x, $y)';
    }
}


void main() {
    Point p = new Point(3, 4);
    Point origin = Point.origin();
    print('distance between $p and $origin ${p.distanceSquare(origin)}');
}