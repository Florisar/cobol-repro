       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CLIENT-FILE
              ASSIGN TO "clients.csv"
              ORGANIZATION IS LINE SEQUENTIAL
              FILE STATUS IS WS-FS-CLIENT.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENT-FILE
           RECORD CONTAINS 80 CHARACTERS
           DATA RECORD IS FS-LIGNE-CLIENT.
       01 FS-LIGNE-CLIENT PIC X(80).

       WORKING-STORAGE SECTION.
       01 WS-LIGNE-CLIENT PIC X(80).
       01 WS-FS-CLIENT     PIC XX.
       01 WS-SEPARATEUR    PIC X(30) 
           VALUE "------------------------------".

       PROCEDURE DIVISION.
       MAIN.
           DISPLAY WS-SEPARATEUR
           DISPLAY "PROGRAMME FILE STATUS DEMO"
           DISPLAY WS-SEPARATEUR

           PERFORM ECRIRE-DONNEES
           PERFORM LIRE-FICHIER

           DISPLAY WS-SEPARATEUR
           DISPLAY "Fin du programme"
           DISPLAY WS-SEPARATEUR
           STOP RUN.

       *>--------------------------------------------------------------
       ECRIRE-DONNEES.
           DISPLAY WS-SEPARATEUR
           DISPLAY "ECRITURE DES DONNEES"
           DISPLAY WS-SEPARATEUR

           OPEN OUTPUT CLIENT-FILE
           IF WS-FS-CLIENT NOT = "00"
               DISPLAY "Erreur ouverture ecriture : " WS-FS-CLIENT
               STOP RUN
           END-IF

           MOVE "1,DUPONT,JEAN,1960-05-12|3000.00" TO WS-LIGNE-CLIENT
           MOVE WS-LIGNE-CLIENT TO FS-LIGNE-CLIENT
           WRITE FS-LIGNE-CLIENT
           PERFORM CONTROLE-ECRITURE

           MOVE "2,DURAND,MARIE,1985-11-23|1500.00" TO WS-LIGNE-CLIENT
           MOVE WS-LIGNE-CLIENT TO FS-LIGNE-CLIENT
           WRITE FS-LIGNE-CLIENT
           PERFORM CONTROLE-ECRITURE

           CLOSE CLIENT-FILE.

       *>--------------------------------------------------------------
       CONTROLE-ECRITURE.
           IF WS-FS-CLIENT NOT = "00"
               DISPLAY "Erreur ecriture : " WS-FS-CLIENT
               STOP RUN
           END-IF.

       *>--------------------------------------------------------------
       LIRE-FICHIER.
           DISPLAY WS-SEPARATEUR
           DISPLAY "LECTURE DU FICHIER"
           DISPLAY WS-SEPARATEUR

           OPEN INPUT CLIENT-FILE
           IF WS-FS-CLIENT NOT = "00"
               DISPLAY "Erreur ouverture lecture : " WS-FS-CLIENT
               STOP RUN
           END-IF

           READ CLIENT-FILE
           PERFORM UNTIL WS-FS-CLIENT = "10"
               IF WS-FS-CLIENT = "00"
                   DISPLAY FS-LIGNE-CLIENT
               ELSE
                   DISPLAY "Erreur lecture : " WS-FS-CLIENT
                   STOP RUN
               END-IF
               READ CLIENT-FILE
           END-PERFORM

           CLOSE CLIENT-FILE.
