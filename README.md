# TP2-traitement-de-signal
**Synthèse et analyse spectrale d’une gamme de musique**


**Introduction**

Pour ce TP on s’intéresse aux signaux sonores qui sont des signaux à temps continu, ces derniers seront manipulés sur Matlab, décomposés et analysés à travers les outils de traitement de signal à savoir la transformée de Fourier discrète et sa version rapide, nous apprendrons ainsi au fur et à mesure des notions tels la compression, la dilatation, et les sons purs.
 
*Jeux de mots* 
1.	« exp.ogg » est un enregistrement audio de la phrase : - « Rien ne sert de courir, il faut partir à point ».
       On fait appel à cet enregistrement grâce a la commande « audioread »
<pre>
[x,fe]=audioread('C:\Users\HP\Downloads\exp.ogg');
</pre>


2.	On trace le signal enregistré en fonction du temps, le signal obtenu se compose de 10 rassemblements de fréquences élevées, celles-ci représentent chaque mot prononcé dans l’enregistrement.

![phrase](https://user-images.githubusercontent.com/86806375/209989582-2f6974c3-8887-4bd1-ab73-211e3b52b855.JPG)



3.	Grâce à la commande « sound(x,fe) » on peut écouter le signal. 
On peut également le compresser en multipliant la fréquence d’échantillonnage par 2 ou le dilater en la divisant par 2

<pre>
sound(x,2*fe); 
sound(x,fe/2);
</pre>

•	Il est important de noter que la compression du son est accompagnée par une dilatation des fréquences avec une conservation des pics à hautes fréquences, ce qui donne l’impression que le son est diminué et aigue.

•	La dilatation est par contre accompagnée d’une compression du son et une augmentation d’amplitude des pics à basses fréquences, ce qui donne l’impression que le son est grave et amplifié.


4.5.   – on segmente la première partie du signal, en créant la variable « rien_ne_sert_de » contenant les n premières valeurs du signal enregistré x qui correspondent à ce morceau
<pre>
rien_ne_sert_de = x(24251:154087);
%plot(rien_ne_sert_de);
%title('Rien ne sert de');
%sound(rien_ne_sert_de,fe)
</pre>

![rien](https://user-images.githubusercontent.com/86806375/209990890-78cd446c-9838-4748-b538-c677dd16b09b.JPG)


6.	On refait la même chose pour les segments restants

<pre>

courir = x(187536:209712);
%plot(courir);
%title('courir');
%sound(courir,fe)
 
il_faut = x(246362:288241);
%plot(il_faut);
%title('il faut');
%sound(il_faut,fe)
 
partir = x(303817:337133);
%plot(partir);
%title('partir');
%sound(partir,fe)
 
a_point = x(355824:409516);
%plot(a_point);
%title('a point');
%sound(a_point,fe)
</pre>


7.	On peut maintenant réarranger le vecteur pour écouter l’inverse de la phrase initiale :
« Rien ne sert de partir à point, il faut courir ».
<pre>
inverse =[rien_ne_sert_de,partir,a_point,il_faut,courir];
sound(inverse,fe);
 </pre>



**- Synthèse d’une gamme de musique**

1.	On crée un programme Matlab qui permet de jouer une gamme de musique, pour cela on commence par définir les fréquences des notes de la gamme et leurs ondes sinusoïdales de fréquence correspondantes. Le vecteur final « gamme » contient tous les échantillons de la gamme concaténés les uns aux autres

<pre>
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
sound(gamme);

</pre>


**Spectre de la gamme de musique**

2.3.	  L’analyseur de spectre signalAnalyzer utilise une estimation du spectre basée sur une transformée de Fourier, on le met en œuvre pour visualiser le spectre des fréquences de la gamme ainsi que le spectrogramme.



![signalanalyzer](https://user-images.githubusercontent.com/86806375/209989631-7d4bd0ed-4aa1-4f7a-b8e7-733a3f3fdb5a.JPG)





**Approximation du spectre d’un signal sinusoïdal à temps continu par FFT**



4.	On affiche le spectre de fréquence de notre gamme en utilisant la version rapide de la transformée de Fourier discrète (TFD) par la fonction fft, d’abord avec une échelle linéaire :
<pre>
Sf=abs(fft(gamme));
subplot(2,1,1);
fshift=(-length(gamme)/2:length(gamme)/2 -1 )*m_Fs/length(gamme);
plot(fshift,fftshift(Sf));
title('spectre en echelle lineaire');
             </pre>

![lin](https://user-images.githubusercontent.com/86806375/209989655-a3390e9e-9379-402d-b1af-fc7471779c4b.JPG)


puis avec une echelle en decibels en utilisant la formule S(dB) = 20*log10(abs(Sf)), où Sf est l'amplitude du spectre de fréquence.

<pre>              
S_dB = 20*log10(Sf)
plot(fshift,fftshift(S_dB));
title('spectre en echellle de decibels');
             </pre>

 
![db](https://user-images.githubusercontent.com/86806375/209989676-7b720a36-b0fa-45aa-bdac-3ac00089a4f3.JPG)


**Conclusion**


En conclusion, ce TP nous a permis de mieux comprendre l'analyse des signaux sonores et l'utilisation de la transformée de Fourier pour décomposer un signal en ses composantes de fréquences.


