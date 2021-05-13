--# -path=.:../abstract
concrete MicroLangEs of MicroLang = open MicroResEs in {
-- concrete MicroLangEs of MicroLang = open MicroResEs, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat

    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;

    Adv = Adverb ;
    Pron = Pronoun ;
    Prep = Preposition ;
    Det = Determiner ;

    Utt = {s : Str} ;
    S  = {s : Str} ;

    CN = Noun ;
    -- NP = Noun ; 
    -- NP = {s : Str} ;
    NP = {s : Case => Str; p : Person ; n : Number; g : Gender} ;
    AP = Adjective ;

    -- VP = { verb : Number => Person => Str ; compl : Str } ; 
    VP = { verb : Number => Person => Str ; compl : Number => Gender => Str } ; -- Added Number and Gender to compl for copula
    Comp = Adjective ;
    
  
  lin
  
    UseN n = n ;
    PositA a = a ;
        
    UttS s = s ;

    -------------------------------------
    ------ fun UttNP : NP -> Utt ; ------
    -------------------------------------
    
    UttNP np = {s = np.s ! Nom} ;


    -----------------------------------------
    ------ fun UsePron : Pron -> NP ;  ------ 
    -----------------------------------------

    -- Pronoun : Type = {s : Case => Str; g : Gender; n : Number; p : Person } ;
    
    UsePron pron = { 
      s = table {
        Nom => pron.s ! Nom ;
        Acc => pron.s ! Acc } ;
        p = pron.p ;
        n = pron.n ;
        g = pron.g
            } ; 


    ------------------------------------------
    ------ fun AdjCN : AP -> CN -> CN ; ------
    ------------------------------------------
    
    -- Noun: Type = {s: Number => Str ; g : Gender} ;
    -- Adjective: Type = {s : Number => Gender => Str} ;

    AdjCN ap cn = {
    s = table { Sg => cn.s ! Sg ++ ap.s ! Sg ! cn.g ;
                Pl => cn.s ! Pl ++ ap.s ! Pl ! cn.g } ;
                g = cn.g; -- this should break but doesn't (?)
                p = P3;
              };
    

    -------------------------------------------
    ------ fun DetCN : Det -> CN -> NP ; ------
    -------------------------------------------

    -- Determiner : Type = {s : Gender => Str; n : Number } ;

    DetCN det cn = {s = \\c => det.s ! cn.g ++ cn.s ! det.n;
                    p =  P3;
                    n = det.n;
                    g = cn.g} ;
    

    ----------------------------------------------
    ------ fun PrepNP : Prep -> NP -> Adv ; ------
    ----------------------------------------------

    -- Preposition : Type = {s : Str } ;
    -- NP = {s : Case => Str; p : Person ; n : Number; g : Gender} ;
    -- Adverb : Type = {s : Str} ;

    PrepNP prep np = {s = prep.s ++ np.s ! Nom} ;


    ----------------------------------
    ------ fun UseV : V -> VP ; ------
    ----------------------------------
    
    -- Verb: Type = {s : Number => Person => Str};
    -- Verb2: Type = {s : Number => Person => Str};

    UseV v = {verb = v.s ; 
              compl = \\num,gen => []} ;
              -- compl =  []} ; -- from before adding number and gender to compl


    ---------------------------------------
    ------ fun CompAP : AP -> Comp ; ------
    --------------------------------------- 
    
    -- Adjective: Type = {s : Number => Gender => Str} ;

    CompAP ap = ap;


    ----------------------------------------
    ------ fun UseComp : Comp -> VP ; ------
    ----------------------------------------

    -- Adjective: Type = {s : Number => Gender => Str} ;
    -- VP = { verb : Number => Person => Str ; compl : Str } ;

        UseComp comp = {
                        verb = be_Verb.s   ;
                        compl = \\num, gen => comp.s ! num ! gen
        };


    --------------------------------------------
    ------ fun ComplV2 : V2 -> NP -> VP ; ------
    --------------------------------------------
    
    -- Verb2: Type = {s : Number => Person => Str};
    -- NP = {s : Case => Str; p : Person ; n : Number; g : Gender} ;

    ComplV2 v2 np = {
                    verb = v2.s ;
                    compl = \\num, gen => np.s ! Acc
                    -- compl = np.s ! Acc -- from before adding number and gender to compl
                    } ;


    -------------------------------------------
    ------ fun AdvVP : VP -> Adv -> VP ; ------
    -------------------------------------------
    
    -- Adverb : Type = {s : Str} ;
    -- VP = { verb : Number => Person => Str ; compl : Str } ;

    AdvVP vp adv = { verb = vp.verb ;
                    compl = \\num,gen => vp.compl ! num ! gen ++ adv.s
                    -- compl = vp.compl ++ adv.s -- from before adding number and gender to compl
                    } ;


    -------------------------------------------
    ------ fun PredVPS : NP -> VP -> S ; ------
    -------------------------------------------
    
    -- NP = {s : Case => Str; p : Person ; n : Number; g : Gender} ;
    -- VP = { verb : Number => Person => Str ; compl : Str } ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb ! np.n ! np.p ++ vp.compl ! np.n ! np.g
      -- s = np.s ! Nom ++ vp.verb ! np.n ! np.p ++ vp.compl -- from before adding number and gender to compl
    };



-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

--- Nouns ---

lin animal_N = mkN "animal" Masc ;
lin apple_N = mkN "manzana" Fem ;
lin baby_N = mkN "bebé" Masc ;
lin beer_N = mkN "cerveza" Fem ;
lin bike_N = mkN "bicicleta" Fem ;
lin bird_N = mkN "pájaro" Masc ;
lin blood_N = mkN "sangre" Fem ;
lin boat_N = mkN "barco" Masc ;
lin book_N = mkN "libro" Masc ;
lin boy_N = mkN "niño" Masc ; ------- niño/a ?
lin girl_N = mkN "niña" Fem ; ------- niño/a ?
lin bread_N = mkN "pan" Masc ;
lin car_N = mkN "coche" Masc ;
lin cat_N = mkN "gato" Masc ; ------gato/a ?
lin child_N = mkN "hijo" Masc; -------hijo/a ?
lin city_N = mkN "ciudad" Fem ;
lin cloud_N = mkN "nube" Fem ;
lin computer_N = mkN "ordenador" Masc ;
lin cow_N = mkN "vaca" Fem ;
lin dog_N = mkN "perro" Masc ; ---- perro/a ?
lin fire_N = mkN "fuego" Masc ;
lin fish_N = mkN "pez" Masc ;
lin flower_N = mkN "flor" Fem ;
lin friend_N = mkN "amigo" Masc ; -------amigo/a ?
lin grammar_N = mkN "gramática" Fem ;
lin horse_N = mkN "caballo" Masc ;
lin house_N = mkN "casa" Fem ;
lin language_N = mkN "lengua" Fem ;
lin man_N = mkN "hombre" Masc ;
lin milk_N = mkN "leche" Fem ;
lin music_N = mkN "música" Fem ;
lin river_N = mkN "río" Masc ;
lin sea_N = mkN "mar" Masc ;
lin ship_N = mkN "barco" Masc ;
lin star_N = mkN "estrella" Fem ;
lin train_N = mkN "tren" Masc ;
lin tree_N = mkN "árbol" Masc ;
lin water_N = mkN "agua" Fem ;
lin wine_N = mkN "vino" Masc ;
lin woman_N = mkN "mujer" Fem ;

--- Adjectives ---

lin bad_A = mkA "malo" ;
lin big_A = mkA "grande" ;
lin black_A = mkA "negro" ;
lin blue_A = mkA "azul" ;
lin clean_A = mkA "limpio" ;
lin clever_A = mkA "listo" ;
lin cold_A = mkA "frío" ;
lin dirty_A = mkA "sucio" ;
lin good_A = mkA "bueno" ;
lin green_A = mkA "verde" ;
lin heavy_A = mkA "pesado" ;
lin hot_A = mkA "caliente" ;
lin new_A = mkA "nuevo" ;
lin old_A = mkA "viejo" ;
lin ready_A = mkA "listo" ;
lin red_A = mkA "rojo" ;
lin small_A = mkA "pequeño" ;
lin warm_A = mkA "tibio" ;
lin white_A = mkA "blanco" ;
lin yellow_A = mkA "amarillo" ;
lin young_A = mkA "jóven" ;

--- Verbs ---

lin break_V2 = mkV2 "romper" ;
lin buy_V2 = mkV2 "comprar" ;
lin come_V = mkV "venir" ;
lin drink_V2 = mkV2 "beber" ;
lin eat_V2 = mkV2 "comer" ;
lin find_V2 = mkV2 "encontrar" ;
lin go_V = mkV "ir" ;
lin jump_V = mkV "saltar" ;
lin kill_V2 = mkV2 "matar" ;
lin live_V = mkV "vivir" ;
lin love_V2 = mkV2 "amar" ;
lin play_V = mkV "jugar" ;
lin read_V2 = mkV2 "leer" ;
lin run_V = mkV "correr" ;
lin see_V2 = mkV2 "ver" ;
lin sleep_V = mkV "dormir" ;
lin swim_V = mkV "nadar" ;
lin teach_V2 = mkV2 "enseñar" ;
lin travel_V = mkV "viajar" ;
lin understand_V2 = mkV2 "entender" ;
lin wait_V2 = mkV2 "esperar" ;
lin walk_V = mkV "andar" ;
-- lin know_VS = mkV2 "saber" ; -- should be mkVS?


--- Adverbs ---

lin already_Adv = mkAdv "ya" ;
lin now_Adv = mkAdv "ahora" ;


--- Pronouns ---

lin he_Pron = mkPron "él" "lo" Masc Sg ;
lin she_Pron = mkPron "ella" "la" Fem Sg ;
lin they_Pron = mkPron "ellos" "los" Masc Pl ;

--- Prepositions ---

lin in_Prep = {s = "en"} ;
lin on_Prep = {s = "encima de"} ;
lin with_Prep = {s = "con"} ;


--- Determiners ---

lin a_Det = mkDet "un" "una" Sg ;
lin aPl_Det = mkDet "unos" "unas" Pl ;
lin the_Det = mkDet "el" "la" Sg ;
lin thePl_Det = mkDet "los" "las" Pl ;


--- Others ---

-- lin john_PN = mkPN "John" ;
-- lin paris_PN = mkPN "Paris" ;
}
