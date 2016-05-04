import processing.sound.*;
SoundFile song;

void setup()
{
  size(1600, 900);
  frameRate = 60;

  sprite = loadImage("sprite.png");
  background = loadImage("JJBG.png");

  song = new SoundFile(this, "song.mp3");
  song.play();
}

int movementSpeed = 10;
int gravity;

int spriteX = 100;
int spriteY = 100;
int spriteHeight = 150;
int spriteWidth = 100;

PImage sprite;
PImage background;

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

  image(background, 0, 50);
  image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);

  if (spriteY <= height - spriteHeight - 100)
    {
      gravity = 10 ;
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
      spriteY -= 20;
    }

    if (keyCode == RIGHT && spriteX < width - spriteWidth)
    {
      spriteX += 10;
      spriteY -= gravity;
    }

    if (keyCode == LEFT && spriteX > -20)
    {
      spriteX -= 10;
      spriteY -= gravity;
    }
  }
}
