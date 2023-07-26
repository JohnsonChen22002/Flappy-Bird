float gravity = 0.2;
float velocity = 0;
float positionY = 0;
float pipeX = 900;
Pipe p;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
//float forward = 10;

//Setup space and load background picture
void setup(){
  size(1000, 500);
  PImage img = loadImage("background.PNG");
  background(img);
  //p = new Pipe();
  //pipes.add(p);
}



//Gravity math stuff and call the function
void draw(){
  velocity = velocity + gravity;
  positionY = positionY + velocity;
  
  //forward = forward + 3;
  drawCharacter();
  
  int numPipes = pipes.size();
  for (int i = 0; i < numPipes; i++) {
    Pipe p = pipes.get(i);
    p.updateAndDraw();
    p.collisionCheck(positionY);
  }

  
  if (frameCount % 75 == 0) {
    p = new Pipe();
    pipes.add(p);
  }
  
  int score = 0;
  for(int i = 0; i < pipes.size(); i++) {
    Pipe p = pipes.get(i);
    p.updateAndDraw();
    boolean collision = p.collisionCheck(positionY);
    if (collision) {
     reset(); 
    }
    if (p.pipeX < 50){
      score++;
    }
  }
  
  textSize(32);
  text("Score: " + score, 10, 30); 
  fill(60, 181, 62);
  
  
}

void drawCharacter(){
  //Load image and apply gravity to the image
  size(1000, 500);
  PImage img = loadImage("background.PNG");
  background(img);
  PImage pic = loadImage("character.png");
  image(pic, 50, positionY);
}  

//reset velocity every time mouse is pressed
void mousePressed(){
  velocity = -4;
}

void reset() {
 
  pipes = new ArrayList<Pipe>();
  
}
