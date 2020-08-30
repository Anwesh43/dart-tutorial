import 'dart:html';
import 'dart:async';

final int parts = 2;
final double scGap = 0.02 / parts;

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

void main() {

}