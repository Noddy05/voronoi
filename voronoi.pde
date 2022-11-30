
final int nPoints = 25;


PVector[] points = new PVector[nPoints];
PVector[] directions = new PVector[nPoints];
color[] colors = new color[nPoints];

float minX;
float maxX;
float minY;
float maxY;

//Modes:
enum Modes {
  Bounce,
    Modulus,
}
Modes mode = Modes.Bounce;

void setup() {
  size(800, 800);
  float offScreen = 5;
  minX = -width / offScreen;
  maxX = width * (1 + 1 / offScreen);
  minY = -height / offScreen;
  maxY = height * (1 + 1 / offScreen);
  
  setupPoints();
}

void setupPoints(){
  for (int i = 0; i < nPoints; i++) {
    colors[i] = color(random(50, 255), random(50, 255), random(50, 255));
    points[i] = new PVector(random(minX, maxX), random(minY, maxY));
    float radian = random(0, 2 * PI);
    float speed = random(1, 5);
    directions[i] = new PVector(cos(radian), sin(radian)).mult(speed);
  }
}

void draw() {
  background(30);

  drawPixels();
  
  noStroke();
  fill(240);
  for (int i = 0; i < nPoints; i++) {
    if (mode == Modes.Bounce)
      modeBounce(i);
    else if (mode == Modes.Modulus)
      modeModulus(i);
    
    //Uncomment if you want to draw voronoi origin
    //circle(points[i].x, points[i].y, 5);
  }
}

void modeModulus(int i){
  points[i].x += 50;
  points[i].y += 13;
  if (points[i].x > maxX)
    points[i].x = minX;
  if (points[i].x < minX)
    points[i].x = maxX;

  if (points[i].y > maxY)
    points[i].y = minY;
  if (points[i].y < minY)
    points[i].y = maxY;
}

void modeBounce(int i){
  points[i].add(directions[i]);
  if (points[i].x > maxX || points[i].x < minX)
    directions[i].x *= -1;
  if (points[i].y > maxY || points[i].y < minY)
    directions[i].y *= -1;
}

void drawPixels(){
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int minI = calculateClosestIndex();

      //color pixelColor = waterColor(minI, x, y);
      color pixelColor = uniqueColor(minI);
      //color pixelColor = distanceColor(minI, x, y, 50);

      //pixelColor = waterColor(minI, x, y);
      set(x, y, pixelColor);
    }
  }
}

int calculateClosestIndex(){
  int minI = 0;
  float minDistance = squareDist(x, y, points[0].x, points[0].y);
  for (int i = 1; i < nPoints; i++) {
    float distance = squareDist(x, y, points[i].x, points[i].y);
    if (distance < minDistance)
    {
      minDistance = distance;
      minI = i;
    }
  }
  return minI;
}

PVector rippleColor = new PVector(150, 190, 255);
float strength = 2;
PVector baseColor = new PVector(0, 0, 150);
color waterColor(int minI, int x, int y) {
  float distanceColor = squareDist(x, y, points[minI].x, points[minI].y) / 900;
  return  color(
    distanceColor / 255 * rippleColor.x * strength + baseColor.x,
    distanceColor / 255 * rippleColor.y * strength + baseColor.y,
    distanceColor / 255 * rippleColor.z * strength + baseColor.z);
}

color uniqueColor(int minI) {
  return colors[minI];
}

color distanceColor(int minI, int x, int y, int divider) {
  return color(squareDist(x, y, points[minI].x, points[minI].y) / divider);
}

float squareDist(float ax, float ay, float bx, float by) {
  return (ax - bx) * (ax - bx) + (ay - by) * (ay - by);
}
