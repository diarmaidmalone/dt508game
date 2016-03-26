void setup()
{
  size(1600, 900);
  tx1 = width/5;
  tx2 = tx1;
  tx3 = tx1 + 100;
  
  ty1 = height/3 + 50;
  ty2 = ty1 + 100;
  ty3 = ty1 + 50;
  
  frameRate = 60;
}

int tx1, tx2, tx3;
int ty1, ty2, ty3;
int movementSpeed = 10;
int gravity;

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
 
 if(ty2 <= height - 30 && keyPressed == false)
 {
   gravity = 10 ;
 }
 else
 {
   gravity = 0; 
 }
 
 stroke(255);
 fill(0);
 triangle(tx1, ty1, tx2, ty2, tx3, ty3);

   ty1 += gravity;
   ty2 += gravity;
   ty3 += gravity;

  if (keyPressed)
    {      
      if(keyCode == UP && ty1 > 30)
      {
         ty1 -= movementSpeed;
         ty2 -= movementSpeed;
         ty3 -= movementSpeed;
      }
      
      if(keyCode == RIGHT && tx3 < width - 10)
      {
         tx1 += movementSpeed;
         tx2 += movementSpeed;
         tx3 += movementSpeed;
      }
      
      if(keyCode == LEFT && tx1 > 10)
      {
         tx1 -= movementSpeed;
         tx2 -= movementSpeed;
         tx3 -= movementSpeed;
      }
    }
}
