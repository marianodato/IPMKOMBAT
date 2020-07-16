class  Personaje
{
  Punto a, b, c, d;
  int vel, contador,v;
  boolean izquierda, derecha, abajo, saltando, agachado, superpuesto, pina_nor, patada_arriba, gancho, disparando;
  boolean pegoizquierda, bloqueo;
  Poder P;

  Personaje (Punto _a, Punto _b)
  {
    a = _a;
    b = _b;
    c = new Punto(_b.x, (_b.y)+350);
    d = new Punto(_a.x, (_a.y)+350);
    vel = 0;
    saltando = false; 
    izquierda = false;
    derecha = false;
    abajo = false;
    agachado = false;
    superpuesto = false;
    pina_nor = false;
    patada_arriba = false;
    gancho = false;
    pegoizquierda= false;
    P = new Poder();
    bloqueo = false;
    v = 400;
  }

  void dibujar(int ca, int cb, int cc)
  {
    fill(color(ca,cb,cc));
    beginShape();
    vertex(a.x, a.y);
    vertex(b.x, b.y);
    vertex(c.x, c.y);
    vertex(d.x, d.y);
    endShape();
  }

  void apretotecla(char key, Punto otro)                                                                                  /////APRETO TECLA/////
  {   
    if (key == 'a' && !pina_nor && !gancho &&  !patada_arriba) izquierda = true;  
    else if (key == 'd' && !pina_nor && !gancho &&  !patada_arriba) derecha = true;

    if (key == 's' && !pina_nor && !gancho &&  !patada_arriba && !saltando) abajo = true;  
    else if (key == 'w' && !pina_nor && !gancho &&  !patada_arriba)
    {
      if (agachado)
      {
        a.y = tam_alto-350;
        b.y = tam_alto-350;
        agachado = false;
      }
      else if (!agachado)
      {
        if (!saltando)
        {
          vel = -30;
          saltando = true;
        }
      }
    }

    if ((key == 'j' || key == '4') && c.y == tam_alto && !saltando) 
    {
      pina_nor = true;
      if (contador == 0) contador = 100;      
    }
    if ((key == 'k' || key == '5') && !saltando)
    {
      patada_arriba = true;
      if (contador == 0) contador = 100;
    } 
    if ((key == 'l' || key == '6') && !pina_nor && !saltando)
    {
      gancho = true;
      if (contador == 0) contador = 100;
    }
    
    if((key == 'i' || key == '8') && P.disparando == false)
   {
     if(a.x > otro.x)if(!agachado)P = new Poder(a.x-40,a.y+100); else P = new Poder(a.x-40,a.y+62);
     else if(!agachado)P = new Poder(b.x,b.y+100); else P = new Poder(b.x,b.y+62);
     P.disparando = true;
   }  
   
   if(key == 'o' || key == '9') bloqueo = true;
   else bloqueo = false;
  }  

  void disparar(Punto el, Personaje rival)
  {
    if(P.disparando)
   { 
    if(a.x > el.x )P.dibujar(el,-15,rival);
    else P.dibujar(el,15,rival);      
   }
  }

  void mover(float izq, float der, float pies, float cabeza, Personaje rival)                                                  /////MOVER/////
  {
    if (c.y == tam_alto && !agachado && !saltando)
    {
      a.y = b.y;
      b.x = c.x;
      d.y = c.y;
      a.x = d.x;
    }

    if (izquierda)
    {
      if ((a.x >= 0 && a.x != (rival.b).x) || a.y > pies || c.y < cabeza )
      {
        a.x -= 10;
        b.x -= 10;
        c.x -= 10;
        d.x -= 10;
        izquierda = false;
      }
    }
    if (derecha)
    {
      if ((b.x <= tam_ancho && b.x != izq) || b.y > pies || c.y < cabeza)
      {
        a.x += 10;
        b.x += 10;
        c.x += 10;
        d.x += 10;
        derecha = false;
      }
    }

    if (abajo && !saltando)
    {
      a.y = tam_alto-150;
      b.y = tam_alto-150;
      cabeza = a.y;
      agachado = true;
      abajo = false;
    } 
    else if (saltando)
    {
      a.y += vel;
      b.y += vel;
      c.y += vel;
      d.y += vel;
      vel++;
      
      if (a.x < 0)//para q no salga d ela pantalla saltando
      {
        a.x += 10;
        b.x += 10;
        c.x += 10;
        d.x += 10;
      }
      
       if (b.x > tam_ancho)//para q no salga de la pantalla saltando
      {
        a.x -= 10;
        b.x -= 10;
        c.x -= 10;
        d.x -= 10;
      }
      
      
      if ((a.x >= izq && a.x <= der || b.x >= izq && b.x <= der) && c.y >= cabeza)
      {
        superpuesto = true;
      }
      if (c.y >= tam_alto) 
      {    
        saltando = false;
        c = new Punto(b.x, tam_alto);
        d = new Punto(a.x, tam_alto);
      }
    }

    if (superpuesto)                                                                                            /////SUPERPUESTO/////
    {
      if ((der - b.x) <= (a.x - izq))
      {
        a.x = der;
        b.x = a.x + 200;
        c.x = b.x;
        d.x = a.x;
      }
      else {
        b.x = izq;
        c.x = b.x;
        a.x = b.x - 200;
        d.x = a.x;
      } 
      superpuesto = false;
    }
  } 

  void golpe(float izq, float der, float pies, float cabeza, Personaje rival)                                          /////GOLPES/////
  {
    if (pina_nor && contador != 0 && !saltando && !gancho) ataque(izq, 75, 150, 1, rival);  

    if (patada_arriba && contador != 0 && !saltando && !gancho)  ataque(izq, 75, 300, 2, rival);
    
    if (gancho && contador != 0 && !saltando) ataque (izq, 75, 150, 3, rival);
  }

  void ataque(float izq, float ancho, float alto, int pega, Personaje rival)                                                                             /////ATAQUE/////
  { 
      if (contador == 100)
      {
        if (agachado) alto = 150;
        
        if(pega == 3)
       { 
          a.y -= ancho;
          b.y -= ancho;
          gancho = true;
          if(((a.x < (rival.c).x && a.x > (rival.d).x) || (b.x < (rival.c).x && b.x > (rival.d).x))&& a.y <= (rival.d).y && !rival.bloqueo) rival.v -= 20;
          
       }else if (pega==1 || pega==2)
       {
          if (a.x > izq)      
          {     
            a.x -= ancho;
            d.x = a.x;
            
            if (pega == 2 && agachado)
            {
                d.x = a.x;
            } 
             
            pegoizquierda = true;
            if(pegoizquierda && a.x < (rival.c).x && a.x > (rival.d).x && a.y >= (rival.b).y && a.y <= (rival.c).y && !rival.bloqueo)
            {
              rival.v -= 15;
              if((rival.a).x >= 25)
              {
                (rival.c).x -= 85;
                (rival.b).x -= 85;
                (rival.a).x -= 85;
                (rival.d).x -= 85;
              }
            }
          }
          else 
          {
  
            b.x += ancho;
            c.x = b.x;

            if (pega==2 && agachado)
            {
               c.x=b.x;
            }
            
            pegoizquierda = false;
            if(!pegoizquierda && b.x < (rival.b).x && b.x > (rival.a).x && b.y >= (rival.b).y && b.y <= (rival.c).y && !rival.bloqueo)
           {
              rival.v -= 10;
              if((rival.b).x <= tam_ancho-45)
              {
                (rival.c).x += 85;
                (rival.b).x += 85;
                (rival.a).x += 85;
                (rival.d).x += 85;
              } 
           }
          }      
        } 
      }   
      
      if (contador != 0)   contador-= 10;
  
      if (pega ==3 && contador==0 )
      {
        a.y +=ancho;
        b.y= a.y;
        gancho=false;
      }
      
      if (pega== 1 || pega== 2)
      {
        if (contador == 0 && pegoizquierda)
        {
          a.x += ancho;
    
          if (agachado && pega==1)
          { 
            a.y = tam_alto - alto;
            d.y = (a.y) + alto;
            
          }else if (agachado && pega==2)
          { 
                a.y=b.y;
                d.x=a.x;
                d.y=c.y;
                
          }else {
            a.y = b.y;
            d.y = c.y;      
          }
          
          d.x = a.x;
          d.y = tam_alto;
    
          if (pega == 1) pina_nor = false;
          else if (pega == 2) patada_arriba = false;
        }
        else if (contador == 0 && !pegoizquierda)
        {
          b.x -= ancho;
          b.y = tam_alto - alto;
    
          if (agachado && pega ==1)
          {
            b.y = tam_alto - alto;
            c.y = (b.y) + alto;
            
          }else if (agachado && pega ==2)
          {
               b.y=a.y;
               c.x=b.x;
               c.y=d.y;
               
          }else {
            
            b.y = a.y;
            c.y = d.y;
          }
          
          c.x = b.x;
          c.y = tam_alto;
    
          if (pega == 1) pina_nor = false;
          else if(pega == 2) patada_arriba = false;
        }
      }
   }  
}

