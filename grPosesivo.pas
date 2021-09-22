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

  function esPosesivo(cad: string;
    out num1: TNumero; out pers1: TPersona;  //Número y persoan del que posee.
    out num2: Tnumero                        //Número de lo que se posee.
    ): boolean;

implementation

function esPosesivo(cad: string;
  out num1: TNumero; out pers1: TPersona;
  out num2: Tnumero                        //Número de lo que se posee.
  ): boolean;
{Determina si la palabra "cad" es un posesivo. De ser así, devuelve TRUE.
En "num1" y "pers1" se devuelve el número y género del artículo.
En "numArt" se devuelve el número del artículo.
}
begin
  case cad of
  'MI'     : begin
    num1 := numSingu ; pers1 := per1; num2 := numSingu; exit(true); end;
  'TU'     : begin
    num1 := numSingu ; pers1 := per2; num2 := numSingu; exit(true); end;
  'SU'     : begin  //También aplica al plural
    num1 := numIndef ; pers1 := per3; num2 := numSingu; exit(true); end;
  'NUESTRO': begin
    num1 := numPlural; pers1 := per1; num2 := numSingu; exit(true); end;
  'NUESTRA': begin   //También se debería consdierar género de lo que se posee.
    num1 := numPlural; pers1 := per1; num2 := numSingu; exit(true); end;
  'VUESTRO': begin
    num1 := numPlural; pers1 := per2; num2 := numSingu; exit(true); end;
  'VUESTRA': begin
    num1 := numPlural; pers1 := per2; num2 := numSingu; exit(true); end;
  //'SU'     : begin num1 := numPlural; pers1 := per3; num2 := numSingu; exit(true); end;

  'MIS'     : begin
    num1 := numSingu ; pers1 := per1; num2 := numPlural; exit(true); end;
  'TUS'     : begin
    num1 := numSingu ; pers1 := per2; num2 := numPlural; exit(true); end;
  'SUS'     : begin  //También aplica al plural
    num1 := numIndef; pers1 := per3; num2 := numPlural; exit(true); end;
  'NUESTROS': begin
    num1 := numPlural; pers1 := per1; num2 := numPlural; exit(true); end;
  'NUESTRAS': begin
    num1 := numPlural; pers1 := per1; num2 := numPlural; exit(true); end;
  'VUESTROS': begin
    num1 := numPlural; pers1 := per2; num2 := numPlural; exit(true); end;
  'VUESTRAS': begin
    num1 := numPlural; pers1 := per2; num2 := numPlural; exit(true); end;
  //'SUS'     : begin num1 := numPlural; pers1 := per3; num2 := numPlural; exit(true); end;
  else exit(false);;
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

