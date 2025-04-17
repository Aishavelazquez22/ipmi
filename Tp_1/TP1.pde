PImage img; //<>//

void setup() {
  size(800, 400);
  background(227 , 221 ,211);
  
  img = loadImage("dataphoto.jpg");
  image(img, 0, 0, 400, 400);
  
}

void draw() {
  noStroke();  
  
  line(400, 0, 400, 400);  
  
  
  fill(245, 222, 179);
  arc(600, 160, 160, 160, PI, TWO_PI); 
  rect(520, 160, 160, 160); // Cuerpo
  
  fill(255, 204, 153);
  ellipse(600, 200, 150, 180);
  
  fill(255, 204, 153);
  rect(530, 170, 60, 40); 
  
  fill(255);
  rect(530, 320, 140, 80);
  
  fill(200);
  triangle(570, 320, 630, 320, 600, 350);
  
  fill(255);
  ellipse(640, 170, 30, 20); 
  ellipse(570, 180, 30, 20);
  
  fill(0);
  ellipse(577, 177, 15, 10);
  ellipse(647, 167, 15, 10); 
  
  fill(255, 170, 120);
  triangle(600, 190, 595, 220, 585, 220);
  
  fill(200, 50, 70);
  ellipse(590, 250, 50, 20);
  
fill(255, 204, 0);
  rect(650, 250, 50, 80);
  
fill(255, 204, 153);
ellipse(680, 310, 50, 40); 
rect(660, 270, 10, 30);
  
}

 
