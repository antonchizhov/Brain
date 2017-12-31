unit coeff;

interface
uses Init,MathMyO;

procedure Define_ig_iC;
procedure AssignCoeffToChange;
procedure CoeffFrom_g(g :longvect);
procedure g_FromCoeff(var g :longvect);

implementation
uses Unit1,Unit2,graph_0d;

procedure Define_ig_iC;
var  i,ig :integer;
begin
  ig:=0;
  for i:=1 to mC do  begin
      if ifC[i]=1 then begin
         ig:=ig+1;
         iC_ig[i]:=ig;
         ig_iC[ig]:=i;
      end else
         iC_ig[i]:=0;
  end;
end;

procedure AssignCoeffToChange;
var  i :integer;
begin
  mC:=2*mMax;
  { Default }
  for i:=1 to mC do  ifC[i]:=0;
  for i:=1 to mC do  LimL[i]:=0;
  for i:=1 to mC do  LimR[i]:=1e8;
  { Which coefficients are used (1\0)? }
  strC[ 1]:='VThr0[i3] ';  ifC[ 1]:=0;
  strC[ 2]:='gAMP3[1]  ';  ifC[ 2]:=0;
  strC[ 3]:='gAMP3[2]  ';  ifC[ 3]:=0;
  strC[ 4]:='gAMPA[1]  ';  ifC[ 4]:=0;
  strC[ 5]:='gAMPA[2]  ';  ifC[ 5]:=0;
  strC[ 6]:='gGABA[1]  ';  ifC[ 6]:=0;
  strC[ 7]:='gGABA[2]  ';  ifC[ 7]:=0;
  strC[ 8]:='gNMD3[1]  ';  ifC[ 8]:=0;
  strC[ 9]:='gNMD3[2]  ';  ifC[ 9]:=0;
  strC[10]:='gGAB3[1]  ';  ifC[10]:=0;
  strC[11]:='gam[1]    ';  ifC[11]:=0;
  strC[12]:='gGABB[1]  ';  ifC[12]:=0;
  strC[13]:='gGAB3[2]  ';  ifC[13]:=0;
  strC[14]:='ts        ';  ifC[14]:=0;
  strC[15]:='VNMDA     ';  ifC[15]:=0;    LimL[15]:=0;  LimR[15]:=0.1;
  strC[16]:='alAMPA[i3]';  ifC[16]:=1;
  strC[17]:='alGABA[i3]';  ifC[17]:=0;
  strC[18]:='alNMDA[i3]';  ifC[18]:=0;
  strC[19]:='beAMPA[i3]';  ifC[19]:=1;
  strC[20]:='beGABA[i3]';  ifC[20]:=0;
  strC[21]:='beNMDA[i3]';  ifC[21]:=0;
  strC[22]:='Iext      ';  ifC[22]:=1;
  strC[23]:='sgm_V[i3] ';  ifC[23]:=0;
  strC[24]:='Square[i3]';  ifC[24]:=0;
  strC[25]:='gNa[1]    ';  ifC[25]:=0;
  strC[26]:='gK        ';  ifC[26]:=0;
  strC[27]:='roI       ';  ifC[27]:=0;
  strC[28]:='tau_m[i3] ';  ifC[28]:=0;
  strC[29]:='VAMPA     ';  ifC[29]:=0;    LimL[29]:=-0.100;  LimR[29]:=0;
  strC[30]:='VL[1]     ';  ifC[30]:=0;    LimL[30]:=-0.100;  LimR[30]:=0;
  strC[31]:='shift_Smp ';  ifC[31]:=0;
  strC[32]:='roE       ';  ifC[32]:=0;
  m:=0;
  for i:=1 to mC do  m:=m+ifC[i];     { 'm' - number of changed parameters }
  { Define 'ig_iC' - numbers of changing coefficients }
  Define_ig_iC;
end;

procedure CoeffFrom_g(g :longvect);
var i,j :integer;
begin
//  if ifC[ 1]=1 then VThr0[i3]  :=g[iC_ig[ 1]];
  if ifC[ 2]=1 then gAMP3[1]   :=g[iC_ig[ 2]];
  if ifC[ 3]=1 then gAMP3[2]   :=g[iC_ig[ 3]];
  if ifC[ 4]=1 then gAMPA[1]   :=g[iC_ig[ 4]];
  if ifC[ 5]=1 then gAMPA[2]   :=g[iC_ig[ 5]];
  if ifC[ 6]=1 then gGABA[1]   :=g[iC_ig[ 6]];
  if ifC[ 7]=1 then gGABA[2]   :=g[iC_ig[ 7]];
  if ifC[ 8]=1 then gNMD3[1]   :=g[iC_ig[ 8]];
  if ifC[ 9]=1 then gNMD3[2]   :=g[iC_ig[ 9]];
  if ifC[10]=1 then gGAB3[1]   :=g[iC_ig[10]];
  if ifC[11]=1 then t_axon[1,1]:=g[iC_ig[11]];
  if ifC[12]=1 then gGABB[1]   :=g[iC_ig[12]];
  if ifC[13]=1 then gGAB3[2]   :=g[iC_ig[13]];
  if ifC[14]=1 then tSt        :=g[iC_ig[14]];
  if ifC[15]=1 then NP0[1].VNMDA   :=g[iC_ig[15]];
  if ifC[16]=1 then alAMPA[EorI(i3)] :=g[iC_ig[16]];
  if ifC[17]=1 then alGABA[EorI(i3)] :=g[iC_ig[17]];
  if ifC[18]=1 then alNMDA[EorI(i3)] :=g[iC_ig[18]];
  if ifC[19]=1 then beAMPA[EorI(i3)] :=g[iC_ig[19]];
  if ifC[20]=1 then beGABA[EorI(i3)] :=g[iC_ig[20]];
  if ifC[21]=1 then beNMDA[EorI(i3)] :=g[iC_ig[21]];
  if ifC[22]=1 then Iext       :=g[iC_ig[22]];
  if ifC[23]=1 then sgm_V[i3]  :=g[iC_ig[23]];
  if ifC[24]=1 then R.NP.Square :=g[iC_ig[24]];
  if ifC[25]=1 then NP0[1].gNa :=g[iC_ig[25]];
  if ifC[26]=1 then NP0[1].gK  :=g[iC_ig[26]];
  if ifC[27]=1 then NP0[2].ro  :=g[iC_ig[27]];
  if ifC[28]=1 then NP0[EorI(i3)].tau_m0 :=g[iC_ig[28]];
  if ifC[29]=1 then VAMPA      :=g[iC_ig[29]];
  if ifC[30]=1 then NP0[1].VL  :=g[iC_ig[30]];
  if ifC[31]=1 then shift_Smp  :=g[iC_ig[31]];
  if ifC[32]=1 then NP0[1].ro  :=g[iC_ig[32]];
  { My definitions }
{  MyDefinitions;}
end;

procedure g_FromCoeff(var g :longvect);
var i :integer;
begin
//  if ifC[ 1]=1 then g[iC_ig[ 1]]:=VThr0[i3] ;
  if ifC[ 2]=1 then g[iC_ig[ 2]]:=gAMP3[1]  ;
  if ifC[ 3]=1 then g[iC_ig[ 3]]:=gAMP3[2]  ;
  if ifC[ 4]=1 then g[iC_ig[ 4]]:=gAMPA[1]  ;
  if ifC[ 5]=1 then g[iC_ig[ 5]]:=gAMPA[2]  ;
  if ifC[ 6]=1 then g[iC_ig[ 6]]:=gGABA[1]  ;
  if ifC[ 7]=1 then g[iC_ig[ 7]]:=gGABA[2]  ;
  if ifC[ 8]=1 then g[iC_ig[ 8]]:=gNMD3[1]  ;
  if ifC[ 9]=1 then g[iC_ig[ 9]]:=gNMD3[2]  ;
  if ifC[10]=1 then g[iC_ig[10]]:=gGAB3[1]  ;
  if ifC[11]=1 then g[iC_ig[11]]:=t_axon[1,1];
  if ifC[12]=1 then g[iC_ig[12]]:=gGABB[1]  ;
  if ifC[13]=1 then g[iC_ig[13]]:=gGAB3[2]  ;
  if ifC[14]=1 then g[iC_ig[14]]:=tSt       ;
  if ifC[15]=1 then g[iC_ig[15]]:=NP0[1].VNMDA     ;
  if ifC[16]=1 then g[iC_ig[16]]:=alAMPA[EorI(i3)];
  if ifC[17]=1 then g[iC_ig[17]]:=alGABA[EorI(i3)];
  if ifC[18]=1 then g[iC_ig[18]]:=alNMDA[EorI(i3)];
  if ifC[19]=1 then g[iC_ig[19]]:=beAMPA[EorI(i3)];
  if ifC[20]=1 then g[iC_ig[20]]:=beGABA[EorI(i3)];
  if ifC[21]=1 then g[iC_ig[21]]:=beNMDA[EorI(i3)];
  if ifC[22]=1 then g[iC_ig[22]]:=Iext      ;
  if ifC[23]=1 then g[iC_ig[23]]:=sgm_V[i3] ;
  if ifC[24]=1 then g[iC_ig[24]]:=R.NP.Square;
  if ifC[25]=1 then g[iC_ig[25]]:=NP0[1].gNa    ;
  if ifC[26]=1 then g[iC_ig[26]]:=NP0[1].gK     ;
  if ifC[27]=1 then g[iC_ig[27]]:=NP0[2].ro       ;
  if ifC[28]=1 then g[iC_ig[28]]:=NP0[EorI(i3)].tau_m0 ;
  if ifC[29]=1 then g[iC_ig[29]]:=VAMPA     ;
  if ifC[30]=1 then g[iC_ig[30]]:=NP0[1].VL     ;
  if ifC[31]=1 then g[iC_ig[31]]:=shift_Smp ;
  if ifC[32]=1 then g[iC_ig[32]]:=NP0[1].ro       ;
  { Check the limits }
  for i:=1 to mC do begin
      if ifC[i]=1 then
         if ((g[iC_ig[i]]<LimL[i])or(g[iC_ig[i]]>LimR[i])) then begin
            Warning('One of fitted variables is out of limits.');
            while ('true'<>'false') do begin end;
         end;
  end;
end;
end.
