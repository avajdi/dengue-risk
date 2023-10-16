function rate=Female_mortality(temprature)
%daily centigrade
T=temprature;
x=[0,4.4,10,34,35,42];
y=[1,1/3,0.0925,0.05946,0.1,1];
if (T>=42)||(T<=0)
    
    rate=1;
elseif (T>=35)&&(T<42)
    ind=5;
    rate=linear(T,x(ind),x(ind+1),y(ind),y(ind+1));
elseif (T>=34)&&(T<35)
    ind=4;
    rate=linear(T,x(ind),x(ind+1),y(ind),y(ind+1));
elseif (T>0)&&(T<=4.4)
    ind=1;
    rate=linear(T,x(ind),x(ind+1),y(ind),y(ind+1));
elseif (T>4.4)&&(T<=10)
    ind=2;
    rate=linear(T,x(ind),x(ind+1),y(ind),y(ind+1));
elseif (T>10)&&(T<34)
    b=[.8692;-.1590;.01116;-.0003408;0.000003809];
    mat=[1,T,T^2,T^3,T^4];
    rate=mat*b;
end

end






