## Tres Balas Phazer

~~~
var w=800;
var h=400;
var jugador;
var fondo;

var bala, balaD=false, nave, bala2, bala2D=false, bala3, bala3D=false, nave2, nave3;

var salto;
var moveri;
var moverd;
var menu;

var velocidadBala;
var despBala;
var velocidadBala2;
var despBala2;
var velocidadBala3;
var despBala3;
var despbala4;
var VelocidadBala4
var estatusAire;
var estatuSuelo;
var estatuSuelo2;
var estatusIzq;
var estatusDer;

var nnNetwork , nnNetwork2, nnNetwork3, nnEntrenamiento, nnEntrenamiento2, nnEntrenamiento3, nnSalida, nnSalida2, nnSalida3, datosEntrenamiento=[],datosEntrenamiento2=[], datosEntrenamiento3=[];
var modoAuto = false, eCompleto=false;



var juego = new Phaser.Game(w, h, Phaser.CANVAS, '', { preload: preload, create: create, update: update, render:render});

function preload() {
    juego.load.image('fondo', 'assets/game/fondo.jpg');
    juego.load.spritesheet('mono', 'assets/sprites/altair.png',32 ,48);
    juego.load.image('nave', 'assets/game/ufo.png');
    juego.load.image('bala', 'assets/sprites/purple_ball.png');
    juego.load.image('menu', 'assets/game/menu.png');

}


function create() {

    juego.physics.startSystem(Phaser.Physics.ARCADE);
    juego.physics.arcade.gravity.y = 800;
    juego.time.desiredFps = 30;

    fondo = juego.add.tileSprite(0, 0, w, h, 'fondo');
    nave = juego.add.sprite(w-100, h-70, 'nave');
    bala = juego.add.sprite(w-100, h, 'bala');
    nave2 = juego.add.sprite(0, 0, 'nave');
    bala2 = juego.add.sprite(50, 50, 'bala');
    nave3 = juego.add.sprite(w - 100, 0, 'nave');
    bala3 = juego.add.sprite(w - 100, h - 350, 'bala');
    jugador = juego.add.sprite(50, h, 'mono');


    juego.physics.enable(jugador);
    jugador.body.collideWorldBounds = true;
    var corre = jugador.animations.add('corre',[8,9,10,11]);
    jugador.animations.play('corre', 10, true);

    juego.physics.enable(bala);
    bala.body.collideWorldBounds = true;
    juego.physics.enable(bala2);
    bala2.body.collideWorldBounds = true;
    juego.physics.enable(bala3);
    bala3.body.collideWorldBounds = true;

    pausaL = juego.add.text(w - 400, 20, 'Pausa', { font: '20px Arial', fill: '#fff' });
    pausaL.inputEnabled = true;
    pausaL.events.onInputUp.add(pausa, self);
    juego.input.onDown.add(mPausa, self);

    salto = juego.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
    moveri = juego.input.keyboard.addKey(Phaser.Keyboard.A);
    moverd = juego.input.keyboard.addKey(Phaser.Keyboard.D); // O la tecla que prefieras


    
    nnNetwork =  new synaptic.Architect.Perceptron(2, 6, 6, 2);
    nnEntrenamiento = new synaptic.Trainer(nnNetwork);
    nnNetwork2 =  new synaptic.Architect.Perceptron(2, 6, 6, 2);
    nnEntrenamiento2 = new synaptic.Trainer(nnNetwork2);
    nnNetwork3 =  new synaptic.Architect.Perceptron(2, 6, 6, 2);
    nnEntrenamiento3 = new synaptic.Trainer(nnNetwork3);

}

function enRedNeural(){
    nnEntrenamiento.train(datosEntrenamiento, {rate: 0.0003, iterations: 10000, shuffle: true});
    nnEntrenamiento2.train(datosEntrenamiento2, {rate: 0.0003, iterations: 10000, shuffle: true});
    nnEntrenamiento3.train(datosEntrenamiento3, {rate: 0.0003, iterations: 10000, shuffle: true});
}


function datosDeEntrenamiento(param_entrada){

    console.log("Entrada",param_entrada[0]+" "+param_entrada[1]);
    nnSalida = nnNetwork.activate(param_entrada);
    var aire=Math.round( nnSalida[0]*100 );
    var piso=Math.round( nnSalida[1]*100 );
    console.log("Valor ","En el Aire %: "+ aire + " En el suelo %: " + piso );
    return nnSalida[0]>=nnSalida[1];
}
function datosDeEntrenamiento2(param_entrada){
    console.log("Entrada",param_entrada[0]+" "+param_entrada[1]);
    nnSalida2 = nnNetwork2.activate(param_entrada);
    var aire=Math.round( nnSalida2[0]*100 );
    var piso=Math.round( nnSalida2[1]*100 );
    console.log("Valor ","En el Aire %: "+ aire + " En el suelo %: " + piso );
    return nnSalida2[0]>=nnSalida2[1];
}
function datosDeEntrenamiento3(param_entrada){
    console.log("Entrada",param_entrada[0]+" "+param_entrada[1]);
    nnSalida3 = nnNetwork3.activate(param_entrada);
    var aire=Math.round( nnSalida3[0]*100 );
    var piso=Math.round( nnSalida3[1]*100 );
    console.log("Valor ","En el Aire %: "+ aire + " En el suelo %: " + piso );
    return nnSalida3[0]>=nnSalida3[1];
}


function pausa(){
    juego.paused = true;
    menu = juego.add.sprite(w/2,h/2, 'menu');
    menu.anchor.setTo(0.5, 0.5);
}

function mPausa(event){
    if(juego.paused){
        var menu_x1 = w/2 - 270/2, menu_x2 = w/2 + 270/2,
            menu_y1 = h/2 - 180/2, menu_y2 = h/2 + 180/2;

        var mouse_x = event.x  ,
            mouse_y = event.y  ;

        if(mouse_x > menu_x1 && mouse_x < menu_x2 && mouse_y > menu_y1 && mouse_y < menu_y2 ){
            if(mouse_x >=menu_x1 && mouse_x <=menu_x2 && mouse_y >=menu_y1 && mouse_y <=menu_y1+90){
                eCompleto=false;
                datosEntrenamiento = [];
                datosEntrenamiento2 = [];
                datosEntrenamiento3 = [];
                modoAuto = false;
            }else if (mouse_x >=menu_x1 && mouse_x <=menu_x2 && mouse_y >=menu_y1+90 && mouse_y <=menu_y2) {
                if(!eCompleto) {
                    console.log("","Entrenamiento "+ datosEntrenamiento.length +" valores" );
                    enRedNeural();
                    eCompleto=true;
                }
                modoAuto = true;
            }

            menu.destroy();
            resetVariables();
            juego.paused = false;

        }
    }
}


function resetVariables(){
    jugador.body.velocity.x=0;
    jugador.body.velocity.y=0;
    bala.body.velocity.x = 0;
    bala.position.x = w-100;
    jugador.position.x = 50;
    jugador.position.y = 352;
    bala2.body.velocity.x = 0;
    bala2.position.y = 50;
    bala2.position.x = 50;
    bala3.position.y = h - 350;
    bala3.position.x = w - 100;
    bala3.body.velocity.x = 0;
    bala3.body.velocity.y = 0;
    balaD=false;
    balaD2 = false;
    bala3D =false;
}


function saltar(){
    jugador.body.velocity.y = -270;
}
function izquierda(){
    jugador.body.position.x = 0;
}
function derecha(){
    jugador.body.position.x = 80; // Mueve al extremo derecho
}



function update() {

    fondo.tilePosition.x -= 1; 

    juego.physics.arcade.collide(bala, jugador, colisionH, null, this);
    juego.physics.arcade.collide(bala2, jugador, colisionH, null, this);
    juego.physics.arcade.collide(bala3, jugador, colisionH, null, this);


    estatuSuelo = 1;
    estatusAire = 0;
    estatuSuelo2 = 1;
    estatusIzq = 0;
    estatusDer = 0;


    if(jugador.position.x==0) {
        estatuSuelo2 = 0;
        estatusIzq = 1;
    }

    if(jugador.position.x==80) {
        estatuSuelo2 = 0;
        estatusDer = 1;
    }

    if(!jugador.body.onFloor()) {
        estatuSuelo = 0;
        estatusAire = 1;
    }
	
    despBala = Math.floor( jugador.position.x - bala.position.x );
    despBala2 = Math.floor(jugador.position.y - bala2.position.y);
    despBala3 = Math.floor( jugador.position.x - bala3.position.x && jugador.position.y - bala3.position.y);

    if( modoAuto==false && salto.isDown &&  jugador.body.onFloor() ){
        saltar();
    }
    if( modoAuto==false && moveri.isDown &&  jugador.body.onFloor() ){
        izquierda();
    }
    if( modoAuto==false && moverd.isDown &&  jugador.body.onFloor() ){
        derecha();
    }
    
    if( modoAuto == true  && bala.position.x>0 && jugador.body.onFloor()) {
        if( datosDeEntrenamiento( [despBala , velocidadBala] )  ){
            saltar();
        }
    }

    if( modoAuto == true  && bala2.position.y<370 && jugador.body.onFloor()) {
        if( datosDeEntrenamiento2( [despBala2 , velocidadBala2] )  ){
            izquierda();
        }
    }

    if( modoAuto == true  && bala2.position.y<370 && jugador.body.onFloor()) {
        if( datosDeEntrenamiento3( [despBala2 , velocidadBala2] )  ){
            derecha();
        }
    }

    if( balaD==false ){
        disparo();
    }
    if( bala2D==false ){
        disparo2();
    }
    if( bala3D==false ){
        disparo3();
    }

    if( bala.position.x <= 0  ){
        resetVariables();
    }

    if (bala2.position.y >= 370) {
        resetVariables();
    }
    
    
    if( modoAuto ==false  && bala.position.x > 0){

        datosEntrenamiento.push({
                'input' :  [despBala , velocidadBala],
                'output':  [estatusAire , estatuSuelo ]  
        });

        console.log("Desplazamiento Bala1, Velocidad Bala1, Estatus, Estatus: ",
        despBala + " " +velocidadBala + " " + estatusAire+" "+  estatuSuelo);
   }

   if( modoAuto ==false  && bala2.position.y<370){
    datosEntrenamiento3.push({
        'input' :  [despBala2, velocidadBala2],
        'output':  [estatusDer , estatuSuelo2 ]  
});
    console.log("Desplazamiento Bala2, Velocidad Bala2, Estatus, Estatus: ",
        despBala2 + " " +velocidadBala2+ " " + estatusDer+" "+  estatuSuelo2);
}

   if( modoAuto ==false  && bala2.position.y<370){
    datosEntrenamiento2.push({
        'input' :  [despBala2, velocidadBala2],
        'output':  [estatusIzq , estatuSuelo2 ]  
});
    console.log("Desplazamiento Bala2, Velocidad Bala2, Estatus, Estatus: ",
        despBala2 + " " +velocidadBala2+ " " + estatusIzq+" "+  estatuSuelo2);
}

}


function disparo(){
    velocidadBala =  -1 * velocidadRandom(300,800);
    bala.body.velocity.y = 0 ;
    bala.body.velocity.x = velocidadBala ;
    balaD=true;
}

function disparo2() {
    velocidadBala2 = 0;
    bala2.body.velocity.y = velocidadBala2;
    bala2.body.velocity.x = 0;
    bala2D = true;
}

function disparo3() {
    velocidadBala3 = -1 * velocidadRandom(300, 700);
    bala3.body.velocity.y = 0;
    bala3.body.velocity.x = velocidadBala3;
    bala3D = true;
}

function colisionH(){
    pausa();
}

function velocidadRandom(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function render(){

}
~~~

<h3>
Este código implementa un juego con la biblioteca Phaser y una red neuronal utilizando Synaptic.js para el entrenamiento y toma de decisiones del personaje principal del juego. Aquí está el resumen de lo que hace cada parte del código:

Variables y Configuración Inicial
Dimensiones del juego: w y h definen el ancho y alto del juego.
Sprites: jugador, fondo, bala, nave, entre otros.
Entradas del jugador: salto, moveri, moverd.
Configuración de la red neuronal: nnNetwork, nnEntrenamiento, datosEntrenamiento, entre otros.
Función preload
Carga las imágenes y sprites necesarios para el juego.

Función create
Configura el sistema de físicas de Phaser.
Añade el fondo, las naves y balas al juego.
Configura la física para el jugador y las balas.
Añade controles de teclado para el jugador.
Inicializa las redes neuronales (nnNetwork, nnNetwork2, nnNetwork3) y sus respectivos entrenadores (nnEntrenamiento, nnEntrenamiento2, nnEntrenamiento3).
Función enRedNeural
Entrena las redes neuronales con los datos de entrenamiento acumulados.

Funciones datosDeEntrenamiento, datosDeEntrenamiento2, datosDeEntrenamiento3
Activan la red neuronal con los parámetros de entrada.
Calculan las salidas (probabilidades de estar en el aire o en el suelo).
Devuelven una decisión basada en las salidas de la red.
Función pausa y mPausa
Pausan el juego y muestran un menú.
Permiten al jugador reiniciar o activar el modo automático.
Función resetVariables
Restablece las posiciones y velocidades del jugador y las balas.

Funciones saltar, izquierda, derecha
Controlan el movimiento del jugador.

Función update
Actualiza la posición del fondo.
Detecta colisiones entre las balas y el jugador.
Calcula estados del jugador (suelo, aire, izquierda, derecha).
Implementa la lógica del movimiento automático basado en las decisiones de la red neuronal.
Gestiona el disparo de las balas.
Acumula datos de entrenamiento cuando el modo automático está desactivado.
Funciones disparo, disparo2, disparo3
Disparan las balas con velocidades aleatorias.

Función colisionH
Pausa el juego en caso de colisión.

Función velocidadRandom
Genera una velocidad aleatoria dentro de un rango dado.

Función render
No hace nada en esta implementación.

Resumen General
Este juego utiliza la biblioteca Phaser para crear un entorno donde un jugador puede moverse y esquivar balas. Además, implementa redes neuronales para entrenar al jugador a moverse automáticamente en función de la posición y velocidad de las balas. El modo automático se puede activar después de acumular suficientes datos de entrenamiento manual.</h3>