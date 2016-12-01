Scott Heinrich
Database Lab 10
11/30/16

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor 
as 
$$
declare
   courseInput int       := $1;
     resultset REFCURSOR := $2;
begin
   open resultset for 
      select prereqnum
        from prerequisites
       where courseNum = courseInput;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
fetch all from results;





create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor 
as 
$$
declare
   courseInput int       := $1;
     resultset REFCURSOR := $2;
begin
   open resultset for 
      select courseNum
        from Prerequisites
       where preReqNum = courseInput;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(221, 'results');
fetch all from results;