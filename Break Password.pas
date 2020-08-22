program 17011907;
uses crt,sysutils;
var
control,x,a1,a2,a3,a4,a5,a6,a7,a8,b,c,d,e,f,g,h,i,uzunluk,kind,counter,cikis,n:integer;
dizi:array[1..8] of char;
key,password,timer,ftime:string;
begin
  repeat
  clrscr;
  repeat
  writeln('Choose Your Password Type, Week=>4 Medium=>6 Strong=>8');					**kullanıcıdan şifre tipini isteyerek uzunluk(var)'a bu değeri atar**
  readln(uzunluk);
  until (uzunluk=4) or (uzunluk=6) or (uzunluk=8);							**repeat-until'le uzunluğun 4-6-8 dışında bir şey girilmemesini sağlar**
  writeln('Choose Your Character Type');
  repeat												**kind değişkenine kullacının seçtiği karakter tipini atar**
  writeln('Digit: 1 , Lowerc: 2 , Digit-Lowercase: 3 , Digit-Lowercase-Uppercase: 4');
  readln(kind);
  until (kind=1) or (kind=2) or (kind=3) or (kind=4);							**repeat-until'le kind'ın 1,2,3,4 dışında bir şey girilmemesini sağlar**
       begin
       if kind=1 then											**3 tane if'le kind'ın ne olduğuna bağlı bir uyarı mesajı veriyor**
       writeln('IMPORTANT! Your Password Should Be With Only Digits!')						
       else if kind=2 then
       writeln('IMPORTANT!Your Password Should Be With Only Lowercase Letters!')
       end;
       if kind=3 then
       writeln('IMPORTANT!Your Password Should Be With Digits And Lowercase Letters!');
  repeat
  writeln('Enter The Password');
  readln(password);
  n:=length(password);					**şifre seçilen uzunluğun dışında bir uzunlukta girilirse tekrar tekrar şifre istiyor**
  until n=uzunluk;
  clrscr;						**şifreyi aldıktan sonra ekranı temizliyor**
  cikis:=1;						**en sonda kullanıcıya devam edip etmeyeceğini sorarken kullandığımız değişken**
  a1:=47;						**bütün haneleri 0'a (ASCII) eşitliyor**
  a2:=48;
  a3:=48;
  a4:=48;
  a5:=48;
  a6:=48;
  a7:=48;
  a8:=48;
  x:=0;
  counter:=0;						**kaç denemede bulduğunu sayan counter'ı 0'ladım** 
  b:=96;						**buradaki değişkenler küçük harfler için tuttuğum değişkenler( ASCII'de bütün haneleri a'ya eşitliyor )**
  c:=97;
  d:=97;
  e:=97;
  f:=97;
  g:=97;
  h:=97;
  i:=97;
  timer:=timetostr(time);				**timer kullanıcı her şeyi girdikten sonra başlıyor**
  repeat
  counter:=counter+1;
  control:=1;
  while (x=0) AND (control=1) AND (uzunluk=8) do			       **8 while var ve hepsinde 1 tane hane kontrol ediliyor değiştiriliyor**
  begin
  if kind=1 then							       **her while'da 3 tane ana if var. Bunlar yapılacak değişiklikleri kind(karakter tipi)'a göre belirliyor** 
  begin
       begin
       if (a1=57) AND (a2=57) AND (a3=57) and (a4=57) and (a5=57)and (a6=57) and (a7=57) then		**sayı 9'lu olduğu durumda yapılacak olan değişiklikler için ayrılmış kısım**
       begin
       a1:=48;
       a2:=48;
       a3:=48;
       a4:=48;
       a5:=48;
       a6:=48;
       a7:=48;
       a8:=a8+1;
       dizi[8]:=chr(a1);							**Bu kısım daha sonraki adımlarda [&&] key adını verdiğim string’e bu değerleri atayabilmek için**
       dizi[7]:=chr(a2);
       dizi[6]:=chr(a3);
       dizi[5]:=chr(a4);
       dizi[4]:=chr(a5);
       dizi[3]:=chr(a6);
       dizi[2]:=chr(a7);
       dizi[1]:=chr(a8);
       end
       else
       dizi[1]:=chr(a8);							**eğer 9'lu değişmesi gereken bir sayı değilse dizinin ilgili hanesine chr'ın ilgili sayısını atıyor**
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];	** [&&]
          if key=password then							**her while'ın ve her ana if'in sonunda bu kontrol var, şifreyi bulduğu an çıkması için**
          x:=1									**x'i 1 yaptığı an diğer while'ların hiç birine giremiyor ve şifreyi yazdırıyor**
          else control:=0;							**şifreyi bulamassa control=0 diyor ve bu while'ı tek seferde bitirip diğer while'a giriş sağlıyor ki sayıyı doğru artırsın**
  end
  else if kind=2 then
  begin
       begin
       if (b=122) AND (c=122) AND (d=122) and (e=122) and (f=122) and(g=122) and (h=122) then			**burası şifrenin küçük harflerden oluştuğu kısım için**
       begin
       if dizi[2]<>'z' then									**bu kısımla ilgili ayrıntılı açıklamayı solutionda yaptım**
       b:=97;
       c:=97;
       d:=97;
       e:=97;
       f:=97;
       g:=97;
       h:=97;
       i:=i+1;
       dizi[8]:=chr(b);
       dizi[7]:=chr(c);
       dizi[6]:=chr(d);
       dizi[5]:=chr(e);
       dizi[4]:=chr(f);
       dizi[3]:=chr(g);
       dizi[2]:=chr(h);
       dizi[1]:=chr(i);
       end
       else
       dizi[1]:=chr(i);
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
           if key=password then
           x:=1
           else control:=0;
  end
  else if kind=3 then											**bu kısım şifrenin sayılar-küçük harfler'den oluştuğu durum için**
  begin
       begin
       if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122)and (a6=122) and (a7=122) then
       begin
         if a8=57 then
         a8:=a8+39;
         if dizi[1]<>'z' then
         a1:=48;
         a2:=48;
         a3:=48;
         a4:=48;
         a5:=48;
         a6:=48;
         a7:=48;
         a8:=a8+1;
         dizi[8]:=chr(a1);
         dizi[7]:=chr(a2);
         dizi[6]:=chr(a3);
         dizi[5]:=chr(a4);
         dizi[4]:=chr(a5);
         dizi[3]:=chr(a6);
         dizi[2]:=chr(a7);
         dizi[1]:=chr(a8);
       end
       else
       dizi[1]:=chr(a8);
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
           if key=password then
           x:=1
           else control:=0;
  end
  else											**bu kısım şifrenin küçük h-büyük h-sayılardan oluştuğu durum için**
  begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122)and (a6=122) and (a7=122) then
      begin
           if a8=57 then
           a8:=a8+7;
           if a8=90 then
           a8:=a8+6;
           if dizi[1]<>'z' then
           a1:=48;
           a2:=48;
           a3:=48;
           a4:=48;
           a5:=48;
           a6:=48;
           a7:=48;
           a8:=a8+1;
           dizi[8]:=chr(a1);
           dizi[7]:=chr(a2);
           dizi[6]:=chr(a3);
           dizi[5]:=chr(a4);
           dizi[4]:=chr(a5);
           dizi[3]:=chr(a6);
           dizi[2]:=chr(a7);
           dizi[1]:=chr(a8);
      end
      else
      dizi[1]:=chr(a8);
      end;
      key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=0;
  end;
  end;
  while (x=0) AND (control=0) AND (uzunluk=8) do
  begin
  if kind=1 then
  begin
       begin
       if (a1=57) AND (a2=57) AND (a3=57) AND (a4=57) AND (a5=57) AND (a6=57) then
       begin
            if dizi[2]<>'9' then
            a1:=48;
            a2:=48;
            a3:=48;
            a4:=48;
            a5:=48;
            a6:=48;
            a7:=a7+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
            dizi[6]:=chr(a3);
            dizi[5]:=chr(a4);
            dizi[4]:=chr(a5);
            dizi[3]:=chr(a6);
            dizi[2]:=chr(a7);
       end
       else dizi[2]:=chr(a7);
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
           if key=password then
           x:=1
           else control:=1;
  end
  else if kind=2 then
  begin
       begin
       if (b=122) AND (c=122) AND (d=122) and (e=122) and (f=122) and(g=122) then
       begin
       if dizi[2]<>'z' then
       b:=97;
       c:=97;
       d:=97;
       e:=97;
       f:=97;
       g:=97;
       h:=h+1;
       dizi[8]:=chr(b);
       dizi[7]:=chr(c);
       dizi[6]:=chr(d);
       dizi[5]:=chr(e);
       dizi[4]:=chr(f);
       dizi[3]:=chr(g);
       dizi[2]:=chr(h);
       end
       else dizi[2]:=chr(h);
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=1;
  end
  else if kind=3 then
  begin
       begin
       if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122)and (a6=122) then
       begin
            if a7=57 then
            a7:=a7+39;
            if dizi[2]<>'z' then
            a1:=48;
            a2:=48;
            a3:=48;
            a4:=48;
            a5:=48;
            a6:=48;
            a7:=a7+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
            dizi[6]:=chr(a3);
            dizi[5]:=chr(a4);
            dizi[4]:=chr(a5);
            dizi[3]:=chr(a6);
            dizi[2]:=chr(a7);
       end
       else dizi[2]:=chr(a7);
       end;
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
           if key=password then
           x:=1
           else control:=1;
 end
 else
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122)and (a6=122) then
      begin
           if a7=57 then
           a7:=a7+7;
           if a7=90 then
           a7:=a7+6;
           if dizi[2]<>'z' then
           a1:=48;
           a2:=48;
           a3:=48;
           a4:=48;
           a5:=48;
           a6:=48;
           a7:=a7+1;
           dizi[8]:=chr(a1);
           dizi[7]:=chr(a2);
           dizi[6]:=chr(a3);
           dizi[5]:=chr(a4);
           dizi[4]:=chr(a5);
           dizi[3]:=chr(a6);
           dizi[2]:=chr(a7);
      end
      else
      dizi[2]:=chr(a7);
      end;
      key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=1;
 end;
 end;
 while (x=0) AND (control=1) AND (uzunluk>=6) do						**eğer şifre 6 haneliyse buraya girip çıkıyor, üsttekilere hiç girmiyor**
 begin
 if kind=1 then
 begin
      begin
      if (a1=57) AND (a2=57) AND (a3=57) and (a4=57) and (a5=57) then
      begin
           if dizi[3]<>'9' then
           begin
           a1:=48;
           a2:=48;
           a3:=48;
           a4:=48;
           a5:=48;
           a6:=a6+1;
           dizi[8]:=chr(a1);
           dizi[7]:=chr(a2);
           dizi[6]:=chr(a3);
           dizi[5]:=chr(a4);
           dizi[4]:=chr(a5);
           dizi[3]:=chr(a6);
           end;
      end
      else
      dizi[3]:=chr(a6);
      end;
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=0;
 end
 else if kind=2 then
 begin
      begin
      if (b=122) AND (c=122) AND (d=122) and (e=122) and (f=122) then
      begin
           if dizi[3]<>'z' then
           begin
           b:=97;
           c:=97;
           d:=97;
           e:=97;
           f:=97;
           g:=g+1;
           dizi[8]:=chr(b);
           dizi[7]:=chr(c);
           dizi[6]:=chr(d);
           dizi[5]:=chr(e);
           dizi[4]:=chr(f);
           dizi[3]:=chr(g);
           end;
      end
      else
      dizi[3]:=chr(g);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=0;
          end;
 end
 else if kind=3 then
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122) then
      begin
           if a6=57 then
           a6:=a6+39;
           if dizi[3]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=48;
                a5:=48;
                a6:=a6+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
                dizi[4]:=chr(a5);
                dizi[3]:=chr(a6);
           end;
      end
      else
      dizi[3]:=chr(a6);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=0;
          end;
 end
 else
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) and (a5=122) then
      begin
           if a6=57 then
           a6:=a6+7;
           if a6=90 then
           a6:=a6+6;
           if dizi[3]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=48;
                a5:=48;
                a6:=a6+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
                dizi[4]:=chr(a5);
                dizi[3]:=chr(a6);
           end;
      end
      else
      dizi[3]:=chr(a6);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=0;
          end;
  end;
  end;
  while (x=0) AND (control=0) AND (uzunluk>=6) do
  begin
  if kind=1 then
  begin
       begin
       if (a1=57) AND (a2=57) AND (a3=57) and (a4=57) then
       begin
            if dizi[4]<>'9' then
            begin
            a1:=48;
            a2:=48;
            a3:=48;
            a4:=48;
            a5:=a5+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
            dizi[6]:=chr(a3);
            dizi[5]:=chr(a4);
            dizi[4]:=chr(a5);
            end;
       end
       else
       dizi[4]:=chr(a5);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
           if key=password then
           x:=1
           else control:=1;
           end;
 end
 else if kind=2 then
 begin
      begin
      if (b=122) AND (c=122) AND (d=122) and (e=122) then
      begin
           if dizi[4]<>'z' then
           begin
                b:=97;
                c:=97;
                d:=97;
                e:=97;
                f:=f+1;
                dizi[8]:=chr(b);
                dizi[7]:=chr(c);
                dizi[6]:=chr(d);
                dizi[5]:=chr(e);
                dizi[4]:=chr(f);
           end;
      end
      else
      dizi[4]:=chr(f);
      end;
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=1;
 end
 else if kind=3 then
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) then
      begin
           if a5=57 then
           a5:=a5+39;
           if dizi[4]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=48;
                a5:=a5+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
                dizi[4]:=chr(a5);
           end;
      end
      else
      dizi[4]:=chr(a5);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=1;
          end;
 end
 else
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) and (a4=122) then
      begin
           if a5=57 then
           a5:=a5+7;
           if a5=90 then
           a5:=a5+6;
           if dizi[4]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=48;
                a5:=a5+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
                dizi[4]:=chr(a5);
           end;
      end
      else
      dizi[4]:=chr(a5);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8];
          if key=password then
          x:=1
          else control:=1;
          end;
 end;
 end;
 while (x=0) AND (control=1) do							**eğer şifre 4 haneliyse üsttekilere hiç girmiyor sadece burdan sonraki kısımlara girip çıkıyor**
 begin
 if kind=1 then
 begin
       begin
       if (a1=57) AND (a2=57) AND (a3=57) then
       begin
       if dizi[5]<>'9' then
       begin
            a1:=48;
            a2:=48;
            a3:=48;
            a4:=a4+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
            dizi[6]:=chr(a3);
            dizi[5]:=chr(a4);
       end;
       end
       else
       dizi[5]:=chr(a4);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=0;
 end
 else if kind=2 then
 begin
      begin
      if (b=122) AND (c=122) AND (d=122) then
      begin
           if dizi[5]<>'z' then
           begin
           b:=97;
           c:=97;
           d:=97;
           e:=e+1;
           dizi[8]:=chr(b);
           dizi[7]:=chr(c);
           dizi[6]:=chr(d);
           dizi[5]:=chr(e);
           end;
      end
      else
      dizi[5]:=chr(e);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else if uzunluk=6 then
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
          end;
              if key=password then
              x:=1
              else control:=0;
 end
 else if kind=3 then
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) then
      begin
           if a4=57 then
           a4:=a4+39;
           if dizi[5]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=a4+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
           end;
      end
      else
      dizi[5]:=chr(a4);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else if uzunluk=6 then
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
          end;
             if key=password then
             x:=1
             else control:=0;
 end
 else
 begin
      begin
      if (a1=122) AND (a2=122) AND (a3=122) then
      begin
           if a4=57 then
           a4:=a4+7;
           if a4=90 then
           a4:=a4+6;
           if dizi[5]<>'z' then
           begin
                a1:=48;
                a2:=48;
                a3:=48;
                a4:=a4+1;
                dizi[8]:=chr(a1);
                dizi[7]:=chr(a2);
                dizi[6]:=chr(a3);
                dizi[5]:=chr(a4);
           end;
      end
      else
      dizi[5]:=chr(a4);
      end;
          begin
          if uzunluk=8 then
          key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else if uzunluk=6 then
          key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
          else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
          end;
             if key=password then
             x:=1
             else control:=0;
  end;
  end;
  while (x=0) AND (control=0) do
  begin
  if kind=1 then
  begin
       begin
       if (a1=57) AND (a2=57) then
       begin
       if dizi[6]<>'9' then
       begin
            a1:=48;
            a2:=48;
            a3:=a3+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
            dizi[6]:=chr(a3);
       end;
       end
       else
       dizi[6]:=chr(a3);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=1;
  end
  else if kind=2 then
  begin
       begin
       if (b=122) AND (c=122) then
       begin
       if dizi[6]<>'z' then
       begin
            b:=97;
            c:=97;
            d:=d+1;
            dizi[8]:=chr(b);
            dizi[7]:=chr(c);
            dizi[6]:=chr(d);
       end;
       end
       else
       dizi[6]:=chr(d);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=1;
  end
  else if kind=3 then
  begin
       begin
       if (a1=122) AND (a2=122) then
       begin
            if a3=57 then
            a3:=a3+39;
            if dizi[6]<>'z' then
            begin
                 a1:=48;
                 a2:=48;
                 a3:=a3+1;
                 dizi[8]:=chr(a1);
                 dizi[7]:=chr(a2);
                 dizi[6]:=chr(a3);
            end;
        end
        else
        dizi[6]:=chr(a3);
        end;
        begin
        if uzunluk=8 then
        key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
        else if uzunluk=6 then
        key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
        else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
        end;
           if key=password then
           x:=1
           else control:=1;
  end
  else
  begin
       begin
       if (a1=122) AND (a2=122) then
       begin
            if a3=57 then
            a3:=a3+7;
            if a3=90 then
            a3:=a3+6;
            if dizi[6]<>'z' then
            begin
                 a1:=48;
                 a2:=48;
                 a3:=a3+1;
                 dizi[8]:=chr(a1);
                 dizi[7]:=chr(a2);
                 dizi[6]:=chr(a3);
            end;
       end
       else
       dizi[6]:=chr(a3);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=1;
  end;
  end;
  while (x=0) AND (control=1) do
  begin
  if kind=1 then
  begin
       begin
       if a1=57 then
       begin
            if dizi[7]<>'9' then
            a1:=48;
            a2:=a2+1;
            dizi[8]:=chr(a1);
            dizi[7]:=chr(a2);
       end
       else
       dizi[7]:=chr(a2);
       end;
            begin
            if uzunluk=8 then
            key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else if uzunluk=6 then
            key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
            end;
                if key=password then
                x:=1
                else control:=0;
  end
  else if kind=2 then
  begin
       begin
       if b=122 then
       begin
            if dizi[7]<>'z' then
            b:=97;
            c:=c+1;
            dizi[8]:=chr(b);
            dizi[7]:=chr(c);
       end
       else
       dizi[7]:=chr(c);
       end;
            begin
            if uzunluk=8 then
            key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else if uzunluk=6 then
            key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
            end;
                if key=password then
                x:=1
                else control:=0;
  end
  else if kind=3 then
  begin
       begin
       if a1=122 then
       begin
       if a2=57 then
       a2:=a2+39;
          if dizi[7]<>'z' then
          a1:=48;
          a2:=a2+1;
          dizi[8]:=chr(a1);
          dizi[7]:=chr(a2);
       end
       else
       dizi[7]:=chr(a2);
       end;
            begin
            if uzunluk=8 then
            key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else if uzunluk=6 then
            key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
            end;
                if key=password then
                x:=1
                else control:=0;
  end
  else
  begin
       begin
       if a1=122 then
       begin
            if a2=57 then
            a2:=a2+7;
            if a2=90 then
            a2:=a2+6;
               if dizi[7]<>'z' then
               a1:=48;
               a2:=a2+1;
               dizi[8]:=chr(a1);
               dizi[7]:=chr(a2);
       end
       else
       dizi[7]:=chr(a2);
       end;
            begin
            if uzunluk=8 then
            key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else if uzunluk=6 then
            key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
            else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
            end;
               if key=password then
               x:=1
               else control:=0;
  end;
  end;
  while (x=0) AND (control=0) do
  begin
  if kind=1 then
  begin
       a1:=a1+1;
       dizi[8]:=chr(a1);
       begin
       if uzunluk=8 then
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
       else if uzunluk=6 then
       key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
       else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
       end;
           if key=password then
           x:=1
           else control:=1;
  end
  else if kind=2 then
  begin
       b:=b+1;
       dizi[8]:=chr(b);
       begin
       if uzunluk=8 then
       key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
       else if uzunluk=6 then
       key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
       else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
       end;
             if key=password then
             x:=1
             else control:=1;
  end
  else if kind=3 then
  begin
       begin
       if a1=57 then
       begin
       a1:=a1+39;
       end;
       a1:=a1+1;
       dizi[8]:=chr(a1);
       end;
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=1;
  end
  else
  begin
       if a1=57 then
       begin
       a1:=a1+7;
       end;
       if a1=90 then
       begin
       a1:=a1+6;
       end;
       a1:=a1+1;
       dizi[8]:=chr(a1);
           begin
           if uzunluk=8 then
           key:=dizi[1]+dizi[2]+dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else if uzunluk=6 then
           key:=dizi[3]+dizi[4]+dizi[5]+dizi[6]+dizi[7]+dizi[8]
           else  key:=dizi[5]+dizi[6]+dizi[7]+dizi[8];
           end;
               if key=password then
               x:=1
               else control:=1;
  end;
  end;
  until key=password;
  ftime:=timetostr(time);
  ftime:=timetostr(strtotime(ftime)-strtotime(timer));
  writeln('Timer=',ftime);
  writeln('Found the password at ',counter,' try');
  writeln('Password=',key);
  writeln('If you want to exit press 0, if not press 1');
  readln(cikis);
  until cikis=0;
  readln();
end.

