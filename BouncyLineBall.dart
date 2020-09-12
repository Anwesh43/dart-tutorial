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

class BouncyLineBall {
    DivElement line;
    DivElement ball;
    double maxH, currY;
    State state;

    void init() {
        state = new State();
        line = new DivElement();
        ball = new DivElement();

        int w = window.innerWidth;
        int h = window.innerHeight;
        double size = 0.1 * w; 
        double x = w * 0.5;
        double lineWidth = w / 90;
        ball.style.position = 'absolute';
        line.style.position = 'absolute';
        ball.style.top = "${h - size}px";
        ball.style.left = "${x - size / 2}px";
        ball.style.width = "${size}px";
        ball.style.height = "${size}px";
        line.style.top = "${h}px";
        line.style.left = "${x}px";
        line.style.width = "${lineWidth}px";
        line.style.height = "${0}px";
        ball.style.borderRadius = "50%";
        document.body.append(this.line);
        document.body.append(this.ball);
        maxH = h / 5;
        currY = h * 1.0;
    }

    void update(Function cb) {
        this.state.update(cb);
        double currH = maxH * state.scale;
        double y = currY - currH; 
        this.line.style.top =  "${y}px";
        this.line.style.height = "${currH}px";
        this.ball.style.top = "${y}px";
    }
}

void main() {

}