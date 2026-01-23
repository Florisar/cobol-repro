          IDENTIFICATION DIVISION.
          PROGRAM-ID. EX-GPT.



      *----------------------------------------------------------------
      * Nom du programme : EX-GPT 
      * Auteur         : Gregory Charbonneau
      * Date           : 22/01/2026
      * Description    : Exercice demandé pour ChatGpt
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          DATA DIVISION. 
          WORKING-STORAGE SECTION. 
          01 WS-CODE-SAISIE      PIC X(4) VALUE SPACES.
          01 WS-CODE-SECRET      PIC 9(4) VALUE 2026.
          01 WS-TENTATIVES       PIC 99 VALUE 0.
          01 WS-RESTE-TENTATIVES PIC 9 VALUE 0.
          01 WS-ACCES-OK         PIC X VALUE 'N'.
          01 WS-INVALID          PIC 9 VALUE 0.
          01 WS-CODE-SAISIE-NUM  PIC 9(4) VALUE 0.

      *----------------------------------------------------------------



      *----------------------------------------------------------------
          PROCEDURE DIVISION.
          MAIN-SECTION.
              PERFORM INITIALISATION
              PERFORM SAISIE-CODE
              PERFORM VERIFICATION-FIN
              STOP RUN.
              

          INITIALISATION.
      * Réinitialisation des variables
               MOVE SPACES   TO WS-CODE-SAISIE 
               MOVE 0        TO WS-TENTATIVES 
               MOVE 0        TO WS-RESTE-TENTATIVES 
               MOVE 'N'      TO WS-ACCES-OK 
               MOVE 0        TO WS-INVALID 
            .


          SAISIE-CODE.
             PERFORM UNTIL WS-TENTATIVES = 3 OR WS-ACCES-OK = 'Y'
                 DISPLAY "Veuillez saisir votre code secret :"
                 ACCEPT WS-CODE-SAISIE

                 IF WS-CODE-SAISIE IS NUMERIC
                   MOVE WS-CODE-SAISIE TO WS-CODE-SAISIE-NUM
                   IF WS-CODE-SAISIE-NUM = WS-CODE-SECRET
                       MOVE 'Y' TO WS-ACCES-OK
                       DISPLAY "CODE SECRET CORRECT - ACCES"
                   ELSE
                   ADD 1 TO WS-TENTATIVES
                   COMPUTE WS-RESTE-TENTATIVES = 3 - WS-TENTATIVES
                   DISPLAY "CODE INCORRECT"
                   DISPLAY "Tentatives restantes : " WS-RESTE-TENTATIVES
                   END-IF
                  ELSE
                    DISPLAY "ERREUR : la saisie doit être un nombre"
                  END-IF
              END-PERFORM
            .

      *----------------------------------------------------------------
           VERIFICATION-FIN.
              IF WS-ACCES-OK = 'N'
                DISPLAY "ACCES BLOQUE - TROP DE TENTATIVES"
              END-IF
            .
           
