;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-DramaComedy

   (logical (start))

   =>

   (assert (UI-state (display DramaComedyQuestion)
                     (relation-asserted DramaComedy)
                     (response Comedy)
                     (valid-answers Comedy Drama Both))))
                     
;;;***************
;;;* BOTH *
;;;***************                     
                     
(defrule determine-SmallTownPrison

   (logical (DramaComedy Both))

   =>

   (assert (UI-state (display SmallTownPrisonQuestion)
                     (relation-asserted SmallTownPrison)
                     (response SmallTown)
                     (valid-answers SmallTown Prison))))
   
(defrule GilmoreGirls

   (logical (DramaComedy Both))
   (logical (SmallTownPrison SmallTown))
   
   =>

   (assert (UI-state (display GilmoreGirlsAnswer)
                     (state final))))
  
(defrule OITNB

   (logical (DramaComedy Both))
   (logical (SmallTownPrison Prison))
 
   =>

   (assert (UI-state (display OITNBAnswer)
                     (state final))))
                     
;;;***************
;;;* COMEDY *
;;;***************                     
       
   
(defrule determine-QuestionableMorals

   (logical (DramaComedy Comedy))

   =>

   (assert (UI-state (display QuestionableMoralsQuestion)
                     (relation-asserted QuestionableMorals)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-FriendGroupDysfunctionalFamily

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals Yes))
   
   =>

   (assert (UI-state (display FriendGroupDysfunctionalFamilyQuestion)
                     (relation-asserted FriendGroupDysfunctionalFamily)
                     (response Friends)
                     (valid-answers Friends Family))))
   
(defrule SunnyInPhiladelphia

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals Yes))
   (logical (FriendGroupDysfunctionalFamily Friends))
   
   =>

   (assert (UI-state (display SunnyInPhiladelphiaAnswer)
                     (state final))))
   
(defrule ArrestedDevelopment

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals Yes))
   (logical (FriendGroupDysfunctionalFamily Family))
   
   =>

   (assert (UI-state (display ArrestedDevelopmentAnswer)
                     (state final))))
   
(defrule determine-FemaleCharacters

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   
   =>

   (assert (UI-state (display FemaleCharactersQuestion)
                     (relation-asserted FemaleCharacters)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-SellDrugs

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters Yes))
   
   =>

   (assert (UI-state (display SellDrugsQuestion)
                     (relation-asserted SellDrugs)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule WEEDS

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters Yes))
   (logical (SellDrugs Yes))
   
   =>

   (assert (UI-state (display WEEDSAnswer)
                     (state final))))
   
(defrule determine-FeyOrPoehler

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters Yes))
   (logical (SellDrugs No))
   
   =>

   (assert (UI-state (display FeyOrPoehlerQuestion)
                     (relation-asserted FeyOrPoehler)
                     (response Tina)
                     (valid-answers Tina Amy))))
   
(defrule 30Rock

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters Yes))
   (logical (SellDrugs No))
   (logical (FeyOrPoehler Tina))
   
   =>

   (assert (UI-state (display 30RockAnswer)
                     (state final))))
                     
(defrule ParksAndRecreation

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters Yes))
   (logical (SellDrugs No))
   (logical (FeyOrPoehler Amy))
   
   =>

   (assert (UI-state (display ParksAndRecreationAnswer)
                     (state final))))
   
(defrule determine-WorkPlaceHumor

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   
   =>

   (assert (UI-state (display WorkPlaceHumorQuestion)
                     (relation-asserted WorkPlaceHumor)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule Office

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor Yes))
   
   =>

   (assert (UI-state (display OfficeAnswer)
                     (state final))))
   
(defrule determine-FrancoRogen

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor No))
   
   =>

   (assert (UI-state (display FrancoRogenQuestion)
                     (relation-asserted FrancoRogen)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule FreaksAndGeeks

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor No))
   (logical (FrancoRogen Yes))
   
   =>

   (assert (UI-state (display FreaksAndGeeksAnswer)
                     (state final))))
   
(defrule determine-BarCafe

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor No))
   (logical (FrancoRogen No))
   
   =>

   (assert (UI-state (display BarCafeQuestion)
                     (relation-asserted BarCafe)
                     (response Bar)
                     (valid-answers Bar Cafe))))
                     
(defrule HowIMetYourMother

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor No))
   (logical (FrancoRogen No))
   (logical (BarCafe Bar))
   
   =>

   (assert (UI-state (display HowIMetYourMotherAnswer)
                     (state final))))
                     
(defrule Friends

   (logical (DramaComedy Comedy))
   (logical (QuestionableMorals No))
   (logical (FemaleCharacters No))
   (logical (WorkPlaceHumor No))
   (logical (FrancoRogen No))
   (logical (BarCafe Cafe))
   
   =>

   (assert (UI-state (display FriendsAnswer)
                     (state final))))
   
;;;****************
;;;* DRAMA *
;;;****************
   
(defrule determine-SciFiSupernatural

   (logical (DramaComedy Drama))
   
   =>

   (assert (UI-state (display SciFiSupernaturalQuestion)
                     (relation-asserted SciFiSupernatural)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-Gore

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   
   =>

   (assert (UI-state (display GoreQuestion)
                     (relation-asserted Gore)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-Zombies

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore Yes))
   
   =>

   (assert (UI-state (display ZombiesQuestion)
                     (relation-asserted Zombies)
                     (response No)
                     (valid-answers No Yes))))

(defrule WalkingDead

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore Yes))
   (logical (Zombies Yes))
   
   =>

   (assert (UI-state (display WalkingDeadAnswer)
                     (state final))))
   
(defrule determine-Vampires

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore Yes))
   (logical (Zombies No))
   
   =>

   (assert (UI-state (display VampiresQuestion)
                     (relation-asserted Vampires)
                     (response No)
                     (valid-answers No Yes))))

(defrule VampiresDiares

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore Yes))
   (logical (Zombies No))
   (logical (Vampires Yes))
   
   =>

   (assert (UI-state (display VampiresDiaresAnswer)
                     (state final))))
   
(defrule SuperNatural

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore Yes))
   (logical (Zombies No))
   (logical (Vampires No))
   
   =>

   (assert (UI-state (display SuperNaturalAnswer)
                     (state final))))
   
(defrule determine-British

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore No))
   
   =>

   (assert (UI-state (display BritishQuestion)
                     (relation-asserted British)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule DrWho

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore No))
   (logical (British Yes))
   
   =>

   (assert (UI-state (display DrWhoAnswer)
                     (state final))))
   
(defrule Lost

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural Yes))
   (logical (Gore No))
   (logical (British No))
   
   =>

   (assert (UI-state (display LostAnswer)
                     (state final))))
   
(defrule determine-Politics

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   
   =>

   (assert (UI-state (display PoliticsQuestion)
                     (relation-asserted Politics)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Action

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   
   =>

   (assert (UI-state (display ActionQuestion)
                     (relation-asserted Action)
                     (response No)
                     (valid-answers No Yes))))

(defrule 24_

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action Yes))
   
   =>

   (assert (UI-state (display 24Answer)
                     (state final))))

(defrule determine-ScandalusRomance

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action No))
   
   =>

   (assert (UI-state (display ScandalusRomanceQuestion)
                     (relation-asserted ScandalusRomance)
                     (response No)
                     (valid-answers No Yes))))

(defrule Scandal

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action No))
   (logical (ScandalusRomance Yes))
   
   =>

   (assert (UI-state (display ScandalAnswer)
                     (state final))))

(defrule determine-OptimistCynical

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action No))
   (logical (ScandalusRomance No))
   
   =>

   (assert (UI-state (display OptimistCynicalQuestion)
                     (relation-asserted OptimistCynical)
                     (response Optimistic)
                     (valid-answers Optimistic Cynical))))

(defrule WestWing

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action No))
   (logical (ScandalusRomance No))
   (logical (OptimistCynical Optimistic))
   
   =>

   (assert (UI-state (display WestWingAnswer)
                     (state final))))

(defrule HouseOfCards

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics Yes))
   (logical (Action No))
   (logical (ScandalusRomance No))
   (logical (OptimistCynical Cynical))
   
   =>

   (assert (UI-state (display HouseOfCardsAnswer)
                     (state final))))

(defrule determine-Crying

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   
   =>

   (assert (UI-state (display CryingQuestion)
                     (relation-asserted Crying)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Football

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying Yes))
   
   =>

   (assert (UI-state (display FootballQuestion)
                     (relation-asserted Football)
                     (response No)
                     (valid-answers No Yes))))

(defrule FridayNightLights

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying Yes))
   (logical (Football Yes))
   
   =>

   (assert (UI-state (display FridayNightLightsAnswer)
                     (state final))))

(defrule determine-Hospital

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying Yes))
   (logical (Football No))
   
   =>

   (assert (UI-state (display HospitalQuestion)
                     (relation-asserted Hospital)
                     (response No)
                     (valid-answers No Yes))))

(defrule GreysAnatomy

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying Yes))
   (logical (Football No))
   (logical (Hospital Yes))
   
   =>

   (assert (UI-state (display GreysAnatomyAnswer)
                     (state final))))

(defrule Parenthood

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying Yes))
   (logical (Football No))
   (logical (Hospital No))
   
   =>

   (assert (UI-state (display ParenthoodAnswer)
                     (state final))))

(defrule determine-CrimeShows

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   
   =>

   (assert (UI-state (display CrimeShowsQuestion)
                     (relation-asserted CrimeShows)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-Criminals

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows Yes))
   
   =>

   (assert (UI-state (display CriminalsQuestion)
                     (relation-asserted Criminals)
                     (response No)
                     (valid-answers No Yes))))

(defrule Dexter

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows Yes))
   (logical (Criminals Yes))
   
   =>

   (assert (UI-state (display DexterAnswer)
                     (state final))))

(defrule determine-ForensicsPsychology

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows Yes))
   (logical (Criminals No))
   
   =>

   (assert (UI-state (display ForensicsPsychologyQuestion)
                     (relation-asserted ForensicsPsychology)
                     (response Forensics)
                     (valid-answers Forensics Psychology))))

(defrule CSIMiami

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows Yes))
   (logical (Criminals No))
   (logical (ForensicsPsychology Forensics))
   
   =>

   (assert (UI-state (display CSIMiamiAnswer)
                     (state final))))
                     
(defrule CriminalMinds

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows Yes))
   (logical (Criminals No))
   (logical (ForensicsPsychology Psychology))
   
   =>

   (assert (UI-state (display CriminalMindsAnswer)
                     (state final))))

(defrule determine-Meth

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows No))
   
   =>

   (assert (UI-state (display MethQuestion)
                     (relation-asserted Meth)
                     (response No)
                     (valid-answers No Yes))))

(defrule BreakingBad

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows No))
   (logical (Meth Yes))
   
   =>

   (assert (UI-state (display BreakingBadAnswer)
                     (state final))))

(defrule MadMen

   (logical (DramaComedy Drama))
   (logical (SciFiSupernatural No))
   (logical (Politics No))
   (logical (Crying No))
   (logical (CrimeShows No))
   (logical (Meth No))
   
   =>

   (assert (UI-state (display MadMenAnswer)
                     (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
