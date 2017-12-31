unit ColumnO;

interface
uses
  Classes,Forms,
  PopulationO,SynCurrO,IonsO,Init,t_dtO,typeNrnParsO,MathMyO,
  ConnectionsO;

type
  {==================================================================}
  TColumn = class(TObject)
  private
  protected
  public
    {Variables:}
    Pop                 :array[1..4] of TPopulation;//1-E, 2-I, 3-E23, 4-I23
    Syn                 :array[1..maxNSyn] of TSynCurr;
    Ions                :array[1..4] of TIons;
    Q,dQdt              :array[1..4] of double;//rates at population's somas
    r,rn,rold,u,un,v,vn,w
                        :array[1..4,1..4] of double;//rates at population's axonal terminals
    rext                :double; //0-external terminal's rate

    {Functions:}
    procedure SetAxonRates;
    procedure IntegrateDensity;
    procedure IntegrateVoltage;
    procedure AxonalDelays;
    procedure EquateFrom(ACol :TColumn);
    procedure EquateTo(ACol :TColumn);
    procedure InitialConditions;
    procedure CopyInitialConditionsFrom(ACol :TColumn);
    //procedure Change_gmax_AccordingToNewHHorder(ie :integer; FromTo :string);
    function OwnerOfSynapse(Name :string):integer;
    procedure GapJunctions;
    procedure GapJunctions2;
    procedure AddSynapse_to_US(i_syn :integer; var u,s :double);
    procedure IntegrateSynapticCurrents;
    procedure ChangeReversalPotentialsAccordingToIonConcentrations;

    constructor Create;
    destructor Destroy;
end;
  {==================================================================}

var AColumn,BGColumn :TColumn;
    IfAColumnCreated,IfBGColumnCreated,IfBGinProcess :boolean;

implementation


procedure TColumn.EquateFrom(ACol :TColumn);
var i,j :integer;
begin
  { Synapses }
  for i:=1 to NSyn do begin
      Syn[i].EquateFrom(ACol.Syn[i]);
  end;
  { Populations }
  for i:=1 to NPop do begin
      Pop[i].EquateFrom(ACol.Pop[i]);
  end;
  { Axons }
  for i:=1 to NPop do begin
      Q[i]   :=ACol.Q[i]   ;
      dQdt[i]:=ACol.dQdt[i];
      for j:=1 to NPop do begin
          r[i,j]   :=ACol.r[i,j]   ;
          rn[i,j]  :=ACol.rn[i,j]  ;
          rold[i,j]:=ACol.rold[i,j]  ;
          u[i,j]   :=ACol.u[i,j]   ;
          un[i,j]  :=ACol.un[i,j]  ;
          v[i,j]   :=ACol.v[i,j]   ;
          vn[i,j]  :=ACol.vn[i,j]  ;
          w[i,j]   :=ACol.w[i,j]  ;
      end;
  end;
  rext:=ACol.rext;
  { Ions }
  for i:=1 to NPop do Ions[i].EquateFrom(ACol.Ions[i]);
end;

procedure TColumn.EquateTo(ACol :TColumn);
var i,j :integer;
begin
  { Synapses }
  for i:=1 to NSyn do begin
      ACol.Syn[i].EquateTo(Syn[i]);
  end;
  { Populations }
  for i:=1 to NPop do begin
      ACol.Pop[i].EquateTo(Pop[i]);
  end;
  { Axons }
  for i:=1 to NPop do begin
      ACol.Q[i]   :=Q[i]   ;
      ACol.dQdt[i]:=dQdt[i];
      for j:=1 to NPop do begin
          ACol.r[i,j]   :=r[i,j]   ;
          ACol.rn[i,j]  :=rn[i,j]  ;
          ACol.rold[i,j]:=rold[i,j]  ;
          ACol.u[i,j]   :=u[i,j]   ;
          ACol.un[i,j]  :=un[i,j]  ;
          ACol.v[i,j]   :=v[i,j]   ;
          ACol.vn[i,j]  :=vn[i,j]  ;
          ACol.w[i,j]   :=w[i,j]  ;
      end;
  end;
  ACol.rext:=rext;
  { Ions }
  for i:=1 to NPop do ACol.Ions[i].EquateTo(Ions[i]);
end;

procedure TColumn.SetAxonRates;
begin
  { ------- AMPA ------- }
       Syn[iOfSyn('AMP3 on P')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('AMP3 on I')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('AMPA on P')].SP.pAxonRate:=@rn[1,1];
       Syn[iOfSyn('AMPA on I')].SP.pAxonRate:=@rn[1,2];
       Syn[iOfSyn('AMPA on P23 de 23')].SP.pAxonRate:=@rn[3,3];//@Pop[3].nu;
       Syn[iOfSyn('AMPA on I23 de 23')].SP.pAxonRate:=@rn[3,4];//@Pop[3].nu;
       Syn[iOfSyn('AMPA on P de 23')].SP.pAxonRate:=@rn[3,1];//@Pop[3].nu;
       Syn[iOfSyn('AMPA on I de 23')].SP.pAxonRate:=@rn[3,2];//@Pop[3].nu;
       Syn[iOfSyn('AMPA on P23')].SP.pAxonRate:=@rn[1,3];
       Syn[iOfSyn('AMPA on I23')].SP.pAxonRate:=@rn[1,4];
       Syn[iOfSyn('AMP3 on P23')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('AMP3 on I23')].SP.pAxonRate:=@rext;
  { ------- GABA ------- }
       Syn[iOfSyn('GAB3 on P')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('GAB3 on I')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('GABA on P')].SP.pAxonRate:=@rn[2,1];
       Syn[iOfSyn('GABA on I')].SP.pAxonRate:=@rn[2,2];
       Syn[iOfSyn('GABA on P23 de 23')].SP.pAxonRate:=@rn[4,3];//@Pop[4].nu;
       Syn[iOfSyn('GABA on I23 de 23')].SP.pAxonRate:=@rn[4,4];//@Pop[4].nu;
       Syn[iOfSyn('GABA on P de 23')].SP.pAxonRate:=@rn[4,1];//@Pop[4].nu;
       Syn[iOfSyn('GABA on I de 23')].SP.pAxonRate:=@rn[4,2];//@Pop[4].nu;
       Syn[iOfSyn('GABA on P23')].SP.pAxonRate:=@rn[2,3];
       Syn[iOfSyn('GABA on I23')].SP.pAxonRate:=@rn[2,4];
       Syn[iOfSyn('GAB3 on P23')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('GAB3 on I23')].SP.pAxonRate:=@rext;
  { ------- NMDA ------- }
       Syn[iOfSyn('NMD3 on P')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('NMD3 on I')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('NMDA on P')].SP.pAxonRate:=@rn[1,1];
       Syn[iOfSyn('NMDA on I')].SP.pAxonRate:=@rn[1,2];
       Syn[iOfSyn('NMDA on P23 de 23')].SP.pAxonRate:=@rn[3,3];
       Syn[iOfSyn('NMDA on I23 de 23')].SP.pAxonRate:=@rn[3,4];
       Syn[iOfSyn('NMDA on P de 23')].SP.pAxonRate:=@rn[3,1];
       Syn[iOfSyn('NMDA on I de 23')].SP.pAxonRate:=@rn[3,2];
       Syn[iOfSyn('NMDA on P23')].SP.pAxonRate:=@rn[1,3];
       Syn[iOfSyn('NMDA on I23')].SP.pAxonRate:=@rn[1,4];
       Syn[iOfSyn('NMD3 on P23')].SP.pAxonRate:=@rext;
       Syn[iOfSyn('NMD3 on I23')].SP.pAxonRate:=@rext;
  { ------- GABB ------- }
       Syn[iOfSyn('GABB on P')].SP.pAxonRate:=@rn[2,1];
       Syn[iOfSyn('GABB on I')].SP.pAxonRate:=@rn[2,2];
       Syn[iOfSyn('GABB on P23')].SP.pAxonRate:=@rn[2,3];
       Syn[iOfSyn('GABB on I23')].SP.pAxonRate:=@rn[2,4];
end;

constructor TColumn.Create;
var i,ip,jp :integer;
begin
  { Memory for new Column }
  inherited Create;
  { Populations }
  for ip:=1 to NPop do
  case ip of
  1: CreatePopulationBy_NP_O('P',  Nts[1],dt,ts_end[1],sgm_V[1],NP0[1],Pop[1]);
  2: CreatePopulationBy_NP_O('I',  Nts[2],dt,ts_end[2],sgm_V[2],NP0[2],Pop[2]);
  3: CreatePopulationBy_NP_O('P23',Nts[1],dt,ts_end[1],sgm_V[3],NP0[3],Pop[3]);
  4: CreatePopulationBy_NP_O('I23',Nts[2],dt,ts_end[2],sgm_V[4],NP0[4],Pop[4]);
  end;
  { Synapses }
  for i:=1 to NSyn do begin
      Syn[i]:=TSynCurr.Create;
      Syn[i].SP:=SP_[i];
  end;
  { Axons }
  SetAxonRates;
{  for ip:=1 to NPop do begin
      for jp:=1 to NPop do begin
          axDelay[ip,jp]:=t_axon[2-(ip mod 2),2-(jp mod 2)];
      end;
  end;}
  { Ionic concentrations }
  for i:=1 to NPop do begin
      Ions[i]:=TIons.Create;
//      Ions[i].InitialConditions(i,NP0[i]);  // replaced on 18.08.2016
  end;
end;

destructor TColumn.Destroy;
var ip,i :integer;
begin
  for ip:=1 to NPop do begin
      for i:=0 to Pop[ip].PP.Nts do begin
          Pop[ip].Nrn[i].Destroy;
          Pop[ip].Nrn[i]:=nil;
      end;
  end;
  inherited Destroy;
end;

procedure TColumn.InitialConditions;
var i :integer;
begin
  for i:=1 to NPop do begin
      Pop[i].InitialConditions(i);
  end;
  for i:=1 to NSyn do begin
      Syn[i].InitialConditions;
  end;
  for i:=1 to NPop do begin
      Ions[i].InitialConditions(i,Pop[i].PP.NP);    // replaced here on 18.08.2016
  end;
end;

procedure TColumn.CopyInitialConditionsFrom(ACol :TColumn);
var i :integer;
begin
  for i:=1 to NPop do  Pop[i].EquateFrom(ACol.Pop[i]);
  for i:=1 to NSyn do  Syn[i].EquateFrom(ACol.Syn[i]);
  { Ions }
  for i:=1 to NPop do  Ions[i].EquateFrom(ACol.Ions[i]);
end;

{procedure TColumn.Change_gmax_AccordingToNewHHorder(ie :integer; FromTo :string);
var i,ip    :integer;
    s       :string;
    ro_,x   :double;
begin
  ro_:=Pop[ie].PP.NP.ro;
  for i:=1 to NSyn do  with Syn[i].SP do begin
      ip:=OwnerOfSynapse(Name);
      if ip<>0 then begin
         s:=Name[9];
         if ((s='P')and(ie=1)) or ((s='I')and(ie=2)) then begin
            if          (Name[1]+Name[2]+Name[3]='GAB') then begin
               // GABA synapses
               x:=(3+ro_)/(3+2*ro_);
               if FromTo='2to1' then  gmax:=gmax*x
                                else  gmax:=gmax/x;
            end else begin
               // AMPA and NMDA synapses
               x:=3/(3+2*ro_);
               if FromTo='2to1' then  gmax:=gmax*x
                                else  gmax:=gmax/x;
            end;
         end;
      end;
  end;
end;             }

function TColumn.OwnerOfSynapse(Name :string):integer;
{ Checks whether the synapse belongs to any active population. }
var s :string;
    ip,iOwner :integer;
begin
  s:=Name[9];  if (Length(Name)>=11)and(Name[10]+Name[11]='23') then  s:=s+'23';
  iOwner:=0;
  ip:=1;
  while (ip<=NPop)and(iOwner=0) do begin
     if s=Pop[ip].PP.Name then iOwner:=ip;
     ip:=ip+1;
  end;
  OwnerOfSynapse:=iOwner;
end;

procedure TColumn.GapJunctions;
var
    ip,i :integer;
    V_,VPeak_,gGJ_,dT_AP_ :double;
begin
  if (gGJ[1]=0)and(gGJ[2]=0) then exit;
  for ip:=1 to NPop do  with Pop[ip] do begin
      { Mean voltage of spiking cells }
      Pop[ip].Calculate_mean_Voltage;
      { Add GJ to control parameters }
      gGJ_:=gGJ[2-(ip mod 2)];
      sE:=sE+gGJ_;
      uE:=uE-gGJ_*(Vus-Pop[ip].mean_U);
  end;
end;

procedure TColumn.GapJunctions2;
var
    ip,i :integer;
    V_,VPeak_,gGJ_,dT_AP_,FiringFraction :double;
begin
  if (gGJ[1]=0)and(gGJ[2]=0) then exit;
  for ip:=1 to NPop do  with Pop[ip] do begin
      FiringFraction:=0;//min(1,nu*0.001{s});
      VPeak_:={PP.NP.Vreset;}0;
      mean_U:=(1-FiringFraction)*U + FiringFraction*VPeak_;
      { Add GJ to control parameters }
      gGJ_:=gGJ[2-(ip mod 2)];
      sE:=sE+gGJ_;
      uE:=uE-gGJ_*(Vus-mean_U);
  end;
end;

procedure TColumn.AddSynapse_to_US(i_syn :integer; var u,s :double);
begin
  s:=s+Syn[i_syn].g;
  u:=u-Syn[i_syn].g*(Vus-Syn[i_syn].SP.Vrev);
end;

procedure TColumn.IntegrateSynapticCurrents;
var i,l,ip    :integer;
    Isyn_     :double;
    s         :string;
begin
  { Integrate conductances }
  for i:=1 to NSyn do if Syn[i].SP.IfBlock<>1 then begin
      {********************}
      Syn[i].Integrate(dt);
      {********************}
  end;
  { Control variables }
  for i:=1 to NPop do  with Pop[i] do begin
      uE:=0;  sE:=0;  uI:=0;  sI:=0;  {uu:=0;  ss:=0;} tt:=0;
  end;
  for i:=1 to NSyn do  with Syn[i].SP do if IfBlock<>1 then begin
      ip:=OwnerOfSynapse(Name);
      if ip<>0 then begin
         s:=Name[9];  if Length(Name)>=11 then  s:=s+Name[10]+Name[11];
         if          (Name[1]+Name[2]+Name[3]='GAB') then begin
            { GABA synapses }
            AddSynapse_to_US(i, Pop[ip].uI, Pop[ip].sI);
         end else if (Name[1]+Name[2]+Name[3]='NMD') then begin
            { NMDA synapses }
            Pop[ip].tt:=Pop[ip].tt+Syn[i].g;
         end else begin
            { AMPA synapses }
            AddSynapse_to_US(i, Pop[ip].uE, Pop[ip].sE);
         end;
      end;
  end;
  { Gap Junctions }
  GapJunctions;
  { Sumarize synaptic signals }
{  for ip:=1 to NPop do begin
      Pop[ip].uu:=Pop[ip].uE+Pop[ip].uI;
      Pop[ip].ss:=Pop[ip].sE+Pop[ip].sI;
  end;}
  { ---------------- Currents ----------------------------------- }
  for ip:=1 to NPop do begin
      Isyn_:=-(Pop[ip].sE+Pop[ip].sI)*(Pop[ip].U-Vus) + Pop[ip].uE + Pop[ip].uI;
      Pop[ip].Isyn:=Isyn_ * Pop[ip].PP.NP.Square*1e9; {pA}
  end;
end;

{******************************************************************************}
procedure TColumn.ChangeReversalPotentialsAccordingToIonConcentrations;
{******************************************************************************}
var
    i,ip                    :integer;
    s                       :string;
    meanK_,mean_gGlu_       :double;
begin
  if IfDynamic_K_Cl=0 then exit; { On/Off }
  for ip:=1 to NPop do  {if (ip=1)or(ip=3) then} begin  // 22.04.2017
      { Interneurons don't change potassium }
      if (ip=2)or(ip=4) then begin                      // 22.04.2017
          IonsP[ip].If_K_fixed:=1;                    // 22.04.2017
          IonsP[ip].K_fix:=Ions[1].IV.K;              // 22.04.2017
      end;                                              // 22.04.2017
      { Calculate ionic concentrations }
      Pop[ip].Calculate_mean_Voltage;
      Pop[ip].Calculate_mean_IK;
      //Pop[ip].Calculate_mean_IsynI;
      mean_gGlu_:=Pop[ip].sE - gGJ[2-(ip mod 2)] +
                  Pop[ip].Nrn[Pop[ip].PP.Nts].NV.gNMDA;
//                  Pop[ip].tt * fNMDA(Pop[ip].mean_U,Pop[ip].PP.NP.Mg);
      {************}
      Ions[ip].Integrate(Pop[ip].mean_U,
                         Pop[ip].mean_IK,
                         mean_gGlu_,
                         Pop[ip].sI,
                         Pop[ip].nu);
      {************}
      { VK and VNa }
      for i:=0 to Pop[ip].PP.Nts do begin
          Pop[ip].Nrn[i].NP.VAHP:=Ions[ip].IV.VK +IonsP[ip].dVAHP;
          Pop[ip].Nrn[i].NP.VK  :=Ions[ip].IV.VK +IonsP[ip].dVK;
          Pop[ip].Nrn[i].NP.VKDr:=Ions[ip].IV.VK +IonsP[ip].dVKDr;
          Pop[ip].Nrn[i].NP.VKM :=Ions[ip].IV.VK +IonsP[ip].dVKM;
          Pop[ip].Nrn[i].NP.VKD :=Ions[ip].IV.VK +IonsP[ip].dVKD;
          Pop[ip].Nrn[i].NP.VNa :=Ions[ip].IV.VNa+IonsP[ip].dVNa;
          if Pop[ip].Nrn[i].NP.HH_type='Bazhenov' then begin
             Pop[ip].Nrn[i].NP.VLd:=(IonsP[ip].gL_Cl *Ions[ip].IV.VCl
                                    +IonsP[ip].gL_K  *Ions[ip].IV.VK
                                    +IonsP[ip].gL_Na *Ions[ip].IV.VNa)/
                                                          Pop[ip].Nrn[i].NP.gLd;
             Pop[ip].Nrn[i].NP.VL :=(IonsP[ip].gg_kl *Ions[ip].IV.VK
                                    +IonsP[ip].gg_Nal*Ions[ip].IV.VNa)/
                                                          Pop[ip].Nrn[i].NP.gL;
          end else begin
             case IonsP[ip].VL_Item of         { VL }
             0:;       { fixed }
             1: begin  { f(K,Cl,Na) }
                  Pop[ip].Nrn[i].NP.VL   :=Ions[ip].IV.VL;// + IonsP[ip].dVL;
                  Pop[ip].Nrn[i].NP.Vrest:=Ions[ip].IV.VL;// + IonsP[ip].dVrest;
                end;
             2: begin  { corrected }
                  Pop[ip].Nrn[i].NP.VL   :=Ions[ip].IV.VL + IonsP[ip].dVL;
                  Pop[ip].Nrn[i].NP.Vrest:=Ions[ip].IV.VL + IonsP[ip].dVrest;
                end;
             end;
          end;
          Pop[ip].Nrn[i].NP.NaKpumpS:=Ions[ip].IV.INaKpump/1000; {mA/cm^2}
          Pop[ip].Nrn[i].NP.NaKpumpD:=Ions[ip].IV.INaKpump/1000; {mA/cm^2}
      end;
      { GABA-A and GABA-B }
      for i:=1 to NSyn do  with Syn[i].SP do if IfBlock<>1 then begin
          if (OwnerOfSynapse(Name)=ip) and
             (Name[1]+Name[2]+Name[3]='GAB') then begin
              Syn[i].SP.Vrev:=Ions[ip].IV.VGABA{-IonsP[ip].VGABA0+Syn[i].SP.Vrev0};
          end;
      end;
  end;
  { Interaction between Ions of different populations }
  {*********************************************************}
  if      NPop=1 then  meanK_:=Ions[1].IV.K
  else if NPop=2 then begin
     meanK_:=(Ions[1].IV.K*IonsP[1].Contribution
            + Ions[2].IV.K*IonsP[2].Contribution)
            /(IonsP[1].Contribution+IonsP[2].Contribution);
     Ions[1].IV.K:=meanK_;
     Ions[2].IV.K:=meanK_;
  end else begin    { NPop>=3 }
     meanK_:=(Ions[1].IV.K*IonsP[1].Contribution
            + Ions[2].IV.K*IonsP[2].Contribution
            + Ions[3].IV.K*IonsP[3].Contribution)
            /(IonsP[1].Contribution+IonsP[2].Contribution+IonsP[3].Contribution);
     Ions[1].IV.K:=meanK_;
     Ions[2].IV.K:=meanK_;
     Ions[3].IV.K:=meanK_;
  end;
  {*********************************************************}
end;
{******************************************************************************}

procedure TColumn.IntegrateDensity;
var i       :integer;
    nu_old  :double;
begin
  { Populations }
  for i:=1 to NPop do begin
      nu_old:=Pop[i].nu; //Q[i];
      {********************}
      Q[i]:=Pop[i].Density;   // Q differs from nu in 2D after accounting delays
      {********************}
      dQdt[i]:=(Pop[i].nu-nu_old)/dt;
  end;
end;

procedure TColumn.IntegrateVoltage;
var i :integer;
begin
  { Populations }
  for i:=1 to NPop do begin
      //Pop[i].Iind:=Current_Iind(2-(i mod 2));
      {************************************}
      Pop[i].MembranePotential(t,0);
      {************************************}
  end;
end;

procedure TColumn.AxonalDelays;
var ip,jp :integer;
    delay_:double;
begin
  { Axons }
  for ip:=1 to NPop do begin
      for jp:=1 to NPop do begin
          delay_:=t_axon[2-(ip mod 2),2-(jp mod 2)];
          {if delay_=0 then begin         // commented on 10.01.2017
             rn[ip,jp]:=Pop[ip].nu;
          end else begin}
             rn[ip,jp]:=Pop[ip].ro_at_ts(delay_);
          {end;}
      end;
  end;
end;
{******************************************************************************}
{******************************************************************************}
{******************************************************************************}

end.
