class Node {
  
    Node next;
    int data;

    Node(int data) {
        this.data = data;
    }

    Node setNext(int data) {
        next = new Node(data);
        return next;  
    }
}

void iterateToMiddle(Node curr) {
    Node iter = curr, iter2 = curr;
    int i = 0;
    while (iter != null) {
        iter = iter.next;
        if (i % 2 == 1 && iter != null) {
            iter2 = iter2.next;
        }
        i++;
    }
    print(iter2.data);
}
void main() {
    Node root = new Node(1);;
    root
    .setNext(2)
    .setNext(3)
    .setNext(4)
    .setNext(5)
    .setNext(6);
    iterateToMiddle(root); 
}