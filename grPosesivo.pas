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

  function esPosesivo(cad: string; out info: TPosesInfo): boolean;

implementation

function esPosesivo(cad: string; out info: TPosesInfo): boolean;
{Determina si la palabra "cad" es un posesivo. De ser así, devuelve TRUE.
En "num1" y "pers1" se devuelve el número y género del artículo.
En "numArt" se devuelve el número del artículo.
}
begin
  case cad of
  'MI'     : begin
    info.num1 := numSingu ; info.pers1 := per1; info.num2 := numSingu; exit(true); end;
  'TU'     : begin
    info.num1 := numSingu ; info.pers1 := per2; info.num2 := numSingu; exit(true); end;
  'SU'     : begin  //También aplica al plural
    info.num1 := numIndef ; info.pers1 := per3; info.num2 := numSingu; exit(true); end;
  'NUESTRO': begin
    info.num1 := numPlural; info.pers1 := per1; info.num2 := numSingu; exit(true); end;
  'NUESTRA': begin   //También se debería consdierar género de lo que se posee.
    info.num1 := numPlural; info.pers1 := per1; info.num2 := numSingu; exit(true); end;
  'VUESTRO': begin
    info.num1 := numPlural; info.pers1 := per2; info.num2 := numSingu; exit(true); end;
  'VUESTRA': begin
    info.num1 := numPlural; info.pers1 := per2; info.num2 := numSingu; exit(true); end;
  //'SU'     : begin info.num1 := numPlural; info.pers1 := per3; info.num2 := numSingu; exit(true); end;

  'MIS'     : begin
    info.num1 := numSingu ; info.pers1 := per1; info.num2 := numPlural; exit(true); end;
  'TUS'     : begin
    info.num1 := numSingu ; info.pers1 := per2; info.num2 := numPlural; exit(true); end;
  'SUS'     : begin  //También aplica al plural
    info.num1 := numIndef; info.pers1 := per3; info.num2 := numPlural; exit(true); end;
  'NUESTROS': begin
    info.num1 := numPlural; info.pers1 := per1; info.num2 := numPlural; exit(true); end;
  'NUESTRAS': begin
    info.num1 := numPlural; info.pers1 := per1; info.num2 := numPlural; exit(true); end;
  'VUESTROS': begin
    info.num1 := numPlural; info.pers1 := per2; info.num2 := numPlural; exit(true); end;
  'VUESTRAS': begin
    info.num1 := numPlural; info.pers1 := per2; info.num2 := numPlural; exit(true); end;
  //'SUS'     : begin info.num1 := numPlural; info.pers1 := per3; info.num2 := numPlural; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

