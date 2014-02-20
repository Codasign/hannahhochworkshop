import gifAnimation.*;

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
  size( 255, 455 );
  noStroke();

  head = loadImage( "hannah.png" ); 
  scissors1 = loadImage( "scissors1.png" );
  scissors2 = loadImage( "scissors2.png" );
  bg = loadImage("bw_bg.jpg");
  imageMode( CENTER ); 

  gifExport = new GifMaker( this, "myAnimation.gif" );
  gifExport. setRepeat( 0 );
  gifExport.setTransparent( 0, 0, 0 );
}
float r=0;
void draw() {
  // draw background image
  image( bg, width/2, height/2, width, height );  

  // every 5 frames...
  if ( frameCount%5 == 0 ) {
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

  // head
  tint(tintColour, 255-tintColour, 200 );
  image( head, width/2, 150 );
  noTint();

  // first half of scissors
  pushMatrix();
  translate( 120, 300 );
  rotate(radians(deg1));
  image( scissors1, 0, 0, 50, 250 );
  popMatrix();

  // second half of scissors
  pushMatrix();
  translate( 120, 300 );
  rotate(radians(deg2));
  image( scissors2, 0, 0, 50, 250 );
  popMatrix();


  if ( frameCount %60 == 0 ) {
    gifExport.setDelay( 2 );
    gifExport.addFrame();
  }
}

void keyPressed() {
  gifExport.finish();
}

