import 'dart:html';
import 'dart:async';

const double scGap = 0.02;

class State {
    
    double scale = 0.0;

    void update(Function cb) {
        this.scale += scGap;
        if (this.scale > 1) {
            this.scale = 0.0;
            cb();
        } 
    }
}

class Animator {

    bool animated = false;

    void start(Function cb) {
        if (!this.animated) {
            this.animated = true;
            Timer.periodic(Duration(milliseconds : 20), (id) {
                cb(() {
                    id.cancel();
                });
            });
        }
    }
}

void main() {

}