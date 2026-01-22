          IDENTIFICATION DIVISION.
          PROGRAM-ID. SECURITE-01.



      *----------------------------------------------------------------
      * Nom du programme : SECURITE-01
      * Auteur         : Gregory Charbonneau
      * Date           : 22/01/2026
      * Description    : Sécurité Style carte bancaire
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          DATA DIVISION. 
          WORKING-STORAGE SECTION. 
      *Ici on initialise plusieurs variables
      *PIC 9(4) 9 signifie uniquement numerique lettre etc... ⛔️
      *PIC x value 'N' x = alphanumerique
          01 WS-CODE-SAISIE      PIC 9(4) VALUE 0.
          01 WS-CODE-SECRET      PIC 9(4) VALUE 1234.
          01 WS-TENTATIVES       PIC 9(4) VALUE 0.
          01 WS-ACCES-OK         PIC X    VALUE 'N'.
          01 WS-RESTE-TENTATIVES PIC 9 VALUE 0.
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          PROCEDURE DIVISION.
      
      *PERFORM UNTIL = boucle ici 3 tentative ou alors l'acces est ok =
      *Bon code secret

            PERFORM UNTIL WS-TENTATIVES = 3 or WS-ACCES-OK = 'Y'
              DISPLAY "Veuillez saisir votre code secret :"
              ACCEPT WS-CODE-SAISIE 
              IF WS-CODE-SAISIE = WS-CODE-SECRET 
                 MOVE 'Y' TO WS-ACCES-OK 
                 DISPLAY "CODE SECRET CORRECT - ACCES AUTORISE"
              ELSE       
                 ADD 1 TO WS-TENTATIVES
                 COMPUTE WS-RESTE-TENTATIVES = 3 - WS-TENTATIVES
                 DISPLAY "CODE INCORRECT"
                 DISPLAY "Tentative restantes : " WS-RESTE-TENTATIVES
                 
              END-IF    
            END-PERFORM
            DISPLAY "CARTE BLOQUE, CONTACTE VOTRE BANQUE"

           STOP RUN.



      