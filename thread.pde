public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    int y = 0 ;
    int x = random_grid_x();
    while(y < height) {
      int newx = x;
      if( chance(20) ) newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      if( isTaken ( newx, y ) )  newx = random_grid_x();
      pivots.add (new PVector(newx, y) );
      y+=GRID_Y;
    }
    pivots.add (new PVector(random_grid_x(), y) );
  }
  
  void draw(){

    
    strokeWeight(40);
    for(int i = 1; i < pivots.size(); i++)
    {
      
        PVector p = pivots.get(i);
        PVector pp = pivots.get(i-1);
        stroke(20);
        int drift = 10;
        line( pp.x+drift,pp.y+drift, p.x+drift,p.y+drift); 
        stroke(240);
        line( pp.x,pp.y, p.x,p.y); 
    
  }

  }
}
