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

    Utt = {s : Str} ;
    S  = {s : Str} ;

    CN = Noun ;
    AP = Adjective ;
  
  -- lin
    
    -- AdjCN ap cn = {
      -- s = \\num => cn.s ! num ! gen ++ ap.s ! num ! cn.gen} -- ?????????????

    -- UsePron p = p ;
    -- UseNoun n = n ;
    -- PositA a = a ;
  


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
lin water_N = mkN "agua" Masc ;
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


--- Adverbs ---

lin already_Adv = mkAdv "ya" ;
lin now_Adv = mkAdv "ahora" ;


--- Pronouns ---

he_Pron = mkPron "él" "lo" Sg ;
she_Pron = mkPron "ella" "la" Sg ;
they_Pron = mkPron "ellos" "los" Pl ;

--- Prepositions ---

in_Prep = {s = "en"} ;
on_Prep = {s = "encima de"} ;
with_Prep = {s = "con"} ;


--- Others ---

-- lin john_PN = mkPN "John" ;
-- lin know_VS = mkVS (mkV "know" "knew" "known") ;
-- lin paris_PN = mkPN "Paris" ;
}
