
PImage[] f = new PImage[5];
String[] t = new String[5];

int i = 0;
int tiempoEstado = 0;

int tam = 19;
int estrellas = 60;
float[] x = new float[estrellas];
float[] y = new float[estrellas];
float[] tamB = new float[estrellas];
float[] tamO = new float[estrellas];

float imgX, imgY;
float txtX, txtY;

int estado = 0; 

void setup() {
  size(640, 480);

  for (int j = 0; j < 5; j++) {
    f[j] = loadImage("imagen" + (j + 1) + ".png");
  }

  t[0] = "El libro comienza con un piloto que, tras un accidente, queda varado en el desierto del Sahara. Allí conoce a un niño pequeño y muy especial: el Principito. Este niño no es común, viene de otro planeta y tiene una visión muy pura y diferente del mundo. El encuentro entre el piloto y el Principito es el punto de partida para una historia llena de enseñanzas sobre la vida, la amistad y el amor.";
  t[1] = "El Principito vive en un planeta muy pequeño llamado asteroide B-612, donde cuida una rosa que es muy importante para él. Para conocer más sobre la vida, decide viajar a otros planetas. En cada uno encuentra personajes que representan diferentes tipos de adultos: un rey que quiere mandar sobre todo, un vanidoso que solo busca admiración, un bebedor que bebe para olvidar, un hombre de negocios obsesionado con contar estrellas, un farolero que sigue órdenes sin sentido, y un geógrafo que nunca explora.";
  t[2] = "La rosa del Principito es especial, pero también es frágil y orgullosa. Al principio, el Principito no entiende bien su relación con ella, pero con el tiempo aprende que amar a alguien significa cuidarlo y ser responsable. La rosa simboliza el amor verdadero, que no es perfecto ni fácil, pero sí único y valioso. Esta parte enseña que el amor requiere paciencia, atención y compromiso.";
  t[3] = "En la Tierra, el Principito conoce a un zorro que le enseña una de las lecciones más importantes del libro: “Lo esencial es invisible a los ojos”. El zorro le explica que para conocer y amar a alguien, hay que crear lazos y dedicar tiempo. La amistad y el amor no se basan en lo superficial, sino en lo que se siente y se construye con el corazón. Esta enseñanza invita a valorar lo que no se ve, como los sentimientos y las conexiones profundas.";
  t[4] = "Al final, el Principito decide regresar a su planeta y a su rosa, dejando al piloto con una gran reflexión. El libro termina con una invitación a mirar el mundo con los ojos de un niño, a valorar la imaginación, la inocencia y lo que realmente importa en la vida. Nos recuerda que debemos cuidar nuestras relaciones y no olvidar la esencia de las cosas, que muchas veces está oculta a simple vista.";

  for (int j = 0; j < estrellas; j++) {
    x[j] = random(width);
    y[j] = random(height);
    tamB[j] = random(1, 4);
    tamO[j] = random(TWO_PI);
  }

  imgX = -200;
  imgY = 10;
  txtX = width + 50;
  txtY = 150;
}

void draw() {
  background(20, 10, 25);

  fill(255);
  noStroke();
  for (int j = 0; j < estrellas; j++) {
    float tamTam = tamB[j] * (1 + 0.6 * sin(frameCount * 0.05 + tamO[j]));
    ellipse(x[j], y[j], tamTam, tamTam);
  }

  if (estado == 0) {
    imgX = imgX + 10;
    txtX = txtX - 10;

    if (imgX > 0) {
      imgX = 0;
    }
    if (txtX < 250) {
      txtX = 250;
    }

    if (imgX == 0 && txtX == 250) {
      estado = 1;
      tiempoEstado = 0;
    }
  } else if (estado == 1) {
    tiempoEstado = tiempoEstado + 1;
    if (tiempoEstado > 180) {
      estado = 2;
    }
  } else if (estado == 2) {
    imgY = imgY + 10;
    txtY = txtY + 10;

    if (imgY > height + 100) {
      estado = 3;
    }
  } else if (estado == 3) {
    i = i + 1;
    if (i >= f.length) {
      i = 0;
    }
    imgX = -200;
    imgY = 10;
    txtX = width + 50;
    txtY = 150;
    estado = 0;
  }

  PImage img = f[i];
  if (img != null) {
    float maxW = width * 0.9;
    float maxH = height * 0.7;
    float esc = min(maxW / img.width, maxH / img.height);
    float an = img.width * esc;
    float al = img.height * esc;

    imageMode(CORNER);
    image(img, imgX, imgY, an, al);
  }

  fill(0, 0, 255, 150);
  rect(245, 145, 360, height - 160);

  fill(255);
  textSize(tam);
  textLeading(tam * 1.3);
  textAlign(LEFT, TOP);
  text(t[i], txtX, txtY, 350, height - 160);
}
