public class thread{
  
  ArrayList<PVector> pivots;
  
  thread(){
    pivots = new ArrayList<PVector>();
    float y = 0 ;
    float x = random_grid_x();
    while(y < height) {
      float newx = x;
      if( chance(DICE) ) newx = random_grid_x();
      pivots.add (new PVector(newx, y) );
      y+=GRID_Y;
      if( chance(5) ){
        break;
      }
    }
    pivots.add (new PVector(random_grid_x(), y) );
  }
  
  void draw(){

    
    strokeWeight(THREAD_WIDTH*scale);
    noFill();
    beginShape();  
    stroke(0);
    for(int i = 0; i < pivots.size(); i++)
    {
        PVector p = pivots.get(i);
        vertex( p.x+SHADE, p.y );  
    }
    endShape();
    
    
    stroke(255);
    
    beginShape();
    for(int i = 0; i < pivots.size(); i++)
    {
        PVector p = pivots.get(i);
        vertex( p.x, p.y );  
    }
    endShape();
 
      
        
        
  
          PVector p = pivots.get(pivots.size() - 1);
          PVector pp = pivots.get(pivots.size() - 2);
        
          PVector dir = new PVector(p.x - pp.x, p.y - pp.y); 
          PVector zero = new PVector(0,-1);
          noStroke();
          fill(0);
          draw_arrow(p.x+SHADE,p.y,PVector.angleBetween(dir,zero));
          fill(255);
          draw_arrow(p.x,p.y,PVector.angleBetween(dir,zero));
          

  }
}
