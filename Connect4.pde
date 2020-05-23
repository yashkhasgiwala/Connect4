int a=0,b=0,c=0,d=0;
boolean abc=true,xyz=true,pqr=true,red=false,yellow=false;
float[][] data = new float[10][10];

void setup(){
  
  for(int i=0;i<10;i++)
  for(int j=0;j<10;j++)
  data[i][j]=random(-10,10);
  
  for(int i=0;i<7;i++){
    print("\n");
    for(int j=0;j<7;j++){
    print(data[i][j]);
    print("\t\t");
    }
  }
  
print("\n\n");

size(1927, 1080);
background(0,0,255);
board();

}

void board(){
  for(int i=0;i<=6;i++)
  {
    a+=120;
    if(abc)
      {c=180;abc=false;}
    else
      c+=120;
    b=0;
    d=0;
    xyz=true;
    for(int j=0;j<=6;j++)
      {
   if(xyz){
     d+=180;xyz=false;}
     else
       d+=120;
     b+=120;
     fill(0,0,255);
     stroke(0,0,255);
    rect(a,b,120,120);
    fill(0);
    stroke(0,0,255);
    circle(c,d,120);
    //fill(255,0,0);
    //text(str(a)+" "+str(b),c,d);
    //fill(0,255,0);
    //text(str(c)+" "+str(d),c,d+10);
  }
}
  
}


void draw()
{
  check();
  
  if(red){
    fill(255,0,0);
    textSize(100);
  text("RED WINS!",1170,500);}
  
  if(yellow){
    fill(255,255,0);
    textSize(100);
 text("YELLOW WINS!",1100,500);}

}

void check(){
  int r,c;
// Horizontal  
  for(r=0;r<7;r++)
  for(c=0;c<7;c++)
  if(data[r][c]==data[r][c+1] && data[r][c]==data[r][c+2] && data[r][c]==data[r][c+3])
    if(data[r][c]==1)
      red=true;
    else
      yellow=true;

// Vertical
   for(r=0;r<7;r++)
   for(c=0;c<7;c++)
   if(data[r][c]==data[r+1][c] && data[r][c]==data[r+2][c] && data[r][c]==data[r+3][c])
    if(data[r][c]==1)
      red=true;
    else
     yellow=true;

// Positive slope Diagonal
   for(r=0;r<7;r++)
   for(c=0;c<7;c++)
   if(data[r][c]==data[r+1][c+1] && data[r][c]==data[r+2][c+2] && data[r][c]==data[r+3][c+3])
    if(data[r][c]==1)
     red=true;
    else
      yellow=true;

// Negatively Sloped Diagonal
    for(r=3;r<7;r++)
   for(c=0;c<7;c++)
   if(data[r][c]==data[r-1][c+1] && data[r][c]==data[r-2][c+2] && data[r][c]==data[r-3][c+3])
    if(data[r][c]==1)
      red=true;
    else
     yellow=true;
}

void mousePressed(){
  int a=0,b=0;
  int x=0,y=0;

    while(x<=840 && y<=840){
    if(mouseX >= 120+x && mouseX <= 240+x && 
    mouseY >= 120+y && mouseY <= 240+y){
     if(data[a][b]==1)
     fill(255,0,0);
    
     else if(data[a][b]==2)
     fill(255,255,0);
     
     else{
   
       if(pqr){
    data[a][b]=1;
   for(int i=0;i<7;i++){
    print("\n");
   for(int j=0;j<7;j++){
    print(data[i][j]);
    print("\t\t");}}
    print("\n\n");
     fill(255,0,0);pqr=false;}
   
     else{
      data[a][b]=2;
     for(int i=0;i<7;i++){
    print("\n");
    for(int j=0;j<7;j++){
    print(data[i][j]);
    print("\t\t");}}
    print("\n\n");
    fill(255,255,0);pqr=true;}
    
     }
     
     circle(180+x,180+y,120);
     
    }
    
    b++;
    x+=120;
    if(x==840){
      x=0;
     a++;
     b=0;
      y+=120;
      }
   }
}
