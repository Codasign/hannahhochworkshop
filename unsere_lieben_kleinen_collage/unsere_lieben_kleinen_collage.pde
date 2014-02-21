/*
* Hannah Höch workshop @ The Whitechapel Gallery
* Code by Codasign
*/

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
 
void setup()
{
  // load the images
  bg = loadImage( "child_background.png" );
  head = loadImage( "childs_head.png" ); 
  left_leg = loadImage( "left_leg.png" );
  right_leg = loadImage( "right_leg.png" );
  
  // set the size of your canvas
  size( bg.width/3, bg.height/3 );
  
  // initialise variables for changing the head size
  head_width = head.width/3;
  head_height = head.height/3;
  init_head_width = head.width/3;
  init_head_height = head.height/3;
  
  // initialise leg variables
  left_leg_width = left_leg.width/3;
  left_leg_height = left_leg.height/3;
  right_leg_width = right_leg.width/3;
  right_leg_height = right_leg.height/3;
  
}
 
void draw()
{
  // now draw all the images on the canvas
  
  background(55); // make sure the holes in the images have a darkgray background
  
  imageMode( CORNER ); //interprets the second and third parameters of image() as the image's left corner coordinates. 
  //If two additional parameters are specified, they are used to set the image's width and height. 
  image( bg, 0, 0, bg.width/3, bg.height/3 ); // display the image in img at co-ordinate (0,0)
    
  
  imageMode( CENTER );//interprets the second and third parameters of image() as the image's center coordinates. 
  //If two additional parameters are specified, they are used to set the image's width and height. 
  
  // left leg
  image( left_leg, 279, 537, left_leg_width, left_leg_height );
  
  // right leg
  image( right_leg, 337, 541, right_leg_width, right_leg_height );

  // head
  image( head, 319, 343, head_width, head_height );
  
}
