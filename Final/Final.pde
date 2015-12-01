/*Overall Plans and Description:
Intro:
Storyline will begin with Waddles and Family on a larger iceberg and narration will begin
telling a story. 
  -Penguins are called from the same model and the parts should animate to make intro animation more realistic
      -Thoughts: eyes will be happy at first but when iceberg breaks eyebrows will 
      have distraught expression
      -arms will also flap 
/*Penguin Model
This model is a static model used for the beginning game animation
 It will be simply display a scene where Waddles, the main character is lost and needs help
 1)Will be rendered with basic shapes
 2)If need be animations can be added. 
 3)Make arms, beak, and eyes all different entities for possible animation
 4)eyes can move to follow mouse. 
 5)arms could flap on click 
 */
color[] iceC = new color[3];
int[] colorStore = new int[640000];
int[] crackStore = new int[22];
float gap=0;
float prev =0;
int endCrack=0;
int crackTime=0;
float zoom=1;
float textEnter =1;
String prevMsg ="";
PSys fire[] = new PSys[30];
void setup () {
  size(800, 800);
  iceC[0] = color(#DEF4F9);
  iceC[1] = color(#ECFBFE);
  iceC[2] = color(#F5FFFF);
  
  for (int i = 0; i < 640000; i++) {
    colorStore[i]=(int)random(0,3);
  }
  for(int i=0; i<21;i++)
  {
    crackStore[i]=(int)random(375,425);
  }
  colorMode(RGB, 255, 255, 255, 100);
  //start a new particle system
  smooth();
  
}

void draw () {
  if (millis()<52000)
  {
    strokeWeight(3);
    pushMatrix();
    scale(zoom);
    pushMatrix();
    if(gap>80)
      translate(0,(gap-80)*-1);
    stroke(79,147,160);
    drawIceBG();
    if(millis()>10000)
      scene2();
    pushMatrix();
    scale(0.9);
    stroke(#000000);
    translate(30, 0);
    drawPenguin();
    popMatrix();
    pushMatrix();
    scale(0.8);
    translate(490, 50);
    drawPenguin();
    popMatrix();
    popMatrix();
    pushMatrix();
    if(gap<=80)
      translate(0,gap);
    else
    {
      translate(0,80);
    }
    pushMatrix();
    scale(0.6);
    translate(442, 600);
    drawPenguin();
    popMatrix();
    drawEnd();
    popMatrix();
    popMatrix();
    textControl();
  }
  else
    game();
}
void textControl()
{
  if(millis()<8000)
    drawTextBox("One afternoon, Waddles is spending time with his family on an iceberg.");
  else if(millis()>=8000 && millis()<17000)
    drawTextBox("Suddenly, he hears a loud CRACK!");
  else if(millis()>=17000 && millis()<23000)
    drawTextBox("Oh no! The iceberg is breaking!");
  else if(millis()>=23000 && millis()<29000)
    drawTextBox("Waddles watches helplessly as his family floats away :(");
  else if(millis()>=29000 && millis()<36000)
    drawTextBox("He would chase them, but he's not a very good swimmer.");
  else if(millis()>=36000 && millis()<45000)
    drawTextBox("The iceberg moved very fast, and now Waddles is far away from home.");
  else if(millis()>=45000 && millis()<52000)
    drawTextBox("Waddles needs your help to get back to his family!");
}
void game()
{
  background(41,72,204);
  pushMatrix();
  translate(10,0);
  scale(0.3);
  rotate(90);
  drawPenguin();
  popMatrix();
}
void scene2()
{
  drawCrack();
  if(endCrack!=840 && millis()-prev>crackTime)
  {
    endCrack+=40;
    fire[endCrack/40] = new PSys((int)random(5,35), new PVector(500, crackStore[endCrack/40], 0));
    fire[endCrack/40].setLoc(new PVector(endCrack, crackStore[endCrack/40],0));
      
    prev =millis();
    crackTime= (int)random(150,450);
  }
  else if(endCrack==840 && gap<600){
    gap+=random(0.3,0.8);
  }
  for(int i =1; i<endCrack/40;i++)
    fire[i].run();
  if(gap!=0)
    newCrack();
}
void drawCrack()
{
  endShape(CLOSE);
   if(gap==0)
     noFill();
   else
     fill(41,72,204);
  beginShape();
  for(int i=0; i<endCrack;i+=40)
  {
      vertex(i, crackStore[i/40]+gap);
  }
  for(int i=endCrack-40; i>=0;i-=40)
  {
      vertex(i, crackStore[i/40]);
  }
  endShape(CLOSE);
}
void newCrack()
{
  if(gap<50)
  {
  fill(142,201,220);
  beginShape();
  for(int i=0; i<820;i+=40)
  {
    vertex(i, crackStore[i/40]+gap);
  }
  for(int i=800; i>=0;i-=40)
  {
    vertex(i, crackStore[i/40]);
  }
  endShape();
  }
  else
  {
    fill(142,201,220);
  beginShape();
  for(int i=0; i<820;i+=40)
  {
    vertex(i, crackStore[i/40]+50);
  }
  for(int i=800; i>=0;i-=40)
  {
    vertex(i, crackStore[i/40]);
  }
  endShape();
  }
  
}
void drawEnd()
{ stroke(79,147,160);
  fill(41,72,204);
  beginShape();
    vertex(0,650);
    vertex(90,720);
    vertex(200,680);
    vertex(230,700);
    vertex(290,640);
    vertex(400,700);
    vertex(510,700);
    vertex(550,630);
    vertex(610,610);
    vertex(700,650);
    vertex(720,670);
    vertex(740,660);
    vertex(760,690);
    vertex(800,650);
    vertex(800,800);
    vertex(0,800);
  endShape(CLOSE);
  fill(142,201,220);
  beginShape();
    vertex(0,650);
    vertex(90,720);
    vertex(200,680);
    vertex(230,700);
    vertex(290,640);
    vertex(400,700);
    vertex(510,700);
    vertex(550,630);
    vertex(610,610);
    vertex(700,650);
    vertex(720,670);
    vertex(740,660);
    vertex(760,690);
    vertex(800,650);
    vertex(800,600);
    vertex(760,640);
    vertex(740,610);
    vertex(720,620);
    vertex(700,600);
    vertex(610,560);
    vertex(550,580);
    vertex(510,650);
    vertex(400,650);
    vertex(290,590);
    vertex(230,650);
    vertex(200,630);
    vertex(90,670);
    vertex(0,600);
  endShape(CLOSE);
}

void drawIceBG()
{
  loadPixels();
  for (int i = 0; i < 640000; i++) {
    pixels[i] = iceC[colorStore[i]];
  }
  updatePixels();
}

void drawPenguin()
{
  //left flipper
  pushMatrix();
  fill(250, 173, 39);
  translate(155, 345);
  rotate(5*PI/6);
  translate(-160, -345);
  ellipse(160, 345, 90, 30);
  popMatrix();
  //right flipper
  pushMatrix();
  fill(250, 173, 39);
  translate(245, 345);
  rotate(PI/6);
  translate(-240, -345);
  ellipse(240, 345, 90, 30);
  popMatrix();
  //body head and white stomach
  pushMatrix();
  noStroke();
  translate(200, 200);
  fill(0);
  ellipse(0, 25, 210, 280);
  ellipse(0, -20, 175, 250);
  stroke(1);
  fill(255);
  ellipse(0, 55, 125, 180);
  popMatrix();
//eye R
pushMatrix();
noStroke();
translate(225, 115);
ellipse(0, 0, 50, 50);
fill(0);
ellipse(0, 0, 40, 40);
fill(255);
ellipse(-6, -6, 12, 12);
popMatrix();
//eyeL
pushMatrix();
translate (175, 115);
fill(255);
ellipse(0, 0, 50, 50);
fill(0);
ellipse(0, 0, 40, 40);
fill(255);
ellipse(-6, -6, 12, 12);
popMatrix();
    
//Beak
pushMatrix();
stroke(1);
fill(253, 141, 25);
triangle(182, 150, 200, 135, 218, 150);
triangle(185, 150, 200, 165, 215, 150);
popMatrix();

//Arm L
pushMatrix();
translate(105, 240);
fill(0);
ellipse(0, 0, 50, 150);
popMatrix();
//Arm R
pushMatrix();
translate(295, 240);
fill(0);
ellipse(0, 0, 50, 150);
popMatrix();

//eyebrow L
pushMatrix();
fill(255);
translate(160, 80);
rect(0, 0, 25, 5);
popMatrix();
//eyebrow R
pushMatrix();
fill(255);
translate(240, 80);
rect(0, 0, -25, 5);
popMatrix();
}

void mousePressed() {
println("Z" + " " + mouseX + " " +  "Q" + " " + mouseY);
}

class Particle {
  
  PVector loc;
  PVector vel;
  PVector accel;
  float r;
  float life;
  
  //constructor
  Particle(PVector start) {
    accel = new PVector(0, 0.05, 0); //gravity
    vel = new PVector(random(-2, 2), random(-6, 0), 0);
    loc = start.get();
    r = 2.0;
    life = random(10,20);
  }
  void run() {
    updateP();
    renderP();
  }
  
  //a function to update the particle each frame
  void updateP() {
    vel.add(accel);
    loc.add(vel);
    life -= 1.0;
  }
  
  //how to draw a particle
  void renderP() {
    pushMatrix();
      ellipseMode(CENTER);
      fill(79,147,160);
      translate(loc.x, loc.y);
      ellipse(0, 0, r, r);
    popMatrix();
  }
  
  //a function to test if a particle is alive
  boolean alive() {
    if (life <= 0.0) {
      return false;
    } else {
      return true;
    }
  }
} //end of particle object definition


//now define a group of particles as a particleSys
class PSys{
  
  ArrayList particles; //all the particles
  PVector source; //where all the particles emit from
  PVector shade; //their main color
  int n;
  //constructor
  PSys(int num, PVector init_loc) {
    particles = new ArrayList();
    source = init_loc;
    n=num;
    shade = new PVector(random(255), random(255), random(255));
  }
    void setLoc(PVector init_loc)
    {
      source = init_loc;
      for (int i=0; i < n; i++) {
        particles.add(new Particle(source));
      }
    }
    //what to do each frame
    void run() {
      //go through backwards for deletes
      for (int i=particles.size()-1; i >=0; i--) {
        Particle p = (Particle) particles.get(i);
        //update each particle per frame
        p.run();
        if ( !p.alive()) {
          particles.remove(i);
        }
      }
    }
    
    //is particle system still populated?
    boolean dead() {
        if (particles.isEmpty() ) {
          return true;
        } else {
          return false;
        }
    }
}
void drawTextBox(String msg)
{
  if(!prevMsg.equals(msg))
    textEnter=1;
  strokeWeight(5);
  stroke(199,168,75);
  fill(40,80,105);
  rect(150,710,500,80);
  fill(255,255,255);
  textAlign(CENTER, CENTER);
  textSize(20);
  try{
  for(int i=0; i<textEnter; i++)
  {
    text(msg.substring(0,(int)textEnter), 160, 705,480,80);
  }
  }
  catch (Exception e)
  {
    text(msg.substring(0,(int)msg.length()), 160, 705,480,80);
  }
  if(textEnter<msg.length())
    textEnter+=0.3;
  prevMsg = msg;
}