function out=phihv(T)
%daily centigrade
dum=(T>=12.3)&(T<=32.461);
out=T;
T=T(dum);
out(dum)=0.001044*T.*(T-12.286).*((32.461-T).^(1/2));


out(~dum)=0;

end