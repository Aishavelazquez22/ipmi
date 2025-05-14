//aisha cabrera//

PImage[] imagenes = new PImage[3]; 
String[] textos = new String[3];

int indice = 0;
int intervalo = 10000;
int ultimoCambio = 0;
int inicioMensaje;

// Animación para el texto
float tamanoTexto = 8;
float tamanoMaximo = 38; 


float xTexto, yTexto;

void setup() {
  size(640, 480);

  
  imagenes[0] = loadImage("dataphoto1.jpg");
  imagenes[1] = loadImage("dataphoto2.jpg");
  imagenes[2] = loadImage("dataphoto3.jpg");

  
  textos[0] = "TeamLab Borderless es una propuesta de arte inmersivo digital sin límites físicos. Fusiona creatividad y tecnología para transformar espacios.";
  textos[1] = "Es de teamLab, un colectivo artístico interdisciplinario fundado en 2001 por Toshiyuki Inoko. Su obra conecta arte, ciencia, naturaleza y tecnología.";
  textos[2] = "Se trata de un museo sin mapa creado para los amantes del arte digital. Las obras interactúan con los visitantes y se transforman en tiempo real.";

  inicioMensaje = millis();
  ultimoCambio = millis();

  iniciarAnimacionTexto();
}

void draw() {
  if (millis() - ultimoCambio > intervalo) {
    indice = (indice + 1) % imagenes.length;
    ultimoCambio = millis();
    tamanoTexto = 8;
    iniciarAnimacionTexto();
  }

  image(imagenes[indice], 0, 0, width, height);

  // Título fijo
  fill(255);
  textSize(20);
  text("AISHA CABRERA", 20, 25);

  // Configurar texto
  fill(255);
  textSize(tamanoTexto);
  textLeading(tamanoTexto * 1.3);
  textAlign(LEFT, TOP); 

  if (indice == 0) {
  
    if (tamanoTexto < tamanoMaximo) tamanoTexto += 0.5;
    drawTextWithParagraphWrap(textos[indice], xTexto, yTexto, width - 60, height / 2);
  } else if (indice == 1) {
    if (yTexto < height / 2) yTexto += 2;
    drawTextWithParagraphWrap(textos[indice], width / 2 - 250, yTexto, width - 60, height / 2);
  } else if (indice == 2) {
    if (xTexto > width / 2 - 250) xTexto -= 2;
    drawTextWithParagraphWrap(textos[indice], xTexto, height / 2, width - 60, height / 2);
  }
}


void drawTextWithParagraphWrap(String texto, float x, float y, float w, float h) {
  textAlign(LEFT, TOP);
  float lineHeight = tamanoTexto * 1.3;
  float currentY = y;
  String[] words = splitTokens(texto, " \n");
  String line = "";

  for (int i = 0; i < words.length; i++) {
    String testLine = line + words[i] + " ";
    float testWidth = textWidth(testLine);

    if (testWidth > w) {
      text(line, x, currentY);
      currentY += lineHeight;
      line = words[i] + " ";
    } else {
      line = testLine;
    }
  }
  text(line, x, currentY);
}


void iniciarAnimacionTexto() {
  if (indice == 0) {
    xTexto = 30;
    yTexto = height / 2;
    tamanoTexto = 8;
  } else if (indice == 1) {
    yTexto = -50;
    tamanoTexto = 36;
  } else if (indice == 2) {
    xTexto = width + 100;
    tamanoTexto = 36;
  }
}
