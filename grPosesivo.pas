{Unidad que implementa la identificación de posesivos en español.
Basado en: https://espanol.lingolia.com/es/gramatica/pronombres-y-determinantes/posesivos
                                             Creado por Tito Hinostroza: 21/09/2021
}
unit grPosesivo;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Gramatica_def;
type
  TPosesInfo = object
    num1      : TNumero;  //Número del que posee.
    pers1     : TPersona; //Persona del que posee.
    num2      : Tnumero;  //Número de lo que posee.
  end;

  function esPosesivo(cad: string; out posesInfo: TPosesInfo): boolean;

implementation

function esPosesivo(cad: string; out posesInfo: TPosesInfo): boolean;
{Determina si la palabra "cad" es un posesivo. De ser así, devuelve TRUE.
En "num1" y "pers1" se devuelve el número y género del artículo.
En "numArt" se devuelve el número del artículo.
}
begin
  case cad of
  'MI'     : begin
    posesInfo.num1 := numSingu ; posesInfo.pers1 := per1; posesInfo.num2 := numSingu; exit(true); end;
  'TU'     : begin
    posesInfo.num1 := numSingu ; posesInfo.pers1 := per2; posesInfo.num2 := numSingu; exit(true); end;
  'SU'     : begin  //También aplica al plural
    posesInfo.num1 := numIndef ; posesInfo.pers1 := per3; posesInfo.num2 := numSingu; exit(true); end;
  'NUESTRO': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per1; posesInfo.num2 := numSingu; exit(true); end;
  'NUESTRA': begin   //También se debería consdierar género de lo que se posee.
    posesInfo.num1 := numPlural; posesInfo.pers1 := per1; posesInfo.num2 := numSingu; exit(true); end;
  'VUESTRO': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per2; posesInfo.num2 := numSingu; exit(true); end;
  'VUESTRA': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per2; posesInfo.num2 := numSingu; exit(true); end;
  //'SU'     : begin posesInfo.num1 := numPlural; posesInfo.pers1 := per3; posesInfo.num2 := numSingu; exit(true); end;

  'MIS'     : begin
    posesInfo.num1 := numSingu ; posesInfo.pers1 := per1; posesInfo.num2 := numPlural; exit(true); end;
  'TUS'     : begin
    posesInfo.num1 := numSingu ; posesInfo.pers1 := per2; posesInfo.num2 := numPlural; exit(true); end;
  'SUS'     : begin  //También aplica al plural
    posesInfo.num1 := numIndef; posesInfo.pers1 := per3; posesInfo.num2 := numPlural; exit(true); end;
  'NUESTROS': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per1; posesInfo.num2 := numPlural; exit(true); end;
  'NUESTRAS': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per1; posesInfo.num2 := numPlural; exit(true); end;
  'VUESTROS': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per2; posesInfo.num2 := numPlural; exit(true); end;
  'VUESTRAS': begin
    posesInfo.num1 := numPlural; posesInfo.pers1 := per2; posesInfo.num2 := numPlural; exit(true); end;
  //'SUS'     : begin posesInfo.num1 := numPlural; posesInfo.pers1 := per3; posesInfo.num2 := numPlural; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

