(define (domain waiting)
	    (:requirements :adl )
	    
	    (:types
	        waiter
	        location
	        broom
	        plate
	        customer
	    )
	    
	    (:constants 
	        Agent - waiter
	        BUFF - location
	    )
	    
	    (:predicates
	      
	        (Adjacent ?loc1 - location ?loc2 - location)
	        (At ?x - object ?y - location)
	        (Served ?c - customer)
	        (Holding ?a - waiter ?o - object) 
	        (HoldingPlateOrBroom ?a)
	        (HasFood ?p - plate)
	        (BrokenPlateAt ?l - location)
	        (DroppedFoodAt ?l - location)
	
	    )

	    (:action PickUp
	        :parameters (?a - waiter ?o - object ?l - location)
	        :precondition (and
	            (not (HoldingPlateOrBroom ?a))
	            (At ?a ?l)
	            (At ?o ?l)
	        )
	        :effect (and
	            (not (At ?o ?l))
	            (Holding ?a ?o)
	            (HoldingPlateOrBroom ?a)
	        )
	    )
	    
	    (:action PutDown
	        :parameters (?a - waiter ?o - object ?l - location)
	        :precondition (and
	            (At ?a ?l)
	            (Holding ?a ?o)
	        )
	        :effect (and
	            (At ?o ?l)
	            (not (Holding ?a ?o))
	            (not (HoldingPlateOrBroom ?a))
	        )
	    )
	
	    (:action HandOver
	        :parameters (?a - waiter ?p - plate ?l - location ?c - customer)
	        :precondition (and
	            (not (Served ?c))
	            (At ?a ?l)
	            (At ?c ?l)
	            (Holding ?a ?p)
	            (not (At ?p ?l))
	            (HasFood ?p)
	        )
	        :effect (and
	            (not (Holding ?a ?p))
	            (not (HoldingPlateOrBroom ?a))
	            (Served ?c)
	        )
	    )
	
	    (:action Fill
	        :parameters (?a - waiter ?p - plate)
	        :precondition (and
	            (not (HasFood ?p))
	            (At ?a BUFF)
	            (Holding ?a ?p)
	            (HoldingPlateOrBroom ?a)
	        )
	        :effect (and
	            (HasFood ?p)
	        )
	    )
	
	    (:action Move
	        :parameters (?a - waiter ?l - location ?g - location)
	        :precondition (and
	            (Adjacent ?l ?g)
	            (At ?a ?l)
	            (not (= ?l ?g))
	            (not (BrokenPlateAt ?g)) ;new check for a broken plate at the goal before moving
	        )
	        :effect (and
	            (At ?a ?g)
	            (not (At ?a ?l))
	        )
	    )
	
	    (:action SweepUp
	        :parameters (?a - waiter ?al - location ?rl - location ?b - broom)
	        :precondition (and
	            (Adjacent ?al ?rl)
	            (At ?a ?al)
	            (not (= ?al ?rl))
	            (Holding ?a ?b)
	                (or
	                    (DroppedFoodAt ?rl)
	                    (BrokenPlateAt ?rl)
	                )
	        )
	        :effect (and
	        (not (BrokenPlateAt ?rl))
	        (not (DroppedFoodAt ?rl))
	        )
	    )
	
	)
	
	
	


