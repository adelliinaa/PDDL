(define (problem waiting-32) 
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
	B - broom
	
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
	(not (HoldingSomething Agent))
	(At P BUFF)
	(At C LB)
	(At B UB)
	(BrokenPlateAt MF)
	(BrokenPlateAt MB)
	(DroppedFoodAt UF)
	
	)
	    
	(:goal (and
	(Served C)
	(At Agent BUFF)
	        
	(not (or (BrokenPlateAt UB) (DroppedFoodAt UB)))
	(not (or (BrokenPlateAt MB) (DroppedFoodAt MB)))
	(not (or (BrokenPlateAt MF) (DroppedFoodAt MF)))
	(not (or (BrokenPlateAt LB) (DroppedFoodAt LB)))
	(not (or (BrokenPlateAt LF) (DroppedFoodAt LF)))
	(not (or (BrokenPlateAt UF) (DroppedFoodAt UF)))
	))
	)
