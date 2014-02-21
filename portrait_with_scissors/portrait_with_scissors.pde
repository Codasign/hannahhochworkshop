
import gifAnimation.*; // add the library for creating gifs to the code

// variables for images
GifMaker gifExport;
PImage head;
PImage scissors1;
PImage scissors2;
PImage bg;

// variables for rotations
int deg1 = -10;
int dir1 = 1;
int deg2 = 20;
int dir2 = -1;

// variables for color tint
int tintColour = 0;
int tintDir = 1;

void setup() {
  
  size( 255, 455 ); // set the size of your canvas

  // load the images you'll use in the animation
  head = loadImage( "hannah.png" ); 
  scissors1 = loadImage( "scissors1.png" );
  scissors2 = loadImage( "scissors2.png" );
  bg = loadImage("bw_bg.jpg");
  
  imageMode( CENTER );  //interprets the second and third parameters of image() as the image's center point. 
  //If two additional parameters are specified, they are used to set the image's width and height. 
 
  gifExport = new GifMaker( this, "myAnimation.gif" ); // prepare an object to create a gif and give it a name
  gifExport.setRepeat( 0 ); // Sets the repeat setting in the GIF file. 0 means endless loop.
  gifExport.setTransparent( 0, 0, 0 ); // Sets black to transparent
  // Unlike other image formats that support alpha (e.g. PNG), GIF does not support semi-transparent pixels. 
  // The way to achieve transparency is to set a color that will be transparent when rendering the GIF. 
  
}

void draw() {
  
  image( bg, width/2, height/2, width, height ); // draw background image

  // every 5 frames change the animation variables
  if ( frameCount % 5 == 0 ) {
    
    // rotation of first scissor half
    deg1 = deg1 + dir1; // add 1 to deg
    if ( deg1 < -30 || deg1 > -10 ) {
      dir1 = -1 * dir1;
    }
    
    // rotation of second scissor half
    deg2 = deg2 + dir2; // add 1 to deg
    if ( deg2 < 10 || deg2 > 40 ) {
      dir2 = -1 * dir2;
    }
    
    // tint of portrait photo
    tintColour = tintColour +tintDir;
    if ( tintColour < 0 || tintColour > 200) {
      tintDir = -1 * tintDir;
    }
    
  }

  // now draw all the images on the canvas

  // head
  tint( tintColour, 255-tintColour, 200 );
  image( head, width/2, 150 );
  noTint();

  // first half of scissors
  pushMatrix();
  translate( 120, 300 );
  rotate( radians( deg1 ) );
  image( scissors1, 0, 0, 50, 250 );
  popMatrix();

  // second half of scissors
  pushMatrix();
  translate( 120, 300 );
  rotate( radians(deg2) );
  image( scissors2, 0, 0, 50, 250 );
  popMatrix();


<<<<<<< HEAD
  if ( frameCount %60 == 0 ) {
    gifExport.setDelay( 2 );
    gifExport.addFrame();
=======
  if ( frameCount % 10 == 0 ) {
    
    gifExport.setDelay( 1 ); //Sets the delay (the "framerate") for the most recently added frame. 
    //This is measured in Milliseconds and can be different for every frame. 
    //This effects the playback speed of the resulting GIF-file only. 
    //The speed / framerate with which you wrote the frames has no effect on playback speed.
    
    gifExport.addFrame(); // add the frame to the gif
    
>>>>>>> 283ce41574d5c8d4f1ac7e53d85ca4bcf770a231
  }
  
  
}


void keyPressed() {
  
  gifExport.finish(); // finish the gif
  
}


