import themidibus.*; //Import the library

MidiBus myBus; 

int OFFSET = 40; //відступ від краю
float X_SCALE_FACTOR = 6;
float Y_SCALE_FACTOR = 1;
int GRID_X = PApplet.parseInt(  PApplet.parseFloat(380 - OFFSET*2)/X_SCALE_FACTOR );  //крок сітки по Х
int GRID_Y =PApplet.parseInt( PApplet.parseFloat(380 - OFFSET*2)/Y_SCALE_FACTOR );    //крок сітки по У

int NUM_THREADS = 3;  // кількість ниток
int SHADE = 20;       // величина тіні (в пікселях)
float scale = 2.5;      // масштаб/товщина нитки

String midiDevice = "Minilab3"; // індикатор міді-девайсу
//String midiDevice = "Akai MPD32";

HashMap<String, MIDIControl> midiMap;

int THREAD_WIDTH = 40;
int DICE = 100;
int FRAMERATE = 250; 

ArrayList <thread> threads;
PShape arrow1, arrow2,arrow3,arrow4;
PShape arrows[];

void setup()
{
  surface.setLocation(0,500);
  size(480, 3840);  // розміри рендера
  MidiBus.list(); 
   //myBus = new MidiBus(this, -1, -1); 
  myBus = new MidiBus(this, "Minilab3", "Java Sound Synthesizer");
  
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
   
   midiMap = new HashMap<String, MIDIControl>();
   
   setControl("DICE", 86, 0, 100);
   setControl("SHADE", 87, 1, 50);
   setControl("scale", 89, 0, 10);
   setControl("OFFSET", 90, 0, 200);
   setControl("X_SCALE_FACTOR", 110, 1, 20);
   setControl("Y_SCALE_FACTOR", 111, 0, 20);
   setControl("FRAMERATE", 116, 10, 500);
}

void draw()
{
  background(0);
  for(thread t : threads){
  t.draw();
  t = new thread();
  }
  //DICE = int( sin(float(frameCount)/5.5)*100);
  //update_variables();
 
  delay(FRAMERATE);
  threads.clear();
  for(int i = 0; i < NUM_THREADS; i++) threads.add( new thread());  
}

void update_variables(){
  SHADE = (int) getControl("SHADE");
  DICE = (int) getControl("DICE");
  scale = (int) getControl("scale");
  OFFSET = (int) getControl("OFFSET");
  FRAMERATE = (int) getControl("FRAMERATE");
  
  X_SCALE_FACTOR =  getControl("X_SCALE_FACTOR");
  GRID_X = max ( PApplet.parseInt(  PApplet.parseFloat(380 - OFFSET*2)/X_SCALE_FACTOR ), 1 ); 
  
  Y_SCALE_FACTOR =  getControl("Y_SCALE_FACTOR");
  GRID_Y = max ( PApplet.parseInt( PApplet.parseFloat(380 - OFFSET*2)/Y_SCALE_FACTOR ), 1 ); 
  
}

void setControl(String varName, int cc, float min, float max) {
  midiMap.put(varName, new MIDIControl(varName, cc, min, max));
}

float getControl(String varName) {
  return midiMap.get(varName).get();
}

void controllerChange(int channel, int number, int value) {
  
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
for (MIDIControl ctrl : midiMap.values()) {
    if (ctrl.cc == number) {
      ctrl.update(value);
      if( ctrl == midiMap.get("SHADE") ) SHADE = (int) ctrl.get();
      if( ctrl == midiMap.get("DICE") ) DICE = (int) ctrl.get();
      if( ctrl == midiMap.get("scale") ) scale = (int) ctrl.get();
      if( ctrl == midiMap.get("OFFSET") ) OFFSET = (int) ctrl.get();
      if( ctrl == midiMap.get("FRAMERATE") ) FRAMERATE = (int) ctrl.get();
      if( ctrl == midiMap.get("X_SCALE_FACTOR") ) X_SCALE_FACTOR = ctrl.get();
      if( ctrl == midiMap.get("Y_SCALE_FACTOR") ) Y_SCALE_FACTOR =  ctrl.get();
      break;
    }
  }
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
