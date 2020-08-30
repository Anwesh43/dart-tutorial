import 'dart:html';
import 'dart:async';
import 'dart:math';

final int parts = 2;
final double scGap = 0.02 / (parts * 2);
final int delay = 30;

class ScaleUtil {

    static double maxScale(double scale, int i, int n) {
        return max(0, scale - i / n);
    }
    static double divideScale(double scale, int i, int n) {
        return min(1 / n, ScaleUtil.maxScale(scale, i, n)) * n; 
    }

    static double sinify(double scale) {
        return sin(scale * pi);
    }
}


class State {

   double scale = 0.0;
   
   void update(Function cb) {
      scale += scGap;
      if (scale > 1) {
          scale = 0; 
          cb();
      }
   }

   void startUpdating(Function cb) {
      cb();
   }
}

class Animator {

    bool animated = false;

    void start(Function cb) {
        if (!animated) {
            animated = true;
            Timer.periodic(Duration(milliseconds: delay), (timerId) {
                cb((){
                  timerId.cancel();
                  animated = false;
                });
            });
        }
    }
}

class Ball {

    DivElement div = document.createElement('div');
    State state = new State();
    int i;
    Ball(int i) {
        this.i = i;
    }
    void init() {
        int w = window.innerWidth; 
        int h = window.innerHeight; 
        double size = min(w, h) / 10;
        this.div.style.position = 'absolute';
        this.div.style.left = '${w / 2 - size / 2}px';
        this.div.style.top = '${h - size}px';
        this.div.style.width = '${size}px';
        this.div.style.height = '${size}px';
        this.div.style.borderRadius = '50%';
        this.div.style.background = 'indigo';
        document.body.append(this.div);
    }

    void updateX() {
        int w = window.innerWidth; 
        int h = window.innerHeight; 
        double size = min(w, h) / 10;
        double sf = ScaleUtil.sinify(state.scale);
        double sfi = ScaleUtil.divideScale(sf, i, 2);
        int sj = 1 - 2 * i;
        double x = (w / 2 - size / 2) * (1 - sj * sfi);
        this.div.style.left = '${x}px';
    }

    void update(Function cb) {  
        this.updateX();
        this.state.update(() {
            cb();
            this.updateX();
        });
    }

    void handleClick(Function cb) {
        this.div.onClick.listen((e) {
            cb();
        });
    }
    static Ball create(int i) {
        Ball ball = new Ball(i);
        ball.init();
        return ball;
    } 
}

class BallContainer {

}

void main() {
    Animator animator = new Animator();
    Ball ball = Ball.create(0);
    Ball ball1 = Ball.create(1);
    
    ball1.handleClick(() {
        animator.start((cb) {
            ball.update(cb);
            ball1.update(() {
                print("stopped");
            });
        });
    });
}