function dydt = odefunc(t,y,ale,se,all,sl,alp,sp,alf1,sf1,alf2,sf2,Cl,Tem)

y(y<0)=0;
temp=Tem(ceil(t));
Clt=Cl(ceil(t));
gamet=egg_development_rate(temp)*24;
muet=egg_death_rate(temp);

ovt=numeg(temp);
gamf1t=Gonotrophic(temp)*24;
muf1t=Female_mortality(temp);
gamf2t=10/6*Gonotrophic(temp)*24;
muf2t=Female_mortality(temp);

gamlt=Larva_development_rate(temp);
mult=larva_mortality_rate(temp);

gampt=Pupa_development_rate(temp);
mupt=pupa_mortality_rate(temp);





  dydt = zeros(length(y),1);

dydt(se(1))=alf1*gamf1t*ovt*y(sf1(2))+alf2*gamf2t*ovt*y(sf2(2))-y(se(1))*(ale*gamet+muet);

for i=(se(1)+1):se(2)
   dydt(i)=y(i-1)*(ale*gamet)-y(i)*(ale*gamet+muet);
end

dydt(sl(1))=max(1-sum(y(sl(1):sl(2)))/Clt,0)*(ale*gamet*y(se(2)))-y(sl(1))*(all*gamlt+mult);

for i=(sl(1)+1):sl(2)
   dydt(i)=y(i-1)*(all*gamlt)-y(i)*(all*gamlt+mult);
end

dydt(sp(1))=all*gamlt*y(sl(2))-y(sp(1))*(alp*gampt+mupt);

for i=(sp(1)+1):sp(2)
   dydt(i)=y(i-1)*(alp*gampt)-y(i)*(alp*gampt+mupt);
end

%half of pupa becomefemale
dydt(sf1(1))=0.5*alp*gampt*y(sp(2))-y(sf1(1))*(alf1*gamf1t+muf1t);

for i=(sf1(1)+1):sf1(2)
   dydt(i)=y(i-1)*(alf1*gamf1t)-y(i)*(alf1*gamf1t+muf1t);
end

dydt(sf2(1))=alf1*gamf1t*y(sf1(2))+alf2*gamf2t*y(sf2(2))-y(sf2(1))*(alf2*gamf2t+muf2t);

for i=(sf2(1)+1):sf2(2)
   dydt(i)=y(i-1)*(alf2*gamf2t)-y(i)*(alf2*gamf2t+muf2t);
end



  
 
end
