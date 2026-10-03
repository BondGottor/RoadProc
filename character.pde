class character {
  character front;
  character back;
  int currentTime;
  float t;
  int lastTime=frameCount;
  float lspeed;
  float lx=0;
  float d=0;
  float frontx;
  float frontspeed;
  float frontboost;
  float slow=100;
  
    float x, speed,boost;
    ArrayList<Float> xs = new ArrayList<Float>();
    ArrayList<Float> speeds = new ArrayList<Float>();
    ArrayList<Float> boosts = new ArrayList<Float>();
    ArrayList<Float> bosts = new ArrayList<Float>();
    character(character front) {
        this(front,0,0,0);
    }
    character(character front,float x, float speed, float boost) {
      this.front=front;
        this.x = x;
        this.speed = speed;
        this.boost = boost;
    }
     void display() {
    if (front.xs.size() > reaction) {
    frontx= front.xs.get(front.xs.size() - reaction-1);
    frontboost= front.boosts.get(front.boosts.size() - reaction-1);
    frontspeed= front.speeds.get(front.speeds.size() - reaction-1);}
    currentTime = frameCount;
    t = ((currentTime - lastTime));
    pushMatrix();
    translate(startX, startY);
    if(frontx-x>hoshi ){
      boost=mboost;}
    else{
    d=((frontspeed*frontspeed)/((2*mboost))+frontx-dist-x);
    boost=max(min(mboost,max((frontspeed-speed),(speed*speed)/(-2*d))),-mboost);}
    if (slow!=100){
    d=((frontspeed*frontspeed)/((2*mboost))+frontx-dist-x);
    boost=max(min(mboost,min(((slow/2)-speed),(speed*speed)/(-2*d))),-mboost);}
    speed=max(min(speed+boost,mspeed),0);
    x=max(min(x+speed,frontx-dist),0);
    speed=x-lx;
    boost=speed-lspeed;
    lspeed=speed;  
    lx=x;
    xs.add(x);
    speeds.add(speed);
    boosts.add(boost);
    fill(255);
    rect(x, 0, 10, 10);
    popMatrix();
    lastTime = currentTime;  
    }}
