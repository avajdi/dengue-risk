
function rate=egg_death_rate(temprature)
%daily centigrade
temp=temprature;
x=[-6.2,1.1,16,22,25,28,31,35,40,45];
y=[1,0.0274,0.0102,0.0145,0.0123,0.0249,0.0858,0.290,.48,1];

if (temp<=-6.2) || (temp>=45)
    rate=1;
else
    ind=find(x<=temp);
    ind=ind(end);
    rate=linear(temp,x(ind),x(ind+1),y(ind),y(ind+1));
end

end


