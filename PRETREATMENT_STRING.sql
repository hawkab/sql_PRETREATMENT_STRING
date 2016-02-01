create or alter procedure PRETREATMENT_STRING (
    "INPUT" varchar(10000))
returns (
    RESULT varchar(10000))
as
declare variable NEW_VAR integer;
begin
  IF (NOT INPUT SIMILAR TO '[[:ALNUM:]]*') THEN
  BEGIN
    RESULT = '';
    WHILE (CHAR_LENGTH(INPUT) > 0) DO
    BEGIN
        IF ( LEFT ( INPUT , 1 ) SIMILAR TO '[[:ALNUM:]]') THEN
            RESULT = :RESULT || LEFT ( INPUT , 1 );
        INPUT = RIGHT( INPUT , CHAR_LENGTH(INPUT) - 1 );
    END
  END
  ELSE
    RESULT = INPUT;
  suspend;
end