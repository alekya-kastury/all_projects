SET SERVEROUTPUT ON;
------------------------------------------------BUILD GAME-------------------------------------------------------------

CREATE OR REPLACE PROCEDURE BUILD_GAME 
AUTHID CURRENT_USER
IS
BEGIN
DECLARE
NCOUNT NUMBER;
V_SQL LONG;
BEGIN
SELECT COUNT(*) INTO NCOUNT FROM ALL_TABLES WHERE TABLE_NAME = 'TICTACTOE';
IF(NCOUNT <= 0)
THEN
V_SQL:='
CREATE TABLE TICTACTOE (
    ROW_ID INT NOT NULL,
    A VARCHAR(1) NULL,
    B VARCHAR(1) NULL,
    C VARCHAR(1) NULL
    )';
EXECUTE IMMEDIATE V_SQL;
END IF;

SELECT COUNT(*) INTO NCOUNT FROM ALL_TABLES WHERE TABLE_NAME = 'PLAYER_TURN';
IF(NCOUNT <= 0)
THEN
V_SQL:='
CREATE TABLE PLAYER_TURN (PLAYER VARCHAR(1))';
EXECUTE IMMEDIATE V_SQL;
END IF;

END;
END;
/
GRANT EXECUTE ON BUILD_GAME TO PUBLIC;
EXEC BUILD_GAME;
--------------------------------------------RESET GAME--------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE RESET_GAME AUTHID CURRENT_USER AS
    BEGIN
        EXECUTE IMMEDIATE 'TRUNCATE TABLE TICTACTOE';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE PLAYER_TURN';
        INSERT INTO TICTACTOE (ROW_ID,A,B,C) VALUES (1,null,null,null);
        INSERT INTO TICTACTOE (ROW_ID,A,B,C) VALUES (2,null,null,null);
        INSERT INTO TICTACTOE (ROW_ID,A,B,C) VALUES (3,null,null,null);
        INSERT INTO PLAYER_TURN (PLAYER)VALUES('X');
        COMMIT;
    END;
/
------------------------------------------------GAME PACKAGE------------------------------------------------------------------
CREATE OR replace PACKAGE GAME AUTHID CURRENT_USER AS
	Procedure PLAYER_MOVE (
		P_COLUMN in VARCHAR, 
		P_ROW in VARCHAR);
    PROCEDURE CHECK_VICTORY;
    PROCEDURE PLAY_TIC_TAC_TOE(P_COLUMN IN VARCHAR2, P_ROW IN VARCHAR2);
END GAME;
/
------------------------------------------------PLAYER MOVE-------------------------------------------------------------
CREATE OR replace PACKAGE BODY GAME IS
	Procedure PLAYER_MOVE (
		P_COLUMN in VARCHAR, 
		P_ROW in VARCHAR) AS
	BEGIN 
		DECLARE
			move_sql VARCHAR(500);
			set_player_turn VARCHAR(500);
			P_MOVE PLAYER_TURN.PLAYER%TYPE;
			RESULT_TAB TICTACTOE%ROWTYPE;
			check_space VARCHAR(100);
			RES VARCHAR(100);  
			invalid_input EXCEPTION;
	
		BEGIN   
		
		IF P_COLUMN NOT IN ('A', 'B', 'C') THEN
			dbms_output.put_line('Invalid Column');
			RAISE invalid_input;
		END IF;
		IF P_ROW NOT IN ('1', '2', '3') THEN
			dbms_output.put_line('Invalid Row');
			RAISE invalid_input;
		END IF;
		
			SELECT PLAYER INTO P_MOVE FROM PLAYER_TURN;  
			IF P_MOVE IN ('X') THEN
				dbms_output.put_line('Play X');
			END IF;
			IF P_MOVE IN ('O') THEN
				dbms_output.put_line('Play O');
			END IF;
			--SELECT CASE WHEN P_COLUMN IS NOT NULL THEN 'TAKEN' END into RES FROM TICTACTOE WHERE ROW_ID = P_ROW;
			check_space:='SELECT CASE WHEN '||P_COLUMN||' IS NOT NULL THEN ''TAKEN'' END FROM TICTACTOE WHERE ROW_ID = '||P_ROW;
			EXECUTE IMMEDIATE check_space INTO RES;
			
			IF RES ='TAKEN' THEN 
			dbms_output.put_line('Space taken.Try different space');
			
			ELSE 
			move_sql:='UPDATE Tictactoe SET '|| P_COLUMN ||'='||''''|| P_MOVE ||''''||' WHERE ROW_ID = '|| P_ROW;
			EXECUTE IMMEDIATE move_sql; 
			set_player_turn:='UPDATE PLAYER_TURN SET PLAYER= 
			CASE PLAYER
			WHEN ''X'' THEN ''O''
			WHEN ''O'' THEN ''X''
			END';
			EXECUTE IMMEDIATE set_player_turn;
			FOR MY_ROW in (SELECT ROW_ID,A,B,C FROM TICTACTOE) loop
				dbms_output.put_line('  '||MY_ROW.A||'  |   '||MY_ROW.B||'  |   '||MY_ROW.C);
			end loop;
			END IF;
			EXCEPTION
			WHEN invalid_input THEN dbms_output.put_line('Try again');
		END ;
	
	END;
	
	---------------------------------------------------------CHECK WINNER------------------------------------------------------------------------
	PROCEDURE CHECK_VICTORY 
	AS
	BEGIN
	DECLARE
		A1 VARCHAR(1);
		A2 VARCHAR(1);
		A3 VARCHAR(1);
		B1 VARCHAR(1);
		B2 VARCHAR(1);
		B3 VARCHAR(1);
		C1 VARCHAR(1);
		C2 VARCHAR(1);
		C3 VARCHAR(1);
        WIN VARCHAR(1) NULL;
	BEGIN 
		SELECT A INTO A1 FROM TicTacToe WHERE row_ID = 1;
		SELECT A INTO A2 FROM TicTacToe WHERE row_ID = 2;
		SELECT A INTO A3 FROM TicTacToe WHERE row_ID = 3;
		SELECT B INTO B1 FROM TicTacToe WHERE row_ID = 1;
		SELECT B INTO B2 FROM TicTacToe WHERE row_ID = 2;
		SELECT B INTO B3 FROM TicTacToe WHERE row_ID = 3;
		SELECT C INTO C1 FROM TicTacToe WHERE row_ID = 1;
		SELECT C INTO C2 FROM TicTacToe WHERE row_ID = 2;
		SELECT C INTO C3 FROM TicTacToe WHERE row_ID = 3;
        IF WIN IS NULL THEN
		--Horizontal wins
        IF A1 = B1 AND B1 = C1 THEN dbms_output.put_line(A1||' is the winner'); WIN:=A1; 
        ELSIF A2 = B2 AND B2 = C2 THEN  dbms_output.put_line(A2||' is the winner'); WIN:=A2; 
        ELSIF A3 = B3 AND B3 = C3 THEN  dbms_output.put_line(A3||' is the winner'); WIN:=A3; 
        
        --Vertical Wins
        ELSIF A1 = A2 AND A2 = A3 THEN dbms_output.put_line(A1||' is the winner'); WIN:=A1; 
        ELSIF B1 = B2 AND B2 = B3 THEN dbms_output.put_line(B1||' is the winner'); WIN:=B1; 
        ELSIF C1 = C2 AND C2 = C3 THEN dbms_output.put_line(C1||' is the winner'); WIN:=C1; 
        
        --Diagonal Wins
        ELSIF A1 = B2 AND B2 = C3 THEN dbms_output.put_line(A1||' is the winner'); WIN:=A1; 
        ELSIF A3 = B2 AND B2 = C1 THEN dbms_output.put_line(A3||' is the winner'); WIN:=A3; 
        ELSE dbms_output.put_line('No winner'); 
        END IF;
        END IF;
	END;
	END;
    PROCEDURE PLAY_TIC_TAC_TOE(P_COLUMN IN VARCHAR2, P_ROW IN VARCHAR2) AS
        BEGIN
            GAME.PLAYER_MOVE(P_COLUMN,P_ROW);
            GAME.CHECK_VICTORY;
        END;
   
END GAME;
/
---------------------------------------------------------EXECUTION---------------------------------------------------------------------------
GRANT EXECUTE ON GAME TO PUBLIC;



