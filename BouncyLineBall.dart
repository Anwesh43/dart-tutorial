import 'dart:html';
import 'dart:async';
import 'dart:math';

const double scGap = 0.02;

class State {
    
    double scale = 0.0, sf;

    void update(Function cb) {
        this.scale += scGap;
        this.sf = sin(scale * pi);
        if (this.scale > 1) {
            this.scale = 0.0;
            this.sf = 0.0;
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
                    animated = false;
                    id.cancel();
                });
            });
        }
    }
}

class BouncyLineBall {
    DivElement line;
    DivElement ball;
    double maxH, currY, size;
    State state;

    void initUI() {
        state = new State();
        line = new DivElement();
        ball = new DivElement();

        int w = window.innerWidth;
        int h = window.innerHeight;
        size = 0.1 * w; 
        double x = w * 0.5;
        double lineWidth = w / 90;
        String background = "indigo";
        ball.style.position = 'absolute';
        line.style.position = 'absolute';
        line.style.background = background;
        ball.style.top = "${h - size}px";
        ball.style.left = "${x - size / 2}px";
        ball.style.width = "${size}px";
        ball.style.height = "${size}px";
        line.style.top = "${h}px";
        line.style.left = "${x}px";
        line.style.width = "${lineWidth}px";
        line.style.height = "${0}px";
        ball.style.borderRadius = "50%";
        ball.style.background = background;
        document.body.append(this.line);
        document.body.append(this.ball);
        maxH = h / 5;
        currY = h * 1.0;
    }

    void update(Function cb) {
        this.state.update(cb);
        double currH = maxH * state.sf;
        double y = currY - currH; 
        this.line.style.top =  "${y}px";
        this.line.style.height = "${currH}px";
        this.ball.style.top = "${y - size}px";
    }

    void handleTap(Function cb) {
        this.ball.onClick.listen(cb);
    }

    static BouncyLineBall init() {
        BouncyLineBall ball = new BouncyLineBall();
        ball.initUI();
        return ball;
    }
}

void main() {
    Animator animator = new Animator();
    BouncyLineBall ball = BouncyLineBall.init();
    ball.handleTap((e) {
        animator.start((cb) {
            ball.update(cb);
        });
    });
}