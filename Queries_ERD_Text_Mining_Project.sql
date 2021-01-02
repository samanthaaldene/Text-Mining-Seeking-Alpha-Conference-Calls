/*Query 1*/
SELECT COUNT(CC_ID)
FROM conference_call
WHERE CC_Date LIKE '%0';


/*Query 2*/
SELECT Tickers, CC_Date
FROM conference_call
WHERE CC_Date LIKE '%0';


/* Query 3*/
SELECT CP.Part_ID, CP.Participant_Type, coalesce(E.participant, I.participant) as Participants
FROM conference_call as C
JOIN conf_participants as CP
	ON C.CC_ID = CP.CC_ID
LEFT JOIN int_participants as I
	ON CP.Part_ID = I.Part_ID
LEFT JOIN ext_participants as E
	ON CP.Part_ID = E.Part_ID
WHERE C.CC_Date LIKE 'November 12, 2020'
AND C.Tickers = '(PTVE)';

SELECT COUNT(Part_ID), Participant_Type
FROM conference_call as C
JOIN conf_participants as CP
	ON C.CC_ID = CP.CC_ID
WHERE C.CC_Date LIKE 'November 12, 2020'
AND C.Tickers = '(PTVE)'
GROUP BY Participant_Type;


SELECT coalesce(E.participant, I.participant) as Participants, S.Speech
FROM conference_call as C
JOIN conf_participants as CP
	ON C.CC_ID = CP.CC_ID
LEFT JOIN int_participants as I
	ON CP.Part_ID = I.Part_ID
LEFT JOIN ext_participants as E
	ON CP.Part_ID = E.Part_ID
LEFT JOIN call_script as S
	on CP.Part_ID = S.Part_ID		
WHERE C.CC_Date LIKE 'November 12, 2020'
AND C.Tickers = '(PTVE)'
AND coalesce(E.participant, I.participant) LIKE 'John McGrath';




