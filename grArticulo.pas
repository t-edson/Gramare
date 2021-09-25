{Unidad que implementa la identificación de artículos en español.

                                             Creado por Tito Hinstroza: 21/09/2021
}
unit grArticulo;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Gramatica_def;
type
//Estructura con información sobr eel pronombre personal
TArticInfo = object
  gen      : TGenero;
  num      : TNumero;  //Número del pronombre
end;

function esArticulo(cad: string; out info: TArticInfo): boolean;

implementation

function esArticulo(cad: string; out info: TArticInfo): boolean;
{Determina si la palabra "cad" es una artículo. De ser así, devuelve TRUE.
En "genArt" se devuelve el género del artículo.
En "numArt" se devuelve el número del artículo.
}
begin
  case cad of
  'EL'       : begin info.gen := genMascul; info.num:= numSingu; exit(true); end;
  'LA'       : begin info.gen := genFemen ; info.num:= numSingu; exit(true); end;
  'LO'       : begin info.gen := genNeutro; info.num:= numSingu; exit(true); end;
  'LOS'      : begin info.gen := genMascul; info.num:= numPlural; exit(true); end;
  'LAS'      : begin info.gen := genFemen ; info.num:= numPlural; exit(true); end;
  'UN', 'UNO': begin info.gen := genMascul; info.num:= numSingu; exit(true); end;
  'UNA'      : begin info.gen := genFemen ; info.num:= numSingu; exit(true); end;
  'UNOS'     : begin info.gen := genMascul; info.num:= numPlural; exit(true); end;
  'UNAS'     : begin info.gen := genFemen ; info.num:= numPlural; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

