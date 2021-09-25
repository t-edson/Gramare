{Unidad que implementa la identificación de verbos en español mediante reglas
gramaticales.
                                                  .
                                             Creado por Tito Hinstroza: 20/09/2021
}
unit grVerbo;
{$mode objfpc}{$H+}
interface
uses
    Classes, SysUtils, crt, Conjugaro;
const
  {Terminación de todos los verbos regulares, incluidos los de la primera, segunda y
  tercera conjugación.}
  terminVerbos : array[1..107] of cad10=
     (
    'Ó', 'A',    'ABA',
    'ABAIS',    'ÁBAMOS',
    'ABAN',    'ABAS',
    'AD',    'ADO',
    'ÁIS',    'AMOS',
    'AN',    'ANDO',
    'AR',    'ARA',
    'ARÁ',    'ARAIS',
    'ÁRAMOS',    'ARAN',
    'ARÁN',    'ARAS',
    'ARÁS',    'ARE',
    'ARÉ',    'AREIS',
    'ARÉIS',    'AREMOS',
    'ÁREMOS',    'AREN',
    'ARES',    'ARÍA',
    'ARÍAIS',    'ARÍAMOS',
    'ARÍAN',    'ARÍAS',
    'ARON',    'AS',
    'ASE',    'ASEIS',
    'ÁSEMOS',    'ASEN',
    'ASES',    'ASTE',
    'ASTEIS',    'E',
    'É',    'ED',
    'ÉIS',    'EMOS',
    'EN',    'ENTE',
    'ER',    'ERÁ',
    'ERÁN',    'ERÁS',
    'ERÉ',    'ERÉIS',
    'EREMOS',    'ERÍA',
    'ERÍAIS',    'ERÍAMOS',
    'ERÍAN',    'ERÍAS',
    'ES',    'Í',
    'ÍA',    'ÍAIS',
    'ÍAMOS',    'ÍAN',
    'ÍAS',    'ID',
    'IDO',    'IENDO',
    'IERA',    'IERAIS',
    'IÉRAMOS',    'IERAN',
    'IERAS',    'IERE',
    'IEREIS',    'IÉREMOS',
    'IEREN',    'IERES',
    'IERON',    'IESE',
    'IESEIS',    'IÉSEMOS',
    'IESEN',    'IESES',
    'IMOS',    'IÓ',
    'IR',    'IRÁ',
    'IRÁN',    'IRÁS',
    'IRÉ',    'IRÉIS',
    'IREMOS',    'IRÍA',
    'IRÍAIS',    'IRÍAMOS',
    'IRÍAN',    'IRÍAS',
    'ÍS',    'ISTE',
    'ISTEIS',    'O');

type
  //Modos verbales.
  TModoVerb = (
    modIndicat,   //Modo indicativo
    modSubjunt,   //Modo subjuntivo
    modImperat    //Modo imperativo
  );

var
    palabra : array[1..20] of cad10;
    oracion : string ;

    function EsVerboTerm(cad: string): boolean;

implementation

function esVerboTerm(cad: string): boolean;
{Determina si una palabra dada, puede ser un verbo, considerando su terminación.}
var
  term: cad10;
  i, lcad: Integer;
  fin_cad: String;
begin
  lcad := length(cad);
  for i := low(terminVerbos) to high(terminVerbos) do begin
    term := terminVerbos[i];
    if lcad < length(term)+1 then exit(false);  //Palabra muy corta para la terminación.
    fin_cad := copy(cad, lcad-length(term)+1);
    if fin_cad = term then exit(true);
  end;
  exit(false);
end;

end.

