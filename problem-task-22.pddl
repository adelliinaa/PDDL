(define (problem waiting-22) 
	(:domain waiting)
	(:objects
	UF - location
	MB - location
	UB - location
	MF - location
	LF - location
	LB - location
	
	C - customer
	P - plate
	)
	    
	(:init
	(Adjacent UF BUFF)
	(Adjacent BUFF UF)
	(Adjacent UF UB)
	(Adjacent MF LF)
	(Adjacent LF MF)
	(Adjacent MB LB)
	(Adjacent LB LF)
	(Adjacent LF LB)
	(Adjacent UB UF)
	(Adjacent MB UB)
	(Adjacent UB MB)
	(Adjacent LB MB)
	(Adjacent UF MF)
	(Adjacent MF UF)
	
	(At Agent BUFF)
	(At P BUFF)
	(At C LB)
	
	)
	    
	(:goal
	(Served C)
	)
	)
	
	
	


