clc
clear

load('muta_llps_seq_no.mat')
load('muta_llps_seq_yes.mat')

len = length(muta_llps_seq_yes);
sum=0;
for i=1:len
   if length(char(muta_llps_seq_yes(i)))>=3000
      sum = sum+1; 
   end
end
sum
sum=0;
len = length(muta_llps_seq_no);
sum=0;
for i=1:len
   if length(char(muta_llps_seq_no(i)))>=3000
      sum = sum+1; 
   end
end
sum