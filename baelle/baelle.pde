// Basisbeispiel Ball 
// zum Thema Klassen und Objekte
// AW 7.6.2007
Ball[] baelle;
int ballzahl = 10;

void setup() {
        // display settings
	size(400,400);
    background(10);
    fill(200,200,0);
    noStroke();
    smooth();

    baelle = new Ball[ballzahl];

        // erzeuge neuen Ball an Position 100,100 mit Zufallstempo
    for (int i = 0; i < ballzahl; i++) {
        baelle[i] = new Ball(100, 100, random(-1,1), random(-1,1));
    }
    
}

void draw() {
  background(10);  
    for (int i = 0; i < ballzahl; i++) {
        baelle[i].bounce(); 
    }

}
//---------------------------------------------------------
class Ball { // was ist ein Ball
float xtempo; // Datenfelder
float ytempo;  
float xpos;
float ypos;

	Ball(float x,  float y, float xt, float yt) { 
        // Konstruktor, überträgt die Parameter auf das neu erzeugte Objekt
		xpos=x;
                ypos=y;
		xtempo=xt;
		ytempo=yt;
	}
 	
        void bounce() { // Methode der Klasse Ball
  	        xpos=xpos+xtempo;
            ypos=ypos+ytempo;
 
          if ((xpos>width) || (xpos<0)) { xtempo=-1*xtempo; }
          if ((ypos>height) || (ypos<0)) { ytempo=-1*ytempo; }   
               
  	  render();
 	} // ende Bounce
 
        void render() { // Ball anzeigen
           ellipse(xpos, ypos, 40, 40); 
        }
}// Ende Ball