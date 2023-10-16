function out=gamaV(T)
%daily centigrade
alpha=1;
T=T+273.15;
out=(0.003359/298)*T.*exp((15000/1.9872)*(1/298-1./T))./...
    (1+exp((6.203e21/1.9872)*(1/(-2.176e30)-1./T)))*24;
out=out*alpha;

end
