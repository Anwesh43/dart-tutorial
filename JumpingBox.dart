import 'dart:html';
import 'dart:math';
import 'dart:async';

class State {
    
    double scale = 0, dir = 0;

    void update(Function cb) {
        this.scale += 0.02 * this.dir;
        if (this.scale > 1) {
            this.scale = 0;
            this.dir = 0;
            cb();
        }
    }

    start(Function cb) {
       if (this.dir == 0) {
          this.dir = 1;
          cb();
       }
    }
}

class Box {
  
    DivElement div;
    double x, y, h, size;
    State state = new State();

    Box(double x, double y, double size, double h) {
        this.x = x; 
        this.y = y; 
        this.size = size;
        this.h = h;
    }
    void initElement() {
         this.div = new DivElement();
         this.div.style.width = '${this.size}px';
         this.div.style.height = '${this.size}px';
         this.div.style.position = 'absolute';
         this.div.style.left = '${this.x}px';
         this.div.style.top = '${this.y}px';
         document.body.append(this.div);
    }

    void update(Function cb) {
        this.div.style.top = "${this.y - this.h * sin(pi * this.state.scale)}px";
        this.state.update(cb);
    }

    void start(Function cb) {
        this.state.start(cb);
    }

    void handleClick(Function cb) {
        this.div.onClick.listen((e) {
            this.start(cb);
        });
    }

    static Box create(double x, double y, double size, double h) {
        Box b = new Box(x, y, size, h);
        b.initElement();
        return b;
    }
}

class Animator {
    
    bool animated = false;
    
    start(Function cb) {
        if (!this.animated) {
            this.animated = true;
            Timer.periodic(Duration(milliseconds: 40), (tid) {
                cb(() {
                    tid.cancel();
                    this.animated = false;
                });
            });
        }
    }
}
void main() {
    Box b = Box.create(300, 400, 50, 200);
    Animator animator = new Animator();
    b.handleClick(() {
        animator.start(b.update);
    });
}