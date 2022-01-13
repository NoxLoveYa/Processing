Player player = new Player(50, 500, 40, 10, color(255,255,255));
Ball ball = new Ball(400, 500, 10, 10, 1, 1, color(255,255,255));
int score = 0;
boolean game = true;

void setup() {
  size(800,600);
  background(0);
  frameRate(244);
  noStroke();
}

void draw() {
  background(0);
  textSize(25);
  if (!game) {
    text("GAME OVER", 30, 50);
    if (mousePressed) {restart();}
    return;
  }
  text("Score: " + score, 30, 50);
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
      if (y == h/2) {score++;}
      if (y == 600 - h/2) {game = false;}
      vY = -vY; 
    }
    //check the position the ball on the y of the player and the x axis
    if ( ball.y == player.y && ball.x > player.x && ball.x < (player.x + player.w)) {
       vY = -vY; 
    }
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
}
