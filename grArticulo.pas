{Unidad que implementa la identificación de artículos en español.

                                             Creado por Tito Hinstroza: 21/09/2021
}
unit grArticulo;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Gramatica_def;

function esArticulo(cad: string;
  out genArt: TGenero; out numArt: TNumero): boolean;

implementation

function esArticulo(cad: string;
  out genArt: TGenero; out numArt: TNumero): boolean;
{Determina si la palabra "cad" es una artículo. De ser así, devuelve TRUE.
En "genArt" se devuelve el género del artículo.
En "numArt" se devuelve el número del artículo.
}
begin
  case cad of
  'EL'       : begin genArt := genMascul; numArt := numSingu; exit(true); end;
  'LA'       : begin genArt := genFemen ; numArt := numSingu; exit(true); end;
  'LO'       : begin genArt := genNeutro; numArt := numSingu; exit(true); end;
  'LOS'      : begin genArt := genMascul; numArt := numPlural; exit(true); end;
  'LAS'      : begin genArt := genFemen ; numArt := numPlural; exit(true); end;
  'UN', 'UNO': begin genArt := genMascul; numArt := numSingu; exit(true); end;
  'UNA'      : begin genArt := genFemen ; numArt := numSingu; exit(true); end;
  'UNOS'     : begin genArt := genMascul; numArt := numPlural; exit(true); end;
  'UNAS'     : begin genArt := genFemen ; numArt := numPlural; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

