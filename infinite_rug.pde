int OFFSET = 40; //відступ від краю
int GRID_X = (380 - OFFSET*2)/6;  //крок сітки по Х
int GRID_Y = (380 - OFFSET*2);    //крок сітки по У

int NUM_THREADS = 3;  // кількість ниток
int SHADE = 20;       // величина тіні
float scale = 2.5;      // масштаб/товщина нитки


int THREAD_WIDTH = 40;
int DICE = 100;

ArrayList <thread> threads;
PShape arrow1, arrow2,arrow3,arrow4;
PShape arrows[];
void setup()
{
  
  size(480, 3840);  // розміри рендера
  
  
  threads = new ArrayList<thread>();
   for(int i = 0; i < NUM_THREADS; i++) threads.add( new thread());  
   arrow1 = loadShape("arrow1.svg");
   arrow1.disableStyle();
  arrow2 = loadShape("arrow2.svg");
   arrow2.disableStyle();
   arrow3 = loadShape("arrow3.svg");
   arrow3.disableStyle();
   arrow4 = loadShape("arrow4.svg");
   arrow4.disableStyle();
   arrows = new PShape[] { arrow1, arrow2, arrow3, arrow4 };
   println ( arrow1.width + " " + arrow1.height );
}


void draw()
{
  background(0);
  for(thread t : threads){
  t.draw();
  t = new thread();
  }
  DICE = int( sin(float(frameCount)/5.5)*100);
  println(frameCount + "  " +DICE);
 
  delay(250);
  threads.clear();
  for(int i = 0; i < NUM_THREADS; i++) threads.add( new thread());  
}

void draw_arrow(float x, float y, float angle){
  pushMatrix();
  translate(x,y);
  rotate(angle);
  PShape arr = random_arrow();
  shape(arr, 0,0,arr.width*scale, arr.height*scale );
  popMatrix();

}
PShape random_arrow(){
  return arrows[(int) random(0, arrows.length)];
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
