unit V1_liasonO;

interface
procedure Set_Ps_Ring(i,j :integer; var pext :double);
procedure q_and_fi_r_on_Ring(ip,jp :integer; var q_,fi_r :double);
procedure AnalytPoissonEq(ip,jp :integer);

implementation
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ComCtrls, ExtCtrls,
     Init,t_dtO,MathMyO,Unit1,Unit3,Unit8,Correspond,V1O;

procedure Set_Ps_Ring(i,j :integer; var pext :double);
var R_,Iext4,fi0,Frequency          :double;
    ifi0                            :integer;
begin
  pext:=Qns;
  Iext4:=Iext{muA}* pext_Iext {Hz/muA};
  if t_stim2=0 then t_stim2 :=Form3.DDSpinEdit18.Value/1e3; //second stimulus
  if t<t_stim2 then  fi0:=Form3.DDSpinEdit12.Value/180*pi   //orientation
               else  fi0:=Form3.DDSpinEdit17.Value/180*pi;
  { Short stimulus }
  if (t>t0s) and (t<t0s+tSt) then  begin
    ifi0:=trunc((fi0+pi)/2/pi*ni);
    R_:=sqrt(sqr(i-ifi0));
    case Form8.ComboBox1.ItemIndex of
    0: if R_<=R_stim then pext:=pext + Iext4;                 {'localised'}
    1: if R_<=R_stim then pext:=pext + Iext4                  {'R_stim/R'}
                     else pext:=pext + Iext4*R_stim/R_;
    end;
  end;
  { Long lasting stimulus }
  case Form8.ComboBox1.ItemIndex of
    2: pext:=pext + Iext4*(1+cos(i/ni*2*pi-pi-fi0));        {'cos'}
    3: if i/ni*2*pi-pi>fi0 then                             {'cos-Illusion'}
       pext:=pext + Iext4*(1+cos(i/ni*2*pi-pi-fi0));
    4: begin
         Frequency:=Form3.DDSpinEdit15.Value; {Hz}
         pext:=pext + Iext4*(1+cos(i/ni*2*pi-pi-fi0))
                       *0.5*(1+cos(2*pi*Frequency*t));      {'cos-gratings'}
       end;
  end;
end;

procedure q_and_fi_r_on_Ring(ip,jp :integer; var q_,fi_r :double);
{ Characteristic length of axo-dendritic connections of
  i-axons on j-dendrites on a Ring.
}
var ip2,jp2 :integer;
begin
  ip2:=2 - (ip mod 2);
  jp2:=2 - (jp mod 2);
  if Form8.ComboBox2.ItemIndex=0 then begin  {"exp"}
     // "1+q_*exp(-fi/fi_r)"
     if (ip2=1)and(jp2=1) then  q_:=Form8.DDSpinEdit2.Value;
     if (ip2=1)and(jp2=2) then  q_:=Form8.DDSpinEdit4.Value;
     if (ip2=2)and(jp2=1) then  q_:=Form8.DDSpinEdit6.Value;
     if (ip2=2)and(jp2=2) then  q_:=Form8.DDSpinEdit5.Value;
     if (ip2=1)and(jp2=1) then  fi_r:=Form8.DDSpinEdit8.Value;
     if (ip2=1)and(jp2=2) then  fi_r:=Form8.DDSpinEdit9.Value;
     if (ip2=2)and(jp2=1) then  fi_r:=Form8.DDSpinEdit10.Value;
     if (ip2=2)and(jp2=2) then  fi_r:=Form8.DDSpinEdit11.Value;
  end else begin                             {"cos"}
     // "1+q_*cos(fi)"
     if (ip2=1)and(jp2=1) then  q_:=Form8.DDSpinEdit2.Value;
     if (ip2=1)and(jp2=2) then  q_:=Form8.DDSpinEdit4.Value;
     if (ip2=2)and(jp2=1) then  q_:=Form8.DDSpinEdit6.Value;
     if (ip2=2)and(jp2=2) then  q_:=Form8.DDSpinEdit5.Value;
     q_:=min(1,q_);
     fi_r:=0;
  end;
end;

{******************************************************************************}
procedure AnalytPoissonEq(ip,jp :integer);
{
  Integrating input rate WQ with exponential or cosinusoidal weight.
  Wpn(x) = int_0^(2*pi) exp(-|x-z|/q_)    WQ(z) dz, where q_ is an angle  or
  Wpn(x) = int_0^(2*pi) (1 + q_*cos(x-z)) WQ(z) dz, where q_ is J1/J0 in FR-ring.
}
var
    i,j,iz,ip2,jp2                       :integer;
    dx,S,d_,x,z,ooo,Norm,q_,fi_r         :double;
begin
  ip2:=2 - (ip mod 2);
  jp2:=2 - (jp mod 2);
  { Characteristic length and angle }
  q_and_fi_r_on_Ring(ip,jp,q_,fi_r);
  j:=1;
  dx:=2*pi/ni;
  for i:=1 to ni do begin
      S:=0;  Norm:=0;
      x:=i*dx;
      for iz:=1 to ni do begin
          z:=iz*dx;//(iz-1/2)*dx;
          ooo:=WQ[1,iz,j];//(WQ[ie,iz,j]+WQ[ie,iz-1,j])/2;
          d_:=min(abs(z-x), min(abs(z-x+2*pi), abs(z-x-2*pi)) );
          case Form8.ComboBox2.ItemIndex of
          0: begin                           {"exp"}
               S:=S  +  ooo*(1 + q_*dexp(-d_/fi_r))*dx;
               Norm:=Norm + (1 + q_*dexp(-d_/fi_r))*dx;
             end;
          1: begin                           {"cos"}
               S:=S  +  ooo*(1 + q_*cos(x-z))*dx;
               Norm:=2*pi;
             end;
          end;
      end;
      Wrn[1,i,j]:=S/Norm;
      if (Form8.CheckBox1.Checked)and(ip2=2)and(jp2=2) then begin  {"Sharpen 22: phi_22=nu_I" }
         Wrn[1,i,j]:=WQ[1,i,j];
      end;
  end;
  { Boundary conditions }
  Wrn[1,0,j]   :=Wrn[1,ni,j];
  Wrn[1,ni+1,j]:=Wrn[1,1,j];
end;
{******************************************************************************}

end.
