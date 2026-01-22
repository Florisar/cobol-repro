          IDENTIFICATION DIVISION. 
          PROGRAM-ID. COULEUR.

      *----------------------------------------------------------------
      * Nom du programme : COULEUR
      * Auteur         : Gregory Charbonneau
      * Date           : 22/01/2026
      * Description    : Programme de démonstration COBOL
      *----------------------------------------------------------------


      *----------------------------------------------------------------
          DATA DIVISION. 
          WORKING-STORAGE SECTION. 
          01 ANSI-RESET   PIC X(4) VALUE X'1B5B306D'.
          01 ANSI-ROUGE   PIC X(5) VALUE X'1B5B33316D'.
          01 ANSI-VERT    PIC X(5) VALUE X'1B5B33326D'.
          01 ANSI-JAUNE   PIC X(5) VALUE X'1B5B33336D'.
          01 ANSI-BLEU    PIC X(5) VALUE X'1B5B33346D'.
          01 ANSI-MAGENTA PIC X(5) VALUE X'1B5B33356D'.
          01 ANSI-CYAN    PIC X(5) VALUE X'1B5B33366D'.
             
      *----------------------------------------------------------------
          PROCEDURE DIVISION.
            DISPLAY ANSI-ROUGE   " ==== TEST DE COULEUR ====" ANSI-RESET
            DISPLAY ANSI-BLEU    "Le ciel est bleu"           ANSI-RESET
            DISPLAY ANSI-JAUNE   "Le soleil est jaune"        ANSI-RESET
            DISPLAY ANSI-MAGENTA "Le magenta est flashy"      ANSI-RESET

              DISPLAY ANSI-ROUGE "R"
                      ANSI-JAUNE "A"
                      ANSI-VERT  "I"
                      ANSI-CYAN  "N"
                      ANSI-BLEU    "B"
                      ANSI-MAGENTA "O"
                      ANSI-ROUGE   "W"
                      ANSI-RESET

           STOP RUN.
