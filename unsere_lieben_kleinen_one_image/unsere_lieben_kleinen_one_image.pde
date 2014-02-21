/*
* Hannah Höch workshop @ The Whitechapel Gallery
* Code by Codasign
*/

PImage bg;  // a new instance of a PImage object to hold a background image
 
// this function prepares the sketch
void setup()
{
  bg = loadImage("Unsere_Lieben_Kleinen.jpg"); // load the background image into the PImage object
  size( bg.width/3, bg.height/3 ); // the image is too big for the screen so make the canvas the size of a 3rd of the image
}
 
// this function updates the screen
void draw()
{
  image( bg, 0, 0, bg.width/3, bg.height/3 ); // display the image in img at co-ordinate (0,0) and make the image the size of the canvas
}
