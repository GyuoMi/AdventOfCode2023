       >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. trebuchet.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT InputFile ASSIGN TO 'input.txt'
                  ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD InputFile.
       01 InputRecord PIC X(100).
       
       WORKING-STORAGE SECTION.
       01 FirstDigit PIC 9.
       01 LastDigit  PIC 9.
       01 ConcatenatedValue PIC 99.
       01 TotalSum PIC S9(10) COMP VALUE 0.
       01 I PIC 9(3) VALUE 1.

       
       PROCEDURE DIVISION.
           OPEN INPUT InputFile.
       
           PERFORM 1001 TIMES
               READ InputFile
                   AT END
                       EXIT PERFORM
                   NOT AT END
                       PERFORM PROCESS-RECORD
               END-READ
           END-PERFORM.
       
           CLOSE InputFile.
       
           DISPLAY 'Total Sum: ' TotalSum.
       
           STOP RUN.
       

       PROCESS-RECORD.
           MOVE ZERO TO FirstDigit
           MOVE ZERO TO LastDigit

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LENGTH OF InputRecord
               IF InputRecord(I:1) NUMERIC
                   IF FirstDigit = 0
                       MOVE FUNCTION NUMVAL(InputRecord(I:1)) TO FirstDigit
                   END-IF
                   MOVE FUNCTION NUMVAL(InputRecord(I:1)) TO LastDigit
               END-IF
           END-PERFORM

           IF FirstDigit > 0 AND LastDigit > 0
               MOVE FirstDigit TO ConcatenatedValue
               MULTIPLY 10 BY ConcatenatedValue
               ADD LastDigit TO ConcatenatedValue
               ADD ConcatenatedValue TO TotalSum
           END-IF.