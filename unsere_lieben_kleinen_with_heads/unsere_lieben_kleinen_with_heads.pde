///*
//* Hannah Höch workshop @ The Whitechapel Gallery
//* Code by Codasign
//*/

import gifAnimation.*; // add the library for creating gifs to the code
GifMaker gifExport;

// variables for images
PImage head;
PImage left_leg;
PImage right_leg;
PImage bg;

PImage floating_head1;
PImage floating_head2;
PImage floating_head3;

PImage horizontal_head;
PImage vertical_head;

// variables for the sizes of the images
int head_width;
int head_height;
int init_head_width;
int init_head_height;
int left_leg_width;
int left_leg_height;
int right_leg_width;
int right_leg_height;

int floating_head1_width;
int floating_head1_height;
int floating_head2_width;
int floating_head2_height;
int floating_head3_width;
int floating_head3_height;

int horizontal_head_width;
int horizontal_head_height;
int vertical_head_width;
int vertical_head_height;

// variables for rotations
int deg1 = -10;
int dir1 = 1;
int deg2 = 10;
int dir2 = -1;

// variables for big head
int head_change = 1;

// variables for floating heads
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;

int x1_move;
int y1_move;
int x2_move;
int y2_move;
int x3_move;
int y3_move;

// variables for horizontal and vertical head
int horizontal_head_x = 50;
int horizontal_head_y = 50;
int vertical_head_x = 540;
int vertical_head_y = 550;

int horizontal_head_move = 2;
int vertical_head_move = 1;

// variables for color tint
int tintColour = 0;
int tintDir = 1;

void setup() {
 
  // load the images
  bg = loadImage("child_background.png");
  head = loadImage( "childs_head.png" ); 
  left_leg = loadImage( "left_leg.png" );
  right_leg = loadImage( "right_leg.png" );
  
  //floating heads
  floating_head1 = loadImage( "child_fullbody.png" ); 
  floating_head2 = loadImage( "child_fullbody.png" ); 
  floating_head3 = loadImage( "child_fullbody.png" ); 
  
  horizontal_head = loadImage( "hannah.png" ); 
  vertical_head = loadImage( "hannah.png" ); 
  
  // All the images are too big for the screen so divide the size by 3, or more if you want them to be smaller
  
  // set the size of your window
  size( bg.width/3, bg.height/3 ); 
  
  // initialise variables for the head size
  head_width = head.width/3; // this will store the current size of the head
  head_height = head.height/3;
  init_head_width = head.width/3; // save the initial size of the head
  init_head_height = head.height/3;
  
  // initialise leg variables
  left_leg_width = left_leg.width/3;
  left_leg_height = left_leg.height/3;
  right_leg_width = right_leg.width/3;
  right_leg_height = right_leg.height/3;
  
  floating_head1_width = floating_head1.width/10;
  floating_head1_height = floating_head1.height/10;
  floating_head2_width = floating_head2.width/10;
  floating_head2_height = floating_head2.height/10;
  floating_head3_width = floating_head3.width/10;
  floating_head3_height = floating_head3.height/10;
  
  horizontal_head_width = horizontal_head.width/3;
  horizontal_head_height = horizontal_head.height/3;
  vertical_head_width = vertical_head.width/3;
  vertical_head_height = vertical_head.height/3;
  
  x1 = giveRandomPositionX(width, floating_head1_width);
  y1 = giveRandomPositionY(height, floating_head1_height);
  x2 = giveRandomPositionX(width, floating_head2_width);
  y2 = giveRandomPositionY(height, floating_head2_height);
  x3 = giveRandomPositionX(width, floating_head3_width);
  y3 = giveRandomPositionY(height, floating_head3_height);
  
  x1_move = giveRandomSpeed(2, 6);
  y1_move = giveRandomSpeed(2, 6);
  x2_move = giveRandomSpeed(2, 6);
  y2_move = giveRandomSpeed(2, 6);
  x3_move = giveRandomSpeed(2, 6);
  y3_move = giveRandomSpeed(2, 6);
  
  // gif export
  gifExport = new GifMaker( this, "myAnimation.gif" ); // prepare an object to create a gif and give it a name
  gifExport.setRepeat( 0 ); // Sets the repeat setting in the GIF file. 0 means endless loop.
  //gifExport.setTransparent( 0, 0, 0 ); // Sets black to transparent
  // Unlike other image formats that support alpha (e.g. PNG), GIF does not support semi-transparent pixels. 
  // The way to achieve transparency is to set a color that will be transparent when rendering the GIF. 
  
}

void draw() {
 
  
  /////////////////
  
  // Change variables to animate the images
  
  // every 5 frames change the animation variables for the legs
  if ( frameCount % 5 == 0 ) {
    
    // rotation of left leg
    deg1 = deg1 + dir1; // add 1 to deg
    if ( deg1 < -20 || deg1 > 0 ) {
      dir1 = -1 * dir1;
    }
    
    // rotation of right leg
    deg2 = deg2 + dir2; // add 1 to deg
    if ( deg2 < 0 || deg2 > 20 ) {
      dir2 = -1 * dir2;
    }
    
  }
  
  //resize the head size by changing width and height
  head_change = getNextResizeChangeWithinBounds(head_width, head_height, init_head_width, init_head_height, 300, 400, head_change);
  head_width = head_width + head_change;
  head_height = head_height + head_change;

  // for the three small heads: get the next movement that doesn't move the image outside the window and update the x and y positions
  x1_move = getHorizontalMovementWithinWindowWidth(x1, floating_head1_width, x1_move);
  y1_move = getVerticalMovementWithinWindowHeight(y1, floating_head1_height, y1_move);
  x1 = x1 + x1_move;
  y1 = y1 + y1_move;
 
  x2_move = getHorizontalMovementWithinWindowWidth(x2, floating_head2_width, x2_move);
  y2_move = getVerticalMovementWithinWindowHeight(y2, floating_head2_height, y2_move);
  x2 = x2 + x2_move;
  y2 = y2 + y2_move;
 
  x3_move = getHorizontalMovementWithinWindowWidth(x3, floating_head3_width, x3_move);
  y3_move = getVerticalMovementWithinWindowHeight(y3, floating_head3_height, y3_move);
  x3 = x3 + x3_move;
  y3 = y3 + y3_move;
   
  // for the horizontal head: make a movement within a minimum and maximum position on the x axis
  horizontal_head_move = getHorizontalMovementWithinBounds(horizontal_head_x, horizontal_head_width, horizontal_head_move, 0, 100);
  horizontal_head_x = horizontal_head_x + horizontal_head_move;
  
  // for the vertical head: make a movement within a minimum and maximum position on the y axis
  vertical_head_move = getVerticalMovementWithinBounds(vertical_head_y, vertical_head_height, vertical_head_move, 500, height);
  vertical_head_y = vertical_head_y + vertical_head_move;  

//  horizontal_head_move = getHorizontalMovementWithinWindowWidth(horizontal_head_x, horizontal_head_width, horizontal_head_move);
//  horizontal_head_x = horizontal_head_x + horizontal_head_move;
//  
//  vertical_head_move = getVerticalMovementWithinWindowHeight(vertical_head_y, vertical_head_height, vertical_head_move);
//  vertical_head_y = vertical_head_y + vertical_head_move;   


  updateTintColour();

  /////////////////
  
  // Draw all the images on the window
  
  background(55); // make sure the holes in the images have a darkgray background
  
  imageMode( CORNER ); //interprets the second and third parameters of image() as the image's left corner coordinates. 
  //If two additional parameters are specified, they are used to set the image's width and height. 
  image( bg, 0, 0, bg.width/3, bg.height/3 ); // draw background image
  
  
  imageMode( CENTER );//interprets the second and third parameters of image() as the image's center coordinates. 
  // this will be the case for all the other images
  
  // left leg
  pushMatrix(); // save the current context
  translate( 279, 537); // Rotation is aways applied to the origin point (0,0), so move the coordinate system origin to your axis.
  rotate( radians( deg1 ) ); // Rotate: angles are specified in radians, so convert from degrees to radians
  //If two additional parameters are specified, they are used to set the image's width and height. 
  image( left_leg, 0, 0, left_leg_width, left_leg_height );
  popMatrix(); // return to the previous context and forget all the translations and rotations

  // right leg
  pushMatrix();
  translate( 337, 541 );
  rotate( radians(deg2) );
  image( right_leg, 0, 0, right_leg_width, right_leg_height );
  popMatrix();

  // big head
  pushMatrix();
  translate( 319, 343 );
  rotate( radians(deg2) );
  //tint( tintColour, 255-tintColour, 200, 50 );
  image( head, 0,0, head_width, head_height );
  //noTint();
  popMatrix();
  

  // floating_head
  image( floating_head1, x1, y1, floating_head1_width, floating_head1_height );
  image( floating_head2, x2, y2, floating_head2_width, floating_head2_height );
  image( floating_head3, x3, y3, floating_head3_width, floating_head3_height );
  
  // horizontal_head and vertical_head
  image( horizontal_head, horizontal_head_x, horizontal_head_y, horizontal_head_width, horizontal_head_height );
  image( vertical_head, vertical_head_x, vertical_head_y, vertical_head_width, vertical_head_height );
  
  /////////////////
  
  // add to Gif
  addFrameToGif();
  
}


// ANIMATION FUNCTIONS

int getNextResizeChangeWithinBounds(int head_width, int head_height, int min_width, int min_height, int max_width, int max_height, int head_change){
    // if head is too big or small, change direction of change (from bigger to smaller or from smaller to bigger)
    if(head_width > max_width || head_height > max_height || (head_width + head_change) < min_width || (head_height + head_change) < min_height ){ 
      head_change = - head_change;
    }
    return head_change;
}

int getHorizontalMovementWithinWindowWidth( int position, int imageWidth, int movement ){

  int rightPositionImage = position + movement + imageWidth/2;
  int leftPositionImage = position + movement - imageWidth/2;
  
  if( leftPositionImage <= 0 || rightPositionImage >= width ){
      movement = -movement; // change direction
   }  

  return movement;
}

int getVerticalMovementWithinWindowHeight( int position, int imageHeight, int movement ){

  int bottomPositionImage = position + movement + imageHeight/2;
  int topPositionImage = position + movement - imageHeight/2;
  
  if(  topPositionImage <= 0 || bottomPositionImage >= height ){
      movement = -movement; // change direction
   }  

  return movement;
}


int getHorizontalMovementWithinBounds( int xPosition, int imageWidth, int movement, int minXBound, int maxXBound ){

  int rightPositionImage = xPosition + movement + imageWidth/2;
  int leftPositionImage = xPosition + movement - imageWidth/2;
  
  if( leftPositionImage <= minXBound || rightPositionImage >= maxXBound ){
      movement = -movement; // change direction
   }  

  return movement;
}

int getVerticalMovementWithinBounds( int yPosition, int imageHeight, int movement, int minYBound, int maxYBound ){

  int bottomPositionImage = yPosition + movement + imageHeight/2;
  int topPositionImage = yPosition + movement - imageHeight/2;
  
  if(  topPositionImage <= minYBound || bottomPositionImage >= maxYBound ){
      movement = -movement; // change direction
   }  

  return movement;
}


void updateTintColour(){
    // tint of portrait photo
  tintColour = tintColour +tintDir;
  if ( tintColour < 0 || tintColour > 255) {
    tintDir = -1 * tintDir;
  }
}


// INITIAL VALUES FOR POSITION AND SPEED

int giveRandomPositionX( int maxPosition, int imageWidth ){
  return int(random(imageWidth/2, maxPosition-imageWidth/2));
}

int giveRandomPositionY( int maxPosition, int imageHeight ){
  return int(random(imageHeight/2, maxPosition-imageHeight/2));
}

int giveRandomSpeed( int minSpeed, int maxSpeed ){
  return int(random(minSpeed, maxSpeed));
}



// FINISH GIF

void addFrameToGif(){
  
  if ( frameCount % 10 == 0 ) {
    
    gifExport.setDelay( 1 ); //Sets the delay (the "framerate") for the most recently added frame. 
    //This is measured in Milliseconds and can be different for every frame. 
    //This effects the playback speed of the resulting GIF-file only. 
    //The speed / framerate with which you wrote the frames has no effect on playback speed.
    
    gifExport.addFrame(); // add the frame to the gif
    
  }
  
}

void keyPressed() {
  
  gifExport.finish(); // finish the gif
  
}

