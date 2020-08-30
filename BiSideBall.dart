import 'dart:html';
import 'dart:async';
import 'dart:math';

final int parts = 2;
final double scGap = 0.02 / parts;
final int delay = 20;
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
                });
            });
        }
    }
}

class Ball {

    DivElement div = document.createElement('div');
    State state = new State();
    
    void init() {
        int w = window.innerWidth; 
        int h = window.innerHeight; 
        double size = min(w, h) / 10;
        this.div.style.position = 'absolute';
        this.div.style.left = '${w / 2 - size / 2}px';
        this.div.style.top = '${h / 2 - size / 2}px';
        this.div.style.width = '${size}px';
        this.div.style.height = '${size}px';
        this.div.style.borderRadius = '50%';
        this.div.style.background = 'indigo';
        document.body.append(this.div);
    }

    void update(Function cb) {   
        this.state.update(cb);
    }

    void handleClick(Function cb) {
        this.div.onClick.listen((e) {
            cb();
        });
    }
    static Ball create(Function cb) {
        Ball ball = new Ball();
        ball.init();
    } 
}

void main() {

}