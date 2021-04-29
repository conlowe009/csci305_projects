import 'dart:html';
import 'dart:async';

//Class for canvas actions
class Canvas {
  static CanvasElement canvas;
  static CanvasRenderingContext2D ctx;
}

//Setup the ball class
class Ball {
  static double x = 50;
  static double y = 40;
  static double radius = 25; 
  static double vx = 0;
  static double vy = 0; 
}

//Main
void main() {
  //Call the canvas object and context 
  Canvas.canvas = querySelector('#canvas');
  Canvas.ctx = Canvas.canvas.getContext('2d');
  
  //Create fill and color for the canvas
  Canvas.ctx..fillStyle = "red";
  Canvas.ctx..strokeStyle = "white";  
  
  //Apply gravity to ball continuously
  ballGravity();
  
  //Listener for moving the ball on the mouse click
  querySelector('#canvas').onClick.listen(moveBall);
}

//Function for updating the position of the ball with the position of the mouse pointer
void moveBall (MouseEvent event) {
  var ctx = Canvas.ctx;
  var clientRect = ctx.canvas.getBoundingClientRect();

  //Update ball position with position of mouse pointer
  Ball.x = event.client.x - clientRect.left;
  Ball.y = event.client.y - clientRect.top;  
  drawBall();
}

//Function to give the ball physics
void ballGravity() {
  //Set up an interval to run the timer function within
  final duration = Duration(milliseconds: 7);
  
  //Use a periodic timer function to conitinuously run the ball physics
  Timer.periodic(duration, (timer) { 
    //Apply velocity
    Ball.x += Ball.vx;
    Ball.y += Ball.vy;
  
    //Apply drag and friction to velocity
    Ball.vx *= .99;
    Ball.vy *= .99;
  
    //Apply gravity to velocity
    Ball.vx += .25;
    Ball.vy += .25;
  
    //Check for collisions
    if (Ball.y + Ball.radius > Canvas.canvas.height) {
      Ball.y = Canvas.canvas.height - Ball.radius;
      Ball.vy = -((Ball.vy).abs());
    }
    if (Ball.x + Ball.radius > Canvas.canvas.width) {
      Ball.x = Canvas.canvas.width - Ball.radius;
      Ball.vx = -((Ball.vx).abs());
    }
  
    //Redraw ball after updated physics
    drawBall();
  });
}

//Function to draw the ball 
void drawBall() {
  //Reassigning this variable for something easier to type
  var ctx = Canvas.ctx;  
  var ballRadius = Ball.radius;

  //Clears board
  clear();
  
  //Creates the ball 
  ctx.beginPath();
  ctx.arc(Ball.x, Ball.y, ballRadius, 0, 3.14*2);
  ctx.fillStyle = "red";
  ctx.fill();
  ctx.closePath();
}

//Creates a blank canvas 
void clear() { 
    Canvas.ctx..fillStyle= "white"
    ..fillRect(0,0, 
               Canvas.canvas.width, 
               Canvas.canvas.height);
}
