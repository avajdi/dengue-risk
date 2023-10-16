%% calculate dengue risk
clear
load('CarryingCapacityModel.mat')
load('RiskModelNets.mat')
load('temperature_precipitation_florida.mat')
%latt=25.572464712510175; lonn=-80.56631784279442;%florida
precipitation_21_22_23_movmean14=movmean(precipitation_21_22_23,[14,0]);


Nh=5000;
Biti=0.839;
J=100;

[VectorPopulation,R0]=Calculate_R0_VectorPopulation(temperature_21_22_23,precipitation_21_22_23_movmean14,Nh,J,Biti,modlcl);
VectorPopulation=movmean(VectorPopulation,[30,0]);
R0=movmean(R0,[30,0]);

dumind=7:7:length(temperature_21_22_23);
VectorPopulation=VectorPopulation(dumind);
R0=R0(dumind);

xpr=[(R0'-dum1/2)/(2*dum1);(VectorPopulation'-dum2/2)/(2*dum2)];
risk=[];
for nn=1:100
    net=netset{nn};
    risk=[risk;net(xpr)];
end
risk=(mean(risk,1)+1)/2;
daterisk=datetime(2021,1,0)+days(dumind);

figure
plot(daterisk,R0)
figure
plot(daterisk,VectorPopulation)
figure
plot(daterisk,risk)
