function rate=larva_mortality_rate(temprature)
%daily centigrade
T=temprature;

if (T>=45.4)||(T<=4.2)
    
    rate=1;
else
    b=[2.315;-4.191e-1;2.735e-2;-7.538e-4;7.503e-6]; 
    
    mat=[1,T,T^2,T^3,T^4];
    rate=max(mat*b,0);
end

end

% b=[2.315;-4.191e-1;2.735e-2;-7.538e-4;7.503e-6;-5.887e-4;1.411e-5;
%     -1.852e-7;1.022e-9]; from yang but did not work