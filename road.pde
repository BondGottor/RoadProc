class svetofor extends character{
  boolean red=true;
  svetofor(character front,float x, float speed, float boost){
    super(front,x,speed,boost);}
  @Override
  void display(){
    pushMatrix();
    translate(startX, startY+20);
    if (frameCount%1000>500){
     red=true;
    fill(0,255,0);}
    else{
      red=false;
      fill(255,0,0);}
     if (back.x>x-hoshi){
      back.slow=0+int(red)*100;
  }
    if (back.x>x){
      back.slow=100;
      back=back.back;
  }
    rect(x, 0, 10, 10);
    popMatrix();
  }
}
class perehod extends character{
  float ly=0;
  perehod(character front,float x, float speed, float boost){
    super(front,x,speed,boost);}
  @Override
  void display(){
    fill(255);
    pushMatrix();
    translate(startX, startY+20);
     if (back.x>x-hoshi){
      back.slow=mspeed/2;
  }
    if (back.x>x){
      back.slow=100;
      back=back.back;
  }
    rect(x, -40, 10, 2);
    rect(x, -30, 10, 2);
    rect(x, -10, 10, 2);
    rect(x, 0, 10, 2);
    popMatrix();
  }
}
class secroad extends character{
  boolean stp=true;
  float ly=0;
  secroad(character front,float x, float speed, float boost){
    super(front,x,speed,boost);}
  @Override
  void display(){
    fill(255);
    pushMatrix();
    translate(startX, startY+20);
        if (back.x>x){
      stp=true;
      back.slow=100;
      back=back.back;
  }
     if (back.x>x-hoshi){
      stp=false;
      back.slow=mspeed/2;
  }
  if (stp || ly!=-60){
    ly=ly+1;
  if (ly==100){ly=-200;}}
  
    rect(x-20, ly, 10, 10);
    popMatrix();
  }
}
class mainroad extends character{
  boolean red=true;
  mainroad(character front,float x, float speed, float boost){
    super(front,x,speed,boost);}
  @Override
  void display(){
    fill(255);
    pushMatrix();
    translate(startX, startY+20);
    if (frameCount%400>200){
     red=true;}
    else{
      rect(x,((frameCount%400)-100)/2, 10, 10);
      red=false;}
     if (back.x>x-hoshi){
      back.slow=0+int(red)*100;
  }
    if (back.x>x){
      back.slow=100;
      back=back.back;
  }
    popMatrix();
  }
}
class finish extends character{
  finish(character front,float x, float speed, float boost){
    super(front,x,speed,boost);}
  @Override
  void display(){
    pushMatrix();
    translate(startX, startY+20);
    xs.add(x);
    speeds.add(speed);
    boosts.add(boost);
    popMatrix();
  }
}
