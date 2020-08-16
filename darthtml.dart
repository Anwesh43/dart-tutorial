import 'dart:async';
import 'dart:html';
import 'dart:math';

class Block {

    DivElement div;

    void init() {
        int w = window.innerWidth;
        int h = window.innerHeight;
        this.div = document.createElement('div');
        this.div.style.width = '0px';
        this.div.style.height = '0px';
        document.body.append(this.div);
    }

    void update(scale) {
        double size = min(window.innerWidth, window.innerHeight) / 10;
        this.div.style.width = '${size * scale}px';
        this.div.style.height = '${size * scale}px';
        this.div.style.background = 'indigo';
    }


    static Block create() {
        Block block = new Block();
        block.init();
        return block;
    }
}
const double scGap = 0.02;

class State {

    double scale = 0;

    update(Function cb) {
        this.scale += scGap;
        if (this.scale > 1) {
            this.scale = 0;
            cb();
        } 
    }  
}

class Animator {

    static start(Function cb) {
        Timer.periodic(Duration(milliseconds: 20), (timer) { 
            cb(() {
              timer.cancel();
            });           
        });
    }
}
void main() {
    Block block = Block.create();
    State state = new State();
    Animator.start((cb) {
        print(state.scale);
        block.update(state.scale);
        state.update(cb);
    });
}