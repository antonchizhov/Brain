unit CreateNrnO;

interface
uses
  Classes,typeNrnParsO,NeuronO;

procedure CreateNeuronByTypeO(NP :NeuronProperties; var ANrn :TNeuron);

{*********************************************************************}
var   ANrn :TNeuron;
{*********************************************************************}

implementation
uses
     ThreshNrnO,LIFNrnO,CondBasedO;


procedure CreateNeuronByTypeO(NP :NeuronProperties; var ANrn :TNeuron);
begin
  { Create Object-Neuron }
  IF       NP.IfLIF=1      THEN  ANrn:=TLIFNrn.Create(NP)
  ELSE IF  NP.IfThrModel=1 THEN  ANrn:=TThreshNrn.Create(NP)
  ELSE                           ANrn:=TCondBasedNrn.Create(NP);
  { Set Parameters }
  ANrn.NP:=NP;
end;
{
                         ______________
                        |              |
                        |              |
                        |   TNeuron    |
                        |      in      |
                        |   NeuronO    |
                       /|              |
                     /  |______________|
                   /                  \
    _____________/_     ____________   \ _________
   |               |   |            |   |         |
   | TCondBasedNrn |___| TThreshNrn |   | TLIFNrn |
   | CondBasedO    |   | ThreshNrnO |   | LIFNrnO |
   |_______________|   |____________|   |_________|
           |                                                                                                                       
         __|_____________________________________________________________________________________________________________________________
  ______|______   ______|_____   ______|___   ______|___   ______|____   ______|____   ______|___   ______|_______   ______|_____   _____|___
 |             | |            | |          | |          | |           | |           | |          | |              | |            | |          |
 | HH_PassiveO | | HH_CalmarO | | HH_DestO | | HH_LyleO | | HH_migliO | |HH_CumminsO| | HH_ChowO | | HH_NaundorfO | | HH_WhiteO  | | HH_ShuO  |
 |_____________| |____________| |__________| |__________| |___________| |___________| |__________| |______________| |____________| |__________|

   TNullChannel    TCalmarNa     TCalmarNa     TLyleNa      TMigliNa      TCumNa        TChowNa      TNaundorfNa      TWhiteNa        TShuNa
                   TCalmarK      TDestexheK    TLyleK       TMigliK       TCumK         TChowK       TChowK           TWhiteK         TShuNaR
                                               TLyleKA                    TCumKA                                      TWhiteAHP       TShuK
   TLyleKM                       TDestexheKM   TLyleKM                                                                TWhiteCa
                                               TLyleKD                    TCumKD
                                               TLyleH
                   TCalmarNaR    TCalmarNaR    TLyleNaR     TCalmarNaR    TCumNaR
   TAHP            TAHP          TAHP          TAHP                       TAHP
                                                                          TCumCaH
                                 TDestexheCaT                             TCumCaT
                                 TKepecsKCa
}

end.

