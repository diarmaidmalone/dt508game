void setup()
{
  size(1600, 900);
  frameRate = 60;

  sprite = loadImage("sprite.png");
}

int movementSpeed = 10;
int gravity;

int spriteX = 100;
int spriteY = 100;
int spriteHeight = 150;
int spriteWidth = 100;

PImage sprite;

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
  background(0);

  image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);

  if (spriteY <= height - spriteHeight - 50)
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
