int[][] cell1;
int[][] cell2;
int sum = 0;
void setup(){
  background(255);
  size(735,835);
  fill(0);
  cell1 = new int [35][35];
  cell2 = new int [35][35];
  for (int q = 0 ; q < 35 ; q++){
    for (int p = 0 ; p < 35 ; p++){
      cell2[q][p] = 0;
      fill(255);
      rect(q*21,p*21,21,21);
    }
  }
  for (int q = 1 ; q < 34 ; q++){
    for (int p = 1 ; p < 34 ; p++){
      cell2[q][p] = floor(random(0,2));
      if (cell2[q][p] == 0){
        fill(255);
        rect(q*21,p*21,21,21);
      }
      if (cell2[q][p] == 1){
        fill(0);
        rect(q*21,p*21,21,21);
      }
    }
  }
  frameRate(20);
}
void draw(){
  textSize(64);
  fill(255);
  rect(0,736,735,128);
  fill(0);
  text(sum,0,790);
  for (int q = 1 ; q < 34 ; q++){
    for (int p = 1 ; p < 34 ; p++){
      cell1[q][p] = cell2[q][p];
    }
  }
  for (int q = 1 ; q < 34 ; q++){
    for (int p = 1 ; p < 34 ; p++){
      int w = cell1[q-1][p-1]+cell1[q-1][p]+cell1[q-1][p+1]+cell1[q][p-1]+cell1[q][p+1]+cell1[q+1][p-1]+cell1[q+1][p]+cell1[q+1][p+1];
      if (cell1[q][p] == 1 && (w < 2 || w > 3)){
        cell2[q][p] = 0;
        fill(255);
        rect(q*21,p*21,21,21);
      }
      if (cell1[q][p] == 0 && w == 3){
        cell2[q][p] = 1;
        fill(0);
        rect(q*21,p*21,21,21);
      }
    }
  }
}

void mouseClicked ()
{   
  if (mouseX > 21 && mouseY > 21 && mouseX < 713 && mouseY < 713){
      fill(0);
      rect(floor(mouseX/21)*21,floor(mouseY/21)*21,21,21);
    cell2[floor(mouseX/21)][floor(mouseY/21)] = 1;
    sum = sum + 1;
  }
}  
