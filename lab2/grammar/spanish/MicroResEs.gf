resource MicroResEs = {
--- resource MicroResEs = open Prelude in {

param
  Number = Sg | Pl ;
  Gender = Masc | Fem ;
  Person = P1 | P2 | P3 ;
  Case = Nom | Acc ;

oper

------ 1. Nouns ------

Noun: Type = {s: Number => Str ; g : Gender} ;

---------- a) words ending with vowel --> +s (i.e., bicicleta+s)

nounV: Str -> Gender -> Noun
  = \x, gen -> {s = table {
        Sg => x ; 
        Pl => (x + "s")};
      g = gen} ;

---------- b) words ending with consonant --> +es (i.e., animal+es)

nounC: Str -> Gender -> Noun
  = \x, gen -> {s = table {
        Sg => x ; 
        Pl => (x + "es")}; 
      g = gen} ;

---------- c) words ending with ez --> -z + es (i.e., pe(z)+ces) (similar to baby/babies for Aarne)

zed: Str -> Gender -> Noun
  = \x, gen -> {s = table {
      Sg => x ; 
      Pl => (x + "ces")};
      g = gen} ;

---------- d) words that change with "sex": amig@ (friend), niñ@ (boy/girl), hij@ (child), gat@ (cat), perr@ (dog) ????

---------- Mix!

mkN : Str -> Gender -> Noun
  = \x, gen -> case x of
  {
    lex + ("a"|"e"|"i"|"o"|"u"|"á"|"é"|"í"|"ó"|"ú") => nounV x gen ;
    lex + "z" => zed x gen ;
    _ => nounC x gen
  } ;


------ 2. Adjectives ------

Adjective: Type = {s : Number => Gender => Str} ;

adj : Str -> Str -> Str -> Str -> Adjective
  = \malo,mala,malos,malas -> {s = table {
      Sg => table { Masc => malo; Fem => mala } ;
      Pl => table { Masc => malos; Fem => malas }} 
  } ;

--- Other version with AgreementN

-- adj : Str -> Str -> Str -> Str -> Adjective
--   = \malo, mala, malos, malas -> table {
--     AgrN Sg Masc => malo;
--     AgrN Sg Fem => mala;
--     AgrN Pl Masc => malos;
--     AgrN Pl Fem => malas
--   } ;

mkA : Str -> Adjective
  = \x -> case x of {
      lex + ("o"|"a") => adj (lex+"o") (lex+"a") (lex+"os") (lex+"as") ;
      lex + "e" => adj x x (x + "s") (x + "s") ;
      _ => adj x x (x + "es") (x + "es")
  } ;



------ 3. Verbs ------

-- Verb: Type = {s : VForm => Str};
Verb: Type = {s : Number => Person => Str};
Verb2: Type = {s : Number => Person => Str};

presInd : Str -> Str -> Str -> Str -> Str -> Str -> Verb
  = \ salto, saltas, salta, saltamos, saltais, saltan -> {s = table {
      Sg => table { P1 => salto; P2 => saltas; P3 => salta};
      Pl => table { P1 => saltamos; P2 => saltais; P3 => saltan}}
  }; 

mkV : Str -> Verb
  = \x -> case x of {
      "ir" => presInd "voy" "vas" "va" "vamos" "vais" "van" ;
      "venir" => presInd "vengo" "vienes" "viene" "venimos" "venís" "vienen" ;
      "dormir" => presInd "duermo" "duermes" "duerme" "dormimos" "dormís" "duermen" ;
      "jugar" => presInd "juego" "juegas" "juega" "jugamos" "jugáis" "juegan" ;
      lex + "ar" => presInd (lex+"o") (lex+"as") (lex+"a") (lex+"amos") (lex+"áis") (lex+"an") ;
      lex + "er" => presInd (lex+"o") (lex+"es") (lex+"e") (lex+"emos") (lex+"éis") (lex+"en") ;
      lex + "ir" => presInd (lex+"o") (lex+"es") (lex+"e") (lex+"imos") (lex+"ís") (lex+"en")  
  } ;

mkV2 : Str -> Verb
  = \x -> case x of {
      "encontrar" => presInd "encuentro" "encuentras" "encuentra" "encontramos" "encontráis" "encuentran";
      "entender" => presInd "entiendo" "entiendes" "entiende" "entendemos" "entendéis" "entienden";
      lex + "ar" => presInd (lex+"o") (lex+"as") (lex+"a") (lex+"amos") (lex+"áis") (lex+"an") ;
      lex + "er" => presInd (lex+"o") (lex+"es") (lex+"e") (lex+"emos") (lex+"éis") (lex+"en") ;
      lex + "ir" => presInd (lex+"o") (lex+"es") (lex+"e") (lex+"imos") (lex+"ís") (lex+"en")  
  } ;

--- Elena: contar & encontrar c + "ont" + ar


------ 3. Adverbs ------

Adverb : Type = {s : Str} ;

mkAdv : Str -> Adverb
    = \s -> {s = s} ;


------ 4. Pronouns ------

Pronoun : Type = {s : Case => Str; n : Number } -- No Person or Gender because it's not in the abstract

mkPron : Str -> Str -> Number -> Pronoun -- I have a syntax error here :'(
    = \nom, acc, num -> {s = table {
        Nom => nom; Acc => acc}; 
        n = num} ;


------ 5. Prepositions ------
 
 Preposition : Type = {s : Str } ;
 
 mkPrep : Str -> Preposition
    = \s -> {s = s} ;


}
