{Programa para el etiquetado gramatical de las palabras de una oración, usando reglas
gramaticales y estadística.
                                                  .
                                             Creado por Tito Hinstroza: 20/09/2021
}
program Gramare;
uses crt, Classes, fgl, SysUtils,
     grVerbo, grPreposicion, grArticulo;
const
  oraciones: array[1..8] of string = (
    'Mi abuela me cocinó fideos con estofado.',
    'El sol saldrá a las 6.30 de la mañana.',
    'Damián se cortó el pelo.',
    'Mi tía fue al supermercado en el auto.',
    'Me compré una bicicleta nueva.',
    'Tengo turno con el dentista a las 18 h.',
    'Mañana tenemos el campamento.',
    'El intendente fue reelecto ayer.'
  );
type
  //Tipos de palabra.
  TEtiqPal = (
    epalDescon,   //Desconocido
    epalSustant,  //Sustantivo
    epalArtic,    //Artículo
    epalPrepos,   //Preposición
    epalVerbo     //Verbo
  );
  //Signo de puntuación al final de la palabra
  TSignPunt = (
    spuNinguno,   //Ningún signo encontrado
    spuComa,      //Coma
    spuPtoComa    //Punto y coma
  );
  {Modela a una palabra.}

  { TPalabra }
  TPalabra = class
    txt : string;    //Texto de la palabra.
    txtM: string;    //Texto en mayúscula
    punt: TSignPunt; //Signo de puntuacíon al final de la palabra.
    etiq: TEtiqPal;  //Tipo de palabra.
    procedure setText(txt0: string);
    function info: string;
  end;

  TPalabras = specialize TFPGObjectList<TPalabra>;

Procedure Descomponer(cad:string; var lstPal: TPalabras);
{Descompone una cadena en lstPal}
var
  l  : word;
  pal: TPalabra;
begin
   //Prepara "cad"
   cad := trim(cad);
   cad := StringReplace(cad, #9, #32, [rfReplaceAll]);
   lstPal.Clear;
   l := 1;
   l := pos(' ', cad);
   while l<>0 do begin
     pal := TPalabra.Create;
     pal.setText( copy(cad, 1, l-1) );
     lstPal.Add(pal);
     delete(cad, 1, l);
     cad := trimleft(cad);
     l := pos(' ',cad);
   end;
   pal := TPalabra.Create;
   pal.setText( cad );
   lstPal.Add(pal);
end;

{******************Programa Principal********************}
var
  orac: String;
  i: Integer;
  palabras: TPalabras;
  pal: TPalabra;

{ TPalabra }
procedure TPalabra.setText(txt0: string);
{Asigna un valor de texto al objeto.}
begin
  txt := txt0;
  txtM := UpCase(txt);
  etiq := epalDescon
end;

function TPalabra.info: string;
{Muestra información sobre la palabra.}
var
  etiq_str: String;
begin
  case etiq of
  epalDescon : etiq_str := 'Desconocido';
  epalSustant: etiq_str := 'Sustantivo';
  epalArtic  : etiq_str := 'Artículo';
  epalPrepos : etiq_str := 'Preposición';
  epalVerbo  : etiq_str := 'Verbo';
  end;
  Result := '"' + txt + '" -->' + etiq_str;
end;

begin
   clrscr;
   palabras := TPalabras.Create(True);
   writeln('Analizando oraciones.');
   //for i:= low(oraciones) to high(oraciones) do begin
   orac := oraciones[1];
   writeln('> ' + Utf8ToAnsi(orac) );
   Descomponer(orac, palabras);
   for pal in palabras do begin
     //write( Utf8ToAnsi(pal.txt) + ',');
     if esPreposicion(pal.txtM) then pal.etiq := epalPrepos;
     writeln(pal.info);
   end;
   writeln('');
   ReadLn;
   palabras.Destroy;
end.

