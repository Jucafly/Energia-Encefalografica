%%
clc
clear
load('EEG.mat')
%3.2.1
%Definimos fs a 1Hz
fs=1000;
%Numero de Muestras
N=30820;
Nm=N/2;
%Calculamos el Vector de tiempo
t=0:1/fs:(1/fs)*(N-1); 
...plot(t)
f=fs*(0:Nm-1)/N;
E1x=EEG(:,1); ...Registros F3
E1x=E1x';
plot(t,E1x')
