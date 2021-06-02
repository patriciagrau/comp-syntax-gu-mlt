--# -path=.:../abstract:../english:../api

-- model implementation using Mini RGL

concrete DoctorSpa of Doctor =
  open
    SyntaxSpa,
    ParadigmsSpa,
    Prelude,
    IrregSpa
  in {

lincat
  Phrase = Utt ;
  Fact = Cl ;
  Action = VP ;
  Property = VP ;
  Profession = CN ;
  Person = NP ;
  Place = {at,to : Adv} ;
  Substance = NP ;
  Illness = NP ;

lin
  presPosPhrase fact = mkUtt (mkS fact) ;
  presNegPhrase fact = mkUtt (mkS negativePol fact) ;
  pastPosPhrase fact = mkUtt (mkS anteriorAnt fact) ;
  pastNegPhrase fact = mkUtt (mkS anteriorAnt negativePol fact) ;
  -- presQuestionPhrase fact = mkUtt (mkQS (mkQCl fact)) ;
  -- pastQuestionPhrase fact = mkUtt (mkQS anteriorAnt (mkQCl fact)) ;
  presQuestionPhrase fact = let p : Utt = mkUtt (mkQS (mkQCl fact)) in p ** {s = p.s ++ SOFT_BIND ++ "?"} ;
  pastQuestionPhrase fact = let p : Utt = mkUtt (mkQS anteriorAnt (mkQCl fact)) in p ** {s = p.s ++ SOFT_BIND ++ "?"} ;


  impPosPhrase action = mkUtt (mkImp action) ;
  impNegPhrase action = mkUtt negativePol (mkImp action) ;

  actionFact person action = mkCl person action ;
  propertyFact person property = mkCl person property ;

  isProfessionProperty profession = mkVP (mkNP profession) ;
  needProfessionProperty profession = mkVP need_V2 (mkNP a_Det profession) ;
  isAtPlaceProperty place = mkVP place.at ;
  haveIllnessProperty illness = mkVP have_V2 illness ;

  theProfessionPerson profession = mkNP the_Det profession ;

  iMascPerson = i_NP ;
  iFemPerson = i_NP ;
  youMascPerson = you_NP ;
  youFemPerson = you_NP ;
  hePerson = he_NP ;
  shePerson = she_NP ;

  goToAction place = mkVP (mkVP go_V) place.to ;
  stayAtAction place = mkVP (mkVP stay_V) place.at ;
  vaccinateAction person = mkVP vaccinate_V2 person ;
  examineAction person = mkVP examine_V2 person ;
  takeSubstanceAction substance = mkVP take_V2 substance ;

-- end of what could be a functor
--------------------------------

  coughAction = mkVP (mkV "toser") ;
  breatheAction = mkVP (mkV "respirar") ;
  vomitAction = mkVP (mkV "vomitar") ;
  sleepAction = mkVP (mkV "dormir" "duermo") ;
  undressAction = mkVP (reflV (mkV "desvestir" "desvisto")) ;
  dressAction = mkVP (reflV (mkV "vestir" "visto")) ;
  eatAction = mkVP (mkV "comer") ;
  drinkAction = mkVP (mkV "beber") ;
  smokeAction = mkVP (mkV "fumar") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "tomar")) (mkNP the_Det (mkCN (mkA "corporal") (mkN "temperatura"))) ;
  measureBloodPressureAction = mkVP (mkV2 (mkV "tomar")) (mkNP the_Det (mkCN (mkA "arterial") (mkN "presión"))) ;

  hospitalPlace = {at = pAdv "en el hospital" ; to = pAdv "al hospital"} ; 
  homePlace = {at = pAdv "en casa" ; to = pAdv "a casa"} ;
  schoolPlace = {at = pAdv "en el colegio" ; to = pAdv "al colegio"} ;
  workPlace = {at = pAdv "en el trabajo" ; to = pAdv "al trabajo"} ;

  doctorProfession = mkCN (mkN "doctor") ;
  nurseProfession = mkCN (mkN "enfermero") ;
  interpreterProfession = mkCN (mkN "intérprete") ;

  bePregnantProperty = mkVP (mkA (mkA "embarazado") estarCopula) ;
  beIllProperty = mkVP (mkA (mkA "enfermo") estarCopula) ;
  beWellProperty = mkVP (mkA (mkA "bien") estarCopula) ;
  beDeadProperty = mkVP (mkA (mkA "muerto") estarCopula) ;

  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "alergia")) ;
  havePainsProperty = mkVP have_V2 (mkNP aPl_Det (mkN "dolor")) ;
  haveChildrenProperty = mkVP have_V2 (mkNP aPl_Det (mkN "hijo")) ;

  feverIllness = mkNP (mkN "fiebre") ;
  fluIllness = mkNP the_Det (mkN "gripe" feminine) ;
  headacheIllness = mkNP (compN (mkN "dolor") "de cabeza") ;
  diarrheaIllness = mkNP (mkN "diarrea") ;
  heartDiseaseIllness = mkNP a_Det (compN (mkN "enfermedad") "del corazón");
  lungDiseaseIllness = mkNP a_Det (mkCN (mkA "pulmonar") (mkN "enfermedad")) ; 
  hypertensionIllness = mkNP (mkN "hipertensión") ;

  alcoholSubstance = mkNP (mkN "alcohol") ;
  medicineSubstance = mkNP a_Det (mkN "medicina") ;
  drugsSubstance = mkNP aPl_Det (mkN "droga") ;

oper
  pAdv : Str -> Adv = ParadigmsSpa.mkAdv ;

  go_V = ir_V ; 
  stay_V = (reflV (mkV "quedar")) ;
  need_V2 = mkV2 (mkV "necesitar") ;
  take_V2 = mkV2 (mkV "tomar") ;
  put_V2 = mkV2 (mkV "poner") ;
  vaccinate_V2 = mkV2 (mkV "vacunar") ;
  examine_V2 = mkV2 (mkV (mkV "examinar") "a" ) ;

}

-- ISSUES --

-- al < a+el
-- del < de+el
