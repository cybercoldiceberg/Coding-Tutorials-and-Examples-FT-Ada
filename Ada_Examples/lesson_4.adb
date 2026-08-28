-- Lesson 4 -- 
with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
-- Lesson 4: Learning how to accept users input from the terminal!
procedure Lesson_4 is 
	-- Declare a variable to store the user's input!
	User_Number : Integer; 
begin
   Put("Enter a number to verify ");
   -- Get will wait for you or the user to type an integer and Press Enter
   Get(User_Number); 

   New_Line; 
   Put("Securely received input: " & Integer'Image(User_Number)); 

   -- If they type a letter instead of a number, Ada safely crashes 
   -- with a Data_Error instead of letting memory get corrupted!
end Lesson_4;
