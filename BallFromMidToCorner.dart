import 'dart:html';
import 'dart:async';

const double scGap = 0.02;

class State {

    double scale = 0.0;

    update(Function cb) {
        this.scale += scGap;
        if (this.scale > 1) {
            this.scale = 1;
            cb();
        } 
    }
}

class Animator {

    bool animated = false;
    Timer timer;
    
    void start(Function cb) {
        if (!animated) {
            animated = true;
            Timer.periodic(Duration(milliseconds: 20), (timerId) {
                timer = timerId;
                cb();

            });
        }    
    }

    void stop() {
        if (animated) {
            animated = false;
            timer.cancel();
        }
    }


}
void main() {

}