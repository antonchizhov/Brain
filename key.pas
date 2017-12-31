unit key;

interface
uses SysUtils,Classes,Init,Unit1;

implementation

procedure Pause;
begin
  MyThread2:=WaitingThread.Create(False);
{  StopKey:=' ';
  repeat
    MyThread2.Synchronize(MyThread2.ForSynchronization);
  until StopKey='P';
  StopKey:=' ';}
  MyThread2.Suspend;
  MyThread2.Terminate;
end;

procedure WaitingThread.ForPause;
begin
  StopKey:=' ';
  repeat
    MyThread2.Synchronize(MyThread2.ForSynchronization);
  until StopKey='P';
  StopKey:=' ';
end;


procedure BrainThread.Treat_Key;
var  a,a1           :char;
     change_sc      :double;
begin
{  Form1.KeyPress(a);}
  a:=StopKey;
  if (a<>' ')and(ord(a)<>0) then begin
     if a='S' then begin
        iHist:=0; nt:=nt_end; istop:=1
     end else
     if a='P' then Pause else
     if a='c' then {Initial_Picture} else
     if a='f' then begin
        if Do_plt=1 then begin  close(ggg);  rewrite(ggg);  end;
        {Initial_Picture}
     end else
     if a='w' then
        if Do_plt=1 then begin
           close(ggg);
           Do_plt:=0;
        end else begin
           assign(ggg,'out.plt');
           rewrite(ggg);
           Do_plt:=1;
        end else
     if a='v' then begin
        {if Phase_Or_Distr=1 then  Phase_Or_Distr:=2 else
        if Phase_Or_Distr=2 then  Phase_Or_Distr:=3 else
        if Phase_Or_Distr=3 then  Phase_Or_Distr:=1;
        Initial_Picture;}
        DrawOrNot:=1;
        {Graphics; Initial_Picture;}
     end else
     if a='t' then begin
        DrawOrNot:=0;
        {closegraph;}
     end else
     if a='+' then begin
        x_sc:=x_sc*1.2;
        y_sc:=y_sc*1.2;
     end else
     if a='-' then begin
        x_sc:=x_sc*0.8;
        y_sc:=y_sc*0.8;
     end else
     if a=chr(77) then  x_pole:=x_pole-shift_step/x_sc  else
     if a=chr(75) then  x_pole:=x_pole+shift_step/x_sc  else
     if a=chr(72) then  y_pole:=y_pole-shift_step/y_sc  else
     if a=chr(80) then  y_pole:=y_pole+shift_step/y_sc  else
     if a='1' then  shift_step:=1    else
     if a='2' then  shift_step:=5    else
     if a='3' then  shift_step:=25   else
     if a='4' then  shift_step:=125  else
     if a='5' then  shift_step:=625  else
     if a='h' then begin
        {CloseGraph;} if Do_plt=1 then close(ggg);
        Form1.Memo2.Lines.Add('"Escape" - stop drawing phase plane');
        Form1.Memo2.Lines.Add('"s" - stop');
        Form1.Memo2.Lines.Add('"p" - pause');
        Form1.Memo2.Lines.Add('"c" - clean screen');
        Form1.Memo2.Lines.Add('"f" - clean file "out.plt" and screen');
        Form1.Memo2.Lines.Add('"w" - stop\begin writing in file "out.plt"');
        Form1.Memo2.Lines.Add('"v" - Phase Plane or Distribution');
        Pause;
        {Graphics;  Initial_Picture;}
     end else begin
                 {Sound(300);  Delay(200); NoSound;}  end;
  end;

end;
end.
