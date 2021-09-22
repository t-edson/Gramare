{Librería con funciones para la conjugación de verbos en español. De momento
solo se soportan las conjugaciones de verbos regulares.
No se consideran todas las variaciones de los verbos. Por ejemplo, solo se
considera la conjugación de una de las formas para el plural de la segunda
persona (ustedes o vosotros).
                             Creado por Tito Hinostroza: 20/09/2021
}
unit Conjugaro;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Gramatica_def;

type
   cad10 = string[10];
   cad12 = string[12];
   cad14 = string[14];

  function nombreTiempo(tpo: TTpoVerb): string;
  procedure termVerbReg1(modo: TModoVerb; tiempo: TTpoVerb; persona: TPersonaNum;
                        negat: boolean; out aux, term: cad12);
  Procedure Conjugar(var verbo: string; modo: TModoVerb; tie: TTpoVerb; per: TPersonaNum);

implementation
function nombreTiempo(tpo: TTpoVerb): string;
{Devuelve una cadena con el nombre del tiempo verbal.}
begin
  case tpo of
  tpoPresente   : exit('Presente');
  tpoPretImper  : exit('Pretérito imperfecto');
  tpoPretPerfSim: exit('Pretérito perfecto simple');
  tpoFuturSim   : exit('Futuro simple');
  tpoCondSim    : exit('Condicional simple');
  tpoPretPerfCom: exit('Pretérito perfecto compuesto');
  tpoPretPluscua: exit('Pretérito pluscuamperfecto');
  tpoPretAnt    : exit('Pretérito anterior');
  tpoFuturPerf  : exit('Futuro perfecto');
  tpoCondPerf   : exit('Condicional perfecto');
  end;
end;
procedure termVerbReg1(modo: TModoVerb; tiempo: TTpoVerb; persona: TPersonaNum;
                      negat: boolean; out aux, term: cad12);
{Retorna la terminación verbal para un verbo regular de la primera terminación, como
por ejemplo "Cantar" o "Amar".
Las terminaciones a devolver dependerán del modo del tiempo y de la persona.
El parámetro "negat" solo se aplica para el modo imperativo.
La terminación (morfema) se devuelve en el parámetro "term". Si hay un auxiliar como
"haya", este se retorna en "aux";
}
begin
  aux := '';  //Por defecto
  case modo of
    modIndicat:
      case tiempo of
      //Tiempos simples
      tpoPresente:    //Presente     (amo, amas, ama, ...)
        case persona of
        per1Sing: term := 'o';   //amo
        per2Sing: term := 'as';  //amas
        per3Sing: term := 'a';
        per1Plur: term := 'amos';
        per2Plur: term := 'áis';
        per3Plur: term := 'an';
        end;
      tpoPretImper:   //Pretérito imperfecto (amaba, amabas, ...)
        case persona of
        per1Sing: term := 'aba';
        per2Sing: term := 'abas';
        per3Sing: term := 'aba';
        per1Plur: term := 'ábamos';
        per2Plur: term := 'abais';
        per3Plur: term := 'aban';
        end;
      tpoPretPerfSim: //Pretérito perfecto simple (amé, amaste, ...)
        case persona of
        per1Sing: term := 'é';
        per2Sing: term := 'aste';
        per3Sing: term := 'ó';
        per1Plur: term := 'amos';
        per2Plur: term := 'asteis';
        per3Plur: term := 'aron';
        end;
      tpoFuturSim:    //Futuro simple (amaré, amarás, )
        case persona of
        per1Sing: term := 'aré';
        per2Sing: term := 'arás';
        per3Sing: term := 'ará';
        per1Plur: term := 'aremos';
        per2Plur: term := 'aréis';
        per3Plur: term := 'arán';
        end;
      tpoCondSim:     //Condicional simple (amaría, amarías, ...)
        case persona of
        per1Sing: term := 'aría';
        per2Sing: term := 'arías';
        per3Sing: term := 'aría';
        per1Plur: term := 'aríamos';
        per2Plur: term := 'aríais';
        per3Plur: term := 'arían';
        end;
      //Tiempos compuestos
      tpoPretPerfCom: //Pretérito perfecto compuesto (he amado, has amado, ...)
        case persona of
        per1Sing: begin aux := 'he'; term := 'ado'; end;
        per2Sing: begin aux := 'has'; term := 'ado'; end;
        per3Sing: begin aux := 'ha'; term := 'ado'; end;
        per1Plur: begin aux := 'hemos'; term := 'ado'; end;
        per2Plur: begin aux := 'habéis'; term := 'ado'; end;
        per3Plur: begin aux := 'han'; term := 'ado'; end;
        end;
      tpoPretPluscua: //Pretérito pluscuamperfecto (había amado, habías amado, ...)
        case persona of
        per1Sing: begin aux := 'había'; term := 'ado'; end;
        per2Sing: begin aux := 'habías'; term := 'ado'; end;
        per3Sing: begin aux := 'había'; term := 'ado'; end;
        per1Plur: begin aux := 'habíamos'; term := 'ado'; end;
        per2Plur: begin aux := 'habíais'; term := 'ado'; end;
        per3Plur: begin aux := 'habían'; term := 'ado'; end;
        end;
      tpoPretAnt:     //Pretérito anterior (hube amado, hubiste amado, ...)
        case persona of
        per1Sing: begin aux := 'hube'; term := 'ado'; end;
        per2Sing: begin aux := 'hubiste'; term := 'ado'; end;
        per3Sing: begin aux := 'hubo'; term := 'ado'; end;
        per1Plur: begin aux := 'hubimos'; term := 'ado'; end;
        per2Plur: begin aux := 'hubisteis'; term := 'ado'; end;
        per3Plur: begin aux := 'hubieron'; term := 'ado'; end;
        end;
      tpoFuturPerf:   //Futuro perfecto (abré amado, habrás amado, ...)
        case persona of
        per1Sing: begin aux := 'habré'; term := 'ado'; end;
        per2Sing: begin aux := 'habrás'; term := 'ado'; end;
        per3Sing: begin aux := 'habrá'; term := 'ado'; end;
        per1Plur: begin aux := 'habremos'; term := 'ado'; end;
        per2Plur: begin aux := 'habréis'; term := 'ado'; end;
        per3Plur: begin aux := 'habrán'; term := 'ado'; end;
        end;
      tpoCondPerf:     //Condicional perfecto (habría amado, habrías amado, ...)
        case persona of
        per1Sing: begin aux := 'habría'; term := 'ado'; end;
        per2Sing: begin aux := 'habrías'; term := 'ado'; end;
        per3Sing: begin aux := 'habría'; term := 'ado'; end;
        per1Plur: begin aux := 'habríamos'; term := 'ado'; end;
        per2Plur: begin aux := 'habríais'; term := 'ado'; end;
        per3Plur: begin aux := 'habrían'; term := 'ado'; end;
        end;
      end;
    modSubjunt:
      case tiempo of
      //Tiempos simples
      tpoPresente:    //Presente     (amo, amas, ama, ...)
        case persona of
        per1Sing: term := 'e';   //amo
        per2Sing: term := 'es';  //amas
        per3Sing: term := 'e';
        per1Plur: term := 'emos';
        per2Plur: term := 'éis';
        per3Plur: term := 'en';
        end;
      tpoPretImper:   //Pretérito imperfecto (amaba, amabas, ...)
        case persona of  //En este tiempo se admiten dos formas, pero se toma solo una.
        per1Sing: term := 'ara';   //También puede ser "ase"
        per2Sing: term := 'aras';  //También puede ser "ases"
        per3Sing: term := 'ara';   //También puede ser  "ase"
        per1Plur: term := 'áramos'; //También puede ser
        per2Plur: term := 'arais';  //También puede ser
        per3Plur: term := 'aran';   //También puede ser
        end;
      tpoFuturSim:    //Futuro simple (amaré, amarás, )
        case persona of
        per1Sing: term := 'are';
        per2Sing: term := 'ares';
        per3Sing: term := 'are';
        per1Plur: term := 'áremos';
        per2Plur: term := 'areis';
        per3Plur: term := 'aren';
        end;
      //Tiempos compuestos
      tpoPretPerfCom: //Pretérito perfecto compuesto (he amado, has amado, ...)
        case persona of
        per1Sing: begin aux := 'haya'; term := 'ado'; end;
        per2Sing: begin aux := 'hayas'; term := 'ado'; end;
        per3Sing: begin aux := 'haya'; term := 'ado'; end;
        per1Plur: begin aux := 'hayamos'; term := 'ado'; end;
        per2Plur: begin aux := 'hayáis'; term := 'ado'; end;
        per3Plur: begin aux := 'hayan'; term := 'ado'; end;
        end;
      tpoPretPluscua: //Pretérito pluscuamperfecto (había amado, habías amado, ...)
        case persona of
        per1Sing: begin aux := 'hubiera'; term := 'ado'; end;
        per2Sing: begin aux := 'hubieras'; term := 'ado'; end;
        per3Sing: begin aux := 'hubiera'; term := 'ado'; end;
        per1Plur: begin aux := 'hubiéramos'; term := 'ado'; end;
        per2Plur: begin aux := 'hubierais'; term := 'ado'; end;
        per3Plur: begin aux := 'hubieran'; term := 'ado'; end;
        end;
      tpoFuturPerf:   //Futuro perfecto (abré amado, habrás amado, ...)
        case persona of
        per1Sing: begin aux := 'hubiere'; term := 'ado'; end;
        per2Sing: begin aux := 'hubieres'; term := 'ado'; end;
        per3Sing: begin aux := 'hubiere'; term := 'ado'; end;
        per1Plur: begin aux := 'hubiéremos'; term := 'ado'; end;
        per2Plur: begin aux := 'hubiereis'; term := 'ado'; end;
        per3Plur: begin aux := 'hubieren'; term := 'ado'; end;
        end;
      else
        term := '';  //Indicador de que no existe el tiempo
      end;
    modImperat: begin
      //En este modo solo hay un tiempo, pero hay modo negativo.
      if not negat then begin  //Modo afirmativo
        case persona of
        per1Sing: begin term := ''; end;  //No aplicable
        per2Sing: begin term := 'a'; end;
        per3Sing: begin term := 'e'; end;
        per1Plur: begin term := 'emos'; end;
        per2Plur: begin term := 'ad'; end;
        per3Plur: begin term := 'en'; end;
        end;
      end else begin  //Modo negativo
        case persona of
        per1Sing: begin aux := ''; term := ''; end;  //No aplicable
        per2Sing: begin aux := 'no'; term := 'es'; end;
        per3Sing: begin aux := 'no'; term := 'e'; end;
        per1Plur: begin aux := 'no'; term := 'emos'; end;
        per2Plur: begin aux := 'no'; term := 'éis'; end;
        per3Plur: begin aux := 'no'; term := 'en'; end;
        end;
      end;
    end;
  end;
end;

Procedure Conjugar(var verbo: string; modo: TModoVerb; tie: TTpoVerb; per: TPersonaNum);
{Conjuga el verbo indicado en el parámetro "verbo". El verbo debe pasarse en
infinitivo, es decir, con terminación "ar", "er" o "ir".
}
var
   raiz  : string[10];  //Raiz del verbo
   termin: string[10];   //Terminación del verbo
   morf , aux: cad12;
   neg: Boolean;
begin
  neg := false;
  termin := copy(verbo,length(verbo)-1,2);
  raiz:= copy(verbo,1,length(verbo)-2);
  if termin = 'ar' then termVerbReg1(modo, tie, per, neg, aux, morf);
  if termin = 'er' then termVerbReg1(modo, tie, per, neg, aux, morf);
  if termin = 'ir' then termVerbReg1(modo, tie, per, neg, aux, morf);
  if aux<>'' then begin
   verbo := aux + ' ' + raiz + morf;
  end else begin
   verbo := raiz + morf;
  end;
end;

//function EsVerbo(a: cad12; var term, modo;
//                      tiem: TTpoVerb; per: byte): boolean;
//var
//  b,c,d:cad12;
//  tiempo: TTpoVerb;
//  pers: TPersona;
//  n:byte;
//begin
//  b:=a;
//  Result := false;
//  repeat
//    b:=copy(b, 1, length(b)-1);
//    if EnVerbo(b, term, n) then begin
//      case term of
//           1 : c:=b + 'ar';
//           2 : c:=b + 'er';
//           3 : c:=b + 'ir';
//      end;
//      for tiempo:=1 to 3 do for pers := 1 to 6 do begin
//          d:=c;Conjugar(d, modIndicat, tiempo, pers);
//          writeln(d);
//          if d = a then begin
//            modo:=1;tiem:=tiempo;
//            per:=pers;Result:=true
//          end;
//      end;
//      for tiempo:=1 to 3 do for pers := 1 to 6 do begin
//          d:=c;Conjugar(d, modImperat,tiempo,pers) ;writeln(d);
//          if d = a then begin
//            modo:=3;tiem:=tiempo;
//            per:=pers;Result:=true
//          end;
//      end;
//    end;
//  until length (b)<=2;
//end;

end.

