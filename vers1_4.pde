import java.util.Collections;
import java.awt.Toolkit;
PGraphics staticLayer;
float mspeed = 10;        // Скорость движения
float mboost = 0.1;
float startX = 40;
float startY = 200;
float endX = 1800;
float endY = 200;
float dist= 20;
float hoshi=(mspeed*mspeed/(2*mboost))+dist+5;
int n=1;
String[] menuItems = {"Новая игра", "Настройки", "Выход"};
int selectedItem = 0;
int menu=0;
boolean svetit = false;
int reaction=0;
ToggleButton[] buttonss=new ToggleButton[4];
boolean[] svetis=new boolean[4];
float[] coordin=new float[4];
setline[] buttons=new setline[9];
color[] colorValues = {
  color(255, 0, 0),      // Красный
  color(255, 165, 0),    // Оранжевый
  color(255, 255, 0),    // Желтый
  color(0, 255, 0),      // Зеленый
  color(0, 255, 255),    // Голубой
  color(0, 0, 255),      // Синий
  color(128, 0, 128),    // Фиолетовый
  color(255, 192, 203),
  color(255, 0, 0),      // Красный
  color(255, 165, 0),    // Оранжевый
  color(255, 255, 0),    // Желтый
  color(0, 255, 0),      // Зеленый
  color(0, 255, 255),    // Голубой
  color(0, 0, 255),      // Синий
  color(128, 0, 128),    // Фиолетовый
  color(255, 192, 203)  // Розовый
};
character[] characters = new character[n];
character[] road = new character[4];
character fin;
character start;
void setup() {
  size(1920,1080,P3D);
  surface.setLocation(0, 0);
  newset();
  //fullScreen(P3D);
  //smooth(8);
  //rectMode(CENTER);
  //noStroke();
 //newgame();
}


void draw() {
  background(0);
  if (menu==0){
      background(200);
  
  // Отображаем пункты меню
  for (int i = 0; i < menuItems.length; i++) {
    if (i == selectedItem) {
      fill(255, 0, 0); // Красный для выбранного пункта
    } else {
      fill(0); // Черный для остальных
    }
    
    float y = height/2 - 30 + i * 40;
    text(menuItems[i], width/2, y);
  }
  }
  if (menu==1){
  fill(0, 255, 0);
  rect(startX, startY, 10, 40);
  fill(255);
  text("START", startX-15, startY-30);
  fill(255, 0, 0);
  rect(endX, endY, 10, 40);
  fill(255);
  text("END", endX-10, endY-30);
   strokeWeight(2);
  stroke(255);
  line(startX, startY, endX, endY);    
  strokeWeight(0);
  lines(100,300);
  lines(750,300);
  lines(1400,300);
  fin.display();
  for (int i = 0; i < 4; i++) {
  if (svetis[i]){road[i].display();}}
  for (int i = 0; i < n; i++) {
    characters[i].display();
    grafs(100,300,characters[i].xs,colorValues[i],2000);
    grafs(750,300,characters[i].speeds,colorValues[i],mspeed);
    grafs(1400,300,characters[i].boosts,colorValues[i],mboost);
}}
if (menu==2){
background(240);
  for (int i = 0; i < 9; i++) {buttons[i].display();}
for (int i = 0; i < 4; i++) {buttonss[i].display();}}
}
void lines(float Xstart,float Ystart){
  pushMatrix();
  translate(Xstart, Ystart);
  stroke(255);
  float width1=500;
  float height1=300;
  strokeWeight(2);
  line(0, height1, width1, height1);
  line(0, 0, 0, height1);
  line(0, height1, 0, 2*height1);
  // Значения на оси Y
  fill(255);
  textAlign(RIGHT, CENTER);
  
  // Количество делений на оси Y
  int numTicks = 10;
  
  for (int i = 0; i <= numTicks; i++) {
    // Вычисляем позицию по Y
    float y = map(i, 0, numTicks, 2*height1, 0);
    
    // Вычисляем значение (можно изменить в соответствии с вашими данными)
    float value = map(i, 0, numTicks, -100, 100);
    
    // Рисуем маленькую метку на оси
    stroke(150);
    strokeWeight(1);
    line(-5, y, 0, y);
    
    // Добавляем текст значения
    fill(255);
    text(nf(value, 0, 1) + "%", -10, y);
  }
  popMatrix();
}
void grafs(float Xstart,float Ystart,ArrayList<Float> dataPoint, color clr,float max){
  pushMatrix();
  strokeWeight(2);
  stroke(clr);
  noFill();
  float height1=300;
  float width1=500;
  float xStep = width1/(dataPoint.size()+0.1);
  float yStep = height1/(max);
  translate(Xstart, Ystart);
  beginShape();
  for (int i = 0; i < dataPoint.size(); i++) {
    float x = xStep * (i + 1);
    float y = height1-dataPoint.get(i)*yStep;
    vertex(x, y);
  }
  endShape();
popMatrix();
strokeWeight(0);}
void keyPressed() {
  if (key == 'r') {
    newgame();
    menu=1;
  }
    if (key == 's') {
       menu=2;
     //newset();
  }
  if (key == ' ') {
    if (looping) { // looping — встроенная переменная Processing
    noLoop(); // Останавливаем анимацию
  } else {
    loop();  // Запускаем снова
  }
  }
    if (keyCode == UP) {
    selectedItem = max(0, selectedItem - 1);
  } else if (keyCode == DOWN) {
    selectedItem = min(menuItems.length - 1, selectedItem + 1);
  } else if (keyCode == ENTER) {
    selectMenuItem(selectedItem);
  }
}
void newgame() {
  start= new finish(null,0,0,0);
  fin= new finish(null,endX-startX+dist,0,0);
    characters = new character[n];
    characters[0]=new character(fin,0,0,0);
   for (int i = 0; i < 4; i++) {
  if (svetis[i]){if (i==0){road[i]= new mainroad(null,coordin[i],0,0);}
  if (i==1){road[1]= new svetofor(null,coordin[i],0,0);}
  if (i==2){road[2]= new perehod(null,coordin[i],0,0);}
  if (i==3){road[3]= new secroad(null,coordin[i],0,0);}
  road[i].back=characters[0];}}
    fin.back=characters[0];
    for (int i = 1; i < n; i++) {
    characters[i] = new character(characters[i-1]);
    characters[i-1].back=characters[i];}
    characters[n-1].back=start;
    hoshi=((mspeed*mspeed)/(2*mboost))+dist+10;
}
void newset() {
      buttons[0]=new setline(200,100,"MSpeed",1,30);
      buttons[1]=new setline(200,200,"Mboost",0.007,1);
      buttons[2]=new setline(200,300,"N",1,16);
      buttons[3]=new setline(200,400,"dist",0,100);
      buttons[4]=new setline(200,500,"reflection",0,200);
      buttons[5]=new setline(1300,200,"coordinata",100,1700);
      buttons[6]=new setline(1300,300,"coordinata",100,1700);
      buttons[7]=new setline(1300,400,"coordinata",100,1700);
      buttons[8]=new setline(1300,500,"coordinata",100,1700);
      buttonss[0]=new ToggleButton(1000, 200, false, "mainroad");
      buttonss[1]=new ToggleButton(1000, 300, false, "svetofor");
      buttonss[2]=new ToggleButton(1000, 400, false, "perehod");
      buttonss[3]=new ToggleButton(1000, 500, false, "secroad");
      
}
void selectMenuItem(int index) {
  //String sketchPath = sketchPath("C:/Users/роб/Documents/Processing/sketch_260211b");
  switch(index) {
    case 0:
      //Runtime.getRuntime().exec(sketchPath);
      newgame();
      menu=1;
      break;
    case 1:
     menu=2;
      break;
    case 2:
      exit();
      break;
  }
}
void mousePressed() {
  if(menu==2){
  for (int i = 0; i < 9; i++) {buttons[i].mousePressed();}
  for (int i = 0; i < 4; i++) {buttonss[i].mousePressed();}}
}
void mouseReleased() {
  if(menu==2){
  for (int i = 0; i < 9; i++) {buttons[i].mouseReleased();}
  for (int i = 0; i < 4; i++) {buttonss[i].mouseReleased();}
   mspeed=buttons[0].currentVal;
      mboost=buttons[1].currentVal;
      n=int(buttons[2].currentVal);
      dist=buttons[3].currentVal;
      reaction=int(buttons[4].currentVal);
      for (int i = 0; i < 4; i++){svetis[i]=buttonss[i].state;
    coordin[i]=buttons[i+5].currentVal;}
  }
}
