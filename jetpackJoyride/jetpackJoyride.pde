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
int scalingObstacleY1;
int scalingObstacleY2;
int scalingObstacleX3;
int scalingObstacleY3;

int scaleSpeed = 6;
int resetPoint = -1600;
int resetWidth = 1500;

PImage sprite;
PImage background;
PImage obstacle;

PFont ui;

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
  
  scalingObstacleX1 -= scaleSpeed;
  scalingObstacleX2 -= scaleSpeed;

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
  
  //println(scalingBackgroundX1);
  //println(scalingBackgroundX2);

  textFont(ui);
  text("Distance: " + distance + "m", 10, 50);
  
  distance += 0.1f;

  println(distance);
  
  
  if (spriteY <= height - spriteHeight - 100)
    {
      gravity = movementSpeed;
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
}
