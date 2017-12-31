unit MorfologyO;

interface
uses Init;

procedure PatchyConnections;
procedure PoissonEq(r_ax_:double; ip,jp :integer);

implementation
uses MathMyO,slice_2DO,Stimulation_2D,Unit3;

function GaussianOrMexicanHat(rr_ :double):double;
var G_,rMH1,rMH2 :double;
begin
  rMH1:=3*rPW;  rMH2:=sqrt(2)*rPW;  G_:=0;
  case Form3.ComboBox6.ItemIndex of
  0,2: // Pref-to-pref: cos(fi12)*Gauss(r12)
       // One-to-one & Gauss(r12)
       { Gaussian }
       G_:= dexp(-rr_/2/sqr(rMH1))/(2*pi*sqr(rMH1));
  1,3: // Pref-to-pref & Mexican hat
       // One-to-one & Mexican hat
       { Mexican hat }
       G_:=(dexp(-rr_/2/sqr(rMH1)) - dexp(-rr_/2/sqr(rMH2)))
                 /(2*pi*(sqr(rMH1)-sqr(rMH2)));
  end;
  GaussianOrMexicanHat:=G_;
end;

function PatchyWeight(i1,j1,i2,j2 :integer) :double;
{ Defines whether the nodes (i1,j1) and (i2,j2) are from neighbour pinwheels
  or not. If yes, calculates the weight of their connection. }
var fi1,fi2,dx1,dy1,dx2,dy2,sm1,sm2,r1,r2,rr12                     :double;
    iPWCenter1,jPWCenter1,iPWCenter2,jPWCenter2,charge1,charge2    :integer;
begin
  PinWheel_fi_for_ij(i1,j1,0, fi1,dx1,dy1,iPWCenter1,jPWCenter1,charge1); //postsynaptic
  PinWheel_fi_for_ij(i2,j2,0, fi2,dx2,dy2,iPWCenter2,jPWCenter2,charge2); //presynaptic
  r1:=sqrt(sqr(dx1)+sqr(dy1));
  r2:=sqrt(sqr(dx2)+sqr(dy2));
  { Smooth pinwheels}
  if Form3.CheckBox6.Checked{smooth} then begin
     sm1:=min(1,2*r1/rPW);
     sm2:=min(1,2*r2/rPW);
  end else begin  sm1:=1; sm2:=1;  end;
  { Mexican hat or Gaussian }
  rr12:=(sqr(i1-i2)+sqr(j1-j2));
  PatchyWeight:= (1 + sm1*sm2 * cos(fi1-fi2)) * GaussianOrMexicanHat(rr12);
end;

procedure PatchyConnections_without_Symmetry;
{  Integrating input rate WQ with the weights of patchy connections.
   Only neurons with the same pref. orientations are connected with
   the Mexican hat profile. }
var
    i,j,ii,jj                              :integer;
    S,Norm,Patchy,portion,w_               :double;
begin
  portion:=Form3.DDSpinEdit16.Value;
  if portion<=0 then exit;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          S:=0;  Norm:=0;
          for ii:=0 to ni+1 do begin
              for jj:=0 to nj+1 do if if_ni_nj_ne_1(ii,jj) then begin
//                  if (ii=33)and(jj=7) then begin
                  Patchy:=PatchyWeight(i,j,ii,jj);
                  S   :=S    +  WQ[1,ii,jj]*Patchy;
                  Norm:=Norm +              Patchy;
//                  end;
              end;
          end;
//          Norm:=pi*rPW*rPW;
          w_:=(1-portion); if Form3.CheckBox11.Checked then w_:=1;
          Wrn[1,i,j]:=Wrn[1,i,j]*w_ + portion*S/Norm;
      end;
  end;
end;

procedure PatchyConnections_with_Symmetry;
{  Integrating input rate WQ with the weights of patchy connections.
   and symmetrical boundary conditions inside the square [1..ni,1..nj]. }
var
    i,j,ii,jj,iii,jjj                       :integer;
    S,Norm,Patchy,portion,w_                :double;
begin
  portion:=Form3.DDSpinEdit16.Value;
  if portion<=0 then exit;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          S:=0;  Norm:=0;
          for iii:=-rPW to ni+1+rPW do begin
              { Symmetry on the edges of square ii=1..ni, jj=1..nj. }
              ii:=iii;
              if iii<=0 then ii:=2-iii else if iii>ni then ii:=2*ni-iii;
              for jjj:=-rPW to nj+1+rPW do if if_ni_nj_ne_1(ii,jj) then begin
                  { Symmetry on the edges of square ii=1..ni, jj=1..nj. }
                  jj:=jjj;
                  if jjj<=0 then jj:=2-jjj else if jjj>nj then jj:=2*nj-jjj;
                  {*******************************************}
                  Patchy:=PatchyWeight(i,j,ii,jj);
                  S   :=S    +  WQ[1,ii,jj]*Patchy;
                  {*******************************************}
                  Norm:=Norm +              Patchy;
              end;
          end;
          //Norm:=pi*rPW*rPW;
          w_:=(1-portion); if Form3.CheckBox11.Checked then w_:=1;
          if Norm<=0 then begin
             Wrn[1,i,j]:=Wrn[1,i,j]*w_; //exclude centers of pinwheels
          end else begin
             Wrn[1,i,j]:=Wrn[1,i,j]*w_ + portion*S/Norm;
          end;
      end;
  end;
end;

procedure PatchyConnections_Copy;
{  Integrating input rate WQ with the weights of patchy connections.
   Only neurons with the same pref. orientations are connected with
   the Mexican hat profile. }
var
    i,j,ii,jj,iPWCenter1,jPWCenter1,iPWCenter2,jPWCenter2,
    charge1,charge2                                                 :integer;
    portion,dx1,dy1,dx2,dy2,r1,r2,fi1,fi2,
    rr12,rMH1,rMH2,Gaussian,maxG,cSymm,sm1,Q,w_                     :double;
    PW,smPW,wPW                                                     :arr_X_Y;
begin
  portion:=Form3.DDSpinEdit16.Value;
  if portion<=0 then exit;
  for i:=0 to ni+1 do for j:=0 to nj+1 do begin PW[i,j]:=0; wPW[i,j]:=0; end;
  maxG:=0;
  Q:=0;
  { Summarize POSTSYNAPTIC firing rates provided by patchy connections }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          { Local coordinates in pinwheels }
          PinWheel_fi_for_ij(i,j,  0, fi1,dx1,dy1,iPWCenter1,jPWCenter1,charge1); //postsynaptic
          r1:=sqrt(sqr(dx1)+sqr(dy1));
          for ii:=0 to ni+1 do begin
              for jj:=0 to nj+1 do if if_ni_nj_ne_1(ii,jj) then begin
                  { Local coordinates in pinwheels }
                  PinWheel_fi_for_ij(ii,jj,0, fi2,dx2,dy2,iPWCenter2,jPWCenter2,charge2); //presynaptic
                  r2:=sqrt(sqr(dx2)+sqr(dy2));
                  { If local coords. of pre- and postsyn. cells coincide then... }
                  if (r1=r2)and(cos(fi1-fi2)=1) then begin
                      { Smooth by the distance to PW center }
                      if Form3.CheckBox6.Checked then sm1:=min(1,2*r1/rPW)
                                                 else sm1:=1;
                      { Mexican hat or Gaussian }
                      rr12:=(sqr(i-ii)+sqr(j-jj));
                      Gaussian:=GaussianOrMexicanHat(rr12);
                      maxG:=max(maxG,Gaussian);
                      { if (i,j) is between 2 pinwheels then the weight is to be doubled. }
                      cSymm:=1;
                      if ((abs(dx1)=rPW)and(ii>0)and(ii<ni+1)) or
                         ((abs(dy1)=rPW)and(jj>0)and(jj<nj+1)) then cSymm:=2;
                      if ((abs(dx1)=rPW)and(ii>0)and(ii<ni+1)) and
                         ((abs(dy1)=rPW)and(jj>0)and(jj<nj+1)) then cSymm:=4;
                      {*******************************************}
                      PW[i,j]:=PW[i,j]+Wrn[1,ii,jj]*Gaussian*cSymm;
                      {*******************************************}
                      smPW[i,j]:=sm1;
                      Q:=Q + Gaussian*cSymm*sm1/(ni+2)/(nj+2);
                      wPW[i,j]:=wPW[i,j]+Gaussian*cSymm;
                  end;
              end;
          end;
      end;
  end;
  { Balance diffuse and patchy connections }
  if maxG>0 then
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          w_:=(1-portion *smPW[i,j]); if Form3.CheckBox11.Checked then w_:=1;
          if wPW[i,j]>0 then
          Wrn[1,i,j]:=w_*Wrn[1,i,j] + portion*smPW[i,j]*PW[i,j]/wPW[i,j]{Q}{maxG};
      end;
  end;
end;

{******************************************************************************}
procedure PatchyConnections;
begin
  case Form3.ComboBox6.ItemIndex of
  0,1: begin // One-to-One & Mexican hat
          PatchyConnections_Copy;
     end;
  2,3: begin // Pref-to-pref: cos(fi12)*Gauss(r12)
             // Pref-to-pref & Mexican hat
       if Form3.CheckBox13.Checked then begin { symmetry }
          PatchyConnections_with_Symmetry;
       end else begin
          PatchyConnections_without_Symmetry;
       end;
     end;
  end;
end;
{******************************************************************************}
{******************************************************************************}

procedure PoissonEq_without_Symmetry(r_ax_ :double; If_Normalized,ip,jp :integer);
{  Integrating input rate WQ with exponential weight. }
var
    i,j,ii,jj,degree_,i_left,i_right,j_bottom,j_top,IfDelay_        :integer;
    x,y,xx,yy,S,d_,Norm,w_,del_,e_                                  :double;
begin
  degree_:=1; if Form3.ComboBox2.ItemIndex in [2,3] then degree_:=2;
  IfDelay_:=0; if Form3.ComboBox2.ItemIndex=3 then IfDelay_:=1;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          S:=0;  Norm:=0;
          x:=i*dx;  y:=j*dy;
          i_left  :=trunc((x-4*r_ax_)/dx);
          i_right :=trunc((x+4*r_ax_)/dx);
          j_bottom:=trunc((y-4*r_ax_)/dy);
          j_top   :=trunc((y+4*r_ax_)/dy);
          { Cut }
          if IfCut=1 then begin
             if abs(j-nj_2)<h_cut/2 then begin
                if i<=i_cut then i_right:=imin(i_right,i_cut)
                            else i_left :=imax(i_left, i_cut+1);
             end;
          end;
          for ii:=imax(0,i_left) to imin(ni+1,i_right) do begin      // 21.01.2016
              for jj:=imax(0,j_bottom) to imin(nj+1,j_top) do if if_ni_nj_ne_1(ii,jj) then begin  // 23.01.2016
                  xx:=ii*dx;
                  yy:=jj*dy;
                  d_:=sqrt(sqr(x-xx)+sqr(y-yy));
                  e_:=d_/r_ax_;
                  if degree_=2 then e_:=sqr(e_);
                  w_:=WQ[1,ii,jj];
                  { Delays depend on the distance }
                  if IfDelay_=1 then begin         //17.05.2016
                     del_:=min(d_/Speed,0.02{s});  //t_axon[2-(ip mod 2),2-(jp mod 2)];
                     w_:=Columns[ii,jj].Pop[ip].ro_at_ts(del_);
                  end;
                  {***************************}
                  S   :=S + w_*dexp(-e_)*dx*dy;
                  {***************************}
                  Norm:=Norm + dexp(-e_)*dx*dy;
              end;
          end;
          { Not-normalized means that boundary nodes recieve weaker signal. }
          if If_Normalized=0 then Norm:=pi*r_ax_*r_ax_;
          { Normalized if norm covers only the integrated area. }
          Wrn[1,i,j]:=S/Norm;
      end;
  end;
end;

procedure PoissonEq(r_ax_:double; ip,jp :integer);
{  Integrating input rate WQ with exponential weight
   and symmetrical boundary conditions inside the square [1..ni,1..nj]. }
var
    i,j,ii,jj,iii,jjj,degree_               :integer;
    x,y,xx,yy,S,d_,Norm                     :double;
begin
  if Form3.ComboBox1.ItemIndex=1 then begin // Cut edge, normalized
     PoissonEq_without_Symmetry(r_ax_,1,ip,jp);
     exit;
  end;
  if Form3.ComboBox1.ItemIndex=2 then begin // Cut edge, not-normalized
     { Not-normalized means that boundary nodes recieve weaker signal. }
     PoissonEq_without_Symmetry(r_ax_,0,ip,jp);
     exit;
  end;
  if Form3.ComboBox1.ItemIndex=3 then begin // Dead boundary
     { Zero rates. }
     for i:=0 to ni+1 do begin   WQ[1,i,0]:=0;  WQ[1,i,nj+1]:=0; end;
     for j:=0 to nj+1 do begin   WQ[1,0,j]:=0;  WQ[1,ni+1,j]:=0; end;
     PoissonEq_without_Symmetry(r_ax_,0,ip,jp);
     for i:=0 to ni+1 do begin  Wrn[1,i,0]:=0; Wrn[1,i,nj+1]:=0; end;
     for j:=0 to nj+1 do begin  Wrn[1,0,j]:=0; Wrn[1,ni+1,j]:=0; end;
     exit;
  end;
  { Otherwise - "Symmetry" - symmetrical reflection }
  degree_:=1; if Form3.ComboBox2.ItemIndex=2 then degree_:=2;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          S:=0;  Norm:=0;
          x:=i*dx;  y:=j*dy;
          for iii:=-rPW to ni+1+rPW do begin
              { Symmetry on the edges of square ii=1..ni, jj=1..nj. }
              ii:=iii;
              if iii<=0 then ii:=2-iii else if iii>ni then ii:=2*ni-iii;
              xx:=iii*dx;
              for jjj:=-rPW to nj+1+rPW do if if_ni_nj_ne_1(ii,jj) then begin
                  { Symmetry on the edges of square ii=1..ni, jj=1..nj. }
                  jj:=jjj;
                  if jjj<=0 then jj:=2-jjj else if jjj>nj then jj:=2*nj-jjj;
                  { Distance between pre- and post- synaptic somas }
                  yy:=jjj*dy;
                  d_:=sqrt(sqr(x-xx)+sqr(y-yy))/r_ax_;
                  if degree_=2 then d_:=sqr(d_);
                  {*******************************************}
                  S   :=S    +  WQ[1,ii,jj]*exp(-d_)*dx*dy;
                  {*******************************************}
                  Norm:=Norm +              exp(-d_)*dx*dy;
              end;
          end;
//          Norm:=pi*r_ax_*r_ax_;
          Wrn[1,i,j]:=S/Norm;
      end;
  end;
end;

end.
