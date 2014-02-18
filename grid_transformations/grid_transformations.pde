/* grid_transformations
 *
 *  Press any key to rotate the image.
 *  Have a play with different values in
 *  the rotation and transformations to see
 *  what happens.
 */

PImage grid;
int deg = 0;

void setup() {
  size( 600, 600 );

  grid = loadImage("grid.png"); 
  imageMode(CENTER);
}

void draw() {
  background(255);
  
  // rotate in middle of window
  translate(width/2, height/2);
  rotate(radians(deg));

  // draw the origin and grid image
  image(grid, 100, 0);
  fill(0);
  ellipse(0, 0, 20, 20);
}

void keyPressed() {
  deg = deg + 1; // add 1 to deg each time a key is pressed
  deg = deg%360; // don't let deg get bigger than 359
}

