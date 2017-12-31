unit FiberO;
{ Solves the cable equation
  C dV/dt - D d^2V/dz^2 = Im(V,t) + Isyn(V,t)
  where Im   = -gL(V-VL) -INa -IK ...,   according to 'HH_type',
        Isyn =-ss(V-Vus)+uu,
        D    = g0* lamda^2
  Integration scheme linearizes the eq. as follows
  Im(V,t)=-g(V-Vold)+Im(Vold,t)+Isyn(Vold,t)
  g=g_Active + gL + ss
}

interface
uses
  Classes,Forms,
  typeNrnParsO,t_dtO,CondBasedO,MathMyO,NeuronO,SetNrnParsO,CreateNrnO,Unit12;

const MaxFb=500;

type
  arr_Fb=array[0..MaxFb] of double;

  { Properties: }
  FiberProperties =record
    Name                                                :string;
    NP                                                  :NeuronProperties;
    dz,L,Vh,ri,RL,lamda,diam,dS
                                                        :double;
    Nz,IfVoltageClamp                                   :integer;
  end;

  {==================================================================}
  TFiber = class
  private
  protected
  public
    {Properties:}
    FP                                          :FiberProperties;
    {Control variables:}
    uu,ss,Iind_mA                               :arr_Fb;
    {Variables:}
    Nrn                                         :array[0..MaxFb] of TNeuron;
    V,g,Im,Isyn,Vold                            :arr_Fb;
    I_soma,I_axon,Jm_soma,Jm_axon               :double;
    {Functions:}
    {*******************************************}
    procedure EquateFrom(AFiber :TFiber);
    procedure EquateTo(AFiber :TFiber);
    function Calculate_LFP :double;
    procedure Draw;
    procedure ClearDrawing;

    procedure InitialConditions;
    procedure Heat_Eq_Step;
    procedure MembranePotential(t_ :double);

    constructor Create(FP_ :FiberProperties);
  end;
  {==================================================================}

procedure Initiate_NP_ForFiber_O(HH_type,HH_order :string;
                                 var NP :NeuronProperties);
procedure CreateFiberBy_NP_O(Name :string; Nz,IfVoltageClamp :integer;
                                  dt_,L,Vh,lamda,RL :double;
                                  NP :NeuronProperties; var AFiber :TFiber);

implementation


procedure Initiate_NP_ForFiber_O(HH_type,HH_order :string;
                                 var NP :NeuronProperties);
begin
  { Define the type of neuron }
  NP.HH_type :=HH_type;
  NP.HH_order:=HH_order;
  { Set parameters according to the type of neuron }
  HodgkinPhysParameters(NP);
end;

procedure CreateFiberBy_NP_O(Name :string; Nz,IfVoltageClamp :integer;
                                  dt_,L,Vh,lamda,RL :double;
                                  NP :NeuronProperties; var AFiber :TFiber);
var  FP_ :FiberProperties;
begin
  { Create Object-Population }
  dt:=dt_;
  FP_.Name:=Name;
  FP_.NP:=NP;
  FP_.Nz:=Nz;
  FP_.L:=L;
  FP_.dz:=L/Nz;
  FP_.Vh:=Vh;
  FP_.lamda:=lamda;  {cm}
  FP_.RL :=RL;   {kOhm*cm}
  FP_.diam:=sqr(lamda)*4*(NP.C_membr/NP.tau_m0)*RL;  {cm}
  FP_.ri:=RL/(pi*sqr(FP_.diam)/4); {kOhm/cm}  // intracell. resistance per unit length
  FP_.IfVoltageClamp:=IfVoltageClamp;
  FP_.dS:=pi*FP_.diam*FP_.dz;
  AFiber:=TFiber.Create(FP_);
end;

{********** procedures of the class *************************************}

constructor TFiber.Create(FP_ :FiberProperties);
var i :integer;
begin
  inherited Create;
  { Create set of neurons }
  for i:=0 to FP_.Nz do begin
      CreateNeuronByTypeO(FP_.NP,Nrn[i]);
  end;
  { Fulfil parameters }
  FP:=FP_;
end;

procedure TFiber.EquateFrom(AFiber :TFiber);
var i :integer;
begin
  FP  :=AFiber.FP  ;
  for i:=0 to FP.Nz do begin
      uu[i]  :=AFiber.uu[i];
      ss[i]  :=AFiber.ss[i];
      Iind_mA[i]:=AFiber.Iind_mA[i];
      V[i]   :=AFiber.V[i];
      g[i]   :=AFiber.g[i];
      Im[i]  :=AFiber.Im[i];
      Isyn[i]:=AFiber.Isyn[i];
      Nrn[i].EquateFrom(AFiber.Nrn[i]);
  end;
end;

procedure TFiber.EquateTo(AFiber :TFiber);
var i :integer;
begin
  AFiber.FP  :=FP  ;
  for i:=0 to FP.Nz do begin
      AFiber.uu[i]  :=uu[i];
      AFiber.ss[i]  :=ss[i];
      AFiber.Iind_mA[i]:=Iind_mA[i];
      AFiber.V[i]   :=V[i];
      AFiber.g[i]   :=g[i];
      AFiber.Im[i]  :=Im[i];
      AFiber.Isyn[i]:=Isyn[i];
      AFiber.Nrn[i].EquateFrom(Nrn[i]);
  end;
end;

function TFiber.Calculate_LFP :double;
var S,d_,h_,z_,Jm_,Area_,sgm_   :double;
    i                           :integer;
begin
  sgm_:=3;        {Holt 98, p.22; Nicholson, p.363}                {mS/cm}
  d_:=Form12.DDSpinEdit5.Value*FP.L;
  h_:=Form12.DDSpinEdit1.Value*FP.L;
  Area_:=pi*FP.diam*FP.dz;                                         {cm^2}
  S:=        Jm_soma   /sqrt(sqr(d_)   +sqr(h_));                  {mA}
  for i:=1 to FP.Nz do begin
      z_:=i*FP.dz;
      Jm_:=FP.NP.C_membr*Nrn[i].NV.DVDt - Im[i] - Isyn[i];         {mA/cm^2}
      S:=S + Jm_*Area_ /sqrt(sqr(z_-d_)+sqr(h_));                  {muV}
  end;
  Calculate_LFP:=-1/(4*pi*sgm_) * S;
end;

procedure TFiber.Draw;
var i             :integer;
    t1            :string;
    LFP_          :double;
begin
  { Drawing }
  Form12.LineSeries2.Clear;
  Form12.Series1.Clear;
  Form12.Series7.Clear;
  Form12.Series8.Clear;
  for i:=0 to FP.Nz do begin
      Form12.Series1.AddXY(FP.dz*i*1e4,V[i]*1000);
      Form12.LineSeries2.AddXY(FP.dz*i*1e4,g[i]);
      Form12.Series7.AddXY(FP.dz*i*1e4,Nrn[i].NV.mm);
      Form12.Series8.AddXY(FP.dz*i*1e4,Nrn[i].NV.hh);
//      Form12.Series9.AddXY(FP.dz*i*1e4,-60+Nrn[i].NP.NaThreshShift-7{mV}*ln(Nrn[i].NV.hh));
  end;
  Form12.LineSeries1.AddXY(t*1e3,I_soma*1e9{pA});
  Form12.LineSeries3.AddXY(t*1e3,I_axon*1e9{pA});
  Form12.Series11.AddXY(t*1e3,Jm_soma*1e9{pA});
  Form12.Series12.AddXY(t*1e3,Jm_axon*1e9{pA});
  Form12.LineSeries4.AddXY(t*1e3,Iind_mA[0]*1e9{pA});
  Form12.LineSeries5.AddXY(t*1e3,Iind_mA[FP.Nz]*1e9{pA});
  Form12.Series5.AddXY(t*1e3,V[FP.Nz]*1000);
  Form12.Series6.AddXY(t*1e3,V[0]*1000);
  { LFP }
  if Form12.PageControl1.TabIndex=5 then begin
     LFP_:=Calculate_LFP;
     Form12.Series13.AddXY(t*1e3,LFP_*1e3{nV});
     Form12.Series14.AddXY(t*1e3,-Jm_soma*1e9{pA});
  end;
  Application.ProcessMessages;
end;

procedure TFiber.ClearDrawing;
begin
  Form12.LineSeries2.Clear;
  Form12.Series1.Clear;
  Form12.Series7.Clear;
  Form12.Series8.Clear;
  { Clean plots in time only if required }
  if Form12.CheckBox1.Checked then begin
     Form12.LineSeries1.Clear;
     Form12.LineSeries3.Clear;
     Form12.Series11.Clear;
     Form12.Series12.Clear;
     Form12.LineSeries5.Clear;
     Form12.LineSeries4.Clear;
     Form12.Series5.Clear;
     Form12.Series6.Clear;
     Form12.Series13.Clear;
     Form12.Series14.Clear;
  end;
end;

procedure TFiber.InitialConditions;
var  i,nt_  :integer;
begin
  t:=0;
  { Set conditions at rest }
  for i:=0 to FP.Nz do begin
      Nrn[i].InitialConditions;
  end;
  FP.NP:=Nrn[FP.Nz].NP;
  { Fulfil voltage, conductance and current }
  for i:=0 to FP.Nz do begin
      V[i]:=Nrn[i].NV.V;
      g[i]:=Nrn[i].NV.gActive+Nrn[i].NP.gL;
      Im[i]:=Nrn[i].NV.Im;
      Isyn[i]:=-ss[i]*(V[i]-Vus) + uu[i];
  end;
  { ClearDrawing }
  ClearDrawing;
end;

{**********************************************************************}
procedure TFiber.Heat_Eq_Step;
{The heat transfer eq. is solved:
        [C d/dt - D d^2/dz^2 + g] V = g*Vold + Im+Isyn
D=g0*sqr(lamda).
Two problems are considered:
1)  "Voltage Clamp":
               V=0                                        dV/dz=ri*Iind[N]*dS
                O===================================================
               z=0                                               z=L

2)  "Current Clamp":
   dV/dz=ri*(C dV/dt-Im-Isyn)*Ssoma                       dV/dz=ri*Iind[N]*dS
                O===================================================
               z=0                                               z=L
}
{**********************************************************************}
var
   a,b,c,d                    :arr_Fb;
   nu,Cm                      :double;
   i,N                        :integer;
begin
      { Define coefficients of Thomas algorithm }
      N:=FP.Nz;
      Cm:=FP.NP.C_membr;
      nu:=dt/FP.NP.tau_m0*sqr(FP.lamda/FP.dz);
      for i:=1 to N-1 do begin
          a[i]:=     -nu;
          d[i]:=1 + 2*nu + dt/Cm*g[i];
          b[i]:=     -nu;
          c[i]:=V[i]     + dt/Cm*(g[i]*V[i] + Im[i]+Isyn[i] + Iind_mA[i]/FP.dS);
      end;
      { Boundary conditions }
      if FP.IfVoltageClamp=1 then begin    { V[0]=Vh }
         a[0]:=0;   d[0]:=1;    c[0]:=FP.Vh;
      end else begin                       { dV/dz=ri*(C dV/dt-Im-Isyn)*Ssoma }
         a[0]:= 1/FP.dz;
         d[0]:=-1/FP.dz-FP.ri* (g[0]      + Cm/dt)*FP.NP.Square;
         c[0]:=        -FP.ri*((g[0]*V[0] + Cm*V[0]/dt
                                + Im[0]+Isyn[0])*FP.NP.Square+Iind_mA[0]);
      end;
      d[N]:=1/FP.dz;  b[N]:=-1/FP.dz;  c[N]:=FP.ri*Iind_mA[N];  { dV/dz=ri*Iind[N] }
      { Forward Thomas algorithm }
      for i:=1 to N do begin
          d[i]:=d[i]-b[i]/d[i-1]*a[i-1];
          c[i]:=c[i]-b[i]/d[i-1]*c[i-1];
      end;
      { Forward Thomas algorithm }
      V[N]:=c[N]/d[N];
      for i:=N-1 downto 0 do begin
          V[i]:=(c[i]-a[i]*V[i+1])/d[i];
      end;
end;
{*********************** End of Heat_Eq *******************************}

procedure TFiber.MembranePotential(t_:double);
var  i :integer;
     RHP,dum,g_Active,CdVdt_soma,CdVdt_axon,dVdz_soma,dVdz_axon,
     DVDt_old                           :double;
begin
  t:=t_;
  for i:=0 to FP.Nz do begin
      Vold[i]:=V[i];
      {******* One step of conductance integration *******************}
      Nrn[i].Calc_RHP_and_g(RHP,dum,g_Active);
      {***************************************************************}
      V[i]:=Nrn[i].NV.V;
      g[i]:=g_Active + Nrn[i].NP.gL + ss[i];
      Im[i]:=RHP - Nrn[i].NP.gL*(V[i]-FP.NP.VL) {+ Iind[i]};
      Isyn[i]:= -ss[i]*(V[i]-Vus) + uu[i];
   end;
  {*** Cable equation ***}
  Heat_Eq_Step;
  {**********************}
  for i:=0 to FP.Nz do begin
      Nrn[i].NV.Vold:=Nrn[i].NV.V;
      DVDt_old:=Nrn[i].NV.DVDt;
      {****************}
      Nrn[i].NV.V:=V[i];
      {****************}
      Nrn[i].NV.DVDt:=(Nrn[i].NV.V-Nrn[i].NV.Vold)/dt;
      Nrn[i].NV.ddV:=(Nrn[i].NV.DVDt-DVDt_old)/dt;
  end;
  { Boundary currents }
  CdVdt_soma:=FP.NP.C_membr*(V[0]    -Vold[0]    )/dt;
  CdVdt_axon:=FP.NP.C_membr*(V[FP.Nz]-Vold[FP.Nz])/dt;
  dVdz_soma:=(Nrn[1].NV.V    -Nrn[0].NV.V      )/FP.dz;  {V/cm}
  dVdz_axon:=(Nrn[FP.Nz].NV.V-Nrn[FP.Nz-1].NV.V)/FP.dz;  {V/cm}
  Jm_soma:=(CdVdt_soma - Im[0]     - Isyn[0]    )*FP.NP.Square - Iind_mA[0];{mA}
  Jm_axon:=(CdVdt_axon - Im[FP.Nz] - Isyn[FP.Nz])*FP.NP.Square - Iind_mA[FP.Nz];  {mA}
  I_soma:=-dVdz_soma/FP.ri + Jm_soma;  {mA}
  I_axon:=-dVdz_axon/FP.ri + Jm_axon;  {mA}
end;

end.
