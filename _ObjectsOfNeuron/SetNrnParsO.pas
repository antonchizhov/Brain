unit SetNrnParsO;

interface
uses typeNrnParsO;

procedure DefaultCanalParameters(var NP :NeuronProperties);
procedure SetParamsForNaR(var NP :NeuronProperties);
procedure HodgkinPhysParameters(var NP :NeuronProperties);

implementation

procedure DefaultCanalParameters(var NP :NeuronProperties);
begin
 Vus:=-0.065{V}; //It was -70 till 27.09.2012
 with NP do BEGIN
  { TTX-Resistent Na-current }
  gNaR:=0;//13.5;
  { Default zero values: }
  gNa:=0;  gK:=0;   gKM:=0;   gKA:=0;   gKD:=0;  gH:=0;
  gCaH:=0;  gKCa:=0;  gADP:=0;  gAHP:=0;  gCaT:=0;  gBst:=0;  gNaP:=0;
  VKDr:=0;  VKM:=0;  VKD:=0;    VADP:=0.120{V};  VK:=-0.070 {V};  VAHP:=0;
  dwADP:=0.0177; dwAHP:=0.0177; tADP:=0.010{s};
  dnM:=0.175;    dyD:=-0.3;     dii:=0;
  dT_AP:=0;
  Vd_reset:=Vrest;
  Mg:=2 {mM};  VNMDA:=0;
  If_NMDA_on_dendrite:=0;
  NaThreshShift:=0;
//  If_I_V_or_g:=2;    {26.09.2011}
  IfSet_gL_or_tau:=2;
  IfPredictorCorrector:=1;
  if          HH_type='Calmar' then begin
     { For Calmar   - gNa=120, gK=36, gL=0.3 }
     gNa :=   120 {mS/cm^2};
     gK  :=    36 {mS/cm^2};
     gL  :=   0.3 {mS/cm^2};
     Vrest:=-0.060{V};
     Vd_reset:=Vrest;
     VL   :=-0.050{V};
     Tr :=-60 {Vrest[1]*1000} {mV !};
     VNa := 0.055 {V};
     VNaR:= 0.055 {V};
     VK  :=-0.072 {V};
     VKM:=VK;
     a1Na:= 0.1;  a2Na:= 25;  a3Na:= 10;  a4Na:= 1;
     b1Na:= 4;    b2Na:= 0;   b3Na:=18;   b4Na:= 0;
     c1Na:= 0.07; c2Na:= 0;   c3Na:= 20;  c4Na:= 0;
     d1Na:= 1;    d2Na:= 30;  d3Na:=10;   d4Na:= -1;
     a1K:=0.01;   a2K:=10;    a3K:=10;
     b1K:=0.125;  b2K:=0;     b3K:=80;
     n_AP:=0.72;  dT_AP:=0.00195{s};
     dii:=-0.02;
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=1;
     Na_type:='Calmar';
     NaR_type:='Calmar';
  end else if HH_type='Destexhe' then begin
     { For Destexhe - gNa=7, gK=10, gKM=0.5, gCaH:=3, gKCa=1.5; }
     gNa :=     7 {mS/cm^2};
     gK  :=    10 {mS/cm^2};
     gKM :=   0.5 {mS/cm^2};
     gCaH:=     1 {mS/cm^2};
     gKCa:=   1.5 {mS/cm^2};
     Tr :=-63 {mV !};
     VNa := 0.050 {V};
     VNaR:= 0.050 {V};
     VK  :=-0.090 {V};
     VKM:=VK;
     a1Na:= 0.32;  a2Na:= 13;  a3Na:= 4;  a4Na:= 1;
     b1Na:=-0.28;  b2Na:=40;   b3Na:=-5;  b4Na:= 1;
     c1Na:= 0.128; c2Na:= 17;  c3Na:= 18; c4Na:= 0;
     d1Na:= 4;     d2Na:= 40;  d3Na:=5;   d4Na:= -1;
     n_AP:=0.5;
     dii:=-0.02;
     if IfSet_gL_or_tau=0 then IfSet_gL_or_tau:=2;
     Na_type:='Calmar';
     NaR_type:='Calmar';
  end else if HH_type='Migliore' then begin
     { For Migliore - gNa=32 (7-p, 22-i), gK=10, gKA=48; }
     gNa := 32{7} {mS/cm^2};
     gK  :=    10 {mS/cm^2};
     gKA :=     0{48} {mS/cm^2};
     VNa:= 0.055 {V};
     VK :=-0.072 {V};
     if HH_order='1-point'  then n_AP:=0.17 else
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then n_AP:={0.12}0.07;
     dii:=-0.1;
     if IfSet_gL_or_tau=0 then IfSet_gL_or_tau:=2;
     Na_type:='Migliore';
     NaR_type:='Migliore';
  end else if HH_type='Cummins' then begin
     { For Cummins - gNaR:=0.05 gNa=63 gK=0.17 gKA=1.08 gKD=0.31 gCaT=0.0108 gCaH=0.0031 - AP_Krylov.id}
     gNa :=    35 {mS/cm^2};
     gK  :=   2.1 {mS/cm^2};
     gL  := 0.14 {mS/cm^2};
     VL :=-0.0543 {V};
     Tr :=0 {mV !};
     VNa := 0.06294 {V};
     VNaR:= 0.06294 {V};
     VK :=-0.09234 {V};
     { NaR }
     gNaR:=6.9;
     if IfSet_gL_or_tau=0 then IfSet_gL_or_tau:=1;
     dii:=-0.4;
     Na_type:='Cummins';
     NaR_type:='Cummins';
  end else if HH_type='Chow' then begin
     { For Chow }
     Square:=1e-4{1e-4} {cm^2};
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then
         Square:=Square*(3+ro)/(3+2*ro); // [p.19]
     gNa :=    30 {mS/cm^2};
     gK  :=    40 {mS/cm^2};
     gL  :=  0.1 {mS/cm^2};
     Vrest:=-0.060 {V};
     Vd_reset:=Vrest;
     Tr :=0 {mV !};
     VNa:= 0.045 {V};
     VK :=-0.080 {V};
     if HH_order='1-point'  then n_AP:=0.45 else
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then n_AP:=0.0;
     dT_AP:=0.0014{s};
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=2;
     Na_type:='Chow';
     NaR_type:='Chow';
  end else if HH_type='Naundorf' then begin
     { For Naundorf }
     Square:=1e-4{1e-4} {cm^2};
     gNa :=  35  {mS/cm^2};
     gK  :=   9  {mS/cm^2};
     gL  := 0.1  {mS/cm^2};
     Vrest:=-0.065 {V};
     Vd_reset:=Vrest;
     VL   :=-0.065 {V};
     Tr :=0 {mV !};
     VNa:= 0.055 {V};
     VK :=-0.090 {V};
     if HH_order='1-point'  then n_AP:=0.68 else
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then n_AP:=0.66;
     dT_AP:=0.0014{s};
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=2;
     KJ_NaCooperativity:=10;
     Na_type:='Naundorf';
     NaR_type:='';
  end else if HH_type='White' then begin
     { For White }
     C_membr:=0.0015 {mF/cm^2};         { !!! }
     Square:=1e-4{1e-4} {cm^2};
     gNa :=  20  {mS/cm^2};
     gCaH:= 0.025{mS/cm^2};
     gK  := 3.65 {mS/cm^2};
     gAHP:= 0.18 {mS/cm^2};
     gL  := 0.02 {mS/cm^2};
     VL   :=-0.070 {V};
     VNa:= 0.045 {V};
     VCa:= 0.120 {V};
     VK :=-0.095 {V};
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=1;
     Na_type:='White';
     NaR_type:='';
  end else if HH_type='White2' then begin
     { For White2 from [Fernandez, White 2010] }
     C_membr:=0.0015 {mF/cm^2};         { !!! }
     Square:=1e-4{1e-4} {cm^2};
     gL  := 0.03 {mS/cm^2};
     VL   :=-0.065 {V};
     Vrest:=-0.065 {V};
     Vd_reset:=Vrest;
     VNa:= 0.050 {V};
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=3;  { Vrest is not a steady-state }
     IfThrModel:=1;
     FixThr:=0.015 {V}-VL;
     dThr_dts:=0;
     Na_type:='White2';
     NaR_type:='';
  end else if HH_type='Shu' then begin
     { For Shu }
     NaThreshShift:=14{mV};
     Square:=1e-4{1e-4} {cm^2};
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then
         Square:=Square*(3+ro)/(3+2*ro); // [p.19]
     gNaR:=     0 {mS/cm^2};   //20
     gNa :=  13.7 {mS/cm^2};   //20
     gK  :=  0.68 {mS/cm^2};   //It was 2 before 10.07.2014. It was 0.15 before Feb2013
     gL  :=  0.05 {mS/cm^2};
     Vrest:=-0.065 {V};
     Vd_reset:=Vrest;
     Tr :=0 {mV !};
     VNa:= 0.060 {V};
     VK :=-0.090 {V};
     Temperature:=309; {K}
     if HH_order='1-point'  then n_AP:=0.91 else
     if (HH_order='2-points')or(HH_order='2-p-ActiveDend') then n_AP:=1;
     dT_AP:=0.0014{s};
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=2;
     IfBlockNaR:=0;
     Na_type:='Shu';
     NaR_type:='Shu';
  end else if HH_type='Bazhenov' then begin
     { For Bazhenov }
     C_membr:=0.00075 {mF/cm^2};
     Square:=1e-6 {cm^2};              { Bazhenov 2004; Mainen }
     gNaR:=     0 {mS/cm^2};
     gNa :=  3450 {mS/cm^2};           { Krishnan&Bazhenov 2011 }
     gK  :=   200 {mS/cm^2};           { Krishnan&Bazhenov 2011 }
     gL  :=  0.0718 {mS/cm^2};         { Krishnan&Bazhenov 2011 }
     gLd :=  0.074 {mS/cm^2};          { Krishnan&Bazhenov 2011 }
     l:=2*gLd*165*Square/0.0001{mS};    { Bazhenov 2011: g_c=0.1\muS }  //0.000165{cm^2}*10000{Ohm};
     VNa := 0.050 {V};
     VK  :=-0.090 {V};
     VL  :=(0.01*VK+0.042*VK+0.0198*VNa)/(0.01+0.042+0.0198) {V}; { Krishnan&Bazhenov 2011 / Buchin PhD }
     VLd :=(0.01*VK+0.044*VK+0.02  *VNa)/(0.01+0.044+0.02) {V};   { Krishnan&Bazhenov 2011 / Buchin PhD }
     ro:=165*gLd/gL;
     VAHP:=-0.070 {V};                 { Bazhenov 2004 }
     n_AP:=0.5;
     dT_AP:=0.0014{s};
     FixThr:=0.004; {V}
     IfSet_gL_or_tau:=1;
     IfSet_VL_or_Vrest:=1;
     Na_type:='Bazhenov';
 //    HH_order:='2-p-MainenSejn';
  end else if HH_type='Lyle' then begin
     { For Lyle }
     C_membr:=0.0007 {mF/cm^2};         { !!! }
     tau_m0:= 0.0144 {s};
//     ro:=3.7{nS}/1.3{nS};
     if HH_order='1-point'  then Square:=tau_m0/C_membr/39000{KOhm};
     if (HH_order='2-points') or
        (HH_order='2-p-MainenSejn') or
        (HH_order='2-p-ActiveDend') then Square:=tau_m0/C_membr/39000{KOhm}*(3+ro)/(3+2*ro); // [p.19]
     gNaR  :=  0 {mS/cm^2};
     gNa :=    2.28 {mS/cm^2};
     gK  :=    0.76 {mS/cm^2};
     gKA :=    4.36 {mS/cm^2};
     gKM :=    0.76 {mS/cm^2};
     gKD :=    0.095{mS/cm^2};
     gAHP:=    0.6  {mS/cm^2};
     gH  :=    0.0057  {mS/cm^2};
     Vrest:=-0.065 {V};  {Corrected from -65.7mV on 30.09.2009}
     Vd_reset:=-0.050{V};  {Introduced on 24.03.2016}
     VNa:= 0.065 {V};
     VKDr:=-0.070 {V};
     VK  :=-0.070 {V};
     VKM :=-0.080 {V};
     VKD :=-0.095 {V};
     V12H:=-0.017 {V};
     Temperature:=296;//297 {K};       {[p.104 Lyle]}
     n_AP:=0.262; yK_AP:=0.473; nA_AP:=0.743; lA_AP:=0.691; dT_AP:=0.0015{s};
     dwADP:=0.0177; dwAHP:=0.0177{0.016}; yH_AP:=0.002;  xD_AP:=0.960;
     if (HH_order='2-points') or
        (HH_order='2-p-MainenSejn') or
        (HH_order='2-p-ActiveDend') then begin
         n_AP:=0.12; nA_AP:=0.6; lA_AP:=0.63;
         dnM:=0.11; dwAHP:=0.01;
     end;
     if (HH_order='2-p-ActiveDend') then begin
         nA_AP:=0.65; lA_AP:=0.63;
         Vd_reset:=Vrest;  //It was -0.045{V} before 9.08.2016
         Vd_reset:=-0.045{V};
     end;
     IfSet_gL_or_tau:=2;
     IfSet_VL_or_Vrest:=2;
     Na_type:='Lyle'; Na_subtype:='Lyle-4';
     NaR_type:='Lyle'; NaR_subtype:='Lyle-4';
  end;
  if VKDr=0 then VKDr:=VK;
  if VKM =0 then VKM :=VK;
  if VKD =0 then VKD :=VK;
  if VAHP=0 then VAHP:=VK;
  if IfSet_VL_or_Vrest=0 then IfSet_VL_or_Vrest:=2;
  if  IfThrModel=1 then begin gNa:=0; gNaR:=0; end;
  if (IfThrModel=1)and(HH_type<>'Passive') then Vreset:=-0.040{V}
                                           else Vreset:=Vrest;
  if HH_type='White2' then begin  gNa:= 6 {mS/cm^2}; Vreset:=-0.065 {V}; end;
  { Brette's threshold }
  k_a_Brette:=0.0041{V};  tau_Brette:=0.002{s};  VTreset_Brette:=0.050{V};
  dVTdV_Brette:=0.80;
  DepBlock_limit:=0.4{mS/cm^2}; 
  DepBlock_slope:=7{mV}; 
  {**************}
  SetParamsForNaR(NP);
 END;
end;

procedure SetParamsForNaR(var NP :NeuronProperties);
begin
 with NP do BEGIN
  { Krylov: }
  Tr_NaR:=-60 {mV};
//  a1NaR:= 0.037;  a2NaR:=45.5; a3NaR:= 11;   a4NaR:= 1;
//  b1NaR:= 2.18;   b2NaR:= 0;   b3NaR:= 19.2; b4NaR:= 0;
//  c1NaR:= 0.031;  c2NaR:= 0;   c3NaR:= 121;  c4NaR:= 0;
//  d1NaR:= 0.98;   d2NaR:=63.3; d3NaR:= 11.8; d4NaR:= -1;
//  VNaR:=0.031 {V};
  a1NaR:= 0.043;  a2NaR:=30;   a3NaR:= 3.85;  a4NaR:= 1;
  b1NaR:= 0.52;   b2NaR:= 0;   b3NaR:= 65;    b4NaR:= 0;
  c1NaR:= 0.042;  c2NaR:= 0;   c3NaR:= 8.6;   c4NaR:= 0;
  d1NaR:= 0.50;   d2NaR:=65;   d3NaR:=12;     d4NaR:= -1;
  VNaR:=0.031;
  { Cummins: }
  if NaR_type='Cummins' then begin
     Tr_NaR:=0;
     a1NaR:= 1.032;  a2NaR:=-6.99;  a3NaR:=14.87; a4NaR:= -1;
     b1NaR:= 5.79;   b2NaR:=-130.4; b3NaR:=-22.9; b4NaR:= -1;
     c1NaR:=0.06435; c2NaR:=-73.26; c3NaR:=-3.72; c4NaR:= -1;
     d1NaR:=0.135;   d2NaR:=-10.28; d3NaR:=9.093; d4NaR:= -1;
     VNaR:=VNa;
  end;
 END;
end;

{----------------------------------------------------------------------}
procedure HodgkinPhysParameters(var NP :NeuronProperties);
var Gs :double;
begin
 with NP do BEGIN
  {------------------- Membrane --------------------}
  { Passive parameters }
  C_membr:=0.001 {mF/cm^2};         { !!! }
  Gs:=1.3 {nS};
  ro:=3.7{nS}/1.3{nS};
  l:=1; {=L^2/lamda^2}
  Vrest:=-0.064{V};  tau_m0:=0.021{s};
  Square:=Gs*tau_m0/C_membr*1e-6{cm^2};
  gL:=C_membr/tau_m0;
  gLd:=gL;
  VLd:=Vrest;
  { Calcium }
  Faraday:=96485 {C/mol};     {Faraday constant}
  Rgas   :=8.314  {J/(K*mol)}; {gas constant}
  Temperature:=309 {K};       {Temperature}
  d_Ca :=1e-4 {cm};         {thickness of shell beneath the membrane}
  Ca8  :=240e-6 {mM};
  Ca0  :=2 {mM};
  tauCa:=0.005 {s};
  { Canals }
  DefaultCanalParameters(NP);
 END;
end;

end.
