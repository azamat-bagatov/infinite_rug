int OFFSET = 40;
int GRID_X = (380 - OFFSET*2)/3;
int GRID_Y = (380 - OFFSET*2);

public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    float y = 0 ;
    float x = random_grid_x();
    while(y < height) {
      float newx = x;
      if( chance(20) ) newx = random_grid_x();
      pivots.add (new PVector(newx, y) );
      y+=GRID_Y;
    }
    pivots.add (new PVector(random_grid_x(), y) );
  }
  
  void draw(){

    stroke(240);
    strokeWeight(40);
    for(int i = 1; i < pivots.size(); i++)
    {
      
        PVector p = pivots.get(i);
        PVector pp = pivots.get(i-1);
        line( pp.x,pp.y, p.x,p.y); 
    
  }

  }
}


ArrayList <thread> threads;

void setup()
{
  size(380, 3840);
  threads = new ArrayList<thread>();
   for(int i = 0; i < 4; i++) threads.add( new thread());  
  
}


void draw()
{
  background(0);
  for(thread t : threads){
  t.draw();
  t = new thread();
  }
  draw_grid();
  delay(300);
  threads.clear();
  for(int i = 0; i < 4; i++) threads.add( new thread());  
}

void draw_grid(){
    int x = OFFSET;
    int y = 0;
    stroke(50);
    strokeWeight(2);
    while( x < width || y < height){
      line(0, y, width,y);
      line(x,0,x,height);
      y+=GRID_Y;
      x+=GRID_X;
    }
}
