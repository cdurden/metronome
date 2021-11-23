import graph;
import animation;

size(0,200);

pen roundcap=linecap(1);
pen p=roundcap+10;
defaultpen(p);
dotfactor=4;

pair metronomePoint(real t)
{
  real omega=1;
  real theta0=0.436;
  return (sin(theta0*sin(omega*t)),cos(theta0*sin(omega*t)));
}

real bpm={{bpm}};
real T=60/bpm*2;
real delay=2; // 2/100 second delay between frames = 50 fps
int n=floor(T/delay*100); // Number of frames

animation a;
real alpha=1.42;
real beta=0.605;
real gamma=0.78;
real delta=1.14;
real epsilon=0.09;

real dt=(T)/n;
for(int i=0; i <= n; ++i) {
  save();

  real t=dt*i;
  draw((-alpha,alpha)--(alpha,alpha),invisible);
  draw((-gamma*(1/(1+beta)),0)--(gamma*(1/(1+beta)),0));

  draw((0,0)--alpha*metronomePoint(t*2*pi/T));
  fill(circle(delta*metronomePoint(t*2*pi/T),epsilon),white);
  draw(circle(delta*metronomePoint(t*2*pi/T),epsilon));
  draw((-gamma,-beta)--(gamma,-beta));
  draw((-gamma,-beta)--(0,1));
  draw((gamma,-beta)--(0,1));


  a.add(); // Add currentpicture to animation.
  shipout("output"+format("%03d",i));
  erase();
  //restore();
}

erase();

// Merge the images into a gif animation.
//a.movie(BBox(0.5cm),loops=0,delay=delay);
