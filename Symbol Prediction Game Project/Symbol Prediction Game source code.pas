program semester_project;

{$mode objfpc}{$H+}

uses
  crt,

  { you can add units after this };
var
  memory:array[1..10,1..10] of integer;
  game:array[1..10,1..10] of integer;
  thematrix:array[1..10,1..10] of integer;
  level,score1,score2,control,size,gameover,surprise,a,b,c,d,x,y,i,j,k,p1,q1,p2,q2,u1,w1,u2,w2:integer;
begin
  repeat                                                                  			//repeat-until'le 1,2,3,4 harici bir sey girilmesini engelliyorum
  writeln('For Beginner:1,Intermediate:2,Advanced:3,Professional:4,Surprise:5');
  readln(level);
  until (level=1) or (level=2) or (level=3) or (level=4) or (level=5);
  repeat                                                                 			//repeat-until'le 6,8,10 harici bir sey girilmesini engelliyorum
  writeln('SELECT SIZE : 6-8-10');
  readln(size);
  until (size=6) or (size=8) or (size=10);
  k:=(size*size)div 2 ;
  gameover:=0;
  score1:=0;
  score2:=0;
  for a:=1 to size do                 	//bilgisayarin hatirladigi memory ve random sayilar atanan oyun matrisini en basta 0'a esitliyorum//
  begin   for b:=1 to size do
          memory[a,b]:=0;  end;
  for i:=1 to size do
  begin   for j:=1 to size do       	//gameover buyutun karesine esit olursa oyun bitiyor//
          game[i,j]:=0;  end;
  for i:=1 to k do       				//buradaki i matrise atanan sayiyi temsil ediyor // k ise matrisin boyutunun karesinin yarisina kadar gidiyor//
  begin                                 //oyun matrisine random sayilar atandigi yer//
       randomize;
       repeat     c:=random(size)+1;
                  d:=random(size)+1;
       until      game[c,d]=0;        	//dolu bir yere tekrar baska sayi atamasin diye 0 olan yeri bulasiya kadar random atiyor//
       game[c,d]:=i;
       thematrix[c,d]:=i;   			//matrisin hic oynanmamis halini oyun bittiginde tekrar ekrana yazdirmak icin dongulere hic girmeyen bir matris olusturdum//
       randomize;
       repeat     c:=random(size)+1;    //bir sayidan iki kez atamasi icin iki donguye giriyor//
                  d:=random(size)+1;
       until      game[c,d]=0;
       game[c,d]:=i;
       thematrix[c,d]:=i;
  end;

  while (gameover<2*k) and (score2<>k) do      //score2 yani bilgisayarin skoru boyutun karesinin yarisina ulastiginda oyunun bitmesi icin//
  begin
  randomize;
  if level=5 then
  surprise:=random(4)+1;
  control:=0;
  repeat
  writeln('What is your guess?');
  writeln('Enter the line');
  readln(p1);
  writeln('Enter the column');
  readln(q1);
  until game[p1,q1]<>1500 ;      	//kullanici onceden acilan (1500'e esit olan) bir yeri acmasin diye repeat until koydum//
  for i:=1 to (size) do            //bu for'un icinde kullanicinin yaptigi tahmini matrisli sekilde ekrana yazdiriyor//
  begin
      writeln;
      for j:=1 to (size) do
      begin    write('| ');
               if (i=p1) and (j=q1) then
               begin
                    if game[i,j]>9 then           				//matriste iki basamakli ya da tek basamakli sayiya gore bosluk birakiyor//
                    write(game[i,j]:1)
                    else write(game[i,j],' ':1);
               end
               else if game[i,j]=1500 then     write('  ')     //eger matristeki o eleman onceden bilinmisse (1500'e esitse) bosluk birakiyor//
               else write('* ');                               //gameover buyutun karesine esit olursa oyun bitiyor//
      end;
      if j=size then   write('| ');
  end;
                if (level=4) then                			//level 4 ise ve level 5 olup surprise=4 ise hafizaya kaydediyor//
                memory[p1,q1]:=game[p1,q1];
                if (level=5) then
                begin
                     if (surprise=5) then
                     memory[p1,q1]:=game[p1,q1];
                end;
  writeln;
  repeat
  writeln('What is your second guess?');
  writeln('Enter the line?');
  readln(p2);
  writeln('Enter the column?');
  readln(q2);
  until game[p2,q2]<>1500 ;      	//kullanici onceden acilan (1500'e esit olan) bir yeri acmasin diye repeat until koydum//
  clrscr;                      		//ikinci tahmini yaptiginda ekrani temizliyor//
  for i:=1 to (size) do         	//bu for'un icinde kullanicinin yaptigi tahmini matrisli sekilde ekrana yazdiriyor//
  begin
      writeln;
      for j:=1 to (size) do
      begin    write('| ');
               if (i=p2) and (j=q2) then
               begin
                    if game[i,j]>9 then
                    write(game[i,j]:1)

                    else write(game[i,j],' ':1);
               end
               else if (i=p1) and (j=q1) then
               begin
                    if game[i,j]>9 then
                    write(game[i,j]:1)
                    else write(game[i,j],' ':1);
               end
               else if game[i,j]=1500 then
                    write('  ')
               else write('* ');
      end;
      if j=size then
      write('| ');
  end;
               if (level=4) or (level=3) then      //level 4 veya 3 ise ,, ve level 5 olup surprise 4 veya 3'e esit ise hafizaya kaydediyor//
               memory[p2,q2]:=game[p2,q2];
               if (level=5) then
               begin
                    if (surprise=5) or (surprise=4) then
                    memory[p2,q2]:=game[p2,q2];
               end;

  if game[p1,q1]=game[p2,q2] then    //eger kullanici tahminlerde esit olanlari tutturursa o haneleri 1500'e esitliyor.
  begin
  score1:=(score1)+1;                //kullanici bilirse skorunu bir artiriyor//
  game[p1,q1]:=1500;
  game[p2,q2]:=1500;
  memory[p1,q1]:=0;                  //Ayrica memory'yi de 0'a esitliyor ki eger bu iki sayi memory'de varsa bilgisayar
  memory[p2,q2]:=0;                  //memory'den hane acarken bu iki sayi esit diye birdaha birdaha o haneleri acmasin//
  end;
  writeln;
  writeln;
  delay(7000);
  clrscr;
  for i:=1 to (size) do             //matrisin sadece * ve ' ' oldugu yerleri ekranda gosteriyor//
  begin       writeln;
              for j:=1 to (size) do
              begin
              write('| ');
              if game[i,j]=1500 then
              write('  ')
              else write('* ');
              end;
                  if j=size then
                  write('| ');
  end;
  writeln;
  writeln('score1= ',score1);            //skorlari yazdiriyor//
  writeln('score2= ',score2);
  writeln;
  writeln;
  for i:=1 to size do                    //son iki kalan haneyi kullanici acarsa bilgisayara sira gecmeden oyunun bitmesi icin bir kontrol yapiyorum//
  begin    for j:=1 to size do
           begin
                if game[i,j]=1500 then
                gameover:=gameover+1;    //gameover boyutun karesine esit olursa oyun bitiyor//
           end;
  end;

  writeln('Computer is going to make a prediction');
  for a:=1 to size do               	//bu for'un icinde memory'de hazirda birbirine esit sayi var mi diye kontrol ediyor//
  begin
       for b:=1 to size do  begin
           if (memory[a,b]<>0) then  begin      		//memory'deki bu hane zaten bossa hic kontrol yapmiyor bir sonraki haneye bakiyor//
              for x:=1 to size do begin
                   for y:=1 to size do begin
                      if (memory[a,b]=memory[x,y]) then begin
                      if (a<>x) or (b<>y) then  begin          //ayni haneyi buldum diyip ayni yeri acmamasi icin bir durum kontrolu koydum//
                              control:=1;                		//eger bulursa control:=1 yaparak bilgisayarin buraya girmedigi durumlarda girecegi yerlerde kullanmasi icin bir kontrol//
                              u1:=a;                     		//bilgisayarin iki adimini da burada belirliyor//
                              w1:=b;
                              u2:=x;
                              w2:=y;   end;  end;  end;  end; end;  end;
  end;
  if control=0 then           //eger yukaridaki adimda memory'de hazirda bir sayi bulmadiysa birinci adimi random yapiyor//
  begin
  randomize;
  repeat
  u1:=random(size)+1;
  w1:=random(size)+1;
  until (game[u1,w1]<>1500);
  end;
  delay(10000);
  clrscr;
  for i:=1 to (size) do
  begin    writeln;          //gameover buyutun karesine esit olursa oyun bitiyor//
           for j:=1 to (size) do
           begin    write('| ');
                    if (i=u1) and (j=w1) then
                    begin     if game[i,j]>9 then
                              write(game[i,j]:1)
                              else write(game[i,j],' ':1);
                    end
                    else if game[i,j]=1500 then
                    write('  ')
                    else write('* ');
           end;
           if j=size then
           write('| ');
  end;
  writeln;
  writeln('Computer is going to make a prediction');
  if control=0 then            			//eger birinci adimi random yaptiysa,memory'de bu sayiya esit bir sayi var mi diye bakiyor//
  begin
       for a:=1 to size do
       begin
            for b:=1 to size do  begin
                 if (memory[a,b]=game[u1,w1]) then  begin      //eger esit sayi varsa ikinci adimini o esit sayidan yana yapiyor//
                    if (a<>u1) or (b<>w1) then  begin
                    control:=1;                                //eger ikinci adimi burada belirlediyse alttaki adima girmemesi icin control:=1 yapiyor//
                    u2:=a;
                    w2:=b;
                    end;  end;  end;
       end;
  end;
  randomize;
  if control=0 then      //ikinci adimini memory'den bulamasssa random yapiyor//
  repeat
  u2:=random(size)+1;
  w2:=random(size)+1;
  until (u1<>u2) and (w1<>w2) and (game[u2,w2]<>1500);         		//birinci adimiyla ayni yeri ve onceden acilan (1500'e esitlenmis) yeri tekrar acmamasi icin farkli yer bulana kadar random//

                     if (level=4) or (level=3) or (level=2) then      //level 4,3,2 ise veya level 5 olup surprise 4,3 veya 2'ye esit ise bilgisayarin ilk adimini hatirliyor//
                     memory[u1,w1]:=game[u1,w1];
                     if level=5 then
                     begin
                        if (surprise=5) or (surprise=4) or (surprise=3) then
                        memory[u1,w1]:=game[u1,w1];
                     end;
                     if (level=4) or (level=3) or (level=2) or (level=1) then     //bilgisayarin son adimini da surprise=1 oldugu durum haric butun level'larda hatirliyor//
                     memory[u2,w2]:=game[u2,w2];                                  //surpise=1 olma durumu hafizaya hicbir seyi kaydetmeme durumu//
                     if level=5 then
                     begin
                          if (surprise=5) or (surprise=4) or (surprise=3) or (surprise=2) then
                          memory[u2,w2]:=game[u2,w2];
                     end;

  delay(10000);
  clrscr;
  for i:=1 to (size) do
  begin    writeln;
           for j:=1 to (size) do
           begin    write('| ');
                    if (i=u2) and (j=w2) then
                    begin     if game[i,j]>9 then
                              write(game[i,j]:1)
                              else write(game[i,j],' ':1);
                    end
                    else if (i=u1) and (j=w1) then
                    begin     if game[i,j]>9 then
                              write(game[i,j]:1)
                              else write(game[i,j],' ':1);
                    end
                    else if game[i,j]=1500 then
                    write('  ')
                    else write('* ');
           end;
           if j=size then
           write('| ');
  end;
  if game[u1,w1]=game[u2,w2] then       //bilgisayarin iki adimi birbirini tutarsa skorunu bir artiriyor,bu acilan yerleri 1500'e esitliyor//
  begin
         score2:=score2+1;
         game[u1,w1]:=1500;
         game[u2,w2]:=1500;
         memory[u1,w1]:=0;             //memory'de bu sayilar varsa 0 yapiyor//
         memory[u2,w2]:=0;
  end;
  writeln;
  writeln;
  delay(7000);
  clrscr;
  for i:=1 to (size) do              //matrisin *'li ve bosluklu halini ekrana yazdiriyor//
  begin    writeln;
           for j:=1 to (size) do
           begin
                write('| ');
                if game[i,j]=1500 then
                write('  ')
                else write('* ');
           end;
           if j=size then
           write('| ');
  end;
  writeln;
  writeln('score1= ',score1);
  writeln('score2= ',score2);

  for i:=1 to size do                    //gameover boyutun karesine esit olursa oyunun bitmesi icin bir kontrol//
  begin    for j:=1 to size do
           begin
                if game[i,j]=1500 then
                gameover:=gameover+1;
           end;
  end;
  end;
  clrscr;
  writeln('THE GAME IS OVER');               //oyunu kimin kazandigini belirleyen adim//
  if score2>score1 then
  writeln('The winner = computer')
  else if score2<score1 then
  writeln('YOU WON THE GAME!')
  else writeln('THE GAME ENDED IN A DRAW');
  for i:=1 to (size) do                      //oyun bittikten sonra oyunun basindaki matrisi ekrana yazdiriyor//
  begin
      writeln;
      for j:=1 to (size) do
      begin    write('| ');
               if thematrix[i,j]>9 then
               write(thematrix[i,j]:1)
               else write(thematrix[i,j],' ':1);
      end;
      if j=size then   write('| ');
  end;
  readln;
end.
