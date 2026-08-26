import sys
import time 
# Define typewriter 
def typewriter(text, delay=0.05): # Add Colon at the end "Always" 
  for char in text: 
   sys.stdout.write(char) 
   sys.stdout.flush() 
   time.sleep(delay) 
print() # Add new line at the end for cleaner output. 
typewriter("Your text here") # Enjoy your typewriter (: 
