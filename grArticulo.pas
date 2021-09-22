{Unidad que implementa la identificación de artículos en español.

                                             Creado por Tito Hinstroza: 21/09/2021
}
unit grArticulo;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils;
type
  //Género del artículo
  TGenArticulo = (
    genArtMascul,  //Masculino
    genArtFemen ,  //Femenino
    genArtNeutro   //Neutro
  );
  //Número del artículo
  TNumArticulo = (
    numArtSingu,  //Singular
    numArtPlur    //Plural
  );

implementation

function esArticulo(cad: string;
  out genArt: TGenArticulo; out numArt: TNumArticulo): boolean;
{Determina si la palabra "cad" es una artículo. De ser así, devuelve TRUE.
En "genArt" se devuelve el género del artículo.
En "numArt" se devuelve el número del artículo.
}
var
  c: String;
begin
  c := UpCase(cad);
  case c of
  'EL'       : begin genArt := genArtMascul; numArt := numArtSingu; exit(true); end;
  'LA'       : begin genArt := genArtFemen ; numArt := numArtSingu; exit(true); end;
  'LO'       : begin genArt := genArtNeutro; numArt := numArtSingu; exit(true); end;
  'LOS'      : begin genArt := genArtMascul; numArt := numArtPlur ; exit(true); end;
  'LAS'      : begin genArt := genArtFemen ; numArt := numArtPlur ; exit(true); end;
  'UN', 'UNO': begin genArt := genArtMascul; numArt := numArtSingu; exit(true); end;
  'UNA'      : begin genArt := genArtFemen ; numArt := numArtSingu; exit(true); end;
  'UNOS'     : begin genArt := genArtMascul; numArt := numArtPlur ; exit(true); end;
  'UNAS'     : begin genArt := genArtFemen ; numArt := numArtPlur ; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

