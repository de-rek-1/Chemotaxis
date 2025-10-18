int maxBacteria = 200;
Bacteria[] bacteriaArray = new Bacteria[maxBacteria];
int numBacteria = 50;
void setup() {
  size(800, 600);
  for (int i = 0; i < numBacteria; i++) {
    bacteriaArray[i] = new Bacteria(width/2, height/2,color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256)));
  }
}
void draw() {
  background(0,0,0);
  for (int i = 0; i < numBacteria; i++) {
    bacteriaArray[i].move();
    bacteriaArray[i].show();
    bacteriaArray[i].age++;
    if (bacteriaArray[i].age > bacteriaArray[i].lifespan) {
      bacteriaArray[i] = bacteriaArray[numBacteria - 1];
      numBacteria--;
      i--;
    }
    else if (numBacteria < maxBacteria && Math.random() < 0.005) {
      bacteriaArray[numBacteria] = new Bacteria(bacteriaArray[i].x,bacteriaArray[i].y,color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256)));
      numBacteria++;
    }
  }
}
class Bacteria {
  int x, y;
  int c;
  int age = 0;
  int lifespan;
  Bacteria(int myX, int myY, int col) {
    x = myX;
    y = myY;
    c = col;
    lifespan = (int)random(300, 600);
  }
  void move() {
    int dx = (int)(Math.random() * 3) - 1;
    int dy = (int)(Math.random() * 3) - 1;
    if (x < mouseX) dx += 1;
    else if (x > mouseX) dx -= 1;
    
    if (y < mouseY) dy += 1;
    else if (y > mouseY) dy -= 1;
    
    x += dx;
    y += dy;
    if (x < 0) x = 0;
    if (x > width) x = width;
    if (y < 0) y = 0;
    if (y > height) y = height;
  }
  void show() {
    fill(c);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
