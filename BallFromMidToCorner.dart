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
void main() {

}