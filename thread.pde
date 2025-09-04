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
      if( chance(20) ){
        break;
      }
    }
    pivots.add (new PVector(random_grid_x(), y) );
  }
  
  void draw(){

    
    strokeWeight(40);
    for(int i = 1; i < pivots.size(); i++)
    {
      
        PVector p = pivots.get(i);
        PVector pp = pivots.get(i-1);
        
        stroke(0);
        line( pp.x+SHADE,pp.y, p.x+SHADE,p.y);
        
        stroke(255);
        line( pp.x,pp.y, p.x,p.y);
        
        
        
        if(i == pivots.size() - 1 ){
          
          PVector dir = new PVector(p.x - pp.x, p.y - pp.y); 
          PVector zero = new PVector(0,-1);
          noStroke();
          fill(0);
          draw_arrow(p.x+SHADE,p.y,PVector.angleBetween(dir,zero));
          fill(255);
          draw_arrow(p.x,p.y,PVector.angleBetween(dir,zero));
          
          
        }
    
  }
  
  

  }
}
