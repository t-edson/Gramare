{Unidad que implementa la identificación de preposiciones en español.
                                                  .
                                             Creado por Tito Hinostroza: 21/09/2021
}
unit grPreposicion;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils;
const
  lstProposiciones: array of string = (
    'A',
    'ANTE',
    'BAJO',
    'CABE',
    'CON',
    'CONTRA',
    'DE',
    'DESDE',
    'DURANTE',
    'EN',
    'ENTRE',
    'HACIA',
    'HASTA',
    'MEDIANTE',
    'PARA',
    'POR',
    'SEGÚN',
    'SIN',
    'SO',
    'SOBRE',
    'TRAS',
    'VERSUS',
    'VÍA'
  );

  function esPreposicion(cad: string): boolean;

implementation

  function esPreposicion(cad: string): boolean;
  {Verifica si la palabra dada corresponde a una preposición. La palabra de búsqueda
  debe darse en mayúscula.}
  var
    i: Integer;
  begin
    for i:=low(lstProposiciones) to high(lstProposiciones) do begin
      if cad = lstProposiciones[i] then exit(true);
    end;
    exit(false);
  end;
end.

