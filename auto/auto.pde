//Erzeugen der Klasse Auto. Sie beschreibt, was ein Auto ist.
class Auto {                   

  float xpos, ypos;              //Datenfelder (Eigenschaften) deklarieren
  float ytempo, xtempo;

  Auto (float x, float y, float xt, float yt) { //Konstruktor: überträgt die Parameter auf das neu erzeugte Objekt
    xpos = x;                  //Parameter werden übergeben
    ypos = y;
    xtempo = xt;
    ytempo = yt;
  }

  void fahren() {              //Methode der Klasse Auto
    xpos = xpos + xtempo;       //Tempo wird zur X-Position addiert -> Bewegung des Autos
    ypos = ypos + ytempo;       //Tempo wird zur Y-Position addiert -> Bewegung des Autos
  }
  
  void display(){
    rect((xpos-5), (ypos-5), 10, 10);   //Rechteck, um Auto darzustellen
  }

  void bremsen() {
    xtempo *= 0.95;
    ytempo *= 0.95;
  }
}
//-------------------------------------------------------------------------------------------------
//Das Hauptprogramm
Auto auto;                     //Objekte deklarieren
Auto auto2;
boolean w, s, a, d;  //Variablen der Richtungstasten deklarieren

void setup() {
  size(1200, 600);
  auto = new Auto(50, 50, 0, 0);  //neues Objekt vom Typ Auto erzeugen mit Angabe der Position und des Tempos
  frameRate(240);

   
}

void draw() {
  if (w)  auto.ytempo -= 0.6; //Wenn w zutrifft, dann yDir von y subtrahieren (nach oben bewegen)
  if (s)  auto.ytempo += 0.6; //Wenn s zutrifft, dann yDir zu y addieren (nach unten bewegen)
  if (a)  auto.xtempo -= 0.6; //Wenn a zutrifft, dann xDir von x subtrahieren (nach links bewegen)
  if (d)  auto.xtempo += 0.6; //Wenn d zutrifft, dann xDir zu x addieren (nach rechts bewegen)

  background(0);
  auto.fahren();               //dem Objekt die Klassenmethode "Fahren" zuweisen
  auto.display();              //Das Objekt anzeigen    
  auto.bremsen();

  if (auto.xpos > width-10)  { 
    auto.xpos = width-10;  
    auto.xtempo *= -1; 
  }

  if (auto.xpos < 10)         { 
    auto.xpos = 10;         
    auto.xtempo *= -1; 
  }

  if (auto.ypos > height-10) { 
    auto.ypos = height-10;  
    auto.ytempo *= -1; 
  }

  if (auto.ypos < 10)         { 
    auto.ypos = 10;         
    auto.ytempo *= -1; 
  }
}

void keyPressed() {
  if (keyCode == 'W') w = true;
  else if (keyCode == 'S')  s = true;
  else if (keyCode == 'A')  a  = true;
  else if (keyCode == 'D')  d  = true;
}
 
void keyReleased() {
  if (keyCode == 'W')   w = false;
  else if (keyCode == 'S')   s = false;
  else if (keyCode == 'A')   a  = false;
  else if (keyCode == 'D')   d  = false;
}
