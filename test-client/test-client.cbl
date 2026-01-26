          IDENTIFICATION DIVISION.
          PROGRAM-ID. TEST-CLIENT.



      *----------------------------------------------------------------
      * Nom du programme : TEST-CLIENT
      * Auteur         : Gregory Charbonneau
      * Date           : 26/01/2026
      * Description    : Ecriture dans un fichier sequentiel
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          ENVIRONMENT DIVISION. 
          INPUT-OUTPUT SECTION. 
          FILE-CONTROL. 
              SELECT CLIENT-FILE
              ASSIGN TO "client.txt"
              ORGANIZATION IS LINE SEQUENTIAL
          

          DATA DIVISION. 
          FILE SECTION. 
          FD CLIENT-FILE.
          01 LIGNE-SORTIE PIC X(50).


          WORKING-STORAGE SECTION. 
          01 WS-NOM PIC X(20) VALUE SPACES.
          01 WS-PRENOM PIC X(20) VALUE SPACES.
          01 WS-STOP PIC X(1) VALUE 'O'.
          01 WS-SEPARATEUR PIC X(25) VALUE "-------------------------".
          01 WS-BONJOUR PIC X(7) VALUE "Bonjour".
          01 WS-MESSAGE-DE-FIN PIC X(20) VALUE "AU REVOIR".
          01 WS-ID-CHAR PIC X(5).
          01 WS-ID PIC 9(5) VALUE 1.
          01 LIGNE-CLIENT PIC X(50).
      *----------------------------------------------------------------



      *----------------------------------------------------------------
          PROCEDURE DIVISION.
          MAIN-SECTION.
              PERFORM INITIALISATION
              PERFORM MESSAGE-DE-FIN
              
              
              STOP RUN.
           
          INITIALISATION.
            DISPLAY WS-BONJOUR
            DISPLAY WS-SEPARATEUR
            OPEN OUTPUT  CLIENT-FILE

           PERFORM UNTIL WS-STOP = 'N' OR WS-STOP = 'n'
             DISPLAY "Veuillez entrer le nom du nouveau client :"
             ACCEPT WS-NOM
             DISPLAY "Veuillez entrer le prénom du nouveau client :"
             ACCEPT WS-PRENOM

             MOVE WS-ID TO WS-ID-CHAR

            STRING WS-ID-CHAR
               "|"
               WS-NOM
               "|"
               WS-PRENOM
               INTO LIGNE-CLIENT
            END-STRING

            
            MOVE LIGNE-CLIENT  TO LIGNE-SORTIE 
            WRITE LIGNE-SORTIE 
            

            DISPLAY "Client ajouté : " LIGNE-CLIENT
            DISPLAY "Voulez-vous ajouter un autre client ? (O/N) :"
            ACCEPT WS-STOP

            ADD 1 TO WS-ID
          END-PERFORM

            CLOSE CLIENT-FILE.

          MESSAGE-DE-FIN.
            DISPLAY WS-MESSAGE-DE-FIN 
            .

           
              

           
           

      