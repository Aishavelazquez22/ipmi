 // Aisha Cabrera Velazquez
PImage img;

// Tonos púrpura desde centro (oscuro) a exterior (claro)
color[] purpleShades = {
  #2E002D,  // Centro
  #4A004D,
  #6A0072,
  #880099,
  #A63DB6,
  #C26FD0,
  #D89CE4,
  #EAC8F3,
  #F7E2FA   // Exterior
};

int layers = purpleShades.length;
float baseSize = 30;
float sizeStep = 25;
float rotationStep = PI / 20;

void setup() {
  size(800, 400);  // Doble ancho: 400 imagen + 400 dibujo
  background(255);
  noStroke();

  // Cargar imagen
  img = loadImage("rombos.jpg");
  img.resize(width / 2, height); // Redimensionamos a mitad del canvas

  // Mostrar imagen a la izquierda
  image(img, 0, 0);

  // Dibujo a la derecha
  pushMatrix();
  translate(600, 200); // Centro de la mitad derecha (x: 400 + mitad de 400)
  
  for (int i = layers - 1; i >= 0; i--) {
    pushMatrix();
    rotate(i * rotationStep);
    fill(purpleShades[i]);
    drawDiamond(baseSize + i * sizeStep);
    popMatrix();
  }
  popMatrix();
}

void drawDiamond(float r) {
  beginShape();
  for (int i = 0; i < 4; i++) {
    float angle = radians(45 + i * 90);
    float x = cos(angle) * r;
    float y = sin(angle) * r;
    vertex(x, y);
  }
  endShape(CLOSE);
}
 // pracabiar de colir tocando un voton 
