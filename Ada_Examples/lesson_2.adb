with Ada.Text_IO; use Ada.Text_IO; 
-- Today we are printing the variables. 
-- We will introduce a new library.
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; -- This will help us print variables cleanly later.
-- Add procedure "Lesson_2" 
procedure Lesson_2 is 
-- Define Variables like we did from Lesson_1! 
X : Integer := 0; -- This sets the value of X to 0! 
-- Let's start printing them! 
begin 
  Put_Line("The value of X is: " & Integer'Image(X)); -- This will cleanly print X along with the Text in Put_Line!
  -- Make sure you use end Lesson_2; 
end Lesson_2;
-- And Run it! If you don't know how to check the preperation page! 
-- Enjoy! 
