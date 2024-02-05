code echoPrime

-- This program is used for Project 2 and is an implementation of printing the characters recieved from GetCh 
var count:int
function main ()
	var c:char
	count = 0
      	print ("Welcome to echoPrime\n")
      	while true
      		c = GetCh()
      	 	if c == 'q' && count == 0  
      	  		printChar(c) 
      	  		count = count + 1
      	  		debug   
      	 	else
      	 		printChar(c)
      	 		count = count + 1
      	 	endIf	 	 
      	endWhile
endFunction
endCode
