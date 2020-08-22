import 'dart:html';
import 'dart:math';

const double scGap = 0.02;

double abs(double number) {
    return number < 0 ? number * -1 : number;
}
class State {
    double scale = 0;
    double dir = 0;
    double prevScale = 0;

    update(Function cb) {
        scale += scGap * dir;
        if (abs(scale - prevScale) > 1) {
            scale = prevScale + dir; 
            dir = 0;
            cb();
        }         
    }

    startUpdating(Function cb) {
        if (this.dir == 0) {
            this.dir = 1 - 2 * this.prevScale;
            cb();
        }
    } 
}
void main() {

}