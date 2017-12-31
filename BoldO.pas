unit BoldO;
{ BOLD-signal is modelled as
  (tau^2 d^2/dt^2 + tau d/dt + 1) BOLD(t) = k MUA(t),
  with tau = 5s,
  according to Fig.4 from [Logothetis et al. Nature 412: 150-157, 2001]
 }

interface
uses Init,MathMyO,t_dtO,Unit29;

type
  TBOLD=class(TObject)
    signal,tau,U,t_previous_plotting
                                            :double;
    constructor Create;
    procedure Draw(MUA :double);
  end;

var
  BOLD :TBOLD;

implementation

constructor TBOLD.Create;
begin
  signal:=0;
  U:=0;
  t_previous_plotting:=0;
  tau:=5{s};
end;

procedure TBOLD.Draw(MUA :double);
begin
  if not(Form29.Visible) then exit;
  if t<BOLD.t_previous_plotting+0.01{s} then exit;
  {***********************************************************}
  New_m2(1, 1/BOLD.tau,1/BOLD.tau,dt, MUA, BOLD.signal,BOLD.U);
  {***********************************************************}
  Form29.Series1.AddXY(t*1e3,BOLD.signal);
  t_previous_plotting:=t;
end;

end.
