function [f,R0]=Calculate_R0_VectorPopulation(temptot,fofprectot,Nh,J,Biti,modlcl)

temptot=reshape(temptot,[],1);
fofprectot=reshape(fofprectot,[],1);
 Je=J; se=[1,J]; Jl=J; sl=se(2)+[1,J]; Jp=J; sp=sl(2)+[1,J]; Jf1=J; sf1=sp(2)+[1,J]; Jf2=J; sf2=sf1(2)+[1,J]; 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp=temptot(1:365); 
temp=repmat(temp,2,1);

fofprec=fofprectot(1:365); 
fofprec=repmat(fofprec,2,1);

Cl=modlcl(2,min(round((2+fofprec*1e4)/2),251))*Nh;

    A0=10*Nh/1000;
    V0=10*Nh/1000;

y0 = zeros(sf2(2),1); y0(1:sp(2))=A0/sp(2);  y0((sp(2)+1):end)=V0/(sf2(2)-sp(2));

tspan=[0.01,30,365*2];
[~,y] = ode45(@(t,y) odefunc(t,y,Je,se,Jl,sl,Jp,sp,Jf1,sf1,Jf2,sf2,Cl,temp), tspan, y0);
y0=y(end,:)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
Cl=modlcl(2,min(round((2+fofprectot*1e4)/2),251))*Nh;

tspan=[0.01,1:length(temptot)];
[~,y] = ode45(@(t,y) odefunc(t,y,Je,se,Jl,sl,Jp,sp,Jf1,sf1,Jf2,sf2,Cl,temptot), tspan, y0);
y=y(2:end,:);
         e=sum(y(:,se(1):se(2)),2);  l=sum(y(:,sl(1):sl(2)),2); p=sum(y(:,sp(1):sp(2)),2);
        f=sum(y(:,sf1(1):sf1(2)),2)+sum(y(:,sf2(1):sf2(2)),2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f=reshape(f,[],1);
temptot=reshape(temptot,[],1);
gamae=temptot*0;
muV=temptot*0;
gamVE=temptot*0;
for i=1:length(temptot)
gamae(i)=16/12*Gonotrophic(temptot(i))*24;
muV(i)=Female_mortality(temptot(i));
gamVE(i)=gamaV(temptot(i));
end
etah=1/4;
f=(f/Nh);
R0=f.*((Biti*gamae).^2).*phivh(temptot).*phihv(temptot)./(etah*muV.*(1+muV./gamVE));
% R0=f.*((Biti*gamae).^2).*phivh(temptot).*phihv(temptot)./(etah*muV.*((1+muV./(J*gamVE)).^J));    
 
       
end
