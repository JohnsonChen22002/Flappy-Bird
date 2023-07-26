class Pipe {
  float pipeX;
  float topHeight;
  float bottomHeight;
  float w;
  
  Pipe() {
    pipeX = 1000;
    topHeight = random(50,250);
    bottomHeight = 300 - topHeight;
    w = 30;
  }
  
  boolean collisionCheck(float positionY) {
    float characterX = 50;
    float rectFrontX = pipeX;
    float rectBackX = pipeX + 80;
    float characterTopY = positionY;
    float rectTopY = topHeight;
    float characterBottomY = positionY;
    float rectBottomY = 500 - bottomHeight;
    if (characterX > rectFrontX && characterX < rectBackX) {
      if (characterTopY < rectTopY) {
        print("character has collided with top rectangles\n");
        return true;
      }
      if (characterBottomY > rectBottomY){
        print("character has collided with bottom rectangles\n");
        return true;
      }
      
    }
      return false;
  }
  void updateAndDraw(){
  pipeX = pipeX - 2;
  //forward = forward + 3;
  //Draw the pipes and apply the math stuff to the pipe for it to move
  rect(pipeX, 0, 80, topHeight);
  rect(pipeX, 500-bottomHeight, 80, bottomHeight);
  }
}