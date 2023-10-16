function rate=egg_development_rate(temprature)
%hourly centigrade
temp=temprature;

if (7.2<temp) && (temp<16)
        rate=-0.00157+temp* 2.21e-04;
elseif (temp>=16) && (temp<31)
            rate=-0.017651+temp* 0.001273+(temp^2)*-1.1166e-06;
elseif (temp>=31) && (temp<38)
                rate=-0.240513+temp* 0.01+(temp^2)*-2.761574e-06+(temp^3)*-1.43213e-07+(temp^4)*-5.91e-09+(temp^5)*-3.883e-10+(temp^6)*-2.792e-11;
else
      rate=0;
end

            
          
end


% %% egg devlopement rates 
% clear
% 
% x=[7,12,16,22,25,28,31,35,38]'; %in centigrade
% y=[0,0.00104,0.002,0.0102,0.0129,0.0163,0.0207,0.0198,0]'; %hour^(-1)
% 
% 
% 
% 
% x1=[7,12,16]';
% y1=[0,0.00104,0.002]';
% 
% regmat=[ones(length(x1),1),x1];
% 
% 
% 
% [B,FitInfo]=lasso(regmat(:,2:end),y1);
% beta0B=[FitInfo.Intercept;B];
% 
% Epred=regmat*beta0B;
% Ereal=repmat(y1,1,length(FitInfo.Lambda));
% e=sum(abs(Epred-Ereal),1);
% 
% plot(1:length(FitInfo.Lambda),e,'kx')
% 
% 
% 
% p1=(7:.1:16)';
% regmat2=[ones(length(p1),1),p1];
% yp1=regmat2*beta0B;
% 
% plot(x1,y1,'o');
% hold on
% l=1;
% plot(p1,yp1(:,l),'-');
% hold on
% 
% ylim([0, 0.025]);
% 
% %for 7<temp<16 then rate= -0.001572200437158+temp* 2.216171803278689e-04
% %plot(p1,-0.00157+p1* 2.21e-04)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x=[7,12,16,22,25,28,31,35,38]';
% y=[0,0.00104,0.002,0.0102,0.0129,0.0163,0.0207,0.0198,0]';
% 
% x2=[16,22,25,28,31]';
% y2=[0.002,0.0102,0.0129,0.0163,0.0207]';
% 
% 
% 
% 
% regmat=[ones(length(x2),1),x2,x2.^2,x2.^3,x2.^4,x2.^5,x2.^6,x2.^7];
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
% p2=(16:.1:31)';
% regmat2=[ones(length(p2),1),p2,p2.^2,p2.^3,p2.^4,p2.^5,p2.^6,p2.^7];
% yp2=regmat2*beta0B;
% figure
% plot(x2,y2,'o');
% hold on
% l=1;
% plot(p2,yp2(:,l),'-');
% hold on
% 
% ylim([0, 0.025]);
% %for 16=<temp<31 then rate= -0.017650775748103+temp*
% %0.001272898354441+temp.^2*-1.116599721671008e-06 up to second order
% %plot(p2,-0.017651+p2* 0.001273+(p2.^2)*-1.1166e-06)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x=[7,12,16,22,25,28,31,35,38]';
% y=[0,0.00104,0.002,0.0102,0.0129,0.0163,0.0207,0.0198,0]';
% 
% x3=[31,35,38]';
% y3=[0.0207,0.0198,0]';
% 
% 
% 
% 
% regmat=[ones(length(x3),1),x3,x3.^2,x3.^3,x3.^4,x3.^5,x3.^6];
% % regmat=[ones(length(x3),1),x3];
% 
% 
% 
% [B,FitInfo]=lasso(regmat(:,2:end),y3);
% beta0B=[FitInfo.Intercept;B];
% figure
% Epred=regmat*beta0B;
% Ereal=repmat(y3,1,length(FitInfo.Lambda));
% e=sum(abs(Epred-Ereal),1);
% 
% plot(1:length(FitInfo.Lambda),e,'kx')
% 
% 
% 
% p3=(31:.1:38)';
% regmat2=[ones(length(p3),1),p3,p3.^2,p3.^3,p3.^4,p3.^5,p3.^6];
% % regmat2=[ones(length(p3),1),p3];
% yp3=regmat2*beta0B;
% figure
% plot(x3,y3,'o');
% hold on
% l=1;
% plot(p3,yp3(:,l),'-');
% hold on
% 
% ylim([0, 0.025]);
% 
% 
% %for 31=<temp<38 then rate= -0.240512841941736+temp*
% %0.009994330858996+temp.^2*-2.761573736891963e-06 up to second order
% %plot(p3,-0.240513+p3* 0.01+(p3.^2)*-2.761574e-06+(p3.^3)*-1.43213e-07+(p3.^4)*-5.91e-09+(p3.^5)*-3.883e-10+(p3.^6)*-2.792e-11)
% 
% plot(p3,-0.240513+p3* 0.01+(p3.^2)*-2.761574e-06+(p3.^3)*-1.43213e-07+(p3.^4)*-5.91e-09+(p3.^5)*-3.883e-10+(p3.^6)*-2.792e-11)
% 
% figure;
% plot([x1;x2;x3],[y1;y2;y3],'o');
% hold on
% l=1;
% plot([p1;p2;p3],[yp1(:,l);yp2(:,l);yp3(:,l)],'-');
% 
% hold on
% plot(p1,-0.00157+p1* 2.21e-04)
% plot(p2,-0.017651+p2* 0.001273+(p2.^2)*-1.1166e-06)
% plot(p3,-0.240513+p3* 0.01+(p3.^2)*-2.761574e-06+(p3.^3)*-1.43213e-07+(p3.^4)*-5.91e-09+(p3.^5)*-3.883e-10+(p3.^6)*-2.792e-11)


