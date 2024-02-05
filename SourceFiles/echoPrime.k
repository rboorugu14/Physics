code echoPrime

var count:int
function main ()
	var c:char
	count = 0
	print ("echoPrime\n")
	while true
		c = getCh ()
		if c == 'q' && count == 0
			count = count+1
			printChar(c)
			debug
		else
			count = count+1
			printChar(c)
		endIf
	endWhile
endFunction
endCode
