T first<T>(List<T> ts) {
    return ts[0];
}
void main() {
    print("First of five numbers ${first([1, 2, 3, 4, 5])}");
    print("First of five strings ${first(["hello", "good", "morning", "and", "bye"])}");
}
