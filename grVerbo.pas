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
     ter1 : array[1..3,1..5] of string[4]=
              (('é‚','aste','o','amos','aron'),
              ('o','as','a','amos','an'),
              ('e','as',' ','emos','an'));
     ter2 : array[1..3,1..5] of string[5]=
              (('i','iste', 'i¢','imos','ieron'),
              ('o','es','e','emos','en'),
              ('‚',' s',' ','emos',' n'));
     ter3 : array[1..3,1..5] of string[5]=
              (('','iste','i¢','imos','ieron'),
              ('o','es','e','imos','en'),
              ('‚',' s',' ','emos',' n'));
     verb1 : array[1..10] of string[10] =  {verbos de primera terminacion}
              ('copi','borr','busc','clasific','ingres',
               'analiz','llam','enseñ','ayud','interactu');
     verb2 : array[1..1] of string[10] =    {verbos de segunda terminacion}
              ('met');
     verb3 : array[1..1] of string[10] =    {verbos de tercera terminacion}
              ('viv');

type
  //Modos verbales.
  TModoVerb = (
    modIndicat,   //Modo indicativo
    modSubjunt,   //Modo subjuntivo
    modImperat    //Modo imperativo
  );
const
    pasad = 1;
    prese = 2;
    futur = 3;
type cad14 = string[14];
     cad10 = string[10];
     cad12 = string[12];

var
    palabra : array[1..20] of cad10;
    oracion : string ;

    function EsVerbo(a: cad12; var term, modo, tiem, per: byte): boolean;

implementation
function termVerbReg1(modo: TModoVerb): string;
{Retorna la terminación verbal para un verbo regular de la primera terminación, como
por ejemplo "Cantar".
Las termianciones a devolver dependerán del modo verbal}
begin
  case modo of
       modIndicat: ;
       modSubjunt: ;
       modImperat: ;
  end;

end;

function EnVerbo(v:string ;VAR ter,n:byte):boolean;
var t:byte;
begin n:=1;
  EnVerbo:=false;
  repeat
    if v=verb1[n] then
      begin EnVerbo:=true;ter:=1;end;
    n:=n+1
  until n=10;
end;

Procedure Conjugar(var v: cad12; modo: TModoVerb; tie, per : byte );
var
   raiz : string [10];
   morfema : string [2];
   term : string [6];
begin
   morfema := copy(v,length(v)-1,2);
   raiz:= copy(v,1,length(v)-2);
   if per=6 then per:=5;
   if modo=modIndicat then
      begin
        if morfema = 'ar' then term := ter1[tie,per];
        if morfema = 'er' then term := ter2[tie,per];
        if morfema = 'ir' then term := ter3[tie,per];
        if tie = futur then term := morfema + term;
        v := raiz + term;
      end;
   if modo = modImperat then
      begin
        if morfema = 'ar' then  case per of 2 : v:=raiz + 'a';
                                            5 : v:=raiz + 'en'; end ;
        if morfema = 'er' then  case per of 2 : v:=raiz + 'e';
                                            5 : v:=raiz + 'an'; end ;
        if morfema = 'ir' then  case per of 2 : v:=raiz + 'e';
                                            5 : v:=raiz + 'an'; end ;
      end;
end;

function EsVerbo(a: cad12; var term, modo, tiem, per: byte): boolean;
var
  b,c,d:cad12;
  t,p,n:byte;
begin
  b:=a;
  Result := false;
  repeat b:=copy(b, 1, length(b)-1);
     if EnVerbo(b, term, n) then begin
        case term of
             1 : c:=b + 'ar';
             2 : c:=b + 'er';
             3 : c:=b + 'ir';
        end;
        for t:=1 to 3 do for p := 1 to 6 do begin
            d:=c;Conjugar(d, modIndicat,t,p);
            writeln(d); delay(100);
            if d = a then begin
              modo:=1;tiem:=t;per:=p;Result:=true
            end;
        end;
        for t:=1 to 3 do for p := 1 to 6 do begin
            d:=c;Conjugar(d, modImperat,t,p) ;writeln(d);delay(100);
            if d = a then begin
              modo:=3;tiem:=t;per:=p;Result:=true
            end;
        end;
     end;
  until length (b)<=2;
end;

end.

