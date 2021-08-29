clc
clear
load('EEG.mat')
%Parametrizacion
N=length(EEG);
Fs=1000;...Frecuencia de Muestreo
Nm=N/2;...Numero de Muestras
%2.2.1
t=0:1/Fs:(1/Fs)*(N-1);...Vector Tiempo
%2.2.2
Fm=Fs/2;...Frecuencia de Nyquist
f=0:Fm/Nm:Fm/Nm*(Nm-1);...Vector Frecuencia

%3.2.3
%Beta
n=5;...Orden
fc1=0.5;...Aqui definimos
fc2=4;...Las Frecuencias de Corte
... En Beta son [0.5-4]Hz
%Filtros Butter
%Pasa Altas
[b1,a1]=butter(n,fc1/Fm,'high');...Coeficiente de Polinomios
%Pasa Bajas
[b2,a2]=butter(n,fc2/Fm,'low');...Coeficiente de Polinomios

%3.2.4
%Traemos la Señal
E1b=EEG(:,1);
E1bT=fft(E1b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb1=E1bT.*conj(E1bT)/N;...Epectro Espejo
PE1bM=PEb1(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE1bM)
grid on
title('Espectro de Potencial E1')
ylabel("PE1")

%Señal Filtrada HC
E1bHC=filter(b1,a1,E1b);
E1bHCT=fft(E1bHC);
PE1bHC=E1bHCT.*conj(E1bHCT)/N;
PE1bHCM=PE1bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE1bHCM)
grid on
title('Espectro de Potencial E1: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E1LC=filter(b2,a2,E1bHC);
E1LCT=fft(E1LC);
PE1LC=E1LCT.*conj(E1LCT)/N;
PE1LCM=PE1LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE1LCM)
grid on
title('Espectro de Potencial E1: Banda Alfa')
ylabel("PE1Alfa")

%/-----------------------------------------------------------------/

%3.2.4
%Alfa
n=5;...Orden
fc1=8;...Aqui definimos
fc2=13;...Las Frecuencias de Corte
... En Alfa son [8-13]Hz
%Filtros Butter
%Pasa Altas
[b1,a1]=butter(n,fc1/Fm,'high');...Coeficiente de Polinomios
%Pasa Bajas
[b2,a2]=butter(n,fc2/Fm,'low');...Coeficiente de Polinomios

%3.2.5
%Traemos la Señal
E1=EEG(:,1);
E1T=fft(E1);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE1=E1T.*conj(E1T)/N;...Epectro Espejo
PE1M=PE1(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE1M)
grid on
title('Espectro de Potencial E1')
ylabel("PE1")

%Señal Filtrada HC
E1HC=filter(b1,a1,E1);
E1HCT=fft(E1HC);
PE1HC=E1HCT.*conj(E1HCT)/N;
PE1HCM=PE1HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE1HCM)
grid on
title('Espectro de Potencial E1: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E1LC=filter(b2,a2,E1HC);
E1LCT=fft(E1LC);
PE1LC=E1LCT.*conj(E1LCT)/N;
PE1LCM=PE1LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE1LCM)
grid on
title('Espectro de Potencial E1: Banda Alfa')
ylabel("PE1Alfa")

%Energias
EE1A=sum(PE1LCM.*PE1LCM)/Nm

%%
    


