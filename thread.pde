public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    
    int y = 0 ;
    while(y < height+400) {
      add_point(y);
      y += GRID_Y;
      
    }
 
    
  }
  
  void add_point(int y){
      int newx = random_grid_x();
      if(pivots.size() > 0) newx = (int) pivots.get(pivots.size()-1).x;
      
      if( chance(60) ) newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      pivots.add (new PVector ( newx, y) );
      println(newx + " | " + y);
  }
  
  void update(){
    pivots.remove(0);
    add_point( (int) pivots.get( pivots.size()-1 ).y + GRID_Y - SPEED );
  }
  
  void shift(float s){
    for( PVector p : pivots){
      p.y += s;
    }
  }
  
  void draw(){

    
    strokeWeight(THREAD_WIDTH);
    for(int i = 1; i < pivots.size(); i++)
    {
      
        PVector p = pivots.get(i);
        PVector pp = pivots.get(i-1);
        stroke(20, 50);
        int drift = 10;
        line( pp.x+drift,pp.y+drift, p.x+drift,p.y+drift); 
        stroke(240);
        line( pp.x ,pp.y, p.x,p.y); 
    
  }

  }
}
