import procontroll.*;

ControllIO controllIO;
ControllDevice joypad;
ControllStick stick;
ControllDevice joypad2;

int tam_ancho = 1280;
int tam_alto = 720;
int n,n2;
boolean menu=false;
int pausa=1;

Personaje p1,p2;

Punto b1, b2;

PImage fighter1,f1norder,f1norizq,f1pinder,f1agcubder,f1agcubizq,f1cam1der,f1cam1izq,f1cam2der,f1cam2izq,f1pinizq,f1patder,f1patizq,f1salder,f1salizq,f1cubder,f1cubizq,f1agder,f1agizq,f1gander,f1ganizq,f1agpinder,f1agpinizq,f1agpatder,f1agpatizq,f1aggander,f1agganizq,f1poder,f1poizq,f1agpoder,f1agpoizq;

PImage fighter2,f2norder,f2norizq,f2pinder,f2agcubder,f2agcubizq,f2cam1der,f2cam1izq,f2cam2der,f2cam2izq,f2pinizq,f2patder,f2patizq,f2salder,f2salizq,f2cubder,f2cubizq,f2agder,f2agizq,f2gander,f2ganizq,f2agpinder,f2agpinizq,f2agpatder,f2agpatizq,f2aggander,f2agganizq,f2poder,f2poizq,f2agpoder,f2agpoizq;

PFont vida;

void setup() 
{
  inicializar();
  
  controllIO = ControllIO.getInstance(this);
  
  joypad = controllIO.getDevice(6);
  joypad2 = controllIO.getDevice(7);

}
void draw() 
{
  
   background(0);
   fill(color(255,255,255));
   text("Press P to play!", tam_ancho - 800, tam_alto/2);
   if(keyPressed)
   {
     if(key=='p')
     {
         menu=true;
     
     }
     
   }
  
  if(menu)
  {
  background(245);

  general();
  if(keyPressed && key ==' ')
  {
      pausa=-pausa;
      keyPressed =false;
      
  } 

if (pausa==-1)
      {
      
      background(0);
      fill(color(255,255,255));
      text("Game paused!", tam_ancho-740, tam_alto/2-15);
      text("Press the bar space to resume", tam_ancho-860, tam_alto/2+15);
      }  
  if(pausa!=-1)
  {
  joypad.plug(this, "poder", ControllIO.ON_PRESS, 4);
  joypad.plug(this, "pina", ControllIO.ON_PRESS, 3);
  joypad.plug(this, "patada", ControllIO.ON_PRESS, 2);
  joypad.plug(this, "gancho", ControllIO.ON_PRESS, 1);
  joypad.plug(this, "endurecerse", ControllIO.WHILE_PRESS, 6);
  if(joypad.getSlider(0).getValue() == -1) arriba();
  if(joypad.getSlider(0).getValue() == 1) abajo();  
  if(joypad.getSlider(1).getValue() == -1) izq();
  if(joypad.getSlider(1).getValue() == 1) der();  
  
  joypad2.plug(this, "poder2", ControllIO.ON_PRESS, 4);
  joypad2.plug(this, "pina2", ControllIO.ON_PRESS, 3);
  joypad2.plug(this, "patada2", ControllIO.ON_PRESS, 2);
  joypad2.plug(this, "gancho2", ControllIO.ON_PRESS, 1);
  joypad2.plug(this, "endurecerse2", ControllIO.WHILE_PRESS, 6);
  if(joypad2.getSlider(0).getValue() == -1) arriba2();
  if(joypad2.getSlider(0).getValue() == 1) abajo2();  
  if(joypad2.getSlider(1).getValue() == -1) izq2();
  if(joypad2.getSlider(1).getValue() == 1) der2();  
  }
 
   
  if (p1.v <= 0)
  { 
      background(0);
   fill(color(255,255,255));
    text("Faria Wins!", tam_ancho - 740, tam_alto/2-15);
    text("Press R to play again", tam_ancho - 800, tam_alto/2+15);
  }
  if (p2.v <= 0)
  { 
      background(0);
   fill(color(255,255,255));
    text("Guido Wins!", tam_ancho - 740, tam_alto/2-15);
    text("Press R to play again", tam_ancho - 800, tam_alto/2+15);
  }
}
  
}


void poder ()
{
  if(pausa!=-1)

  p1.apretotecla('i',p2.a);
}
 
void pina ()
{
   if(pausa!=-1)

 p1.apretotecla('j',p2.a);
}

void patada ()
{
   if(pausa!=-1)

 p1.apretotecla('k',p2.a);
}

void gancho ()
{
   if(pausa!=-1)

 p1.apretotecla('l',p2.a);
}

void endurecerse ()
{
   if(pausa!=-1)

 p1.apretotecla('o',p2.a);
}

void arriba ()
{
   if(pausa!=-1)

 p1.apretotecla('w',p2.a);
}

void abajo ()
{
   if(pausa!=-1)

 p1.apretotecla('s',p2.a);
}

void izq ()
{
   if(pausa!=-1)

 p1.apretotecla('a',p2.a);
}

void der ()
{
   if(pausa!=-1)

 p1.apretotecla('d',p2.a);
}

/////////////////////////////////////////////////////////////////////////

void poder2 ()
{
   if(pausa!=-1)

 p2.apretotecla('i',p1.a);
}
 
void pina2 ()
{
   if(pausa!=-1)

 p2.apretotecla('j',p1.a);
}

void patada2 ()
{
   if(pausa!=-1)

 p2.apretotecla('k',p1.a);
}

void gancho2 ()
{
   if(pausa!=-1)

 p2.apretotecla('l',p1.a);
}

void endurecerse2 ()
{
   if(pausa!=-1)

 p2.apretotecla('o',p1.a);
}

void arriba2 ()
{
   if(pausa!=-1)

 p2.apretotecla('w',p1.a);
}

void abajo2 ()
{ 
  if(pausa!=-1)

 p2.apretotecla('s',p1.a);
}

void izq2 ()
{
   if(pausa!=-1)

 p2.apretotecla('a',p1.a);
}

void der2 ()
{
  
 p2.apretotecla('d',p1.a);
}




void inicializar()
{
 size(tam_ancho,tam_alto);

  p1 = new Personaje(new Punto(100,tam_alto-350), new Punto(300,tam_alto-350));
  p2 = new Personaje(new Punto(tam_ancho-300,tam_alto-350), new Punto(tam_ancho-100,tam_alto-350));
  b1 = new Punto(15,15);
  b2 = new Punto(tam_ancho-415,15);
  
  vida = loadFont("ArialMT-48.vlw"); 
  textFont(vida, 32);  
  
  n = 0;
  n2 = 0;
  
  f1norder = loadImage("Tin_nor_der.JPG");
  f1norizq = loadImage("Tin_nor_izq.JPG");
  f1pinder = loadImage("Tin_pin_der.JPG");
  f1pinizq = loadImage("Tin_pin_izq.JPG");
  f1patder = loadImage("Tin_pata_der.JPG");
  f1patizq = loadImage("Tin_pata_izq.JPG");
  f1cubder = loadImage("Tin_cub_der.JPG");
  f1cubizq = loadImage("Tin_cub_izq.JPG");
  f1gander = loadImage("Tin_gan_der.JPG");
  f1ganizq = loadImage("Tin_gan_izq.JPG");
  f1agder = loadImage("Tin_ag_der.JPG");
  f1agizq = loadImage("Tin_ag_izq.JPG");
  f1poder = loadImage("Tin_po_der.JPG");
  f1poizq = loadImage("Tin_po_izq.JPG");
  f1agpinder = loadImage("Tin_agpin_der.JPG");
  f1agpinizq = loadImage("Tin_agpin_izq.JPG");
  f1agpatder = loadImage("Tin_agpat_der.JPG");
  f1agpatizq = loadImage("Tin_agapat_izq.JPG");
  f1aggander = loadImage("Tin_aggan_der.JPG");
  f1agganizq = loadImage("Tin_aggan_izq.JPG");
  f1agpoder = loadImage("Tin_agpod_der.JPG");
  f1agpoizq = loadImage("Tin_agpod_izq.JPG");
  f1agcubder = loadImage("Tin_agcub_der.JPG");
  f1agcubizq = loadImage("Tin_agcub_izq.JPG");
  f1salder = loadImage("Tin_sal_der.JPG");
  f1salizq = loadImage("Tin_sal_izq.JPG");
  f1cam1der = loadImage("Tin_cam1_der.JPG");
  f1cam1izq = loadImage("Tin_cam1_izq.JPG");
  f1cam2der = loadImage("Tin_cam2_der.JPG");
  f1cam2izq = loadImage("Tin_cam2_izq.JPG");
  
  f2norder = loadImage("far_nor_der.JPG");
  f2norizq = loadImage("far_nor_izq.JPG");
  f2pinder = loadImage("far_pina_der.JPG");
  f2pinizq = loadImage("far_pina_izq.JPG");
  f2patder = loadImage("far_pat_der.JPG");
  f2patizq = loadImage("far_pat_izq.JPG");
  f2cubder = loadImage("far_bloq_der.JPG");
  f2cubizq = loadImage("far_bloq_izq.JPG");
  f2gander = loadImage("far_gan_der.JPG");
  f2ganizq = loadImage("far_gan_izq.JPG");
  f2agder = loadImage("far_aga_der.JPG");
  f2agizq = loadImage("far_aga_izq.JPG");
  f2poder = loadImage("far_po_der.JPG");
  f2poizq = loadImage("far_po_izq.JPG");
  f2agpinder = loadImage("far_aga_pin_der.JPG");
  f2agpinizq = loadImage("far_aga_pin_izq.JPG");
  f2agpatder = loadImage("far_aga_pat_der.JPG");
  f2agpatizq = loadImage("far_aga_pat_izq.JPG");
  f2aggander = loadImage("far_aga_gan_der.JPG");
  f2agganizq = loadImage("far_aga_gan_izq.JPG");
  f2agpoder = loadImage("far_aga_pod_der.JPG");
  f2agpoizq = loadImage("far_aga_pod_izq.JPG");
  f2agcubder = loadImage("far_aga_bloq_der.JPG");
  f2agcubizq = loadImage("far_aga_bloq_izq.JPG");
  f2salder = loadImage("far_sal_der.JPG");
  f2salizq = loadImage("far_sal_izq.JPG");
  f2cam1der = loadImage("far_cam1_der.JPG");
  f2cam1izq = loadImage("far_cam1_izq.JPG");
  f2cam2der = loadImage("far_cam2_der.JPG");
  f2cam2izq = loadImage("far_cam2_izq.JPG");

}

void general()
{
  barras();
  
  //Imagenes
  
  int ancho = 200;
  int alto = 350;
  int ancho2 = 200;
  int alto2 = 350;
  
  if(p1.a.x < p2.a.x) fighter1 = f1norder;
  else if (p1.a.x > p2.a.x) fighter1 = f1norizq;
  if (p1.pina_nor && p1.a.x < p2.a.x){ fighter1 = f1pinder; ancho = 275; }
  else if (p1.pina_nor && p1.a.x > p2.a.x){ fighter1 = f1pinizq; ancho = 275;}
  if (p1.patada_arriba && p1.a.x < p2.a.x){ fighter1 = f1patder; ancho = 275;}
  else if (p1.patada_arriba && p1.a.x > p2.a.x){ fighter1 = f1patizq;  ancho = 275;}
  if (p1.bloqueo && p1.a.x < p2.a.x) fighter1 = f1cubder;
  else if (p1.bloqueo && p1.a.x > p2.a.x) fighter1 = f1cubizq;
  if (p1.gancho && p1.a.x < p2.a.x){ fighter1 = f1gander; alto = 425;}
  else if (p1.gancho && p1.a.x > p2.a.x){ fighter1 = f1ganizq; alto = 425;}
  if (p1.agachado && p1.a.x < p2.a.x){ fighter1 = f1agder; alto = 200;}
  else if (p1.agachado && p1.a.x > p2.a.x){ fighter1 = f1agizq; alto = 200;}
  if (p1.P.disparando && p1.a.x < p2.a.x) fighter1 = f1poder;
  else if (p1.P.disparando && p1.a.x > p2.a.x) fighter1 = f1poizq;
  if (p1.agachado && p1.pina_nor && p1.a.x < p2.a.x){ fighter1 = f1agpinder; alto = 200;  ancho = 275;}
  else if (p1.agachado && p1.pina_nor && p1.a.x > p2.a.x){ fighter1 = f1agpinizq; alto = 200; ancho = 275;}
  if (p1.agachado && p1.patada_arriba && p1.a.x < p2.a.x){ fighter1 = f1agpatder; alto = 200;  ancho = 275;}
  else if (p1.agachado && p1.patada_arriba && p1.a.x > p2.a.x){ fighter1 = f1agpatizq; alto = 200;  ancho = 275;}
  if (p1.agachado && p1.gancho && p1.a.x < p2.a.x){ fighter1 = f1aggander; alto = 275;}
  else if (p1.agachado && p1.gancho && p1.a.x > p2.a.x){ fighter1 = f1agganizq; alto = 275;}
  if (p1.agachado && p1.P.disparando && p1.a.x < p2.a.x){ fighter1 = f1agpoder; alto = 200;}
  else if (p1.agachado && p1.P.disparando && p1.a.x > p2.a.x){ fighter1 = f1agpoizq; alto = 200;}
  if (p1.agachado && p1.bloqueo && p1.a.x < p2.a.x){ fighter1 = f1agcubder; alto = 200;}
  else if (p1.agachado && p1.bloqueo && p1.a.x > p2.a.x){ fighter1 = f1agcubizq; alto = 200;}
   if (p1.saltando && p1.a.x < p2.a.x) fighter1 = f1salder;
  else if (p1.saltando && p1.a.x > p2.a.x) fighter1 = f1salizq;
  
  if( p1.a.x < p2.a.x && !p1.saltando && !p1.P.disparando && !p1.agachado)
  {
    if(p1.derecha && n < 15) fighter1 = f1cam1der;
    else if (p1.derecha && n >= 15) fighter1 = f1cam2der;
     if(p1.izquierda && n < 15) fighter1 = f1cam2der;
    else if (p1.izquierda && n >= 15) fighter1 = f1cam1der;
  }
  else if( p1.a.x > p2.a.x && !p1.saltando && !p1.P.disparando && !p1.agachado)
  {
     if(p1.izquierda && n < 15) fighter1 = f1cam2izq;
    else if (p1.izquierda && n >= 15) fighter1 = f1cam1izq;
     if(p1.derecha && n < 15) fighter1 = f1cam1izq;
    else if (p1.derecha && n >= 15) fighter1 = f1cam2izq;
  }
  

  p1.dibujar(245,245,245);
 
  image(fighter1,p1.a.x,p1.a.y,ancho,alto);
 
  if(p2.a.x < p1.a.x) fighter2 = f2norder;
  else if (p2.a.x > p1.a.x) fighter2 = f2norizq;
  if (p2.pina_nor && p2.a.x < p1.a.x){ fighter2 = f2pinder; ancho2 = 275; }
  else if (p2.pina_nor && p2.a.x > p1.a.x){ fighter2 = f2pinizq; ancho2 = 275;}
  if (p2.patada_arriba && p2.a.x < p1.a.x){ fighter2 = f2patder; ancho2 = 275;}
  else if (p2.patada_arriba && p2.a.x > p1.a.x){ fighter2 = f2patizq;  ancho2 = 275;}
  if (p2.bloqueo && p2.a.x < p1.a.x) fighter2 = f2cubder;
  else if (p2.bloqueo && p2.a.x > p1.a.x) fighter2 = f2cubizq;
  if (p2.gancho && p2.a.x < p1.a.x){ fighter2 = f2gander; alto2 = 425;}
  else if (p2.gancho && p2.a.x > p1.a.x){ fighter2 = f2ganizq; alto2 = 425;}
  if (p2.agachado && p2.a.x < p1.a.x){ fighter2 = f2agder; alto2 = 200;}
  else if (p2.agachado && p2.a.x > p1.a.x){ fighter2 = f2agizq; alto2 = 200;}
  if (p2.P.disparando && p2.a.x < p1.a.x) fighter2 = f2poder;
  else if (p2.P.disparando && p2.a.x > p1.a.x) fighter2 = f2poizq;
  if (p2.agachado && p2.pina_nor && p2.a.x < p1.a.x){ fighter2 = f2agpinder; alto2 = 200;  ancho2 = 275;}
  else if (p2.agachado && p2.pina_nor && p2.a.x > p1.a.x){ fighter2 = f2agpinizq; alto2 = 200; ancho2 = 275;}
  if (p2.agachado && p2.patada_arriba && p2.a.x < p1.a.x){ fighter2 = f2agpatder; alto2 = 200;  ancho2 = 275;}
  else if (p2.agachado && p2.patada_arriba && p2.a.x > p1.a.x){ fighter2 = f2agpatizq; alto2 = 200;  ancho2 = 275;}
  if (p2.agachado && p2.gancho && p2.a.x < p1.a.x){ fighter2 = f2aggander; alto2 = 275;}
  else if (p2.agachado && p2.gancho && p2.a.x > p1.a.x){ fighter2 = f2agganizq; alto2 = 275;}
  if (p2.agachado && p2.P.disparando && p2.a.x < p1.a.x){ fighter2 = f2agpoder; alto2 = 200;}
  else if (p2.agachado && p2.P.disparando && p2.a.x > p1.a.x){ fighter2 = f2agpoizq; alto2 = 200;}
  if (p2.agachado && p2.bloqueo && p2.a.x < p1.a.x){ fighter2 = f2agcubder; alto2 = 200;}
  else if (p2.agachado && p2.bloqueo && p2.a.x > p1.a.x){ fighter2 = f2agcubizq; alto2 = 200;}
   if (p2.saltando && p2.a.x < p1.a.x) fighter2 = f2salder;
  else if (p2.saltando && p2.a.x > p1.a.x) fighter2 = f2salizq;
  
  if( p2.a.x < p1.a.x && !p2.saltando && !p2.P.disparando && !p2.agachado)
  {
    if(p2.derecha && n2 < 15) fighter2 = f2cam1der;
    else if (p2.derecha && n2 >= 15) fighter2 = f2cam2der;
     if(p2.izquierda && n2 < 15) fighter2 = f2cam2der;
    else if (p2.izquierda && n2 >= 15) fighter2 = f2cam1der;
  }
  else if( p2.a.x > p1.a.x && !p2.saltando && !p2.P.disparando && !p2.agachado)
  {
     if(p2.izquierda && n2 < 15) fighter2 = f2cam2izq;
    else if (p2.izquierda && n2 >= 15) fighter2 = f2cam1izq;
     if(p2.derecha && n2 < 15) fighter2 = f2cam1izq;
    else if (p2.derecha && n2 >= 15) fighter2 = f2cam2izq;
  }
  
  
  p2.dibujar(245,245,245); 
  
 image(fighter2,p2.a.x,p2.a.y,ancho2,alto2);
  
  if(p1.v > 0 && p2.v > 0)
  {
    p1.mover((p2.a).x,(p2.b).x,(p2.c).y,(p2.a).y,p2);
    p2.mover((p1.a).x,(p1.b).x,(p1.c).y,(p1.a).y,p1);
    p1.golpe((p2.a).x,(p2.b).x,(p2.c).y,(p2.a).y, p2);
    p2.golpe((p1.a).x,(p1.b).x,(p1.c).y,(p1.a).y, p1);
    p1.disparar(p2.a,p2);
    p2.disparar(p1.a,p1);
  }else if (keyPressed)
  {
   if(key == 'r')
   { 
     p1 = new Personaje(new Punto(100,tam_alto-350), new Punto(250,tam_alto-350));
     p2 = new Personaje(new Punto(tam_ancho-250,tam_alto-350), new Punto(tam_ancho-100,tam_alto-350));
   }
   if(key== ESC) exit(); 
  }

  ancho = 200;
  alto = 350;
  if(n >= 30 ) n=0;
  else n++;
  if(n2 >= 30 ) n2=0;
  else n2++;
}

void barras()
{
 //Recuadro
 fill(color(0,0,0));
 beginShape();
 rect(10,10,410,30);
 endShape();
 
 fill(color(0,0,0));
 beginShape();
 rect(tam_ancho-420,10,410,30);
 endShape();
 
 //Relleno
 fill(color(0,255,0));
 b1.x = (415-p1.v);
 beginShape();
 if(p1.v > 0)rect(b1.x,b1.y,p1.v,20);
 endShape();
 
 fill(color(0,255,0));
 beginShape();
 if(p2.v > 0)rect(b2.x,b2.y,p2.v,20);
 endShape();
 
 fill(color(0,0,0));
 text("Guido", tam_ancho - 1100, tam_alto-650);
 text("Faria", tam_ancho - 250, tam_alto-650);
}
