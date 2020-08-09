void printColor(Color color) {
    switch(color) {
        case Color.red:
          print('roses are red');
          break;
        case Color.green:
          print('roses are green');
           break;
        case Color.blue:
          print('roses are blue');
          break;
    }
}

enum Color {red, green, blue}

void main() {
    print(Color.red.index);
    print(Color.red);
    printColor(Color.green);
}