function [] = zn2( Gp )
rlocus(Gp);
[kcr,pole]=rlocfind(Gp);
wcr=max(imag(pole));
kc=0.5*kcr;
tcr=2*pi/wcr;
vector=[];
vector(1,1)=0.5*kcr;
vector(2,1)=0.45*kcr;
vector(3,1)=0.6*kcr;

vector(3,3)=0.125*kcr*tcr;
disp(' ');
disp('  Kp   ki   kd ');
disp(vector);
t=0:0.1:10; 
step(Gp,t);
hold on
GContp=tf(vector(1,1),[0 1]);
GpGcontp=series(Gp,GContp);
GpGcontpclc=feedback(GpGcontp,1); 
step(GpGcontpclc,t);
hold on
numpi=[vector(2,1) vector(2,2)];
dempi=[1 0];
Gpi=tf(numpi, dempi);
GpGpi=series(Gp,Gpi);
GpGpilc=feedback(GpGpi,1);
step(GpGpilc,t)
hold on
numpid=[vector(3,3) vector(3,1) vector(3,2)];
denpid=[1 0];
Gpid=tf(numpid,denpid);
GpGpid=series(Gp,Gpid);
GpGpidlc=feedback(GpGpid,1);
step(GpGpidlc,t);
grid
end

