unit RepresentativesO;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,Math,
     Init, t_dtO, Unit1,Unit4,Unit6,Unit10,
     typeNrnParsO, NeuronO, CreateNrnO, SetNrnParsO,Correspond,
     ConnectionsO,ColumnO;

procedure InitiateRepresentativeNeuronsO;
procedure DestroyRepresentativeNeuronsO;
procedure PrepareFormForRepresentativeNeuronsO;
procedure OneStepForRepresentativeNeuronsO(Pt,Pdt :Pdouble);

var
  NP_,NP_tmp            :NeuronProperties;
  ANrns,BGNrns          :array[1..4] of TNeuron;
  Inoise                :array[1..4] of double;
  rrr                   :text;

implementation

procedure InitiateRepresentativeNeuronsO;
var  ip :integer;
begin
  for ip:=1 to NPop do begin
      NP_:=AColumn.Pop[ip].PP.NP;
      NP_.Thr_type:='Default-2';                            //14.05.2016
      { If this representative neuron is the registered one... }
      if ip=i3 then begin
//         NP_.Vrest:=NP_.Vrest+ShiftOfVrest;
         NP_.IfThrModel:=R.NP.IfThrModel;
         if NP_.IfThrModel=0 then begin
            NP_.IfBlockNa:=0;
            NP_tmp:=NP_;
            DefaultCanalParameters(NP_tmp);
            NP_.gNa:=NP_tmp.gNa;
         end;
         NP_.If_I_V_or_g:=R.NP.If_I_V_or_g;
         NP_.Vrest:=R.NP.Vrest;
         NP_.ThrShift:=R.NP.ThrShift;
//         NP_.Thr_type:='Default-2';                         //13.05.2016
         if R.NP.Square>0 then NP_.Square:=R.NP.Square;
         R.NP.Square:=NP_.Square;
      end;
      { Create an object and set initial conditions }
      CreateNeuronByTypeO(NP_, ANrns[ip]);
      @ANrns[ip].NP.IfSpikeOccursInThrModel:=nil;
      ANrns[ip].InitialConditions;
      { BG }
      if (IfBGColumnCreated)and(IfBGinProcess=false) then
                            ANrns[ip].EquateFrom(BGNrns[ip]);
      {****}
      Inoise[ip]:=0;
      CorrespondParametersToTheForm;
  end;
  { Drawing }
  Form6.Series1.Clear;
  Form6.Series2.Clear;
  Form6.Series5.Clear;
  Form6.Series6.Clear;
  Form6.Series7.Clear;
  Form6.Series8.Clear;
  Form6.Series9.Clear;
  Form6.Series10.Clear;
  { Writing }
  assign(rrr,'Representatives_U_nu(t).dat'); rewrite(rrr); close(rrr);
end;

procedure DestroyRepresentativeNeuronsO;
var i :integer;
begin
  { Destruction }
  if nt>=nt_end then for i:=1 to NPop do begin
     ANrns[i].Free;
  end;
end;

procedure PrepareFormForRepresentativeNeuronsO;
begin
  //Form1.CheckBox1.Checked:=true;
  //Form10.CheckBox5.Checked:=true;
  //Form6.Visible:=true;
  Form6.CheckBox3.Checked:=false;
//  Form6.CheckBox3.Visible:=false;
{  Form6.Series1.Active:=false;
  Form6.Series2.Active:=false;}
  Form6.Chart1.Visible:=(NPop>=1);
  Form6.Chart2.Visible:=(NPop>=2);
  Form6.Chart4.Visible:=(NPop>=3);
  Form6.Chart5.Visible:=(NPop>=4);
  { If switch on when simulating, create an object and set initial conditions }
{  if nt>1 then begin
     InitiateRepresentativeNeuronsO;
  end;}
end;

function Current_Iind_InNeuron(t,Iind,Freq_Iind,
                               t_Iind,t_IindShift,Square :double) :double;
var  w,tp,t_ :double;
begin
  t_:=t-t_IindShift;
  if (t_>t0_ind) and (t_<=t0_ind+t_Iind) then begin
     if Freq_Iind=0 then begin
        w:=Iind;
        { Meander, negative part }
        if (Form4.ComboBox1.ItemIndex=3)and(t_>=t0_ind+t_Iind/2) then w:=-w;
     end else w:=Iind*sin(2*pi*Freq_Iind*t_);
     Result:=w/(Square*1e9);
  end else begin
     Result:=0;
  end;
  { Pulse train }
  if (Freq_Iind>0)and(t_Iind<0.005) then begin
     tp:=trunc(t_*Freq_Iind)/Freq_Iind;
     if (t_>tp)and(t_<tp+t_Iind)and(trunc(t_*Freq_Iind)<=10)
     then  Result:=Iind/(Square*1e9)
     else  Result:=0;
  end;
end;

function Add_Iind(ip :integer) :double;
begin
  if ip=i3 then begin
     Add_Iind:=Current_Iind_InNeuron(t,Iind_ReprNrn,nu_ind,t_ind,t0_ind,ANrns[ip].NP.Square);
  end else begin
     Add_Iind:=0;
  end;
end;

procedure WriteRepresentative;
var ip     :integer;
begin
  append(rrr);
  write  (rrr,t*1000:8:4,' ');
  for ip:=1 to NPop do write(rrr,ANrns[ip].NV.V*1e3:9:5,' ',AColumn.Pop[ip].nu:8:2,' ');
  writeln(rrr);
  close(rrr);
end;

procedure OneStepForRepresentativeNeuronsO(Pt,Pdt :Pdouble);
var i                                               :integer;
    Iinj_,Ampl_Noise,tau_Noise,x,s_gL,gL0           :double;
begin
  { At t=0 create an object and set initial conditions }
{  if nt=1 then begin
     InitiateRepresentativeNeuronsO;
  end;}
//  taum_taus:=Form4.DDSpinEdit98.Value;
  t:=Pt^;  dt:=Pdt^;
  for i:=1 to NPop do with AColumn.Pop[i] do begin
      Iinj_:=Iind+Add_Iind(i);
      gL0:=PP.NP.C_membr/PP.NP.tau_m0;
      s_gL:=(sE+sI)/gL0;
      { Color Noise-current }
      Ampl_Noise:=PP.sgm_V*gL0;
      { Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b; }
      if Form4.CheckBox10.Checked then Ampl_Noise:=Ampl_Noise*sqrt(1+s_gL); // sqrt is introduced on 25.02.2017
      if Form4.CheckBox20.Checked{'IfNoise'}=false then Ampl_Noise:=0;
      if taum_taus=0 then tau_Noise:=0 else tau_Noise:=PP.NP.tau_m0/taum_taus;
      if tau_Noise=0 then begin
         Inoise[i]:=Ampl_Noise*sqrt(2*PP.NP.tau_m0  {/(1+s_gL)}  /dt)*randG(0,1);  //commented on 20.09.2012
      end else begin
         x:=Ampl_Noise*randG(0,1);
         Inoise[i]:=Inoise[i] - Inoise[i]/tau_Noise*dt + x*sqrt(2*dt/tau_Noise);
      end;
      {********* One step of integration **********************************}
      ANrns[i].MembranePotential(uE,sE,uI,sI,tt,Iinj_+Inoise[i],R.NP.Vrest);
      {********************************************************************}
  end;
  { Draw }
  if (trunc(nt/n_show)=nt/n_show)or(nt=1) then begin
     if NPop>=1 then Form6.Series1.AddXY(t*1000,ANrns[1].NV.V*1000);
     if NPop>=2 then Form6.Series2.AddXY(t*1000,ANrns[2].NV.V*1000);
     if NPop>=3 then Form6.Series7.AddXY(t*1000,ANrns[3].NV.V*1000);
     if NPop>=4 then Form6.Series8.AddXY(t*1000,ANrns[4].NV.V*1000);
     if NPop>=1 then Form6.Series5.AddXY(t*1000,AColumn.Pop[1].nu);
     if NPop>=2 then Form6.Series6.AddXY(t*1000,AColumn.Pop[2].nu);
     if NPop>=3 then Form6.Series9.AddXY(t*1000,AColumn.Pop[3].nu);
     if NPop>=4 then Form6.Series10.AddXY(t*1000,AColumn.Pop[4].nu);
     Application.ProcessMessages;
  end;
  { Write }
  WriteRepresentative;
end;

end.

