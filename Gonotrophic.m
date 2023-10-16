function rate=Gonotrophic(temprature)
%hourly centigrade
T=temprature+273;
RR=1.987;
rho=0.00898;
d1=15725;
d2=1756481;
d3=447.17;

if (temprature>=31.33)
    T=31.33+273;
    rate=((rho*T/298)*exp((d1/RR)*((1/298)-(1/T))))/(1+exp((d2/RR)*((1/d3)-(1/T))));
else
    T=temprature+273;
    rate=((rho*T/298)*exp((d1/RR)*((1/298)-(1/T))))/(1+exp((d2/RR)*((1/d3)-(1/T))));
end

end






