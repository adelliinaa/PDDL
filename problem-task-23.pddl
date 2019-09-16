(define (problem waiting-23) 
	(:domain waiting)
	(:objects
	UF - location
	MB - location
	UB - location
	MF - location
	LF - location
	LB - location
	
	C1 - customer
	C2 - customer
	P1 - plate
	P2 - plate
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
	
	(At Agent MF)
	(At C1 UB)
	(At P1 MB)
	(At P2 LB)
	(At C2 LF)
	)
	    
	(:goal (and
	(Served C1)
	(Served C2)
	(At Agent BUFF)
	))

	)
	
	
	

