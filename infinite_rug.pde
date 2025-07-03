int OFFSET = 40;
int GRID_X = (380 - OFFSET*2)/3;
int GRID_Y = (380 - OFFSET*2);

ArrayList <thread> threads;


boolean isTaken( int x, int y) {
  for(thread t : threads){
        for(int i = 0; i < t.pivots.size(); i++)
    {
      
        PVector p = t.pivots.get(i);
        if(p.x == x && p.y == y) return true;
  }
  }
  return false;
}
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
  }
  draw_grid();
  
}

void keyPressed(){
  if(key == ' ') refresh();
}

void refresh(){
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
