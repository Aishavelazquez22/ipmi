 // aisha velazquez cabrera
 // https://youtu.be/EWSJ3vgSVPA 
PImage img;
ArrayList<Rombo> rombos;
ArrayList<Rombo> rombosBase;  
Rombo seleccionado = null;
PVector mouseOffset;
int cantidad = 9;
boolean animando = false;


float hueInicio = 250;
float hueFin = 290;

color getColorFromPalette(int index) {
  float hue = map(index, 0, cantidad - 1, hueInicio, hueFin);
  return color(hue, 80.0, 100.0);  
}

void setup() {
  size(800, 400);
  background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100); 
  
  img = loadImage("rombos.jpg");  
  img.resize(width / 2, height);

  rombos = new ArrayList<Rombo>();
  rombosBase = new ArrayList<Rombo>();

  int layers = cantidad;
  float baseSize = 30;           
  float sizeStep = 18;           
  float rotationStep = radians(7.5);  

  for (int i = layers - 1; i >= 0; i--) {
    color c = getColorFromPalette(i);
    float tam = baseSize + i * sizeStep;
    float angle = i * -rotationStep;
    PVector pos = new PVector(600, 200);
    Rombo r = new Rombo(pos, tam, angle, c);
    rombos.add(r);
    rombosBase.add(r.copiar());
  }
}

void draw() {
  background(255);
  image(img, 0, 0);

  if (animando) {
    for (int i = 0; i < rombos.size(); i++) {
      Rombo r = rombos.get(i);
      float dx = random(-0.7, 0.7);
      float dy = random(-0.7, 0.7);

      r.pos.x = constrain(r.pos.x + dx, width / 2 + r.tam, width - r.tam);
      r.pos.y = constrain(r.pos.y + dy, 0 + r.tam, height - r.tam);

      r.rot += random(-0.01, 0.01);
      r.tam += random(-0.1, 0.1);
      r.tam = constrain(r.tam, 30, 30 + 9 * 18);

      r.display();
    }

    for (int i = 0; i < rombos.size(); i++) {
      for (int j = i + 1; j < rombos.size(); j++) {
        Rombo a = rombos.get(i);
        Rombo b = rombos.get(j);
        if (a != b && a.intersecta(b)) {
          a.fusionar(b);
        }
      }
    }
  } else {
    for (int i = 0; i < rombos.size(); i++) {
      Rombo base = rombosBase.get(i);
      Rombo actual = rombos.get(i);
      actual.pos.set(base.pos.x, base.pos.y);
      actual.tam = base.tam;
      actual.rot = base.rot;
      actual.col = base.col;
      actual.display();
    }
  }

  fill(0);
  textAlign(CENTER);
  text("Click derecho para iniciar/detener animación", width * 3/4, height - 10);
  text("Presiona C para cambiar colores", width / 2, height - 10);
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    animando = !animando;
    if (!animando) {
      for (int i = 0; i < rombos.size(); i++) {
        Rombo base = rombosBase.get(i);
        Rombo actual = rombos.get(i);
        actual.pos.set(base.pos.x, base.pos.y);
        actual.tam = base.tam;
        actual.rot = base.rot;
        actual.col = base.col;
      }
    }
    return;
  }

  if (!animando) {
    for (Rombo r : rombos) {
      if (r.estaSobre(mouseX, mouseY)) {
        seleccionado = r;
        mouseOffset = PVector.sub(r.pos, new PVector(mouseX, mouseY));
        break;
      }
    }
  }
}

void mouseDragged() {
  if (seleccionado != null && !animando) {
    float newX = constrain(mouseX + mouseOffset.x, width/2 + seleccionado.tam, width - seleccionado.tam);
    float newY = constrain(mouseY + mouseOffset.y, seleccionado.tam, height - seleccionado.tam);
    seleccionado.pos.set(newX, newY);
  }
}

void mouseReleased() {
  seleccionado = null;
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    // Cambiar aleatoriamente el rango de violeta
    hueInicio = random(240, 280);
    hueFin = hueInicio + 30;

    for (int i = 0; i < rombos.size(); i++) {
      color nuevo = getColorFromPalette(i);
      rombos.get(i).col = nuevo;
      rombosBase.get(i).col = nuevo;
    }
  }
}

class Rombo {
  PVector pos;
  float tam;
  float rot;
  color col;

  Rombo(PVector pos, float tam, float rot, color col) {
    this.pos = pos.copy();
    this.tam = tam;
    this.rot = rot;
    this.col = col;
  }

  Rombo copiar() {
    return new Rombo(this.pos, this.tam, this.rot, this.col);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    fill(col);
    beginShape();
    for (int i = 0; i < 4; i++) {
      float angle = radians(45 + i * 90);
      float x = cos(angle) * tam;
      float y = sin(angle) * tam;
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  boolean estaSobre(float mx, float my) {
    return (mx >= width / 2 && mx <= width && my >= 0 && my <= height && dist(mx, my, pos.x, pos.y) < tam * 1.2);
  }

  boolean intersecta(Rombo otro) {
    float d = PVector.dist(this.pos, otro.pos);
    return d < (this.tam + otro.tam) * 0.7;
  }

  void fusionar(Rombo otro) {
    this.tam += 0.2;
    otro.tam -= 0.2;
    if (otro.tam < 10) otro.tam = 10;
  }
}
