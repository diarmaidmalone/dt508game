import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSnippet song;

void setup()
{
  size(1600, 900);
  frameRate = 60;

  sprite = loadImage("sprite.png");
  background = loadImage("JJBG.png");
  obstacle = loadImage("obstacle.png");

  minim = new Minim(this);
  song = minim.loadSnippet("song.mp3");
  song.loop();
  
  scalingBackgroundX2 = width;
  scalingObstacleX1 = width + width/2;
  scalingObstacleX2 = width * 2;
  scalingObstacleX3 = width * 2 + (width/2);
  scalingObstacleY1 = 200;
  scalingObstacleY2 = 500;
  scalingObstacleY3 = 300;
  
  ui = loadFont("PixelBug-48.vlw");
  
  alive = true;
}

int movementSpeed = 10;
int gravity;

int spriteX = 100;
int spriteY = 100;
int spriteHeight = 100;
int spriteWidth = 90;
float distance = 0.0f;

int scalingBackgroundX1 = 0;
int scalingBackgroundX2;

int scalingObstacleX1;
int scalingObstacleX2;
float scalingObstacleY1;
float scalingObstacleY2;
int scalingObstacleX3;
float scalingObstacleY3;

int scaleSpeed = 10;
int resetPoint = -1600;
int resetWidth = 1500;

PImage sprite;
PImage background;
PImage obstacle;

PFont ui;

boolean alive;

boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

void draw()
{
  background(47, 171, 223);

  image(background, scalingBackgroundX1, 50);
  image(background, scalingBackgroundX2, 50);
  image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);
  image(obstacle, scalingObstacleX1, scalingObstacleY1);
  image(obstacle, scalingObstacleX2, scalingObstacleY2);
  image(obstacle,scalingObstacleX3, scalingObstacleY3);
  
  scalingObstacleX1 -= scaleSpeed;
  scalingObstacleX2 -= scaleSpeed;
  scalingObstacleX3 -= scaleSpeed;

  scalingBackgroundX1 -= scaleSpeed;
  scalingBackgroundX2 -= scaleSpeed;
  
  if(scalingBackgroundX1 <= resetPoint)
  {
     scalingBackgroundX1 = resetWidth;
  }
  
  if(scalingBackgroundX2 <= resetPoint)
  {
     scalingBackgroundX2 = resetWidth;
  }
  
  if(scalingObstacleX1 <= - width/2)
  {
    scalingObstacleX1 = width + 100;
    scalingObstacleY1 = random(20, 600);
  }
  
  if(scalingObstacleX2 <= - width/2)
  {
    scalingObstacleX2 = width + 100;
    scalingObstacleY2 = random(20, 600);
  }
  
  if(scalingObstacleX3 <= - width/2)
  {
    scalingObstacleX3 = width + 100;
    scalingObstacleY3 = random(20, 600);
  }
  
  //println(scalingBackgroundX1);
  //println(scalingBackgroundX2);

  textFont(ui);
  text("Distance: " + distance + "m", 10, 50);
  
  if(alive)
  {
    distance += 0.1f;
  }
  println(distance);
  
  
  if (spriteY <= height - spriteHeight - 100)
    {
      gravity = 10;
    }
  else
    {
      gravity = 0;
    }

  spriteY += gravity;

  
  if (keyPressed)
  {      
    if (keyCode == UP && spriteY > 10)
    {
      spriteY -= 2 * movementSpeed;
    }

    if (keyCode == RIGHT && spriteX < width - spriteWidth)
    {
      spriteX += movementSpeed;
      spriteY -= gravity;
    }

    if (keyCode == LEFT && spriteX > 20)
    {
      spriteX -= movementSpeed;
      spriteY -= gravity;
    }
  }
  
  if(spriteX == scalingObstacleX1 && spriteY + spriteHeight >= scalingObstacleY1 && spriteY < scalingObstacleY1 + 240)
  {
    alive = false;
  }
  
  if(spriteX == scalingObstacleX2 && spriteY + spriteHeight >= scalingObstacleY2 && spriteY < scalingObstacleY2 + 240)
  {
    alive = false;
  }
  
  if(spriteX == scalingObstacleX3 && spriteY + spriteHeight >= scalingObstacleY3 && spriteY < scalingObstacleY3 + 240)
  {
    alive = false;
  }
  
      if(alive == false)
    {
       movementSpeed = 0;
       scaleSpeed = 0;
      
       text("GAME OVER!", width/2 - 150, height/2 - 100);
       text("Distance traveled: " + distance + " Meters", width/2- 400, height/2); 
    }
}
