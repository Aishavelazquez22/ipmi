//aisha velazquez cabrera comision 5
PImage img;

void setup() {
  size(800, 400);
  img = loadImage("figura.jpg");
  println("Imagen cargada: " + img);
  noStroke();
}

void draw() {
  background(200);

  
  if (img != null) {
    image(img, 0, 0, 300, 400);
  }

  
  pushMatrix();
  translate(400, 0); 

  fill(230); 
  ellipse(145,95,130, 130);

  fill(180);
  ellipse(150, 270, 220, 90); 

  fill(220);
  ellipse(150, 150, 154, 180); 

  fill(100); 
  ellipse(120, 140, 40, 30);  
  ellipse(180, 140, 40, 30);

  fill(255);
  ellipse(120, 130, 40, 30);  
  ellipse(180, 130, 40, 30);

  fill(150);
  triangle(120, 190, 170, 190, 150, 140);

  fill(255);
  triangle(130, 190, 170, 190, 150, 140);

  fill(190);
  ellipse(150, 360, 220, 90); 

  fill(160); 
  ellipse(160, 340, 120, 70);

  fill(200);
  ellipse(120, 80, 25, 25);
  ellipse(110, 90, 25, 25);
  ellipse(100, 100, 25, 25);
  ellipse(90, 110, 25, 25);

  ellipse(180, 80, 25, 25);
  ellipse(190, 90, 25, 25);
  ellipse(200, 100, 25, 25);
  ellipse(210, 110, 25, 25);

  ellipse(150,70, 30, 25);

  popMatrix();
}
