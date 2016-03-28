function [ r ] = difference3( f1,f2 )
       
aa=rgb2gray(f1);
bb=rgb2gray(f2);
aa=rot90(aa);
bb=rot90(bb);
bb=mean(bb);

k=mahal(bb,double(aa));


r=sum(k);
end

