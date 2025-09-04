float random_grid_x(){
  return OFFSET +  ( int(random(0,width -OFFSET))/GRID_X )*GRID_X ;
}

//float random_grid_x_centered(){
//  return OFFSET +  ( int(random(0,width-OFFSET))/GRID_X )*GRID_X ;
//}
boolean chance ( int percent) {
  return random(100) < percent;
}
