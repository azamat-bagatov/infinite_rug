color random_from_palette() {
  return palette[int(random(palette.length))];
}
int random_grid_x(){
  return OFFSET +  ( int(random(0,width-OFFSET-15))/GRID_X )*GRID_X ;
}

boolean chance ( int percent) {
  return random(100) < percent;
}

boolean isTaken( int x , int y) {
  for(thread t : threads){
        for(int i = 0; i < t.pivots.size(); i++)
    {
      
        PVector p = t.pivots.get(i);
        if(p.x == x && p.y == y) return true;
  }
  }
  return false;
}
