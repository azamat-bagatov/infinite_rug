int OFFSET = 40;
int GRID_X = (380 - OFFSET*2)/6;
int GRID_Y = (380 - OFFSET*2);
int NUM_THREADS = 4;
int THREAD_WIDTH = 42;
int SPEED = -4;
int SHADE = 4;

ArrayList <thread> threads;

float shift = 0;

void setup()
{
  size(380, 3840);
  threads = new ArrayList<thread>();
   for(int i = 0; i < NUM_THREADS; i++) threads.add( new thread());  
  frameRate(120);
}



void draw()
{
  
  //background(207,207,201);
  background(15);
  //draw_grid();
  for(thread t : threads) {
    t.draw();
    t.shift(SPEED);
  }
  shift += SPEED;
  
 if(shift < -GRID_Y) {
    for(thread t : threads) t.update();
    shift = 0;
  }
  
  
  
}

void keyPressed(){
  if(key == ' ') refresh();
}

void refresh(){
  threads.clear();
  for(int i = 0; i < NUM_THREADS; i++) threads.add( new thread());  
}

void draw_grid(){
    int x = OFFSET;
    int y = 0;
    stroke(50);
    strokeWeight(2);
    while( x < width-OFFSET || y < height){
      //line(0, y, width,y);
      line(x,0,x,height);
      y+=GRID_Y;
      x+=GRID_X;
    }
}
