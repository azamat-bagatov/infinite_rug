color palette[] = {
  color(115,104,59),
  color(88,62,35),
  color(19,38,47),
  color(176,160,132)
  
};
public class thread{
  
  ArrayList<PVector> pivots;
  color col = color(240); //random_from_palette();
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
      if( chance(60) ) {
        newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      }
      pivots.add (new PVector ( newx, y) );
      
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
    noFill();
  
    stroke(20, 50);
    beginShape();   
    for(int i = 0; i < pivots.size(); i++)
    {
        PVector p = pivots.get(i);
        vertex( p.x+SHADE, p.y );  
    }
    endShape();
    
    
    stroke(col);
    beginShape();   
    for(int i = 0; i < pivots.size(); i++)
    {
        PVector p = pivots.get(i);
        vertex( p.x, p.y );  
    }
    endShape();
    
  }
}
