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

// variables for the sizes of the images
int head_width;
int head_height;
int init_head_width;
int init_head_height;
int left_leg_width;
int left_leg_height;
int right_leg_width;
int right_leg_height;

// variables for rotations
int deg1 = -10;
int dir1 = 1;
int deg2 = 10;
int dir2 = -1;

// variables for big head
int head_change = 1;

void setup() {
 
  // load the images
  bg = loadImage("child_background.png");
  head = loadImage( "childs_head.png" ); 
  left_leg = loadImage( "left_leg.png" );
  right_leg = loadImage( "right_leg.png" );
  
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
    
    // rotation of right leg and head
    deg2 = deg2 + dir2; // add 1 to deg
    if ( deg2 < 0 || deg2 > 20 ) {
      dir2 = -1 * dir2;
    }
    
  }
  
  //resize the head size by changing width and height
  head_change = getNextResizeChangeWithinBounds(head_width, head_height, init_head_width, init_head_height, 300, 400, head_change);
  head_width = head_width + head_change;
  head_height = head_height + head_change;

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
  image( head, 0,0, head_width, head_height );
  popMatrix();
  
  /////////////////
  
  // add to Gif
  addFrameToGif();
  
}


// ANIMATION FUNCTION

int getNextResizeChangeWithinBounds(int head_width, int head_height, int min_width, int min_height, int max_width, int max_height, int head_change){
    
  // if head is too big or small, change direction of change (from bigger to smaller or from smaller to bigger)
  if(head_width > max_width || head_height > max_height || (head_width + head_change) < min_width || (head_height + head_change) < min_height ){ 
    head_change = - head_change;
  }
  
  return head_change;
  
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

