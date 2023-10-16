function rate=Pupa_development_rate(temprature)

%daily centigrade

T=temprature;

if (T>=40.3)||(T<=9.9)
    
    rate=0;
else
    %b=[21.902;-10.311;2.051;-2.242e-1;1.469e-2;-5.887e-4;1.411e-5;
    %-1.852e-7;1.022e-9]; from yang but did not work
    b=[-0.426869237527704;0.062496053850089;-0.002038578933687;0;
        9.421108489840427e-07;2.566279862691307e-08;2.288289917484751e-11;
        -1.065058060341299e-14;-5.873515428269140e-13];
    mat=[1,T,T^2,T^3,T^4,T^5,T^6,T^7,T^8];
    rate=max(mat*b,0);
end

end


%clear


% x2=[10,10.38,10.45,14.74,14.84,14.92,18.86,19.04,19.18,26.56,26.84,26.85,30.83,31.61,34.95,36.47,36.55,39.95,40.16,40.64]';
% y2=[0,0,0,0.17969,.13782,.03561,.2107,.24643,.24693,.45905,.42216,.44117,.69297,.64697,.82961,.68905,.68518,0,0,0]';
% 
% regmat=[ones(length(x2),1),x2,x2.^2,x2.^3,x2.^4,x2.^5,x2.^6,x2.^7,x2.^8];
% 
% 
% 
% [B,FitInfo]=lasso(regmat(:,2:end),y2);
% beta0B=[FitInfo.Intercept;B];
% figure
% Epred=regmat*beta0B;
% Ereal=repmat(y2,1,length(FitInfo.Lambda));
% e=sum(abs(Epred-Ereal),1);
% 
% plot(1:length(FitInfo.Lambda),e,'kx')
% 
% 
% 
% p2=(9.5:.1:40.5)';
% regmat2=[ones(length(p2),1),p2,p2.^2,p2.^3,p2.^4,p2.^5,p2.^6,p2.^7,p2.^8];
% yp2=regmat2*beta0B;
% figure
% plot(x2,y2,'o');
% hold on
% l=1;
% plot(p2,yp2(:,l),'-');
% hold on

