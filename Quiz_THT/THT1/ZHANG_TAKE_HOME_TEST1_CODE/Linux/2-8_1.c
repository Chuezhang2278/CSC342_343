int myadd(int x, int y) {
    int temp;
    temp = x + y;
    return temp;
}

int main() {
    static int a = 2;
    int b = 5;
    int c = myadd(a, b);
}