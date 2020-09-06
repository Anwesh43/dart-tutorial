import 'dart:html';
import 'dart:async';
import 'dart:math';

const double scGap = 0.01;

double absolute(double a) {
    return a >= 0? a: -a;
}
class State {

    double scale = 0;
    double dir = 0;
    double prevScale = 0;
    
    void update(Function cb) {
        this.scale += scGap * this.dir;
        if (absolute(scale - prevScale) > 1) {
            scale = prevScale + dir;
            dir = 0;
            prevScale = scale; 
            cb();
        }
    }

    void startUpdating(Function cb) {
        if (dir == 0) {
            dir = 1 - 2 * this.prevScale;
        }
    }
}

class Animator {

    bool animated = false;

    start(Function cb) {
        if (!animated) {
            animated = true;
            Timer.periodic(Duration(milliseconds: 20), (id) {
                cb(() {
                    animated = false;
                    id.cancel();
                });
            });
        }
    }
}
void main() {

}