import 'dart:html';
import 'dart:async';
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
            prevScale = scale;
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

class Animator {
    bool animated = false;

    start(Function cb) {
        if (!animated) {
            animated = true;
            Timer.periodic(Duration(milliseconds: 30), (timerId) => {
                cb(() {
                  timerId.cancel();
                  animated = false;
                }) 
            });
        }
    }
}

class Ball {
    
    DivElement div = document.createElement('div');
    double size, x, y;
    State state = new State();

    Ball(double size,) {
        this.size = size;
        this.x = 0;
        this.y = window.innerHeight / 2 - size / 2;
    }

    void init() {
        div.style.position = 'absolute';
        div.style.width = '${size}px';
        div.style.height = '${size}px';
        div.style.background = 'indigo';
        div.style.borderRadius = '50%';
        div.style.left = "${this.x}px";
        div.style.top = "${this.y}px";
        document.body.append(div);
    }
    void updateDimension() {
        double sf = sin(pi * this.state.scale);
        this.x = (window.innerWidth - size) * this.state.scale;
        this.y = (window.innerHeight / 2 - size / 2) * (1 + sf);
        div.style.left = "${this.x}px";
        div.style.top = "${this.y}px";
    }
    void update(cb) {
        this.updateDimension();
        this.state.update(cb);
    }

    void handleClick(cb) {
        div.onClick.listen((e) => {
            this.state.startUpdating(cb)
        });
    }

    static Ball create(double size) {
        Ball ball = new Ball(size);
        ball.init();
        return ball;
    }
    

}
void main() {
    Animator animator = new Animator();
    Ball ball = Ball.create(100);
    ball.handleClick(() => {
        animator.start((cb) => {
            ball.update(cb)
        })
    });
}