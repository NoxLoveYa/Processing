Player player = new Player(50, 500, 40, 10, color(255,255,255));
Ball ball = new Ball(400, 500, 10, 10, 1, 1, color(255,255,255));
//Brick brick = ;
ArrayList<Brick> brickList1 = new ArrayList<Brick>();
ArrayList<Brick> brickList2 = new ArrayList<Brick>();
ArrayList<Brick> brickList3 = new ArrayList<Brick>();
ArrayList<Brick> brickList4 = new ArrayList<Brick>();
ArrayList<Brick> brickList5 = new ArrayList<Brick>();
ArrayList<Brick> brickList6 = new ArrayList<Brick>();


int score = 0;
boolean game = true;

void setup() {
  size(800,600);
  background(0);
  frameRate(244);
  noStroke();
  brickSpawn();
}

void draw() {
  background(0);
  textSize(25);
  if (!game) {
    text("GAME OVER", 30, 50);
    if (mousePressed) {restart();}
    return;
  }
  text("Score: " + score, 20, 25);
  for (int i=0; i < brickList1.size(); i++) {
      brickList1.get(i).draw();
      if (brickList1.get(i).collisionHandler()) {
        brickList1.remove(i);
      }
  }
  for (int i=0; i < brickList2.size(); i++) {
      brickList2.get(i).draw();
      if (brickList2.get(i).collisionHandler()) {
        brickList2.remove(i);
      }
  }
  for (int i=0; i < brickList3.size(); i++) {
      brickList3.get(i).draw();
      if (brickList3.get(i).collisionHandler()) {
        brickList3.remove(i);
      }
  }
  for (int i=0; i < brickList4.size(); i++) {
      brickList4.get(i).draw();
      if (brickList4.get(i).collisionHandler()) {
        brickList4.remove(i);
      }
  }
  for (int i=0; i < brickList5.size(); i++) {
      brickList5.get(i).draw();
      if (brickList5.get(i).collisionHandler()) {
        brickList5.remove(i);
      }
  }
  for (int i=0; i < brickList6.size(); i++) {
      brickList6.get(i).draw();
      if (brickList6.get(i).collisionHandler()) {
        brickList6.remove(i);
      }
  }
  player.draw();
  ball.draw();
  ball.collisionHandler();
}

class Player {
  int x, y, w, h;
  color Color;
  
  Player(int PlayerPosX, int PlayerPosY, int PlayerWidth, int PlayerHeight, color COLOR){
      x = PlayerPosX;
      y = PlayerPosY;
      w = PlayerWidth;
      h = PlayerHeight;
      Color = COLOR;
  }
  
  void draw() {
   fill(Color);
   updatePos();
   rect(x, y, w, h);
  }
  
  void updatePos() {
    x = constrain(mouseX - w/2, 0, 800 - w);
  }
}

class Ball {
  int x, y, w, h, vX, vY;
  color Color;
  
  Ball(int BallPosX, int BallPosY, int BallWidth, int BallHeight, int BallVelocityX, int BallVelocityY, color COLOR){
    x = BallPosX;
    y = BallPosY;
    w = BallWidth;
    h = BallHeight;
    vX = BallVelocityX;
    vY = BallVelocityY;
    Color = COLOR;
  }
  
  void draw() {
   fill(Color);
   updatePos();
   ellipse(x, y, w, h);
  }
  
  void updatePos() {
    x = constrain(x - vX, w/2, 800 - w/2);
    y = constrain(y - vY, h/2, 600 - h/2);
    
  }
  
  void collisionHandler() {
    if (x == w/2 || x == 800 - w/2) {
      vX = -vX;
    }
    if (y == h/2 || y == 600 - h/2) {
      //if (y == h/2) {score++;}
      if (y == 600 - h/2) {game = false;}
      vY = -vY; 
    }
    //check the position the ball on the y of the player and the x axis
    if ( ball.y == player.y && ball.x > player.x && ball.x < (player.x + player.w)) {
       vY = -vY; 
    }
  }
}

class Brick {
  int x, y, w, h;
  color Color;
  
  Brick(int BrickPosX, int BrickPosY, int BrickWidth, int BrickHeight, color COLOR){
    x = BrickPosX;
    y = BrickPosY;
    w = BrickWidth;
    h = BrickHeight;
    Color = COLOR;
  }
  
  void draw() {
   fill(Color);
   rect(x, y, w, h);
  }
  
  boolean collisionHandler() {
    if (ball.y <= (y + h) && ball.y >= y && ball.x >= x && ball.x <= (x + w)) {
      //y = 1000;
      ball.vY = -ball.vY;
      score++;
      return true;
    }
    return false;
  }
}

void brickSpawn() {
      for (int i = 0; i<19; i++) {
    brickList1.add(new Brick(20 + 40*i, 50, 35, 15, color(255,255,255,255)));
    brickList2.add(new Brick(20 + 40*i, 75, 35, 15, color(255,255,255,255)));
    brickList3.add(new Brick(20 + 40*i, 100, 35, 15, color(255,255,255,255)));
    brickList4.add(new Brick(20 + 40*i, 125, 35, 15, color(255,255,255,255)));
    brickList5.add(new Brick(20 + 40*i, 150, 35, 15, color(255,255,255,255)));
    brickList6.add(new Brick(20 + 40*i, 175, 35, 15, color(255,255,255,255)));
  }
}

void restart() {
  score = 0;
  ball.x = 400;
  ball.y = 500;
  ball.w = 10;
  ball.h = 10; 
  ball.vX = 1;
  ball.vY = 1; 
  ball.Color = color(255,255,255);
  game = true;
  brickList1.clear();
  brickList2.clear();
  brickList3.clear();
  brickList4.clear();
  brickList5.clear();
  brickList6.clear();
  brickSpawn();
}
