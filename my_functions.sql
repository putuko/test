DELIMITER $$
CREATE FUNCTION `strip_tags`($str text) RETURNS text
BEGIN
    DECLARE $start, $end INT DEFAULT 1;
    LOOP
        SET $start = LOCATE("<", $str, $start);
        IF (!$start) THEN RETURN $str; END IF;
        SET $end = LOCATE(">", $str, $start);
        IF (!$end) THEN SET $end = $start; END IF;
        SET $str = INSERT($str, $start, $end - $start + 1, "");
    END LOOP;
END;


#DROP FUNCTION IF EXISTS SPLIT_STR;

/* igivea rac explode */

/*
CREATE FUNCTION SPLIT_STR(
  x text,
  delim VARCHAR(50),
  pos INT
)
RETURNS text
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
delim, '');
*/


