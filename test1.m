function [x y] =test1(answerBase,remaind,refer,a,b)
    temp=1;  %temp�u�O�@�Ӯ��ӭp���ܼ� 
    remain=0;
     for i=1:remaind
         %���a�ȩMb�ȡA���n�ϧO�󤧫e���H����J��a��b�� 
         aa = 0;
         bb = 0;
         %�H�U���for�ΨӤ���i�ӵ��שM�üƨ������ת��O�Xa�Xb 
         for j=1:4  
             for k=1:4
                 if answerBase(i,j)==refer(k)
                     if j==k
                         aa=aa+1;
                     else
                         bb=bb+1;
                     end
                 end
             end
         end
         %��� end
         if ((aa==a)&&(bb==b))
			for k=1:4
                answerbase(temp,k)=answerBase(i,k);
            end
			remain=remain+1;
            temp=temp+1;
         end
     end
     if remain ==0
         msgbox('Cheater�I= =+');
         pause(3);
         close all;
     end
     disp(refer);
     x = remain;
     y = answerbase;
end
