{Definiciones comunes a diversos elementos de una oración.
                                           Por Tito Hinostroza 21/09/2021.
}
unit Gramatica_def;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils;
type

  //Modos verbales.
  TModoVerb = (
    modIndicat,     //Indicativo
    modSubjunt,     //Subjuntivo
    modImperat      //Imperativo
  );

  //Tiempo verbal
  TTpoVerb = (
    //Tiempos simples
    tpoPresente,    //Presente     (amo, amas, ama, ...)
    tpoPretImper,   //Pretérito imperfecto (amaba, amabas, ...)
    tpoPretPerfSim, //Pretérito perfecto simple (amé, amaste, ...)
    tpoFuturSim,    //Futuro simple (amaré, amarás, )
    tpoCondSim,     //Condicional simple (amaría, amarías, ...)
    //Tiempos compuestos
    tpoPretPerfCom, //Pretérito perfecto compuesto (he amado, has amado, ...)
    tpoPretPluscua, //Pretérito pluscuamperfecto (había amado, habías amado, ...)
    tpoPretAnt,     //Pretérito anterior (hube amado, hubiste amado, ...)
    tpoFuturPerf,   //Futuro perfecto (abré amado, habrás amado, ...)
    tpoCondPerf     //Condicional perfecto (habría amado, habrías amado, ...)
  );

  //Géneros gramaticales
  TGenero = (
    genMascul,      //Masculino
    genFemen ,      //Femenino
    genNeutro       //Neutro (usado en artículos)
  );

  //Número
  TNumero = (
    numSingu,       //Singular
    numPlural,      //Plural
    numIndef        //Indefinido (puede ser singular o plural)
  );

  //Persona
  TPersona = (
    per1,          //Primera persona en singular
    per2,          //Segunda persona en singular
    per3           //Tercera persona en singular
  );

  //Número y persona
  TPersonaNum = (
    per1Sing,    //1ra persona singular
    per2Sing,    //2da persona singular
    per3Sing,    //3ra persona singular
    per1Plur,    //1ra persona plural
    per2Plur,    //2da persona plural
    per3Plur     //3ra persona plural
  );

type  //Definiciones de cadenas.
   cad14 = string[14];
   cad10 = string[10];
   cad12 = string[12];

implementation

end.

