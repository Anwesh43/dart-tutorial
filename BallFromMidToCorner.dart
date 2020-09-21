import 'dart:html';
import 'dart:async';
import 'dart:math';

const double scGap = 0.02;
int w = window.innerWidth;
int h = window.innerHeight; 
const int delay = 20;
const int sizeFactor = 8;
double size = h / sizeFactor;

class State {

    double scale = 0.0;

    update(Function cb) {
        this.scale += scGap;
        if (this.scale > 1) {
            this.scale = 0;
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

class BallFromMidToCorner {

    DivElement ball;
    State state;
    int dirx, diry;

    BallFromMidToCorner(int dirx, int diry) {
        this.dirx = dirx;
        this.diry = diry;
    }

    void init() {
        ball = document.createElement('div');
         
        state = new State();
        ball.style.borderRadius = "50%";
        ball.style.background = "indigo";
        ball.style.width = "${size}px";
        ball.style.height = "${size}px";
        ball.style.position = "absolute";
        ball.style.top = "${h / 2 - size / 2}px";
        ball.style.left = "${w / 2 - size / 2}px";
        document.body.append(this.ball);
    }

    void update(Function cb) {
        state.update(cb);
        double x = (w / 2 - size / 2) * (1 + dirx * sin(pi * state.scale));
        double y = (h / 2 - size / 2) * (1 + diry * sin(pi * state.scale));
        ball.style.left = "${x}px";
        ball.style.top = "${y}px";
    }

    void handleTap(Function cb) {
        ball.onClick.listen((e) {
            cb();
        });
    }
    static BallFromMidToCorner initBall(int dirx, int diry) {
        BallFromMidToCorner ball = new BallFromMidToCorner(dirx, diry);
        ball.init();
        return ball;
    }
}

class BallFromMidToCornerFactory {

    static BallFromMidToCorner createBallFromMidToCorner(int dirx, int diry) {
        BallFromMidToCorner bmc = BallFromMidToCorner.initBall(dirx, diry);
        Animator animator = new Animator();
        bmc.handleTap(() {
            animator.start(() {
                bmc.update(() {
                    animator.stop();
                });
            });
        });
        return bmc;
    }
}
void main() {
    BallFromMidToCorner bmc = BallFromMidToCornerFactory.createBallFromMidToCorner(1, 1);
    BallFromMidToCorner bmc1 = BallFromMidToCornerFactory.createBallFromMidToCorner(-1, 1);
    BallFromMidToCorner bmc2 = BallFromMidToCornerFactory.createBallFromMidToCorner(-1, -1);
    BallFromMidToCorner bmc3 = BallFromMidToCornerFactory.createBallFromMidToCorner(1, -1);
}