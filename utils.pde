int random_grid_x(){
  return OFFSET +  ( int(random(0,width))/GRID_X )*GRID_X ;
}

boolean chance ( int percent) {
  return random(100) < percent;
}
