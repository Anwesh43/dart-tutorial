mixin Musical {
    bool canPlay = false;
    bool canConduct = false;

    void play() {
        if (canPlay) {
            print("I am playing");
        }
        if (canConduct) {
            print("I am conducting");
        }
    }
}

class Person with Musical {

    String name;

    Person(String name) {
        this.name = name;
        canPlay = true;
    }

    String toString() {
        return 'My name is $name';
    }

}

class Conductor extends Person with Musical {

  
    Conductor(String name) : super(name) {
      canConduct = true;
    }
}
void main() {
    Person p = new Person("Anwer");
    Conductor c = new Conductor("Teaker");
    print('person is $p');
    p.play();
    print('conductor is $c');
    c.play();
}