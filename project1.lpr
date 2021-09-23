{Programa para el etiquetado gramatical de las palabras de una oración, usando reglas
gramaticales y estadística.
                                                  .
                                             Creado por Tito Hinstroza: 20/09/2021
}
program Gramare;
uses crt, Classes, fgl, SysUtils,
     Gramatica_def, grVerbo, grPreposicion, grArticulo, grPosesivo, grPronombre;
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
    epalPronomb,  //Pronombre personal
    //epalSustant,  //Sustantivo
    epalArtic,    //Artículo
    epalPrepos,   //Preposición
    epalPoses,    //Posesivo
    epalVerbo     //Verbo
  );
  //Signo de puntuación al final de la palabra
  TSignPunt = (
    spuNinguno,   //Ningún signo encontrado
    spuComa,      //Coma
    spuPtoComa    //Punto y coma
  );

  { TEtiquet }
  //Etiqueta de palabra
  TEtiquet = object
    tipo: TEtiqPal;    //Tipo de etiqueta.
    ptos: byte;        //Puntuación de etiqueta (certeza).
    function info: string;
  end;
  TEtiquets = array[0..6] of TEtiquet;  //Solo se espera hasta 6 etiquetas.

  { TPalabra }
  {Modela a una palabra.}
  TPalabra = class
    txt      : string;    //Texto de la palabra.
    txtM     : string;    //Texto en mayúscula
    puntuac  : TSignPunt; //Signo de puntuacíon al final de la palabra.
    procedure setText(txt0: string);
    function info: string;
  public  //Manejo de etiquetas
    etiqFinal: TEtiquet;  //Tipo final de palabra.
    etiquetas : TEtiquets; //Lista de etiquetas identificadas
    netiqs   : byte;      //Número de etiquetas
    procedure agregarEtiq(tipo: TEtiqPal; ptos: byte);  //Agrega una etiqueta
  //public
  //  constructor Create;
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

{ TEtiquet }
function TEtiquet.info: string;
begin
  case tipo of
  epalDescon : Result := '???';
  epalPronomb: Result := 'Pron. pers.';
  //epalSustant: Result := 'Sustantivo ';
  epalArtic  : Result := 'Artículo';
  epalPrepos : Result := 'Preposición';
  epalPoses  : Result := 'Posesivo';
  epalVerbo  : Result := 'Verbo';
  else
    Result := '<error>';
  end;
end;

{ TPalabra }
procedure TPalabra.setText(txt0: string);
{Asigna un valor de texto al objeto.}
begin
  txt := txt0;
  txtM := UpCase(txt);
  etiqFinal.tipo := epalDescon;
  etiqFinal.ptos := 0;
end;

function TPalabra.info: string;
{Muestra información sobre la palabra.}
var
  txtAnchoFijo: String;
  txtEtiquets: string;
  i: Integer;
begin
  //Trata de fijar un ancho mínimo al texto
  if length(txt)<10 then txtAnchoFijo := txt + space(10-length(txt));
  //Construye lista etiquetas
  txtEtiquets := '';
  for i:=0 to netiqs-1 do begin
    if i=0 then txtEtiquets := etiquetas[i].info
    else txtEtiquets += ', ' + etiquetas[i].info;
  end;
  Result := '"' + txtAnchoFijo + '" -->' + txtEtiquets; // etiqFinal.info;
end;

procedure TPalabra.agregarEtiq(tipo: TEtiqPal; ptos: byte);
begin
  etiquetas[netiqs].tipo := tipo;
  etiquetas[netiqs].ptos := ptos;
  inc(netiqs);
end;

// Programa principal
var
  orac: String;
  palabras: TPalabras;
  pal: TPalabra;
  pronInfo: TpronInfo;
  posesInfo: TPosesInfo;
  articInfo: TArticInfo;

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
     if esArticulo(pal.txtM , articInfo) then pal.agregarEtiq(epalArtic, 1);
     if esPronombre(pal.txtM, pronInfo)  then pal.agregarEtiq(epalPronomb, 1);
     if esPosesivo(pal.txtM , posesInfo) then pal.agregarEtiq(epalPoses, 1);
     if esPreposicion(pal.txtM)          then pal.agregarEtiq(epalPrepos, 1);
     writeln( Utf8ToAnsi(pal.info) );
   end;
   writeln('');
   ReadLn;
   palabras.Destroy;
end.

