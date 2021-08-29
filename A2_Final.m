%/-----------------------------E1-------------------------/
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
plot(f,PE1bM,'r')
grid on
title('Espectro de Potencial E1')
ylabel("PE1")

%Señal Filtrada HC
E1bHC=filter(b1,a1,E1b);
E1bHCT=fft(E1bHC);
PE1bHC=E1bHCT.*conj(E1bHCT)/N;
PE1bHCM=PE1bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE1bHCM,'g')
grid on
title('Espectro de Potencial E1: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E1LC=filter(b2,a2,E1bHC);
E1LCT=fft(E1LC);
PE1LC=E1LCT.*conj(E1LCT)/N;
PE1LCM=PE1LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE1LCM,'b')
grid on
title('Espectro de Potencial E1: Banda Delta')
ylabel("PE1Delta")

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
plot(f,PE1M,'r')
grid on
title('Espectro de Potencial E1')
ylabel("PE1")

%Señal Filtrada HC
E1HC=filter(b1,a1,E1);
E1HCT=fft(E1HC);
PE1HC=E1HCT.*conj(E1HCT)/N;
PE1HCM=PE1HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE1HCM,'g')
grid on
title('Espectro de Potencial E1: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E1LC=filter(b2,a2,E1HC);
E1LCT=fft(E1LC);
PE1LC=E1LCT.*conj(E1LCT)/N;
PE1LCM=PE1LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE1LCM,'b')
grid on
title('Espectro de Potencial E1: Banda Alfa')
ylabel("PE1Alfa")

%Energias
EE1A=sum(PE1LCM.*PE1LCM)/Nm










%%
%/-----------------------------E2-------------------------/
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
E2b=EEG(:,2);
E2bT=fft(E2b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb2=E2bT.*conj(E2bT)/N;...Epectro Espejo
PE2bM=PEb2(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE2bM,'r')
grid on
title('Espectro de Potencial E2')
ylabel("PE2")

%Señal Filtrada HC
E2bHC=filter(b1,a1,E2b);
E2bHCT=fft(E2bHC);
PE2bHC=E2bHCT.*conj(E2bHCT)/N;
PE2bHCM=PE2bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE2bHCM,'g')
grid on
title('Espectro de Potencial E2: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E2LC=filter(b2,a2,E2bHC);
E2LCT=fft(E2LC);
PE2LC=E2LCT.*conj(E2LCT)/N;
PE2LCM=PE2LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE2LCM,'b')
grid on
title('Espectro de Potencial E2: Banda Delta')
ylabel("PE1Delta")

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
E2=EEG(:,2);
E2T=fft(E2);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE2=E2T.*conj(E2T)/N;...Epectro Espejo
PE2M=PE2(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE2M,'r')
grid on
title('Espectro de Potencial E2')
ylabel("PE2")

%Señal Filtrada HC
E2HC=filter(b1,a1,E2);
E2HCT=fft(E2HC);
PE2HC=E2HCT.*conj(E2HCT)/N;
PE2HCM=PE2HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE2HCM,'g')
grid on
title('Espectro de Potencial E2: Altas Frecuencias')
ylabel("PE1HC")

%Señal Filtrada LC
E2LC=filter(b2,a2,E2HC);
E2LCT=fft(E2LC);
PE2LC=E2LCT.*conj(E2LCT)/N;
PE2LCM=PE2LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE2LCM,'b')
grid on
title('Espectro de Potencial E2: Banda Alfa')
ylabel("PE2Alfa")

%Energias
EE2A=sum(PE2LCM.*PE2LCM)/Nm














%%
%/-----------------------------E3-------------------------/
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
E3b=EEG(:,3);
E3bT=fft(E3b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb3=E3bT.*conj(E3bT)/N;...Epectro Espejo
PE3bM=PEb3(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE3bM,'r')
grid on
title('Espectro de Potencial E3')
ylabel("PE3")

%Señal Filtrada HC
E3bHC=filter(b1,a1,E3b);
E3bHCT=fft(E3bHC);
PE3bHC=E3bHCT.*conj(E3bHCT)/N;
PE3bHCM=PE3bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE3bHCM,'g')
grid on
title('Espectro de Potencial E3: Altas Frecuencias')
ylabel("PE3HC")

%Señal Filtrada LC
E3LC=filter(b2,a2,E3bHC);
E3LCT=fft(E3LC);
PE3LC=E3LCT.*conj(E3LCT)/N;
PE3LCM=PE3LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE3LCM,'b')
grid on
title('Espectro de Potencial E3: Banda Delta')
ylabel("PE3Delta")

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
E3=EEG(:,3);
E3T=fft(E3);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE3=E3T.*conj(E3T)/N;...Epectro Espejo
PE3M=PE3(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE3M,'r')
grid on
title('Espectro de Potencial E3')
ylabel("PE3")

%Señal Filtrada HC
E3HC=filter(b1,a1,E3);
E3HCT=fft(E3HC);
PE3HC=E3HCT.*conj(E3HCT)/N;
PE3HCM=PE3HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE3HCM,'g')
grid on
title('Espectro de Potencial E3: Altas Frecuencias')
ylabel("PE3HC")

%Señal Filtrada LC
E3LC=filter(b2,a2,E3HC);
E3LCT=fft(E3LC);
PE3LC=E3LCT.*conj(E3LCT)/N;
PE3LCM=PE3LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE3LCM,'b')
grid on
title('Espectro de Potencial E3: Banda Alfa')
ylabel("PE3Alfa")

%Energias
EE3A=sum(PE3LCM.*PE3LCM)/Nm
















%%
%/-----------------------------E4-------------------------/
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
E4b=EEG(:,4);
E4bT=fft(E4b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb4=E4bT.*conj(E4bT)/N;...Epectro Espejo
PE4bM=PEb4(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE4bM,'r')
grid on
title('Espectro de Potencial E4')
ylabel("PE4")

%Señal Filtrada HC
E4bHC=filter(b1,a1,E4b);
E4bHCT=fft(E4bHC);
PE4bHC=E4bHCT.*conj(E4bHCT)/N;
PE4bHCM=PE4bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE4bHCM,'g')
grid on
title('Espectro de Potencial E4: Altas Frecuencias')
ylabel("PE4HC")

%Señal Filtrada LC
E4LC=filter(b2,a2,E4bHC);
E4LCT=fft(E4LC);
PE4LC=E4LCT.*conj(E4LCT)/N;
PE4LCM=PE4LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE4LCM,'b')
grid on
title('Espectro de Potencial E4: Banda Delta')
ylabel("PE4Delta")

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
E4=EEG(:,4);
E4T=fft(E4);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE4=E4T.*conj(E4T)/N;...Epectro Espejo
PE4M=PE4(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE4M,'r')
grid on
title('Espectro de Potencial E4')
ylabel("PE4")

%Señal Filtrada HC
E4HC=filter(b1,a1,E4);
E4HCT=fft(E4HC);
PE4HC=E4HCT.*conj(E4HCT)/N;
PE4HCM=PE4HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE4HCM,'g')
grid on
title('Espectro de Potencial E4: Altas Frecuencias')
ylabel("PE4HC")

%Señal Filtrada LC
E4LC=filter(b2,a2,E4HC);
E4LCT=fft(E4LC);
PE4LC=E4LCT.*conj(E4LCT)/N;
PE4LCM=PE4LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE4LCM,'b')
grid on
title('Espectro de Potencial E4: Banda Alfa')
ylabel("PE4Alfa")

%Energias
EE4A=sum(PE4LCM.*PE4LCM)/Nm









%%
%/-----------------------------E5-------------------------/
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
E5b=EEG(:,5);
E5bT=fft(E5b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb5=E5bT.*conj(E5bT)/N;...Epectro Espejo
PE5bM=PEb5(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE5bM,'r')
grid on
title('Espectro de Potencial E5')
ylabel("PE5")

%Señal Filtrada HC
E5bHC=filter(b1,a1,E5b);
E5bHCT=fft(E5bHC);
PE5bHC=E5bHCT.*conj(E5bHCT)/N;
PE5bHCM=PE5bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE5bHCM,'g')
grid on
title('Espectro de Potencial E5: Altas Frecuencias')
ylabel("PE5HC")

%Señal Filtrada LC
E5LC=filter(b2,a2,E5bHC);
E5LCT=fft(E5LC);
PE5LC=E5LCT.*conj(E5LCT)/N;
PE5LCM=PE5LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE5LCM,'b')
grid on
title('Espectro de Potencial E5: Banda Delta')
ylabel("PE5Delta")

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
E5=EEG(:,5);
E5T=fft(E5);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE5=E5T.*conj(E5T)/N;...Epectro Espejo
PE5M=PE5(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE5M,'r')
grid on
title('Espectro de Potencial E5')
ylabel("PE5")

%Señal Filtrada HC
E5HC=filter(b1,a1,E5);
E5HCT=fft(E5HC);
PE5HC=E5HCT.*conj(E5HCT)/N;
PE5HCM=PE5HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE5HCM,'g')
grid on
title('Espectro de Potencial E5: Altas Frecuencias')
ylabel("PE5HC")

%Señal Filtrada LC
E5LC=filter(b2,a2,E5HC);
E5LCT=fft(E5LC);
PE5LC=E5LCT.*conj(E5LCT)/N;
PE5LCM=PE5LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE5LCM,'b')
grid on
title('Espectro de Potencial E5: Banda Alfa')
ylabel("PE5Alfa")

%Energias
EE5A=sum(PE5LCM.*PE5LCM)/Nm











%%
%/-----------------------------E6-------------------------/
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
E6b=EEG(:,6);
E6bT=fft(E6b);...Señal Transformada (Compleja)
%Potencia del Electrodo
PEb6=E6bT.*conj(E6bT)/N;...Epectro Espejo
PE6bM=PEb6(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE6bM,'r')
grid on
title('Espectro de Potencial E6')
ylabel("PE6")

%Señal Filtrada HC
E6bHC=filter(b1,a1,E6b);
E6bHCT=fft(E6bHC);
PE6bHC=E6bHCT.*conj(E6bHCT)/N;
PE6bHCM=PE6bHC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE6bHCM,'g')
grid on
title('Espectro de Potencial E6: Altas Frecuencias')
ylabel("PE6HC")

%Señal Filtrada LC
E6LC=filter(b2,a2,E6bHC);
E6LCT=fft(E6LC);
PE6LC=E6LCT.*conj(E6LCT)/N;
PE6LCM=PE6LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE6LCM,'b')
grid on
title('Espectro de Potencial E6: Banda Delta')
ylabel("PE6Delta")

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
E6=EEG(:,6);
E6T=fft(E6);...Señal Transformada (Compleja)
%Potencia del Electrodo
PE6=E6T.*conj(E6T)/N;...Epectro Espejo
PE6M=PE6(1:Nm);...Espectro De Potencia (grf)
figure
%Configuraciones Grafica
subplot(3,1,1)
plot(f,PE6M,'r')
grid on
title('Espectro de Potencial E6')
ylabel("PE6")

%Señal Filtrada HC
E6HC=filter(b1,a1,E6);
E6HCT=fft(E6HC);
PE6HC=E6HCT.*conj(E6HCT)/N;
PE6HCM=PE6HC(1:Nm);...Espectro Potencia (grf)
subplot(3,1,2)
plot(f,PE6HCM,'g')
grid on
title('Espectro de Potencial E6: Altas Frecuencias')
ylabel("PE6HC")

%Señal Filtrada LC
E6LC=filter(b2,a2,E6HC);
E6LCT=fft(E6LC);
PE6LC=E6LCT.*conj(E6LCT)/N;
PE6LCM=PE6LC(1:Nm);...Espectro Potencia Alfa Final (grf)
subplot(3,1,3)
plot(f,PE6LCM,'b')
grid on
title('Espectro de Potencial E6: Banda Alfa')
ylabel("PE6Alfa")

%Energias
EE6A=sum(PE6LCM.*PE6LCM)/Nm







