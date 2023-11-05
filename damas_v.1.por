programa
{
	inclua biblioteca Graficos -->g
	inclua biblioteca Teclado -->t
	inclua biblioteca Util -->u

      inteiro ALTURA_TABULEIRO = 600 , LARGURA_TABULEIRO  = 600
      inteiro quadrado_x = 20 , quadrado_y = 275, pos_x = 4, pos_y = 0, movimento_x =8, qta_movimento = 0
      inteiro atualiza_pedras_vermelhas_X[8][8]
      inteiro atualiza_pedras_vermelhas_Y[8][8]
      inteiro atualiza_pedras_pretas_X[8][8]
      inteiro atualiza_pedras_pretas_Y[8][8]
      logico  inicializa_pedras = verdadeiro
      logico  cima=falso, baixo=falso, direita=falso, esquerda=falso, selecionado = falso
      inteiro delay = 240, contador_selecionado = 0
      caracter pedra = 'V'
      logico criar_pedra = falso, esq = falso, dir =falso
      inteiro conta_tecla_pressionada =0, conta_pedra_vermelha = 12, conta_pedra_preta = 12

	funcao controle(){
		se(t.tecla_pressionada(t.TECLA_SETA_ACIMA)){
	
			cima = verdadeiro
		     baixo = falso
		     direita = falso
		     esquerda = falso
		     u.aguarde(delay)
		     mover()
			
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO)){

		     cima = falso
		     baixo = verdadeiro
		     direita = falso
		     esquerda = falso
		     u.aguarde(delay)
		     mover()
		     
		}
		se(t.tecla_pressionada(t.TECLA_SETA_DIREITA)){
				cima = falso
			     baixo = falso
			     direita = verdadeiro
			     esquerda = falso
			     dir = verdadeiro
			     u.aguarde(delay)
			     mover()
			
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)){
				cima = falso
			     baixo = falso
			     direita = falso
			     esquerda = verdadeiro
			      esq = verdadeiro
			     u.aguarde(delay)
			     mover()
			
	     
		}
		se(t.tecla_pressionada(t.TECLA_E)){
			
			     esq = verdadeiro
			     u.aguarde(delay)
			     mover()
			}
		se(t.tecla_pressionada(t.TECLA_R)){
			
			     dir = verdadeiro
			     u.aguarde(delay)
			     mover()
			}
	    se(t.tecla_pressionada(t.TECLA_A)){
	    
	    	se((pos_x%2 == 0 e pos_y%2 ==0) ou (pos_x%2==1 e pos_y%2==1) ){
	    	    u.aguarde(delay)
	    	     contador_selecionado ++
	    	    
	    	    se(contador_selecionado == 1){
	    	    	 selecionado = verdadeiro
	    	    	se(pedra == 'V'){
	    	    	 atualiza_pedras_vermelhas_local()
	    	    	}senao{
	    	    	  atualiza_pedras_pretas_local()
	    	    	}
	    	    }
	    	    senao{
	    	    	  selecionado = falso
	    	    	  contador_selecionado = 0
	    	    	 se(pedra == 'V'){
	    	    	  atualiza_pedras_vermelhas_local()
	    	    	 }senao{
	    	    	  atualiza_pedras_pretas_local()
	    	    	 }
	    	    	}
	    	   conta_tecla_pressionada++
	    	  se(pedra == 'V' e conta_tecla_pressionada ==2){pedra = 'P'} 
	    	  se(pedra == 'P' e conta_tecla_pressionada ==4){pedra = 'V' conta_tecla_pressionada = 0} 
	    	}
	     movimento_x = pos_x
	   }
	   se(t.tecla_pressionada(t.TECLA_Q)){
	   	 u.aguarde(delay)
	    	se(pedra == 'P')
	    	{
			  atualiza_pedras_vermelhas_Y[pos_y][pos_x] = 0
			  atualiza_pedras_vermelhas_X[pos_y][pos_x] = 0 
			  conta_pedra_vermelha--      	  
	    	}
	    se(pedra == 'V')
	    	{
			  atualiza_pedras_pretas_Y[pos_y][pos_x] = 0
			  atualiza_pedras_pretas_X[pos_y][pos_x] = 0 
			  conta_pedra_preta--      	  
	    	}
	   }    	  
	}
	funcao mover(){
            se(cima){
            quadrado_y = quadrado_y - 64
            quadrado_x = quadrado_x + 64
            	cima = falso
            	pos_y++
            	pos_x--
            }
            se(baixo){
            		 se(esq){
		            	quadrado_y = quadrado_y + 64
		               quadrado_x = quadrado_x - 64
		            	pos_y--
		            	pos_x++
		            	esq = falso
		            	baixo = falso
            		 }
            		  se(dir){
            		  	u.aguarde(delay)
		            	quadrado_y = quadrado_y + 64
		               quadrado_x = quadrado_x + 64
		            	pos_y--
		            	pos_x++      
		               dir = falso
		               baixo = falso   		 
            	}
             
              
            }
            se(direita e (movimento_x != pos_x)){
            quadrado_x = quadrado_x + 128
            	direita = falso
            	dir = falso
            	pos_y = pos_y +2
            }
            se(esquerda e (movimento_x != pos_x)){
            quadrado_x = quadrado_x - 128
            	esquerda = falso
            	esq = falso
            	pos_y= pos_y -2
            }
	}
	funcao selecionar_pedra(){
		se(selecionado){
 	     g.definir_cor(g.COR_VERDE)
	     g.desenhar_retangulo(quadrado_x, quadrado_y,64, 64,falso, falso)
	  }senao{
	  	g.definir_cor(g.COR_AZUL)
	     g.desenhar_retangulo(quadrado_x, quadrado_y,64, 64,falso, falso)
	  	}
	}
     funcao tabuleiro(){
     	para(inteiro x = 0;x<8;x++){
     	    para(inteiro y = 0; y<8;y++){   		
               se(y%2==0 e x%2==0){  	
     		      g.definir_cor(g.COR_AMARELO)
               }senao{
               	g.definir_cor(g.COR_BRANCO)
               }
               se(y%2==1 e x%2==1){ 
                     g.definir_cor(g.COR_AMARELO)
               }
                     g.desenhar_retangulo(20+x*64, 20+y*64, 64, 64,falso, verdadeiro)
     	   }
         }
     }
     funcao pedras_vermelhas(){
       	   para(inteiro v1 = 0;v1<8; v1++){
       	   	para(inteiro v2=0;v2<8;v2++){
       	     se(v2<3){
       	   	  se(v1%2==0 e v2%2==0){
       	   	  	  g.definir_cor(g.COR_VERMELHO)
	       	       g.desenhar_elipse(32+v1*64,32+v2*64,42,42,verdadeiro)
	       	       atualiza_pedras_vermelhas_Y[v2][v1] = 32+v1*64
	       	       atualiza_pedras_vermelhas_X[v2][v1] = 32+v2*64
       	   	  }senao{
       	   	  	   atualiza_pedras_vermelhas_Y[v2][v1] = 0
	       	       atualiza_pedras_vermelhas_X[v2][v1] = 0
       	   	  	}
       	   	   se(v1%2==1 e v2%2==1){
       	   	  	  g.definir_cor(g.COR_VERMELHO)
	       	       g.desenhar_elipse(32+v1*64,32+v2*64,42,42,verdadeiro)
	       	       atualiza_pedras_vermelhas_Y[v2][v1] = 32+v1*64
	       	       atualiza_pedras_vermelhas_X[v2][v1] = 32+v2*64
       	   	  }
       	     }senao{
       	      atualiza_pedras_vermelhas_Y[v2][v1] = 0
	       	 atualiza_pedras_vermelhas_X[v2][v1] = 0 
       	     }
       	   }
       	 }
       }
     funcao pedras_pretas(){
       	   para(inteiro v1 = 0;v1<8; v1++){
       	   	para(inteiro v2=0;v2<8;v2++){
       	     se(v2>4){
       	   	  se(v1%2==0 e v2%2==0){
       	   	  	  g.definir_cor(g.COR_PRETO)
	       	       g.desenhar_elipse(32+v1*64,32+v2*64,42,42,verdadeiro)
	       	       atualiza_pedras_pretas_Y[v2][v1] = 32+v1*64
	       	       atualiza_pedras_pretas_X[v2][v1] = 32+v2*64
       	   	  }senao{
       	   	  	   atualiza_pedras_pretas_Y[v2][v1] = 0
	       	       atualiza_pedras_pretas_X[v2][v1] = 0
       	   	  	}
       	   	   se(v1%2==1 e v2%2==1){
       	   	  	  g.definir_cor(g.COR_PRETO)
	       	       g.desenhar_elipse(32+v1*64,32+v2*64,42,42,verdadeiro)
	       	       atualiza_pedras_pretas_Y[v2][v1] = 32+v1*64
	       	       atualiza_pedras_pretas_X[v2][v1] = 32+v2*64
       	   	  }
       	     }senao{
       	      atualiza_pedras_pretas_Y[v2][v1] = 0
	       	 atualiza_pedras_pretas_X[v2][v1] = 0 
       	     }
       	   }
       	 }
       }
     funcao atualiza_pedras_vermelhas_local(){
	     	
	     	  se(selecionado){
	     	  	para(inteiro p1 = 0;p1<8;p1++){
       	   	     para(inteiro p2=0;p2<8;p2++){
       	   	       se(atualiza_pedras_vermelhas_X[pos_x][pos_y] != 0 e atualiza_pedras_vermelhas_Y[pos_x][pos_y] !=0){
       	   	         criar_pedra= verdadeiro
       	         	}
       	   	    }
	     	  }            //tirando a pedra do tabuleiro
			       	    atualiza_pedras_vermelhas_Y[pos_x][pos_y] = 0
			       	    atualiza_pedras_vermelhas_X[pos_x][pos_y] = 0
       	   	     }	
		       senao se(selecionado == falso e criar_pedra== verdadeiro){
                            //incluindo a pedra em outro lugar
			       	    atualiza_pedras_vermelhas_Y[pos_x][pos_y] = ((pos_y+1)*64)-32
			       	    atualiza_pedras_vermelhas_X[pos_x][pos_y] = ((pos_x+1)*64)-32
			       	    criar_pedra = falso
	     }
	  }
	funcao atualiza_pedras_pretas_local(){
	     se(selecionado){
	     	  	para(inteiro p1 = 0;p1<8;p1++){
       	   	     para(inteiro p2=0;p2<8;p2++){
       	   	       se(atualiza_pedras_pretas_X[pos_x][pos_y] != 0 e atualiza_pedras_pretas_Y[pos_x][pos_y] !=0){
       	   	         criar_pedra= verdadeiro
       	         	}
       	   	    }
	     	  }
			       	    atualiza_pedras_pretas_Y[pos_x][pos_y] = 0
			       	    atualiza_pedras_pretas_X[pos_x][pos_y] = 0
       	   	     }	
		       senao se(selecionado == falso e criar_pedra== verdadeiro){

			       	 //incluindo a pedra em outro lugar
			       	    atualiza_pedras_pretas_Y[pos_x][pos_y] = ((pos_y+1)*64)-32
			       	    atualiza_pedras_pretas_X[pos_x][pos_y] = ((pos_x+1)*64)-32
			       	    criar_pedra = falso
	     }
	  }
     funcao atualiza_pedras_vermelhas(){
  	        para(inteiro p1 = 0;p1<8;p1++){
       	   	para(inteiro p2=0;p2<8;p2++){
       	   	se(atualiza_pedras_vermelhas_X[p1][p2] != 0 e atualiza_pedras_vermelhas_Y[p1][p2] !=0){
       	   	    g.definir_cor(g.COR_VERMELHO)
	       	    g.desenhar_elipse(atualiza_pedras_vermelhas_Y[p1][p2],atualiza_pedras_vermelhas_X[p1][p2],42,42,verdadeiro)
       	   	}
       	 }
  	    }
      }      
     funcao atualiza_pedras_pretas(){
  	        para(inteiro p1 = 0;p1<8;p1++){
       	   	para(inteiro p2=0;p2<8;p2++){
       	   	se(atualiza_pedras_pretas_X[p1][p2] != 0 e atualiza_pedras_pretas_Y[p1][p2] !=0){
       	   	    g.definir_cor(g.COR_PRETO)
	       	    g.desenhar_elipse(atualiza_pedras_pretas_Y[p1][p2],atualiza_pedras_pretas_X[p1][p2],42,42,verdadeiro)
       	   	   
       	   	}
       	 }
  	    }
      }
     funcao texto(){
     	para(inteiro x = 0;x<8;x++ ){
     		g.definir_cor(g.COR_PRETO)
     		g.desenhar_texto(64*x+46, 5, ""+x)
     		g.definir_cor(g.COR_PRETO)
     		g.desenhar_texto(5, 64*x+46, ""+x)
         }
     }	
	funcao desenhar(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
	     tabuleiro()
	     se(inicializa_pedras){
 			pedras_vermelhas()
 			pedras_pretas()
 			
	     }
	     selecionar_pedra()
          atualiza_pedras_vermelhas()
          atualiza_pedras_pretas()
	     //g.definir_cor(g.COR_AZUL)
	     //g.desenhar_retangulo(quadrado_x, quadrado_y,64, 64,falso, falso)
	  
	     texto()
		g.renderizar()
	}
	funcao inicio(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(600, 550)
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			controle()
			desenhar()
			inicializa_pedras = falso
		}
	}	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3953; 
 * @DOBRAMENTO-CODIGO = [169, 184, 210, 276, 286, 297, 305, 326, 323];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {baixo, 14, 26, 5}-{direita, 14, 39, 7}-{esq, 17, 34, 3};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */