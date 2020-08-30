import 'dart:html';
import 'dart:async';

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

void main() {

}