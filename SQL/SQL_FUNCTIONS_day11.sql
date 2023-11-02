--CREATING FUNCTIONS--
CREATE OR REPLACE FUNCTION addf(x numeric, y numeric)

returns numeric

language plpgsql ---postgresql

as

$$

begin

return x + y;

end

$$

SELECT addf(3,4) as addition;