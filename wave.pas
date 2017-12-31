unit wave;

interface
uses Init,t_dtO;

procedure Derivatives(i,j :integer);
procedure Limiters;
procedure DerivativesOfLimiters(i,j :integer);
procedure WaveEquation(ie,i,j :integer; r_ax_,t_ax_,w,diff, po,uo,vo :double;
                       var p,u,v :double);
procedure BoundaryConditions(ie :integer);
procedure AxonEquation(ie :integer; r_ax_,t_ax_ :double);

implementation
uses MathMyO,slice_2DO;

var
  pp,up,vp
                                                        : arr_X_Y;
  DxWp,DyWp,DDxWp,DDyWp,DDWu,DDWv,DWu,DWv, DDxWv,DDyWu,
  DLxp,DLyp,DLu,DLv, DDLxp,DDLyp,DDLu,DDLv
                                                        : double;
  Lxp,Lyp,Lu,Lv
                                                        : arr_X_Y;

procedure Derivatives(i,j :integer);
begin
  if ni=1 then begin
     DxWp:=0; DDxWp:=0; DWu:=0; DDWu:=0;
  end else begin
     DxWp:=(pp[i+1,j]-pp[i-1,j])/2/dx;
     DWu :=(up[i+1,j]-up[i-1,j])/2/dx;
     DDxWp:=(pp[i+1,j]-2*pp[i,j]+pp[i-1,j])/dx/dx;
     DDWu :=(up[i+1,j]-2*up[i,j]+up[i-1,j])/dx/dx;
  end;
  if nj=1 then begin
     DyWp:=0; DDyWp:=0; DWv:=0; DDWv:=0;
  end else begin
     DyWp:=(pp[i,j+1]-pp[i,j-1])/2/dy;
     DWv :=(vp[i,j+1]-vp[i,j-1])/2/dy;
     DDyWp:=(pp[i,j+1]-2*pp[i,j]+pp[i,j-1])/dy/dy;
     DDWv :=(vp[i,j+1]-2*vp[i,j]+vp[i,j-1])/dy/dy;
  end;
end;

procedure Limiters;
var  L1,L2 :double;
     i,j              :integer;
begin
  for i:=1 to ni do begin
      for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
          Derivatives(i,j);
          if (i=1) or (i=ni) then begin  DDxWp:=0; DDWu:=0;  end;
          if (j=1) or (j=nj) then begin  DDyWp:=0; DDWv:=0;  end;
          {*** X ***}
          L1:=MinMod(DWu+DxWp-dx2*(DDWu+DDxWp),DWu+DxWp+dx2*(DDWu+DDxWp));
          L2:=MinMod(DWu-DxWp-dx2*(DDWu-DDxWp),DWu-DxWp+dx2*(DDWu-DDxWp));
          Lu[i,j]:=0.5*(L1+L2);        Lxp[i,j]:=0.5*(L1-L2);
          {*** Y ***}
          L1:=MinMod(DWv+DyWp-dy2*(DDWv+DDyWp),DWv+DyWp+dy2*(DDWv+DDyWp));
          L2:=MinMod(DWv-DyWp-dy2*(DDWv-DDyWp),DWv-DyWp+dy2*(DDWv-DDyWp));
          Lv[i,j]:=0.5*(L1+L2);        Lyp[i,j]:=0.5*(L1-L2);
      end;
  end;
end;

procedure DerivativesOfLimiters(i,j :integer);
begin
  if (i=1) or (i=ni) then begin
     DLxp:=0;  DLu:=0;  DDLu:=0;  DDLxp:=0;
  end else begin
     DLxp :=(Lxp[i+1,j]-Lxp[i-1,j])/2/dx;
     DLu  :=(Lu [i+1,j]-Lu [i-1,j])/2/dx;
     DDLu :=(Lu [i+1,j]-2*Lu [i,j]+Lu [i-1,j])/dx/dx;
     DDLxp:=(Lxp[i+1,j]-2*Lxp[i,j]+Lxp[i-1,j])/dx/dx;
  end;
  if (j=1) or (j=nj) then begin
     DLyp:=0;  DLv:=0;  DDLv:=0;  DDLyp:=0;
  end else begin
     DLyp :=(Lyp[i,j+1]-Lyp[i,j-1])/2/dy;
     DLv  :=(Lv [i,j+1]-Lv [i,j-1])/2/dy;
     DDLv :=(Lv [i,j+1]-2*Lv [i,j]+Lv [i,j-1])/dy/dy;
     DDLyp:=(Lyp[i,j+1]-2*Lyp[i,j]+Lyp[i,j-1])/dy/dy;
  end;
end;

procedure WaveEquation(ie,i,j :integer; r_ax_,t_ax_,w,diff, po,uo,vo :double;
                       var p,u,v :double);
{
  Solving of wave equation
          DDp/Dtt + gam*Dp/Dt + gam2*p - a (DDp/Dxx + DDp/Dyy) = gam2*Source
  by TVD-scheme for equivalent system
        Dp/Dt + gam*p + a (Du/Dx + Dv/Dy) = w,
        Du/Dt + gam*u + a Dp/Dx = 0,
        Dv/Dt + gam*v + a Dp/Dy = 0,
        Dw/Dt + gam*w = gam2*Source.
}
var  a,gt,oo :double;
begin
  { ***           Godunov's scheme              ***}
  Derivatives(i,j);
  a:=r_ax_/t_ax_;
  gt:=dt/t_ax_;
  oo:=(min(dx,dy)-a*dt)/2;
  p:=po - a*dt*(DWu+DWv-diff*(dx2*DDxWp+dy2*DDyWp))  - gt*pp[i,j]+dt*w;
  u:=uo - a*dt*(DxWp   -diff* dx2*DDWu) - gt*up[i,j];
  v:=vo - a*dt*(DyWp   -diff* dy2*DDWv) - gt*vp[i,j];
  {*****                  Antidiffusion            *****}
  if (OrderOfWaveEq=2) and (diff=1) then begin
     DerivativesOfLimiters(i,j);
     p:=p - a*dt*oo*(DLxp - dx2*DDLu + DLyp - dy2*DDLv);
     u:=u - a*dt*oo*(DLu  - dx2*DDLxp);
     v:=v - a*dt*oo*(DLv  - dy2*DDLyp);
  end;
end;

procedure BoundaryConditions(ie :integer);
var  i,j :integer;
begin
    { Soft conditions }
    for i:=0 to ni+1 do if if_ni_nj_ne_1(i,1) then begin
        Wrn[ie,i,0]:=Wrn[ie,i,1];     Wrn[ie,i,nj+1]:=Wrn[ie,i,nj];
        Wvn[ie,i,0]:=0;               Wvn[ie,i,nj+1]:=0;
        Ww[ie,i,0]:=Ww[ie,i,1];       Ww[ie,i,nj+1]:=Ww[ie,i,nj];
    end;
    for j:=0 to nj+1 do if if_ni_nj_ne_1(1,j) then begin
        Wrn[ie,0,j]:=Wrn[ie,1,j];     Wrn[ie,ni+1,j]:=Wrn[ie,ni,j];
        Wun[ie,0,j]:=0;               Wun[ie,ni+1,j]:=0;
        Ww[ie,0,j]:=Ww[ie,1,j];       Ww[ie,ni+1,j]:=Ww[ie,ni,j];
    end;
end;

procedure AxonEquation(ie :integer; r_ax_,t_ax_ :double);
{
  Solving of axon equation
  [ 1/gam2 DD + 2/gam D + 1 - r_axon2 Lapl ] Wp = Qe
  by reducing to wave equation.
}
var
    i,j              :integer;
    w,Wwn,gt,gam2,S  :double;
begin
  gt:=dt/t_ax_;
  gam2:=1/sqr(t_ax_);
  { Predictor ************************************** }
  for i:=0 to ni+1 do begin
    for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
        pp[i,j]:= Wr[ie,i,j];
        up[i,j]:= Wu[ie,i,j];
        vp[i,j]:= Wv[ie,i,j];
    end;
  end;
  for i:=1 to ni do begin
    for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
        w:=Ww[ie,i,j];
        WaveEquation(ie,i,j,r_ax_,t_ax_,w,0,
                     Wr[ie,i,j], Wu[ie,i,j], Wv[ie,i,j],
                     Wrn[ie,i,j],Wun[ie,i,j],Wvn[ie,i,j]);
    end;
  end;
  BoundaryConditions(ie);
  { Corrector ************************************** }
  for i:=0 to ni+1 do begin
    for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
        pp[i,j]:= (Wrn[ie,i,j]+Wr[ie,i,j])/2;
        up[i,j]:= (Wun[ie,i,j]+Wu[ie,i,j])/2;
        vp[i,j]:= (Wvn[ie,i,j]+Wv[ie,i,j])/2;
    end;
  end;
  if OrderOfWaveEq=2 then Limiters;
  for i:=1 to ni do begin
    for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
        { Source }
        S:=WQ[ie,i,j] + WdQdt[ie,i,j]*t_ax_;
        Wwn:=       Ww[ie,i,j] - gt*Ww[ie,i,j] + gam2*dt*S;
        w:= (Wwn+Ww[ie,i,j])/2;
        Ww[ie,i,j]:=Ww[ie,i,j] - gt*w          + gam2*dt*S;
        WaveEquation(ie,i,j,r_ax_,t_ax_,w,1,
                     Wr[ie,i,j], Wu[ie,i,j], Wv[ie,i,j],
                     Wrn[ie,i,j],Wun[ie,i,j],Wvn[ie,i,j]);
    end;
  end;
end;
{--------------------EOF---------------------------------------------------}


end.
