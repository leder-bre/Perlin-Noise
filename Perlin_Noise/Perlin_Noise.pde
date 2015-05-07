float xMove = 0;
float yMove = 0;
float noiseScale=0.01;
float scaleNoise=0.01;
int rot = 0;
int r;
int g;
int b;
int rflip=1;
int gflip=1;
int bflip=1;
boolean circle = false;

void setup() {
  size(1280, 800);
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
}

void draw() {

  if (r > 255) {
    r = 255;
    rflip = -1;
  } else if (r < 0) {
    r = 0;  
    rflip = 1;
  }

  r += rflip;

  if (g > 255) {
    g = 255;
    gflip = -1;
  } else if (g < 0) {
    g = 0;  
    gflip = 1;
  }

  g += gflip;

  if (b > 255) {
    b = 255;
    bflip = -1;
  } else if (b < 0) {
    b = 0;  
    bflip = 1;
  }

  b += bflip;

  background(255);

  pushMatrix();

  xMove += 1;
  yMove += 1;
  rot = 0;
  
  for (int x=0; x < height; x++) {
    float valNoise = noise((500+x)*scaleNoise, yMove*scaleNoise);
    pushMatrix();
    if (circle == false) {
      stroke(valNoise/1*r, valNoise/1*g, valNoise/1*b, 127);
      translate(width/2.00, 0);
    } else {
      stroke(valNoise/1*r, valNoise/1*g, valNoise/1*b);
      translate(width/2, height/2);
      rotate(rot);
    }
    line(valNoise*-1*width/2 + mouseX - width/4, x, 0, x);
    popMatrix();
    rot += 1;
  }
  
  rot = 0;
  xMove += 1;
  
  for (int x=0; x < width; x++) {
    float noiseVal = noise((500+x)*noiseScale, xMove*noiseScale);
    pushMatrix();
    if (circle == false) {
      stroke(255-noiseVal/1*r, 255-noiseVal/1*g, 255-noiseVal/1*b, 127);
      translate(width, height/2);
      rotate(PI/2);
    } else {
      stroke(255-noiseVal/1*r, 255-noiseVal/1*g, 255-noiseVal/1*b);
      translate(width/2, height/2);
      rotate(rot);
    }
    line(noiseVal*-1*height/2 - height/4 + mouseY, x, 0, x);
    popMatrix();
    rot += 1;
  }

  popMatrix();
}

void mouseReleased() {
  if (circle == false) {
    circle =  true;
  } else {
    circle = false;
  }
}
