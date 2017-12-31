unit IonsO;
{ Describes the dynamics of the ionic concentrations for Ko and Cli
  and calculates the reversal potentials VK and VCl. }

interface
uses
  Classes,Forms,
  t_dtO,typeSynParsO,MathMyO,Unit26,{Init,}typeNrnParsO;

type
  {==================================================================}
  IonsProperties =record
    K_0,Cl_0,Na_0,K_fix,Cl_fix,
    Ki,Cl_inf,Clo,e0,Nai_alpha,Ko_alpha,
    tau_Cl_0,tau_Cl_inf,alpha_KCl,factor_IK_leak_IK_tot,
    k_K,k_Cl,d,F,gL_K,gL_Cl,gL_Na,q_Na,
    dVAHP,dVK,dVKDr,dVKM,dVKD,dVNa,dVGABA,dVGABB,dVL,dVrest,
    Bmax,k1,k1N, Kext, Ikcc2_max, Vhalf,
    Nao,  gg_kl, gg_Nal, INaKpump_max, Diff_coe,
    Contribution,VGABA0,HCO3in,HCO3out,Vgaba_shift
                                                          :double;
    If_Glia,If_Diffusion,If_K_fixed,If_Cl_fixed,
    NaKpump_Item,KCC2_Item,VL_Item                        :integer;
  end;

  IonsVariables =record
    K,Cl,Na,VCl,VK,VNa,VL,VGABA,
    INaKpump,
    B,I_Glia,I_Diff
                                                          :double;
  end;

  TIons = class
  private
  protected
  public
    iPop :integer;
    {Variables:}
    IV :IonsVariables;
    {Functions:}
    {*******************************************}
    procedure InitialConditions(iPop_ :integer; var NP_ :NeuronProperties);
    function GlialBuffer :double;
    procedure Integrate(Umean{V},IK_tot{mA/cm^2},gGlu_tot,gGABA_tot{mS/cm^2},nu{Hz} :double);
    procedure Draw;
    procedure Draw2;
    procedure Writing;

    constructor Create;
    procedure EquateFrom(AIons :TIons);
    procedure EquateTo(AIons :TIons);
  end;
  {==================================================================}
  procedure ParamsToForm26;

var
  {Properties:}
  IonsP                                    :array[1..3] of IonsProperties;

implementation

var
    iii                                   :text;
    IK_,IK_leak_,ICl_leak_,INa_leak_,
    ICl_,IKCC2_,I_K_Na_Cl_,IGABA_tot_,
    INa_glu_,IK_glu_
                                          :array[1..3] of double;
    G_,Diff_                              :double;

constructor TIons.Create;
begin
  inherited Create;
end;

procedure TIons.EquateFrom(AIons :TIons);
begin
  { Properties }
  iPop :=AIons.iPop ;
  { Variables }
  IV :=AIons.IV ;
end;

procedure TIons.EquateTo(AIons :TIons);
begin
  { Properties }
  AIons.iPop :=iPop;
  { Variables }
  AIons.IV :=IV ;
end;

procedure ParamsToForm26;
var iPop :integer;
begin
  for iPop:=1 to 3 do with IonsP[iPop] do begin
    { K and Cl concentrations }
    k1        :=Form26.DDSpinEdit4.Value; //0.0008{1/ms} in [Bazhenov,Timofeev,...,2004]
    k_K       :=Form26.DDSpinEdit5.Value; //10 {*10^2 cm^3};
    k_Cl      :=Form26.DDSpinEdit6.Value; //100 {*10^6 cm^2};
    K_fix :=Form26.DDSpinEdit22.Value;  { Ko fixed, mM }
    Cl_fix:=Form26.DDSpinEdit23.Value;  { Cli fixed, mM }
    If_K_fixed  :=IfTrue(Form26.CheckBox2.Checked);
    If_Cl_fixed :=IfTrue(Form26.CheckBox3.Checked);
    VL_Item     :=Form26.RadioGroup3.ItemIndex;
    Form26.DDSpinEdit22.Enabled:=Form26.CheckBox2.Checked;
    Form26.DDSpinEdit23.Enabled:=Form26.CheckBox3.Checked;
    Form26.DDSpinEdit9.Enabled:=not(Form26.CheckBox2.Checked);
    Form26.DDSpinEdit10.Enabled:=not(Form26.CheckBox3.Checked);
    Form26.DDSpinEdit12.Enabled:=(Form26.CheckBox4.Checked);
    Form26.DDSpinEdit13.Enabled:=(Form26.CheckBox4.Checked);
    Form26.DDSpinEdit18.Enabled:=(iPop>=3);
    Form26.DDSpinEdit25.Enabled:=(iPop>=3);
    Clo:=Form26.DDSpinEdit16.Value; //130 {mM};
    Kext:=Form26.DDSpinEdit13.Value;
    factor_IK_leak_IK_tot:=Form26.DDSpinEdit3.Value;
    { GABA }
    case iPop of
    1: Vgaba_shift:=Form26.DDSpinEdit24.Value/1000;    // mM  {Glykys et al.K_0 2014}
    2: Vgaba_shift:=Form26.DDSpinEdit27.Value/1000;
    3: Vgaba_shift:=Form26.DDSpinEdit25.Value/1000;
    end;
    { Glia }
    If_Glia:=IfTrue(Form26.CheckBox1.Checked);
    { NaK-pump }
    INaKpump_max:=Form26.DDSpinEdit20.Value; //20 {muA/cm^2};
    NaKpump_Item:=Form26.RadioGroup4.ItemIndex;
    { KCC2 }
    KCC2_Item   :=Form26.RadioGroup1.ItemIndex;
    { KCC2 Bazhenov }
    tau_Cl_0  :=Form26.DDSpinEdit7.Value; //100 {ms};
    tau_Cl_inf:=Form26.DDSpinEdit8.Value; //2e4 {ms};
    alpha_KCl :=Form26.DDSpinEdit11.Value; // 0.08 {mM} norm, 1000 {mM} path
    { KCC2 Doyon }
    case iPop of
    1: Ikcc2_max:=Form26.DDSpinEdit14.Value;     // muA/cm^2
    2: Ikcc2_max:=Form26.DDSpinEdit26.Value;     // muA/cm^2
    3: Ikcc2_max:=Form26.DDSpinEdit18.Value;     // muA/cm^2
    end;
    Vhalf    :=Form26.DDSpinEdit15.Value;     // mV
    case KCC2_Item of
    0: {Bazhenov} begin
                    Form26.DDSpinEdit7.Enabled:=true;
                    Form26.DDSpinEdit8.Enabled:=true;
                    Form26.DDSpinEdit11.Enabled:=true;
                    Form26.DDSpinEdit14.Enabled:=false;
                    Form26.DDSpinEdit15.Enabled:=false;
                    Form26.DDSpinEdit18.Enabled:=false;
                    Form26.DDSpinEdit26.Enabled:=false;
                  end;
    1: {Doyon}    begin
                    Form26.DDSpinEdit7.Enabled:=false;
                    Form26.DDSpinEdit8.Enabled:=false;
                    Form26.DDSpinEdit11.Enabled:=false;
                    Form26.DDSpinEdit14.Enabled:=true;
                    Form26.DDSpinEdit15.Enabled:=true;
                    Form26.DDSpinEdit18.Enabled:=true;
                    Form26.DDSpinEdit26.Enabled:=true;
                  end;
    end;
    { Diffusion }
    If_Diffusion:=IfTrue(Form26.CheckBox4.Checked);
    Diff_coe:=Form26.DDSpinEdit12.Value;
    { Contribution to K of Pop 2,3 }
    case iPop of
      1: Contribution:=1-Form26.DDSpinEdit19.Value-Form26.DDSpinEdit28.Value;
      2: Contribution:=Form26.DDSpinEdit28.Value;
      3: Contribution:=Form26.DDSpinEdit19.Value;
    end;
  end;
end;

procedure TIons.InitialConditions(iPop_ :integer; var NP_ :NeuronProperties);
begin
  { Initiate writing }
  AssignFile(iii,'Ions.dat');  rewrite(iii);  CloseFile(iii);
  { Type of population for Ions: 1, 2 or 3. }
  iPop:=iPop_;  if iPop_>3 then iPop:=2-(IPop mod 2);
  { Parameters }
  ParamsToForm26;
  with IonsP[iPop] do begin
    Cl_inf:=5 {mM};
    HCO3in:=16 {mM};      { Doyon et al. 2011 }
    HCO3out:=24 {mM};     { Amakhin et al. }
    Nao:=125.90;  {mM}
    Ki :=129.34;  {mM}
    K_0 :=Form26.DDSpinEdit9.Value;  { Ko initial, mM }
    Cl_0:=Form26.DDSpinEdit10.Value; { Cli initial, mM }
    Na_0:=Form26.DDSpinEdit29.Value; { Nai initial, mM }

    gL_K      :=Form26.DDSpinEdit1.Value;  // 0.035  {mS/cm^2};
    gL_Cl     :=Form26.DDSpinEdit2.Value;  // 0.01   {mS/cm^2};
    gL_Na     :=Form26.DDSpinEdit21.Value; // 0.02; {mS/cm^2}
    q_Na      :=Form26.DDSpinEdit17.Value; // charge of a spike = 0.1muC/cm^2=0.1mA/cm^2 * 1ms

    gg_kl     :=0.042; {mS/cm^2}
    gg_Nal    :=0.022; {mS/cm^2}

    e0:=0.02663 {V};
    d:=0.15; // volume ratio of extracell. compartment to the surface area
    F:=96489 {C/mol};
    Bmax:=500{mM};

    k1N:=1.1;
    { Initial conditions }
    IV.B:=Bmax;
    IV.K :=K_0;            if If_K_fixed=1  then IV.K :=K_fix;           { Ko fixed, mM }
    IV.Cl:=Cl_0;           if If_Cl_fixed=1 then IV.Cl:=Cl_fix;          { Cli fixed, mM }
    IV.Na:=Na_0;
    IV.VCl  :=e0*ln(IV.Cl/Clo);  {V}
    IV.VK   :=e0*ln(IV.K/Ki);    {V}
    IV.VNa  :=e0*ln(Nao/IV.Na);  {V}
    //IV.VL   :=(gL_Cl *IV.VCl + gL_K *IV.VK + gL_Na *IV.VNa)/(gL_Cl+gL_K+gL_Na); {V}
    IV.VL   :=e0*ln((IV.K+0.085*Nao+0.1*IV.Cl)/(Ki+0.085*IV.Na+0.1*Clo)); {V}
    IV.VGABA:=e0*ln((4*IV.Cl+HCO3in)/(4*Clo+HCO3out)); {V}
    { KCC2 }
    Nai_alpha:=20 {mM};
    Ko_alpha:=2.5 {mM};
    IV.INaKpump:=INaKpump_max/sqr(1+Ko_alpha/IV.K)/step(1+Nai_alpha/IV.Na,3);
    { Set parameters for Bazhenov model }
    if NP_.HH_type='Bazhenov' then begin
       NP_.gLd :=gL_Cl+gL_K+gL_Na;
       NP_.gL  :=gg_kl+gg_Nal;
       NP_.l:=2*NP_.gLd*0.000165{cm^2}*10000{Ohm};
       NP_.VLd :=(gL_Cl*IV.VCl+gL_K*IV.VK+gL_Na*IV.VNa)/(gL_Cl+gL_K+gL_Na);
       NP_.VL  :=(gg_kl*IV.VK+gg_Nal*IV.VNa)/(gg_kl+gg_Nal);
       NP_.ro:=165*NP_.gLd/NP_.gL;
       NP_.NaKpumpS:=IV.INaKpump/1000; {mA/cm^2}
       NP_.NaKpumpD:=IV.INaKpump/1000; {mA/cm^2}
    end;
    { Residual between reversals of specific K-channels and pure K-ions. }
    dVAHP :=NP_.VAHP -IV.VK;
    dVK   :=NP_.VK   -IV.VK;
    dVKDr :=NP_.VKDr -IV.VK;
    dVKM  :=NP_.VKM  -IV.VK;
    dVKD  :=NP_.VKD  -IV.VK;
    dVNa  :=NP_.VNa  -IV.VNa;
    dVL   :=NP_.VL   -IV.VL;
    dVrest:=NP_.Vrest-IV.VL;
    { GABA-A and GABA-B }
    VGABA0:=IV.VGABA;
{    for i:=1 to NSyn do  with Syn[i].SP do if IfBlock<>1 then begin
        if (OwnerOfSynapse(Name)=iPop) then begin
            if (Name[1]+Name[2]+Name[3]+Name[4]='GABA') or
               (Name[1]+Name[2]+Name[3]+Name[4]='GAB3') then begin
               dVGABA :=Syn[i].SP.Vrev - IV.VCl;
            end else
            if (Name[1]+Name[2]+Name[3]+Name[4]='GABB') then begin
               dVGABB :=Syn[i].SP.Vrev - IV.VCl;
            end;
        end;
    end;}
  end;
end;

function TIons.GlialBuffer :double;
{ Krishnan and Bazhenov 2011 }
var k2 :double;
begin
  GlialBuffer:=0;
  with IonsP[iPop] do begin
    if If_Glia<>1 then exit;
    k2:=k1/(1+dexp(-(IV.K-15{mM})/1.15{mM}));
    {**********************************************}
    IV.B:=IV.B + dt*1000*(k1*(Bmax-IV.B) - k2*IV.B);        {mM}
    {**********************************************}
    GlialBuffer:=         k1*(Bmax-IV.B)/k1N - k2*IV.B;     {mM/ms}
  end;
end;

{******************************************************************************}
procedure TIons.Integrate(Umean{V},IK_tot{mA/cm^2},gGlu_tot,gGABA_tot{mS/cm^2},nu{Hz} :double);
{******************************************************************************}
var
   tau_Cl_,dK_dt,dCl_dt,dNa_dt  :double;
begin
  with IonsP[iPop] do begin
  IK_leak_[iPop]  :=    gL_K     *(Umean-IV.VK) *1e3;  {muA/cm^2}
  ICl_leak_[iPop] :=    gL_Cl    *(Umean-IV.VCl)*1e3;  {muA/cm^2}
  INa_leak_[iPop] :=    gL_Na    *(Umean-IV.VNa)*1e3;  {muA/cm^2}
  IGABA_tot_[iPop]:=    gGABA_tot*(Umean-IV.VCl)*1e3;  {muA/cm^2}
  IK_glu_[iPop]   :=0.2*gGlu_tot *(Umean-IV.VK) *1e3;  {muA/cm^2} // [p.166, Mayer&Westbrook1987]
  INa_glu_[iPop]  :=0.4*gGlu_tot *(Umean-IV.VNa)*1e3;  {muA/cm^2} // [--//--]
  case KCC2_Item of
  0: begin { Bazhenov 2004; Kager 2000 }
       IV.INaKpump:=INaKpump_max/sqr(1+Ko_alpha/IV.K)/step(1+Nai_alpha/IV.Na,3);
     end;
  1: begin { Cressman 2009; Wei 2014 }
       IV.INaKpump:=INaKpump_max/   (1+dexp(3.5-IV.K))/  (1+dexp((25-IV.Na)/3));
     end;
  end;
  IK_[iPop]  := IK_leak_[iPop] + IK_tot   *1e3/factor_IK_leak_IK_tot; {muA/cm^2}  //16.10.2013 - factor was 200
  ICl_[iPop] :=ICl_leak_[iPop] + IGABA_tot_[iPop];                    {muA/cm^2}
  G_:=GlialBuffer;                   {mM/ms}
  { Extracellular diffusion }
  if If_Diffusion=1 then begin
     Diff_:=Diff_coe*(Kext-IV.K);
  end else begin
     Diff_:=0;
  end;
  {*** KCC2 *****************************************************************}
  case KCC2_Item of
  0:   begin {Bazhenov KCC2 approximation}
         tau_Cl_:=tau_Cl_0 + tau_Cl_inf/(1+dexp((Cl_inf-IV.K)/alpha_KCl));  {ms}
         IKCC2_[iPop]:=(Cl_inf-IV.Cl)/tau_Cl_/k_Cl*F;                 {muA/cm^2}
       end;
  1:   begin {Doyon KCC2 approximation}
         IKCC2_[iPop]:=Ikcc2_max*(IV.VK-IV.VCL)*1e3/((IV.VK-IV.VCL)*1e3+Vhalf);   {muA/cm^2}
       end;
  end;
  {**************************************************************************}
  dK_dt :=k_K /F/d*(IK_[iPop]+IK_glu_[iPop]-2*IV.INaKpump-IKCC2_[iPop]) + G_ + Diff_;  {mM/ms}
  dCl_dt:=k_Cl/F  *(ICl_[iPop] +IKCC2_[iPop]);                           {mM/ms}
  dNa_dt:=k_Cl/F  *(-INa_leak_[iPop] - INa_glu_[iPop] + q_Na*nu - 3*IV.INaKpump);         {mM/ms}
  {**************************************************************************}
  IV.K :=IV.K  + dt*1000*dK_dt;                                    {mM}
  IV.Cl:=IV.Cl + dt*1000*dCl_dt;                                   {mM}
  IV.Na:=IV.Na + dt*1000*dNa_dt;                                   {mM}
  {**************************************************************************}
  if If_K_fixed=1  then IV.K :=K_fix;           { Ko fixed, mM }
  if If_Cl_fixed=1 then IV.Cl:=Cl_fix;          { Cli fixed, mM }
  I_K_Na_Cl_[iPop]:=(dK_dt)*F; {A}
  IV.I_Glia:=G_   /k_K*F*d/1000;    {mA/cm^2}
  IV.I_Diff:=Diff_/k_K*F*d/1000;    {mA/cm^2}
  IV.K :=max(IV.K, 1e-8);
  IV.Cl:=max(IV.Cl,1e-8);
  IV.VCl  :=e0*ln((IV.Cl) /Clo);  {V}     { p.160 }
  IV.VK   :=e0*ln(IV.K  /Ki);     {V}
  IV.VNa  :=e0*ln(Nao/IV.Na);     {V}
  //IV.VL   :=e0*ln((IV.K+0.085*Nao+0.1*IV.Cl)/(Ki+0.085*IV.Na+0.1*Clo)); {V}    { [Bazhenov 2004] }
  IV.VL   :=e0*ln((IV.K+0.065*Nao+0.6*IV.Cl)/(Ki+0.065*IV.Na+0.6*Clo)); {V}    { [Ullah 2009] }
  //(gL_Cl *IV.VCl + gL_K *IV.VK + gL_Na *IV.VNa)/(gL_Cl+gL_K+gL_Na); {V}
  IV.VGABA:=e0*ln((IV.Cl+HCO3in/4)/(Clo+HCO3out/4))+Vgaba_shift; {V}      { Doyon et al. 2011 }
  end;
end;
{******************************************************************************}

procedure TIons.Draw;
begin
  Form26.Visible:=true;
  Form26.Series1.AddXY(t*1e3,IV.VK*1e3);
  Form26.Series2.AddXY(t*1e3,IV.VGABA*1e3);
  Form26.Series3.AddXY(t*1e3,-2*IV.INaKpump);
  Form26.Series4.AddXY(t*1e3,IK_[iPop]);
  Form26.Series5.AddXY(t*1e3,IV.K);
  Form26.Series6.AddXY(t*1e3,IV.Cl);
  Form26.Series7.AddXY(t*1e3,IK_leak_[iPop]);
  Form26.Series8.AddXY(t*1e3,ICl_leak_[iPop]);
  Form26.Series9.AddXY(t*1e3,IGABA_tot_[iPop]);
  Form26.Series10.AddXY(t*1e3,IKCC2_[iPop]);
  Form26.Series11.AddXY(t*1e3,IV.I_Glia+IV.I_Diff);
  Form26.Series12.AddXY(t*1e3,IV.VNa*1e3);
  Form26.Series13.AddXY(t*1e3,IV.Na);
  Form26.Series16.AddXY(t*1e3,IV.VL*1e3);
  Form26.Series17.AddXY(t*1e3,IK_glu_[iPop]);
  Form26.Series18.AddXY(t*1e3,INa_glu_[iPop]);
end;

procedure TIons.Draw2;
begin
  Form26.Series14.AddXY(t*1e3,IV.VGABA*1e3);
  Form26.Series15.AddXY(t*1e3,IV.VNa*1e3);
end;

procedure TIons.Writing;
begin
  append(iii);
  {           1-A            2-B           3-C                      }
  write  (iii,t*1000:8:3,' ',IV.K:10:3,' ',IV.Cl:10:3,' ');
  {           4-D               5-E                                 }
  write  (iii,IV.VK:10:3,' ',   IV.VCl:10:3,' ');
  {           6-F              7-G                    8-H           }
  write  (iii,IV.INaKpump:10:3,' ',IK_[iPop]:10:3,' ',IK_leak_[iPop]:10:3,' ');
  {           9-I                      10-K                         }
  write  (iii,ICl_leak_[iPop]:10:3,' ',IKCC2_[iPop]:10:3,' ');
  {           11-K                      12-L                        }
  write  (iii,I_K_Na_Cl_[iPop]:10:3,' ',IV.I_Glia+IV.I_Diff*1e3:10:3,' ');
  {           13-M                   12-N                           }
  writeln(iii,IK_glu_[iPop]:10:3,' ',INa_glu_[iPop]:10:3,' ');
  CloseFile(iii);
end;

end.


