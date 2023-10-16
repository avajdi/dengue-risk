function rate=Larva_development_rate(temprature)
%daily centigrade
T=temprature;

if (T>=40)||(T<=11.5)
    
    rate=0;
else
    b=[-1.847;8.291e-1;-1.457e-1;1.304e-2;-6.461e-4;1.796e-5;-2.617e-7;1.551e-9];
    mat=[1,T,T^2,T^3,T^4,T^5,T^6,T^7];
    rate=max(mat*b,0);
end

end




