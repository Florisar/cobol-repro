         IDENTIFICATION DIVISION.
         PROGRAM-ID. EX01.
      *--------------------------------------
      * Nom du programme : EX01
      * Auteur         : Gregory Charbonneau
      * Date           : 22/01/2026
      * Description    : Programme de démonstration COBOL
      *--------------------------------------
     
         DATA DIVISION.
         WORKING-STORAGE SECTION.
      
         01 GREETING        PIC X(50) VALUE "BONJOUR, JE TEST COBOL !".

         PROCEDURE DIVISION.
      *--------------------------------------
      * Début des instructions du programme
      *--------------------------------------
           DISPLAY GREETING
           DISPLAY "Deuxième = ligne pour démonstration."
           STOP RUN.
                   
 