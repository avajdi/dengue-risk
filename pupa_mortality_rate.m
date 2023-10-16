function rate=pupa_mortality_rate(temprature)
%daily centigrade
T=temprature;

if (T>40)||(T<10)
    
    rate=1;
else
    b=[4.256e-1;-3.248e-2;7.06e-4;4.395e-7]; 
    
    mat=[1,T,T^2,T^3];
    rate=max(mat*b,0);
end

end

