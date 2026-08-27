with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
-- Lesson 3 we will be learning how to use if and else statements to check our variables signature number!
-- Get ready! 
-- Shoutout to: @SrTortugardo 
-- Start with your procedure 
procedure Lesson_3 is 
-- Remeber to define your variable!
X : Integer := 0; -- Set to 1 to check the else statement! 
-- Let's start the begin block
begin 
  -- Start if statements here!
  if X = 0 then 
  Put_Line("X Signature Matches and equals: " & Integer'Image(X)); 
-- Lets add our else statement!
else Put_Line("X signature does not match and is equal to: " & Integer'Image(X)); 
-- You do not need to end a else statement so dont do it! it will make GNAT or ALIRE throw a fit.
-- Make sure you end your procedure Lesson_3! 
 end if; -- Add you end if here 
end Lesson_3; 
