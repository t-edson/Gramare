{Unidad que implementa la identificación de pronombres personales en español.
Basado en: https://espanol.lingolia.com/es/gramatica/pronombres-y-determinantes/pronombres-personales
                                             Creado por Tito Hinostroza: 22/09/2021
}
unit grPronombre;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Gramatica_def;
type
  //Estructura con información sobr eel pronombre personal
  TPronInfo = object
    num      : TNumero;  //Número del pronombre
    pers     : TPersona; //Persona del pronombre
    esSujeto : boolean;  //Indica que el pronombre es de tipo Sujeto
    esCompDir: boolean;  //Indica que el pronombre es de tipo Complemento Directo
    esCompInd: boolean;  //Indica que el pronombre es de tipo Complemento Indirecto
    esPrepos : boolean;  //Indica que el pronombre es de tipo Preposicional.
  end;

  function esPronombre(cad: string; out info: TpronInfo): boolean;

implementation

function esPronombre(cad: string; out info: TpronInfo): boolean;
{Determina si la palabra "cad" es una pronombre personal. De ser así, devuelve TRUE.
En "info" se devuelve información sobre el pronombre.
}
begin
  info.esSujeto := false;
  info.esCompDir := false;
  info.esCompInd := false;
  info.esPrepos := false;
  case cad of
  /////// Pronombre Sujeto
  'YO'       : begin
    info.num := numSingu; info.pers := per1; info.esSujeto:=true; exit(true); end;
  'TÚ','USTED', 'VOS': begin  //Por alguna razón 'USTED' se considera 3ra persona en algunas páginas.
    info.num := numSingu; info.pers := per2; info.esSujeto:=true; info.esPrepos := true; exit(true); end;
  'ÉL','ELLA': begin
    info.num := numSingu; info.pers := per3; info.esSujeto:=true; info.esPrepos := true; exit(true); end;

  'NOSOTROS','NOSOTRAS' : begin
    info.num := numPlural; info.pers := per1; info.esSujeto:=true; info.esPrepos := true; exit(true); end;
  'VOSOTROS','VOSOTRAS','USTEDES' : begin
    info.num := numPlural; info.pers := per2; info.esSujeto:=true; info.esPrepos := true; exit(true); end;
  'ELLOS','ELLAS':begin
    info.num := numPlural; info.pers := per3; info.esSujeto:=true; info.esPrepos := true; exit(true); end;

  /////// Pronombre Complemento directo
  'ME'       : begin
    info.num := numSingu; info.pers := per1; info.esCompDir:=true; info.esCompInd:=true; exit(true); end;
  'TE'       : begin
    info.num := numSingu; info.pers := per2; info.esCompDir:=true; info.esCompInd:=true; exit(true); end;
  'LO','LA' : begin
    info.num := numSingu; info.pers := per3; info.esCompDir:=true; exit(true); end;

  'NOS' : begin
    info.num := numPlural; info.pers := per1; info.esCompDir:=true; info.esCompInd:=true; exit(true); end;
  'OS'  : begin
    info.num := numPlural; info.pers := per2; info.esCompDir:=true; info.esCompInd:=true; exit(true); end;
  'LOS','LAS':begin
    info.num := numPlural; info.pers := per3; info.esCompDir:=true; exit(true); end;

  /////// Pronombre Complemento indirecto
  //'ME'       : begin
  //  info.num := numSingu; info.pers := per1; info.esCompInd:=true; exit(true); end;
  //'TE'       : begin
  //  info.num := numSingu; info.pers := per2; info.esCompInd:=true; exit(true); end;
  'LE' : begin
    info.num := numSingu; info.pers := per3; info.esCompInd:=true; exit(true); end;

  //'NOS' : begin
  //  info.num := numPlural; info.pers := per1; info.esCompInd:=true; exit(true); end;
  //'OS'  : begin
  //  info.num := numPlural; info.pers := per2; info.esCompInd:=true; exit(true); end;
  'LES':begin
    info.num := numPlural; info.pers := per3; info.esCompInd:=true; exit(true); end;
  'SE':begin
    info.num := numIndef; info.pers := per3; info.esCompInd:=true; exit(true); end;

  /////// Pronombre Preposicional
  'MI'       : begin
    info.num := numSingu; info.pers := per1; info.esPrepos:=true; exit(true); end;
  'TI'{, 'USTED'}: begin  //Por alguna razón 'USTED' se considera 3ra persona en algunas páginas.
    info.num := numSingu; info.pers := per2; info.esPrepos:=true; exit(true); end;
  //'ÉL','ELLA': begin
  //  info.num := numSingu; info.pers := per3; info.esPrepos:=true; exit(true); end;

  //'NOSOTROS','NOSOTRAS' : begin
  //  info.num := numPlural; info.pers := per1; info.esPrepos:=true; exit(true); end;
  //'VOSOTROS','VOSOTRAS','USTEDES' : begin
  //  info.num := numPlural; info.pers := per2; info.esPrepos:=true; exit(true); end;
  //'ELLOS','ELLAS':begin
  //  info.num := numPlural; info.pers := per3; info.esPrepos:=true; exit(true); end;

  else exit(false);
  end
  {Notar que no se considera las contracciones preposición+artículo: "al" "del"}
end;

end.

