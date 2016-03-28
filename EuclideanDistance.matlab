function [ r ] = difference2( f1,f2 )
       f11=rgb2gray(f1);  % Convert into gray scale
       f12=rgb2gray(f2);
       
       diffe=f11-f12; 
       diffe = diffe.^2;
       
       r=sum(diffe);
       
   end
