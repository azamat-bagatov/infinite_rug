int OFFSET = 20;
int GRID_X = 340/3;
int GRID_Y = 340;

public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    float y = 0 ;
    while(y < height) {
      pivots.add (new PVector(random_grid_x(), y+=GRID_Y) );
    }
  }
}



void setup()
{
  size(380, 1920);
  background(0);
}


void draw()
{
  stroke(240); // Black stroke
  noFill(); // No fill color
  
}
