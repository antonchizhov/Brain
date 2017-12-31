unit graph_0d;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,
     ColumnO,PopulationO;

procedure PrintTime;
procedure PrintCoefficients;
procedure Warning(t1 :string);
function Color_u(x,min,max :double) :integer;
procedure CalculateAndPrintCV(APop_:TPopulation; var CV_:double);
PROCEDURE Initial_Picture;
PROCEDURE Evolution;
procedure DrawPhaseSpace;
procedure WritePhaseSpace;

implementation
uses Init,t_dtO,MathMyO,Unit1,Unit2,Unit4,Unit5,Unit6,Unit7,Unit12,
     Unit25,Unit26,Unit29,
     Bp2Delphi,other,ConnectionsO;



procedure PrintTime;
var t1 :string;
begin
   setcolor(3);
   str(t*1000:7:2,t1);
   t1:='t='+t1+' ms';
//   outtextxy(20,2,t1);
   Form1.Label1.Caption:=t1;
end;

procedure PrintCoefficients;
var t1,t2,t3 :string;
    i        :integer;
    dum      :longint;
begin
   setcolor(8);
   t1:='';  t3:='    ';
   for i:=1 to round(min(8,m)) do begin
       if abs(g_dg[i])>1e-3 then
          str(g_dg[i]:13:4,t2)
       else
          str(g_dg[i]:12,t2);
       t1:=t1+t2+',';
       t3:=t3+'  '+strC[ig_iC[i]];
   end;
   Form1.CoeMemo.Clear;
   Form1.CoeMemo.Lines.Add(t3);
   Form1.CoeMemo.Lines.Add(t1);
   if m>=9 then begin
      t1:='';  t3:=' ';
      for i:=9 to m do begin
          str(g_dg[i]:9:3,t2);
          t1:=t1+t2+',';
          t3:=t3+' '+strC[ig_iC[i]];
      end;
      dum:=Form1.CoeMemo.Lines.Add(t3);
      Form1.CoeMemo.Lines.Add(t1);
   end;
end;

procedure Warning(t1 :string);
begin
   Form1.Chart4.Visible:=false;
   Form1.Chart5.Visible:=false;
   setcolor(1);
   Form1.CoeMemo.Font.Color:=clRed;
//   Form1.CoeMemo.Font.Size:=20;
   Form1.CoeMemo.Lines.Add(t1);
   {outtextxy(30,40,t1);}
   StopKey:='P'; Pause;
   Form1.Chart4.Visible:=true;
   Form1.Chart5.Visible:=true;
end;

function Color_u(x,min,max :double) :integer;
var  sc :double;
begin
  sc:=abs(max-min);  if sc<1e-6 then sc:=1e-6;
  if x<min then x:=min else if x>max then x:=max;
  Color_u:=14-round(abs(x-min)/sc*14);
end;

procedure CalculateAndPrintCV(APop_:TPopulation; var CV_:double);
var i :integer;
    S0_,S1_,S2_ :double;
    t0,t1,t2    :string;
begin
  S0_:=0; S1_:=0;  S2_:=0;
  for i:=0 to APop_.PP.Nts do begin                            { loop for t* }
      S2_:=S2_ + sqr(APop_.ts[i])*APop_.Hzrd[i]*APop_.PP.dts;     {s}
      S1_:=S1_ +     APop_.ts[i] *APop_.Hzrd[i]*APop_.PP.dts;     {1}
      S0_:=S0_ +                  APop_.Hzrd[i]*APop_.PP.dts;     {Hz}
  end;
  //CV_:=sqrt(S2_ - S1_*S1_);
  if S1_>0.01 then CV_:=sqrt(S2_*S0_ - S1_*S1_)/S1_ else CV_:=0;
  str(S0_:9:4,t0);
  str(S1_:9:4,t1);
  str(S2_:9:4,t2);
  Form2.Label1.Caption:=    'S0='+t0+';  S1='+t1+';  S2='+t2;
  Form2.Label2.Caption:=    'CV='+FloatToStr(CV_);
end;

PROCEDURE Initial_Picture;
var
   nl,nle,ntl,i : longint;
   t1,t2,t3,t4  : string;
   tl,Ve_sc,TimeAxisMax     : double;
BEGIN
                  { Cleaning }
   if YesToClean=1 then begin
      Form1.Series1.Clear;
      Form1.Series2.Clear;
      Form1.Series3.Clear;
      Form1.Series8.Clear;
      Form1.Series9.Clear;
      Form1.Series10.Clear;
      Form1.Series11.Clear;
      Form1.Series12.Clear;
      Form1.Series13.Clear;
      Form12.Series3.Clear;
      Form12.Series4.Clear;
      Form5.Series1.Clear;
      Form5.Series2.Clear;
      Form5.Series3.Clear;
      Form5.Series4.Clear;
      Form5.Series5.Clear;
      Form5.Series6.Clear;
      Form5.Series7.Clear;
      Form5.Series8.Clear;
      Form5.Series9.Clear;
      Form5.Series10.Clear;
      Form5.Series11.Clear;
      Form5.Series12.Clear;
      Form5.Series13.Clear;
      Form5.Series14.Clear;
      Form6.Series1.Clear;
      Form6.Series2.Clear;
      Form6.Series3.Clear;
      Form6.Series4.Clear;
      Form6.Series5.Clear;
      Form6.Series6.Clear;
      Form6.Series7.Clear;
      Form6.Series8.Clear;
      Form6.Series9.Clear;
      Form6.Series10.Clear;
      Form7.Series1.Clear;
      Form7.Series2.Clear;
      Form7.Series3.Clear;
      Form7.Series4.Clear;
      Form25.Series1.Clear;
      Form25.Series2.Clear;
      Form25.Series3.Clear;
      Form25.Series4.Clear;
      Form25.Series5.Clear;
      Form25.Series6.Clear;
      Form26.Series1.Clear;
      Form26.Series2.Clear;
      Form26.Series3.Clear;
      Form26.Series4.Clear;
      Form26.Series5.Clear;
      Form26.Series6.Clear;
      Form26.Series7.Clear;
      Form26.Series8.Clear;
      Form26.Series9.Clear;
      Form26.Series10.Clear;
      Form26.Series11.Clear;
      Form26.Series12.Clear;
      Form26.Series13.Clear;
      Form26.Series14.Clear;
      Form26.Series15.Clear;
      Form26.Series16.Clear;
      Form26.Series17.Clear;
      Form26.Series18.Clear;
      Form29.Series1.Clear;
      if (nt<=1)or(nt=nt_end) then begin
         Form1.Series4.Clear;
         Form1.Series5.Clear;
         Form1.Series6.Clear;
         Form1.Series7.Clear;
      end;
   end;
                     { *** Axes *** }
      if           R.NP.If_I_V_or_g=1 then begin
          Form1.Series10.VertAxis:=aLeftAxis;
          Form1.Series11.VertAxis:=aLeftAxis;
      end else if R.NP.If_I_V_or_g in [2,4,5] then begin
          Form1.Series10.VertAxis:=aRightAxis;
          Form1.Series11.VertAxis:=aRightAxis;
      end else if R.NP.If_I_V_or_g=3 then begin
          Form1.Series10.ParentChart:=Form1.Chart6;
          Form1.Series11.ParentChart:=Form1.Chart6;
          Form1.Series10.VertAxis:=aLeftAxis;
          Form1.Series11.VertAxis:=aLeftAxis;
      end;
      TimeAxisMax:=max(MinIfNotZero(PlotWindow,t_end*1000),
                       Form1.Chart1.BottomAxis.Minimum);
      Form1.Chart1.BottomAxis.Minimum:=0;
      Form1.Chart2.BottomAxis.Minimum:=0;
      Form1.Chart3.BottomAxis.Minimum:=0;
      Form1.Chart6.BottomAxis.Minimum:=0;
      Form1.Chart7.BottomAxis.Minimum:=0;
      Form1.Chart1.BottomAxis.Maximum:=max(Form1.Chart1.BottomAxis.Maximum,TimeAxisMax);
      Form1.Chart2.BottomAxis.Maximum:=max(Form1.Chart2.BottomAxis.Maximum,TimeAxisMax);
      Form1.Chart3.BottomAxis.Maximum:=max(Form1.Chart3.BottomAxis.Maximum,TimeAxisMax);
      Form1.Chart6.BottomAxis.Maximum:=max(Form1.Chart6.BottomAxis.Maximum,TimeAxisMax);
      Form1.Chart7.BottomAxis.Maximum:=max(Form1.Chart7.BottomAxis.Maximum,TimeAxisMax);
      Form5.Chart1.BottomAxis.Maximum:=max(Form5.Chart1.BottomAxis.Maximum,TimeAxisMax);
      Form5.Chart2.BottomAxis.Maximum:=max(Form5.Chart2.BottomAxis.Maximum,TimeAxisMax);
      Form5.Chart3.BottomAxis.Maximum:=max(Form5.Chart3.BottomAxis.Maximum,TimeAxisMax);
      Form6.Chart1.BottomAxis.AutomaticMaximum:=(TimeAxisMax=t_end*1000);
      Form6.Chart2.BottomAxis.AutomaticMaximum:=(TimeAxisMax=t_end*1000);
      Form6.Chart3.BottomAxis.AutomaticMaximum:=(TimeAxisMax=t_end*1000);
      Form6.Chart1.BottomAxis.Maximum:=1e6;
      Form6.Chart2.BottomAxis.Maximum:=1e6;
      Form6.Chart3.BottomAxis.Maximum:=1e6;
      Form6.Chart1.BottomAxis.Minimum:=t*1e3;
      Form6.Chart2.BottomAxis.Minimum:=t*1e3;
      Form6.Chart3.BottomAxis.Minimum:=t*1e3;
      Form6.Chart1.BottomAxis.Maximum:=t*1e3+TimeAxisMax;
      Form6.Chart2.BottomAxis.Maximum:=t*1e3+TimeAxisMax;
      Form6.Chart3.BottomAxis.Maximum:=t*1e3+TimeAxisMax;
      Form2.Chart1.BottomAxis.Maximum:=ts_end[1]*1e3;
      Form2.Chart2.BottomAxis.Maximum:=ts_end[2]*1e3;
      Form2.Chart3.BottomAxis.Maximum:=ts_end[1]*1e3;
      Form2.Chart4.BottomAxis.Maximum:=ts_end[2]*1e3;
                     { ***      *** }
      { Sample - 'Black' }
      //MaximumsOfSignals(VexpMax,VmodMax);
      if not((Smpl=0)or(SmplFile[Smpl]='NoFile')) then begin
         Ve_sc:=VI_sc;  if IfUndimensionate=1 then  Ve_sc:=VexpMax;
         xU:=TimeAxisMax/dt;
         nle:=round(nt+xU);  if nle>nt_end then nle:=nt_end;
         for nl:=nt to nle do begin
             ntl:=trunc(nl-trunc(nl/xU)*xU);
             tl:=ntl*dt*1000 {ms};
             if (nl>=0)and(nl<mMaxExp)and
                ((trunc(nl/n_show)=nl/n_show)or(nl=1)) then begin
                Form1.Series10.AddXY(tl, Vexp[nl,Smpl]*Ve_sc);
             end;
         end;
      end;
      { Coefficients }
      PrintCoefficients;
      { Data file name }
      Form1.Label2.Caption:=SmplFile[Smpl];
      { Number of Newton iteration }
      setcolor(1);
      str(nFunk:4,t1);
      t1:='nFunk='+t1+'  ';
//      outtextxy(450,30,t1);
      Form1.Label5.Caption:=t1;
      str(Functional:11,t1);
      t1:='Residual='+t1+'  ';
//      outtextxy(450,45,t1);
      Form1.Label6.Caption:=t1;
      Application.ProcessMessages;
END;

{*********************************************************************}
PROCEDURE Evolution;
var
     Vm_sc,tl,t_sc,ts,dum             :double;
     i,k,ntl,nWindow,L,L_1,L_2        :integer;
BEGIN
  if (Form1.Chart1.Visible=false)and(Form1.CheckBox2.Checked=false) then EXIT;
//  L:=4-IfViewInLayer2or4;
//  L_1:=L+1; L_2:=L+2;
  { Which populations are to be to visualized }
  case Form4.ComboBox4.ItemIndex of
  0: begin L_1:=3; L_2:=4; end;   // View in layer 2/3
  1: begin L_1:=1; L_2:=2; end;   // View in layer 4
  2: begin L_1:=1; L_2:=3; end;   // View pops. 1 and 3
  3: begin L_1:=2; L_2:=4; end;   // View pops. 2 and 4
  end;
  if L_1>NPop  then L_1:=1;
  if L_2>NPop  then L_2:=2;
  if NPop=1 then L_2:=1;
  dum:=MinIfNotZero(PlotWindow,t_end*1000)+1e-8;
  if dum<>0 then t_sc:=dum;
  nWindow:=trunc(t*1000{ms}/t_sc);
  tl:=t*1000{ms}-nWindow*t_sc;
  if (nWindow>0) then begin
   if (tl<=dt*n_show*1000) then begin
      Initial_Picture;
   end;
  end;
  { Labels }
  PrintTime;
  if L_1 in [1,3] then Form1.Label3.Caption:='Excitatory population '+IntToStr(L_1)
                  else Form1.Label3.Caption:='Inhibitory population '+IntToStr(L_1);
  if L_2 in [1,3] then Form1.Label4.Caption:='Excitatory population '+IntToStr(L_2)
                  else Form1.Label4.Caption:='Inhibitory population '+IntToStr(L_2);
  { axon firing rate - 'Red' }
  Form1.Series2.AddXY(tl, AColumn.Pop[L_1].nu);
  Form1.Series3.AddXY(tl, AColumn.Pop[L_2].nu);
  { Long History }
  if (Form1.CheckBox7.Checked)and(Form1.Chart4.Enabled)and(nt>0) then begin
     Form1.Series4.AddXY(t*1000, AColumn.Pop[L_1].nu);
     Form1.Series5.AddXY(t*1000, AColumn.Pop[L_1].U*1000);
     Form1.Series6.AddXY(t*1000, AColumn.Pop[L_2].nu);
     Form1.Series7.AddXY(t*1000, AColumn.Pop[L_2].U*1000);
  end;
  Form1.Series8 .AddXY(tl, AColumn.Pop[L_1].U*1000);
  Form1.Series12.AddXY(tl, AColumn.Pop[L_2].U*1000);
  { Conductances }
  // Moved to Unit5 on 20.03.2013


  { Current - 'Green'; Iind - 'Maroon' dashed }
  Form1.Series9 .AddXY(tl, AColumn.Pop[L_1].Isyn);
  Form1.Series13.AddXY(tl, AColumn.Pop[L_2].Isyn);
  if (I_ind<>0)or(Form4.ComboBox7.ItemIndex=4) then begin
     Form1.Series1.AddXY(tl, AColumn.Pop[L_1].Iind*NP0[1].Square*1e9);
  end else begin
//     if pext<1900 then   { To avoid stupid Delphi error }
     Form1.Series1.AddXY(tl, pext);
  end;
  { registered potential - 'Lime' }
  Vm_sc:=VI_sc;  {if IfUndimensionate=1 then  Vm_sc:=VmodMax;}
  if nt>0 then 
  Form1.Series11.AddXY(tl, Vmod[imin(nt,mMaxExp)]*Vm_sc);
  Application.ProcessMessages;
END;

procedure DrawPhaseSpace;
var
     ts_,m_roE,m_roI,m_HzE,m_HzI         :double;
     i,k,L,L_1,L_2,xThr_                 :integer;
begin
  if not(Form2.Visible) then exit;
  L:=4-IfViewInLayer2or4;
  L_1:=L+1; if L_1>NPop  then L_1:=1;
  L_2:=L+2; if L_2>NPop  then L_2:=2;
  if NPop=1 then L_2:=1;
     Form2.SeriesE_ro.Clear;
     Form2.SeriesE_V .Clear;
     Form2.SeriesE_VE.Clear;
     Form2.SeriesE_nn.Clear;
     Form2.SeriesI_nn.Clear;
     Form2.SeriesI_ro.Clear;
     Form2.SeriesI_V .Clear;
     Form2.SeriesI_VE.Clear;
     Form2.SeriesE_VT.Clear;
     Form2.SeriesI_VT.Clear;
     Form2.Series1.Clear;
     Form2.Series2.Clear;
     Form2.Series3.Clear;
     Form2.Series7.Clear;
     Form2.Series9.Clear;
     Form2.Series11.Clear;
     Form2.Series12.Clear;
     Form2.Series16.Clear;
     Form2.Series17.Clear;
     { Maximums }
     m_roE:=0;     m_HzE:=0;
     for i:=0 to AColumn.Pop[L_1].PP.Nts do begin
         m_roE:=max(m_roE,AColumn.Pop[L_1].ro_at_its(i));
         m_HzE:=max(m_HzE,AColumn.Pop[L_1].Hzrd[i]);
     end;
     m_roI:=0;     m_HzI:=0;
     for i:=0 to AColumn.Pop[L_2].PP.Nts do begin
         m_roI:=max(m_roI,AColumn.Pop[L_2].ro_at_its(i));
         m_HzI:=max(m_HzI,AColumn.Pop[L_2].Hzrd[i]);
     end;
     k:=1;
     for i:=0 to AColumn.Pop[L_1].PP.Nts do begin
         ts_:=AColumn.Pop[L_1].ts[i]*1e3;
         Form2.SeriesE_ro.AddXY (ts_,  AColumn.Pop[L_1].ro_at_its(i));
         Form2.SeriesE_V.AddXY  (ts_, (AColumn.Pop[L_1].Nrn[i].NV.V-NP0[1].Vrest)*1000);
         if (NP0[k].HH_order='2-points')or(NP0[k].HH_order='2-p-ActiveDend') then
         Form2.SeriesE_VE.AddXY (ts_, (AColumn.Pop[L_1].Nrn[i].NV.Vd-NP0[1].Vrest)*1000);
         Form2.SeriesE_nn.AddXY (ts_,  AColumn.Pop[L_1].Nrn[i].NV.nn);
         Form2.Series1.AddXY    (ts_,  AColumn.Pop[L_1].Nrn[i].NV.yK);
         Form2.Series2.AddXY    (ts_,  AColumn.Pop[L_1].Nrn[i].NV.nA);
         Form2.Series3.AddXY    (ts_,  AColumn.Pop[L_1].Nrn[i].NV.lA);
         Form2.Series7.AddXY    (ts_,  AColumn.Pop[L_1].Nrn[i].NV.nM);
         Form2.Series9.AddXY    (ts_,  AColumn.Pop[L_1].Nrn[i].NV.wAHP);
         Form2.Series16.AddXY   (ts_,  AColumn.Pop[L_1].Nrn[i].NV.gActive/NP0[1].gL);
         Form2.SeriesE_VT.AddXY (ts_,  AColumn.Pop[L_1].VT[i]*1e3);
         if m_HzE>0 then Form2.Series11.AddXY(ts_, AColumn.Pop[L_1].Hzrd[i]/m_HzE*m_roE);
     end;
     for i:=0 to AColumn.Pop[L_2].PP.Nts do begin
         ts_:=AColumn.Pop[L_2].ts[i]*1e3;
         Form2.SeriesI_nn.AddXY (ts_,  AColumn.Pop[L_2].Nrn[i].NV.nn);
         Form2.Series17.AddXY   (ts_,  AColumn.Pop[L_2].Nrn[i].NV.gActive/NP0[2].gL);
         Form2.SeriesI_ro.AddXY (ts_,  AColumn.Pop[L_2].ro_at_its(i));
         Form2.SeriesI_V.AddXY  (ts_, (AColumn.Pop[L_2].Nrn[i].NV.V-NP0[2].Vrest)*1000);
         if (NP0[k].HH_order='2-points')or(NP0[k].HH_order='2-p-ActiveDend') then
         Form2.SeriesI_VE.AddXY (ts_, (AColumn.Pop[L_2].Nrn[i].NV.Vd-NP0[2].Vrest)*1000);
         Form2.SeriesI_VT.AddXY (ts_,  AColumn.Pop[L_2].VT[i]*1e3);
         if m_HzI>0 then Form2.Series12.AddXY(ts_, AColumn.Pop[L_2].Hzrd[i]/m_HzI*m_roI);
     end;
     { "xThr"-point of incrementation ("Hzrd" maximum) }
     xThr_:=AColumn.Pop[L_1].xThr;
     Form2.Series13.Clear;
     Form2.Series13.AddXY(AColumn.Pop[L_1].ts[xThr_]*1e3,AColumn.Pop[L_1].Nrn[xThr_].NV.nM);
end;

procedure WritePhaseSpace;
var
    i,iLN :integer;
    aaa :text;
    S :double;
begin
  assign(aaa,'PhaseSpace.dat'); rewrite(aaa);
  for i:=0 to AColumn.Pop[1].PP.Nts do begin
      S:=0;       // S - cumulative density
      for iLN:=1 to AColumn.Pop[1].LogN.Nx do begin
          S:=S + AColumn.Pop[1].ro[i,iLN]*AColumn.Pop[1].PHI_dx[iLN];
      end;
      {                          V1                V2                          }
      write  (aaa,AColumn.Pop[1].ts[i]*1e3:8:2,' ',S:11:5,' ');
      {                                    V3                                  }
      write  (aaa,AColumn.Pop[1].Nrn[i].NV.V*1e3:8:2,' ');
      {                          V4                                            }
      write  (aaa,AColumn.Pop[1].Hzrd[i]:11:5,' ');
      {                           V5                                           }
      writeln(aaa,(AColumn.Pop[1].VT[i]+ AColumn.Pop[1].PP.NP.Vrest)*1e3:8:2);
  end;
  close(aaa);
end;

end.
