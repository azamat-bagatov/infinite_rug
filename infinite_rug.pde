int OFFSET = 20;
int GRID_X = 340/3;
int GRID_Y = 340;

public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    float y = 0 ;
    while(y < height) {
      pivots.add (new PVector(random_grid_x(), y) );
      println(pivots.get(pivots.size()-1).x + "  " + pivots.get(pivots.size()-1).y);
      y+=GRID_Y;
    }
    pivots.add (new PVector(random_grid_x(), y) );
  }
  
  void draw(){
    int x = OFFSET;
    int y = 0;
    stroke(50);
    while( x < width || y < height){
      line(0, y, width,y);
      line(x,0,x,height);
      y+=GRID_Y;
      x+=GRID_X;
    }
    stroke(240);
    for(int i = 1; i < pivots.size(); i++)
    {
      
        PVector p = pivots.get(i);
        PVector pp = pivots.get(i-1);
        line( pp.x,pp.y, p.x,p.y); 
    
  }
  }
}

thread t;

void setup()
{
  size(380, 1920);
   t = new thread();
  
}


void draw()
{
  background(0);
  t.draw();
  
}
