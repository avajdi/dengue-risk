function out=phivh(T)
%daily centigrade
dum=(T>=13.4)&(T<=27);
dum1=T<13.4;
dum2=T>27;
out=T;
T=T(dum);
out(dum)=0.0729*T-0.97;


out(dum1)=0;
out(dum2)=1;

end