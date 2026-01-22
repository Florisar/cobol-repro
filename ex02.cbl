          IDENTIFICATION DIVISION.
          PROGRAM-ID. EX02.

      *----------------------------------------------------------------
      * Nom du programme : EX02
      * Auteur         : Gregory Charbonneau
      * Date           : 22/01/2026
      * Description    : Programme de démonstration COBOL
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          DATA DIVISION. 
          WORKING-STORAGE SECTION. 
      *Varaible WS-NOMBRE valeur 0 avec 99 caratere de reservé en memoire
          01 WS-NOMBRE PIC 99 VALUE 0.
      *----------------------------------------------------------------


          PROCEDURE DIVISION.
      *Le programme est simple l'utilisateur entre un nombre
      *Qui est récuperé par accept qui le stock dans WS-NOMBRE
      *Pour ensuite l'afficher 
            DISPLAY "Entrez un nombre :"   
            ACCEPT WS-NOMBRE
            DISPLAY "Vous avez saisie : " WS-NOMBRE
            STOP RUN.
      *STOP RUN marque la fin du programme 
  




