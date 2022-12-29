
 m_Fs=8192;
 Ts=1/m_Fs;
 t=[0:Ts:1];
 
 F_do=262;
 F_re=294;
 F_mi=330;
 F_fa=349;
 F_sol=392; 
 F_la=440; 
 F_si=494;
 F_do2=523;
 
 Do=sin(2*pi*F_do*t); 
 re=sin(2*pi*F_re*t);
 mi=sin(2*pi*F_mi*t);
 fa=sin(2*pi*F_fa*t);
 sol=sin(2*pi*F_sol*t);
 la=sin(2*pi*F_la*t);
 si=sin(2*pi*F_si*t);
 do=sin(2*pi*F_do2*t);

gamme= [Do,re,mi,fa,sol,la,si,do];
%sound(gamme);
%signalAnalyzer(gamme)

Sf=abs(fft(gamme));
S_dB = 20*log10(Sf)
subplot(2,1,1);
fshift=(-length(gamme)/2:length(gamme)/2 -1 )*m_Fs/length(gamme);
plot(fshift,fftshift(Sf));
title('spectre en echelle lineaire');
subplot(2,1,2);
plot(fshift,fftshift(S_dB));
title('spectre en echellle de decibels');

