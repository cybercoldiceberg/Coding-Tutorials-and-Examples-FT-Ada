-- Bringing ADA BACK! 
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Real_Time; use Ada.Real_Time; 
procedure Typewriter is 
Message : constant String := "Your text here";
begin 
  for Index in Message'Range loop
  -- Begin Printing Message here 
   Put(Message(Index)); 
   Delay 0.7; -- You can use any delay time you want! I just chose 0.7 
   Flush; -- Use this to flush message makes things cleaner!
 end loop; 
end Typewriter;
