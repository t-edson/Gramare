{Unidad que implementa la identificación de preposiciones en español.
                                                  .
                                             Creado por Tito Hinostroza: 21/09/2021
}
unit grSustantivo;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils;
const
  //Se carga un diccionario de sustantivos obtenidos del corpus: //https://repositori.upf.edu/handle/10230/20048
  lstSustantivos: array of
    string = ({$include dic_sustantivos.txt});

  function esSustantivo(cad: string): boolean;

implementation

function esSustantivo(cad: string): boolean;
{Verifica si la palabra dada corresponde a una preposición. La palabra de búsqueda
debe darse en mayúscula.}
var
  i: Integer;
  sust, plural, ultcar2, plural2: String;
  ultcar: char;
begin
  for i:=low(lstSustantivos) to high(lstSustantivos) do begin
    sust := lstSustantivos[i];
//    sust := 'TÚ';
    ultcar := sust[length(sust)];  //Caracter simple
    ultcar2 := copy(sust, length(sust)-1, 2);  //Caracter con tilde
    if ultcar in ['A','E','I','O','U' ] then begin
      plural := sust + 'S'
    end else if (ultcar2= 'Á') or (ultcar2='É') or (ultcar2='Ó') then begin
      plural := sust + 'S'
    end else if (ultcar2='Í') or (ultcar2='Ú') then begin
      plural := sust + 'S';
      plural2 := sust + 'ES';  //Segunda forma del plural
    end else  //Debe terminar en consonante
      plural := 'ES';
    if (cad = sust) or (cad = plural) or (cad = plural2) then exit(true);
  end;
  exit(false);
end;

end.

