clc
close all
clear all

dados1 = readtable('TripB22.csv'); 
cor1 = table2array(dados1(:,8));
t1 = table2array(dados1(:,1));

dados2 = readtable('TripB27.csv'); 
cor2 = table2array(dados2(:,8));
t2 = table2array(dados2(:,1));

dados3 = readtable('TripB29.csv'); 
cor3 = table2array(dados3(:,8));
t3 = table2array(dados3(:,1));

M = 500;

cor_m1 = movmean(cor1,M,'omitnan');

cor_m2 = movmean(cor2,M,'omitnan');

cor_m3 = movmean(cor3,M,'omitnan');

desv1 = std(cor1,0,'omitnan')
desv2 = std(cor2,0,'omitnan')
desv3 = std(cor3,0,'omitnan')

% a = mean(cor_m1,'omitnan');
% b = median(cor_m1);
% al = sqrt(2*((a/b)-1));
% normal1 = makedist('Normal','mu',a,'sigma',desv1);
% poisson1 = makedist('Poisson','lambda',a);
% ray1 = makedist('rayleigh','b',a);
% exp1 = makedist('Exponential','mu',a);

aux = 50; %número de subdivisões bins


cor_HF1 = cor1 - cor_m1;
cor_HF2 = cor2 - cor_m2;
cor_HF3 = cor3 - cor_m3;

ker2 = fitdist(cor_HF1,'Kernel');
ker22 = fitdist(cor_HF2,'Kernel');
ker23 = fitdist(cor_HF3,'Kernel');


pdf1 = pdf(ker2,cor_HF1);
pdf2 = pdf(ker22,cor_HF2);
pdf3 = pdf(ker23,cor_HF3);

pdf_e1 = 10000*pdf1;
pdf_e2 = 10000*pdf2;
pdf_e3 = 10000*pdf3;




plot(t1,cor_m1);
hold on
plot(t1,cor1);
figure
plot(t1,cor_HF1)
figure
hist(cor_HF1,70);
hold on
plot(cor_HF1,pdf_e1);
figure






% normal2 = fitdist(cor_HF1,'Normal');
ray2 = fitdist(cor_HF1,'rayleigh');
% t_de2 = fitdist(cor_HF1,'tLocationScale');
% satb2 = fitdist(cor_HF1,'Stable');
% logis2 = fitdist(cor_HF1,'Logistic');


poisson2 = fitdist(cor1,'Poisson');
gam2 = fitdist(cor1,'Gamma');
naka2 = fitdist(cor1,'Nakagami');
wei2 = fitdist(cor1,'Weibull');
% ric2 = fitdist(cor1,'Rician');
% log2 = fitdist(cor1,'Lognormal');
% loglogis2 = fitdist(cor1,'Loglogistic');
% invgaus2 = fitdist(cor1,'InverseGaussian');

% f1 = 10;
% 
% F1 = fft(cor1);
% F2 = fft(cor2);
% F3 = fft(cor3);
% 
% L1 = length(cor1);
% L2 = length(cor2);
% L3 = length(cor3);
% 
% P2_1 = abs(F1/L1);
% P1_1 = P2_1(1:L1/2+1);
% P1_1(2:end-1) = 2*P1_1(2:end-1);
% f1 = F1*(0:(L1/2))/L1;


% qqplot(cor_HF1,ker2);
% figure
% qqplot(cor_HF2,ker22);
% figure
% qqplot(cor_HF3,ker23);
% figure
% qqplot(cor_HF1,logis2);
% figure
% qqplot(cor_HF1,satb2);
% figure
% qqplot(cor_HF1,t_de2);
% figure
% qqplot(cor_HF1,exp1);
% figure
% qqplot(cor_HF1,normal2);
% figure
% qqplot(cor_HF1,poisson1);
% figure
qqplot(cor_HF1,ray2);
figure
% qqplot(cor1,poisson2);
% figure
qqplot(cor1,gam2);
figure
qqplot(cor1,naka2);
figure
qqplot(cor1,wei2);
% figure
% qqplot(cor1,ric2);
% figure
% qqplot(cor1,log2);
% figure
% qqplot(cor1,loglogis2);
% figure
% qqplot(cor1,invgaus2);
%figure
%plot(t1,cor_HF1)