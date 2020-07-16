class Poder
{
  float x,y;
  boolean disparando;
 
  Poder()
  {
   disparando = false;  
  }
 
  Poder(float _x,float _y)
 {
  x = _x;
  y = _y;
  disparando = true;
 } 

  void dibujar(Punto el, int vel, Personaje rival)
  {  
    if (disparando)
    {
       fill(color(0,0,0));
       beginShape();
       rect(x,y,40,40);
       endShape();
       disparar(el, vel, rival);    
    }
  }
  
  void disparar(Punto el, int vel, Personaje rival)
  {
    deshabilitar(el,vel,rival);
  }
  
  void deshabilitar(Punto el, int vel, Personaje rival)
  {
    if(vel > 0)
    {
      x += vel;
      if((x+40 >= tam_ancho) || ((x+40) >= ((rival.P).x) && (rival.P).disparando == true && y == (rival.P).y))
      {
        disparando = false;
        (rival.P).disparando = false;
      } 
      if ((x+40 >= (el.x)) && (y > (rival.a).y && y < (rival.d).y))
      {
        disparando = false;
        if (!rival.bloqueo) rival.v -= 10;
      } 
    }else{
      x += vel;
      if(( x <= 0) || ((x <= (rival.P).x+40) && (rival.P).disparando == true && y == (rival.P).y))
      {
        disparando = false;
        (rival.P).disparando = false;
      } 
      if ((x <= (el.x)+150) && (y > (rival.b).y && y < (rival.c).y))
      {
        disparando = false;
        if (!rival.bloqueo) rival.v -= 10;
      } 
    }
  }
}


