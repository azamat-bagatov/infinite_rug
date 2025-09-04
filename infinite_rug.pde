int OFFSET = 40;
int GRID_X = (380 - OFFSET*2)/3;
int GRID_Y = (380 - OFFSET*2);
int SHADE = 8;

ArrayList <thread> threads;
PShape arrow1;
void setup()
{
  size(380, 3840);
  threads = new ArrayList<thread>();
   for(int i = 0; i < 4; i++) threads.add( new thread());  
   arrow1 = loadShape("arrow1.svg");
   arrow1.disableStyle();
  
}


void draw()
{
  background(0);
  for(thread t : threads){
  t.draw();
  t = new thread();
  }
  //draw_grid();
  
 
  delay(300);
  threads.clear();
  for(int i = 0; i < 4; i++) threads.add( new thread());  
}

void draw_arrow(float x, float y, float angle){
  pushMatrix();


  translate(x,y);
  rotate(angle);
  //ellipse(0,0,10,10);
  shape(arrow1, 0,0);
  popMatrix();

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
