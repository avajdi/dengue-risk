function rate=numeg(temprature)
%daily centigrade
temp=temprature;
x=[10,15.3,16.5,20,21.79,25.64,27.64,31.33,33.41,40];
y=[0,2,7.3,14,13,17,17.6,15.5,11.73,0];

if (temp<=10) || (temp>=40)
    rate=0;
else
    ind=find(x<=temp);
    ind=ind(end);
    rate=linear(temp,x(ind),x(ind+1),y(ind),y(ind+1));
end

end