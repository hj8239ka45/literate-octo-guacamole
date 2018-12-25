clc;clear;
port_num = 5;
port = remo_open(port_num);

name = dataname;
[row , column] = size(name);
for i=1:row
    DATAName = [char(name(i)) '.txt'];
    fid = fopen(DATAName,'r');
    if fid==-1
        fid = fopen(DATAName,'a+');
        fprintf(fid,' �m�W\t\t�d��\t\t\t\t���\t\t\t\t\t\t�i�X ');
        fprintf(fid,'\r\n');       
        fclose(fid);
        fid=0;
    elseif fid==3
        fclose(fid);
    end
end

while 1
    pause(2);
    [Card_ID,error] = remo_get(port);
    Card_ID = string(dec2hex(Card_ID))
    format short g;
    cloc = clock;
    DATA(1) = data(Card_ID);
    for i=1:10
        if(i<5)
            DATA(i+1) = Card_ID(i);
        else
            DATA(i+1) = round(cloc(i-4));
        end
    end

    %�����ӤH���
    DATAName = [char(DATA(1)) '.txt'];
    fid = fopen(DATAName,'r');
    formatSpec = '%s %s %s %s %s %s %s %s %s %s %s %s';
    N = 12;
    C_text = textscan(fid,formatSpec);
    fclose(fid);
    
    [row_chara,column_chara] = size(C_text{1});
    
    if rem(row_chara,2)==1
        DATA(12) = 'on';
    else
        DATA(12) = 'off';
    end
    fid = fopen(DATAName,'a+');
    fprintf(fid,' %s ',DATA);
    fprintf(fid,'\r\n');
    fclose(fid);
    
    %�����������
    name = dataname;
    DATA_total(:,1) = name;
    for i = 1:row
        [time(i,:)  exist(i)] = CumulativeTime(name(i));
    end
    
    DATA_total(:,2:7) = time;
    DATA_total(:,8) = exist;
    fid = fopen('CARD_ID.txt','wt');
    fprintf(fid,' �m�W\t\t�ɶ�\t\t\t\t\t\t�O�_�٦b ');
    fprintf(fid,'\n');
    for i = 1:row
        fprintf(fid,'%s\t',DATA_total(i,:));
        fprintf(fid,'\n');
    end
    fclose(fid);
end
