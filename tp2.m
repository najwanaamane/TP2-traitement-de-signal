clear all
close all
clc

[x,fe]=audioread('C:\Users\HP\Downloads\exp.ogg');
%sound(x,fe)
%plot(x)
dt = 1/fe;
t = 0:dt:(length(x)-1)*dt;
 
 %sound(x,2*fe); 
%sound(x,fe/2); 

rien_ne_sert_de = x(24251:154087);
%plot(rien_ne_sert_de);
%title('Rien ne sert de');
%sound(rien_ne_sert_de,fe)

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


%inverse =[rien_ne_sert_de,partir,a_point,il_faut,courir];
%sound(inverse,fe);


