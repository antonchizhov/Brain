unit MappingsO;

interface
uses typeNrnParsO;

procedure LinearApproxOfJoh(Vrest{mV},Vth{mV},Vrev{mV},V_about{mV},
                            tau{ms},R{MOhms},sgm{mV},Gad_nu_gL :double;
                            var k_Joh{Hz/pA},I0_Joh{pA} :double);
procedure Map_2d_CBRD_to_Ring;
procedure Map_KFP_to_CBRD;
procedure Map_CBRD_to_KFP;
function AccountAdaptation(NP_:NeuronProperties) :double;

implementation
uses Init,Unit3,Unit4,Unit8,MathMyO,
     KFP_ringO,ColumnO,Correspond,ThresholdO,ConnectionsO,V1_liasonO,EEGO;

function k_R_d(R_d :double) :double;
{"1+k*cos(fi)"}
begin
//  k_R_d:=0.0059 + 0.307*R_d - 0.0318*sqr(R_d) + 0.00125*sqr(R_d)*(R_d); //old version without "xy" term in the integral "Hi"
  k_R_d:=minmod(1,
       -0.04117 + 0.6003*R_d - 0.07986*R_d*R_d + 0.005539*R_d*R_d*R_d
       -1.938E-4*R_d*R_d*R_d*R_d + 2.696E-6*R_d*R_d*R_d*R_d*R_d);
end;

function q_R_d(R_d :double) :double;
begin
//  q_R_d:=-0.497 + 1.436*R_d + 0.0422*sqr(R_d) - 0.00102*sqr(R_d)*R_d; //old version without "xy" term in the integral "Hi"
  q_R_d:=max(0, 2.303 + 2.592*R_d - 1.362*sqr(R_d)  + 0.6785*sqr(R_d)*R_d);
end;

function fi_R_d(R_d :double) :double;
var R_d3 :double;
begin
  R_d3:=sqr(R_d)*R_d;
  fi_R_d:=1.614 - 0.364*R_d + 0.0486*sqr(R_d) - 0.00359*R_d3
         + 0.000136*sqr(sqr(R_d)) - 0.00000204*R_d3*sqr(R_d);
end;

procedure Map_2d_CBRD_to_Ring;
{ See dir. \Anton\TEXT\V1\cos-connections_on_Ring. }
var k,R,d :double;
begin
  R:=rPW*sqrt(sqr(dx)+sqr(dy))/sqrt(2);
  if Form8.ComboBox2.ItemIndex=0 then begin  {"exp"}
     // "1+q_*exp(-fi/fi_r)"
     Form8.DDSpinEdit2.Value:=q_R_d(R/r_axon[1,1]);
     Form8.DDSpinEdit4.Value:=q_R_d(R/r_axon[1,2]);
     Form8.DDSpinEdit6.Value:=q_R_d(R/r_axon[2,1]);
     Form8.DDSpinEdit5.Value:=q_R_d(R/r_axon[2,2]);
     Form8.DDSpinEdit8.Value:=fi_R_d(R/r_axon[1,1]);
     Form8.DDSpinEdit9.Value:=fi_R_d(R/r_axon[1,2]);
     Form8.DDSpinEdit10.Value:=fi_R_d(R/r_axon[2,1]);
     Form8.DDSpinEdit11.Value:=fi_R_d(R/r_axon[2,2]);
  end else begin                             {"cos"}
     // "1+q_*cos(fi)"
     Form8.DDSpinEdit2.Value:=k_R_d(R/r_axon[1,1]);
     Form8.DDSpinEdit4.Value:=k_R_d(R/r_axon[1,2]);
     Form8.DDSpinEdit6.Value:=k_R_d(R/r_axon[2,1]);
     Form8.DDSpinEdit5.Value:=k_R_d(R/r_axon[2,2]);
  end;
end;

procedure Map_KFP_to_CBRD;
begin
  { Map KFP to CBRD }
  NP0[1].ThrShift:=(KFP.Vth-KFP.Vrest)/1e3-AColumn.Pop[1].PP.NP.FixThr;
  NP0[1].tau_m0:=KFP.tau/1e3;
//  NP0[1].Vreset:=KFP.Vrev/1e3;     {1.10.2009}
  NP0[1].Square:=NP0[1].tau_m0/NP0[1].C_membr/KFP.R/1e3;
  sgm_V[1]:=sqrt(KFP.sgm2)/sqrt(2)/1e3;
  Form4.CheckBox10.Checked:=KFP.If_sgm_is_proportional_to_g_g0;
  CorrespondParametersToTheForm;
end;

procedure LinearApproxOfJoh(Vrest{mV},Vth{mV},Vrev{mV},V_about{mV},
                            tau{ms},R{MOhms},sgm{mV},Gad_nu_gL :double;
                            var k_Joh{Hz/pA},I0_Joh{pA} :double);
{ Parameters of slope and shift for the Threshold-linear approximation
  nu=k_Joh*(I-I1)+nu1=k_Joh*(I-I0Joh),
  I0_Joh=I1-nu1/k_Joh, k_Joh=(nu2-nu1)/(I2-I1).}
var V1,V2,kV,V0,mu1,mu2,nu1,nu2,I1,I2 :double;
begin
  V1:=V_about; {mV}
  V2:=V_about+1{mV};
  if Vrev>Vth then Vrev:=Vrest;  // Exclusion
  nu1:=nu_Johannesma(V1,tau/1e3,Vth,Vrev,sgm);
  nu2:=nu_Johannesma(V2,tau/1e3,Vth,Vrev,sgm);
  I1:=(V1-Vrest)/R*1000;   {pA}
  I2:=(V2-Vrest)/R*1000;   {pA}
  k_Joh :=(nu2-nu1)/(I2-I1); {Hz/pA}
  I0_Joh:=I1-nu1/k_Joh; {pA}
end;

function AccountAdaptation(NP_:NeuronProperties) :double;
{ Approximating AHP- and KM-channels as rate-dependent in steady-state,
  and assuming their influence through only shunting conductance G_adapt*nu,
  we obtain a factor for the gain of F-I-G-dependence by solving
  stationary rate-model equation: I/(gL+s+GA*nu)=VT,
  i.e. nu=(I/VT-gL-s)/G_adapt.                                  }
var  K_AHP,K_KM,w8_AHP,n8_KM,gL0,n_,w_,Gad_nu_gL       :double;
begin
//  if (AColumn.Pop[1].PP.NP.gAHP=0)and(AColumn.Pop[1].PP.NP.gKM=0) then exit;
  K_AHP:=Max_K(1/0.001{s},1/0.414{s});
  K_KM :=Max_K(1/0.003{s},1/0.124{s});
  w8_AHP:=0.058;
  n8_KM :=0.082;
  w_ :=NP_.dwAHP/K_AHP*(1-w8_AHP);
  n_ :=NP_.dnM/  K_KM *(1-n8_KM);
  gL0:=NP_.C_membr/NP_.tau_m0;
  { /Gad_nu_gL = (gAHP+gKM)/nu/gL }
  AccountAdaptation:=(NP_.gAHP*w_ + NP_.gKM*n_*n_)/gL0; {s}
//  new_gain  :=1/KFP.Gadapt_nu{mS*s}/(KFP.Vth-KFP.Vrest){mV}; {Hz/muA}
//  k_factor:=new_gain{Hz/muA}/KFP.k_Joh{Hz/pA}/1e6;
{ KFP.II1 :=KFP.II1*k_factor;
  KFP.II0 :=KFP.II0*k_factor;
  KFP.J1  :=KFP.J1 *k_factor;
  KFP.J0  :=KFP.J0 *k_factor;
  KFP.K1  :=KFP.K1 *k_factor;
  KFP.K0  :=KFP.K0 *k_factor;
  KFP.L1  :=KFP.L1 *k_factor;
  KFP.L0  :=KFP.L0 *k_factor;}
end;

procedure Map_CBRD_to_KFP;
{ Map from CBRD-ring model to KFP-ring model }
var   Qext,S_E,S_I,Vrest_E,Vrest_I,Vreset_I,ImI_,
      c01,c02,c11,c12, m01,m02,m11,m12,m21,m22,q11,q21,q12,
      fi_r11,fi_r12,fi_r21,
      Gain_I,Hi,shiftI0,VT_E,VT_I,c21,c22,
      dV11,dV12,dV21,dV22,
      k_Joh_I,I0_Joh_I,R_I,tau_I,k_
                                                                  :double;
      i01,i02,i11,i12,i21,i22  :integer;
begin
  if IfAColumnCreated=false then begin AColumn:=TColumn.Create; IfAColumnCreated:=true; end;
  if KFP=nil then KFP:=TKFP.Create;
  { Neuron properties }
  KFP.Nnrn:=ni;
  KFP.tau:=AColumn.Pop[1].PP.NP.tau_m0*1e3;
  KFP.R  :=AColumn.Pop[1].PP.NP.tau_m0/AColumn.Pop[1].PP.NP.C_membr/
           AColumn.Pop[1].PP.NP.Square/1e3; {MOhms}
  KFP.Vrev :=AColumn.Pop[1].PP.NP.Vreset*1e3;        {6.12.2009}
  KFP.Vrest:=AColumn.Pop[1].PP.NP.Vrest*1e3;
  KFP.Vth  :=//(AColumn.Pop[1].PP.NP.FixThr+AColumn.Pop[1].PP.NP.ThrShift)
             VThreshold3(AColumn.Pop[1].PP.NP, 0.5{V/s}, 0.100{ms})
              *1e3+KFP.Vrest;
  KFP.V0:=min(KFP.Vrev,VGABA*1e3)-5*sgm_V[1]*1e3;//-40{mV};
  KFP.Nv:=250;
  KFP.Vstep :=(KFP.Vth-KFP.V0)/KFP.Nv;
  KFP.tstep :=KFP.tau/2000;
  KFP.sgm2  :=sqr(sgm_V[1]*sqrt(2)*1e3);
  KFP.teta1 :=Form3.DDSpinEdit12.Value/180*pi+pi;
  KFP.teta2 :=Form3.DDSpinEdit17.Value/180*pi+pi;
  KFP.t_Teta2:=Form3.DDSpinEdit18.Value;
  KFP.tSt_start:= t0s*1e3;
  KFP.tSt_end  :=(t0s+t_ind)*1e3;
  KFP.tBG      :=0;  if Form4.CheckBox11.Checked then KFP.tBG:=100; {ms}
  KFP.If_sgm_is_proportional_to_g_g0:=Form4.CheckBox10.Checked;
  {****************}
  KFP.Gad_nu_gL:=AccountAdaptation(AColumn.Pop[1].PP.NP);
  {****************}
  { Linearization of Johannesma }
  KFP.RunLinearApproximationOfJohannesma;
//  KFP.ParametersToForm;
  { Connections }
  Qext:=pext_Iext{Hz/muA}*Iext{muA};
  S_E     :=AColumn.Pop[1].PP.NP.Square{cm^2};
  S_I     :=AColumn.Pop[2].PP.NP.Square{cm^2};
  Vrest_E :=AColumn.Pop[1].PP.NP.Vrest;
  Vrest_I :=AColumn.Pop[2].PP.NP.Vrest;
  Vreset_I:=AColumn.Pop[2].PP.NP.Vreset;
  VT_E:=VThreshold3(AColumn.Pop[1].PP.NP, 0.5{V/s}, 0.100{ms});//AColumn.Pop[1].PP.NP.FixThr+AColumn.Pop[1].PP.NP.ThrShift;
  VT_I:=VThreshold3(AColumn.Pop[2].PP.NP, 0.5{V/s}, 0.100{ms});//AColumn.Pop[2].PP.NP.FixThr+AColumn.Pop[2].PP.NP.ThrShift;
  tau_I:=AColumn.Pop[2].PP.NP.tau_m0;
  R_I  :=AColumn.Pop[2].PP.NP.tau_m0/AColumn.Pop[2].PP.NP.C_membr/
         AColumn.Pop[2].PP.NP.Square/1e3; {MOhms}
  i01:=iOfSyn('AMP3 on P');
  i02:=iOfSyn('AMP3 on I');
  i11:=iOfSyn('AMPA on P');
  i21:=iOfSyn('GABA on P');
  i12:=iOfSyn('AMPA on I');
  i22:=iOfSyn('GABA on I');
  m01:=Max_K(AColumn.Syn[i01].SP.alpha,AColumn.Syn[i01].SP.beta);
  m02:=Max_K(AColumn.Syn[i02].SP.alpha,AColumn.Syn[i02].SP.beta);
  m11:=Max_K(AColumn.Syn[i11].SP.alpha,AColumn.Syn[i11].SP.beta);
  m21:=Max_K(AColumn.Syn[i21].SP.alpha,AColumn.Syn[i21].SP.beta);
  m12:=Max_K(AColumn.Syn[i12].SP.alpha,AColumn.Syn[i12].SP.beta);
  m22:=Max_K(AColumn.Syn[i22].SP.alpha,AColumn.Syn[i22].SP.beta);
  q_and_fi_r_on_Ring(1,1,q11,fi_r11);
  q_and_fi_r_on_Ring(2,1,q21,fi_r21);
  q_and_fi_r_on_Ring(1,2,q12,fi_r12);
  LinearApproxOfJoh(Vrest_I*1000,(VT_I+Vrest_I)*1000,Vreset_I*1000,
                    (VT_I+Vrest_I)*1000,tau_I*1000,R_I,
                    sgm_V[2]*sqrt(2)*1000,0,k_Joh_I,I0_Joh_I{pA});
//  Gain_I  :=1/ AColumn.Pop[2].PP.NP.C_membr
//             /(VT_I+Vrest_I-AColumn.Pop[2].PP.NP.Vreset); {cm^2/mF/V}
//  Gain_I  :=KFP.k_Joh{Hz/pA}*S{cm^2}*1e9; {cm^2/s/mA}
  Gain_I  :=k_Joh_I{Hz/pA}*S_I{cm^2}*1e9; {cm^2/s/mA}
  c01       :=AColumn.Syn[i01].SP.gmax/m01; {mS*s/cm^2}
  c02       :=AColumn.Syn[i02].SP.gmax/m02; {mS*s/cm^2}
  c11       :=AColumn.Syn[i11].SP.gmax/m11; {mS*s/cm^2}
  c21       :=AColumn.Syn[i21].SP.gmax/m21; {mS*s/cm^2}
  c12       :=AColumn.Syn[i12].SP.gmax/m12; {mS*s/cm^2}
  c22       :=AColumn.Syn[i22].SP.gmax/m22; {mS*s/cm^2}
  dV11 :=Vrest_E-VAMPA     {08.05.2009:}+0*VT_E;
  dV12 :=Vrest_I-VAMPA+0*VT_I{08.05.2009: +VT_I; 21.10.2009:}+I0_Joh_I*R_I/1e6;
  dV21 :=Vrest_E-VGABA     {08.05.2009:}+0*VT_E;
  dV22 :=Vrest_I-VGABA+0*VT_I{08.05.2009: +VT_I; 21.10.2009:}+I0_Joh_I*R_I/1e6;
  k_:=Gain_I/(1+Gain_I*c22*dV22);
//  ImI_:=1/(1-Gain_I*c22_shunt)*(c12*phi12 + c02*phi02 - KFP.I0_Joh{pA}/S/1e9);
  Hi:=1;
  {*************************************}
  KFP.II1 := -c01*dV11* Qext      *S_E*1e9
           +Hi*q21*c21*dV21*k_ * c02*dV12*Qext/2*S_E*1e9;{pA}
  KFP.II0 := -c01*dV11*(Qns+    Qext)*S_E*1e9
           +Hi    *c21*dV21*k_
           *( c02*dV12*(Qns+    Qext)*S_E*1e9 + I0_Joh_I{pA}/S_I*S_E);{pA}
  KFP.J1  :=(-c11*dV11*q11 +Hi*c21*dV21*q21*k_*c12*dV12*q12/2)*S_E*1e9;{pA*s}
  KFP.J0  :=(-c11*dV11     +Hi*c21*dV21    *k_*c12*dV12      )*S_E*1e9;{pA*s}
  {*************************************}
  KFP.K1  :=  c01     * Qext      *S_E*1e9
           -Hi*q21*c21     *k_ * c02*dV12*Qext/2*S_E*1e9;{pS}
  KFP.K0  :=  c01     *(Qns+    Qext)*S_E*1e9
           -Hi    *c21     *k_
           *( c02*dV12*(Qns+    Qext)*S_E*1e9 + I0_Joh_I{pA}/S_I*S_E);{pS}
  KFP.L1  :=( c11     *q11 -Hi*c21     *q21*k_*c12*dV12*q12/2)*S_E*1e9;{pS*s}
  KFP.L0  :=( c11          -Hi*c21         *k_*c12*dV12      )*S_E*1e9;{pS*s}
  {*************************************}
  KFP.fi_r:=fi_r11;
  KFP.CosOrExp:=2-Form8.ComboBox2.ItemIndex;
  KFP.ParametersToForm;
end;

end.
