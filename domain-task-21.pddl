(define (domain waiting)
	    (:requirements :adl )
	    
	    (:types
	        waiter
	        location
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
	        (Holding ?a - waiter ?p - plate)
	        (HoldingPlateOrBroom ?a)
	        (HasFood ?p - plate)
	
	    )

	    (:action PickUp
	        :parameters (?a - waiter ?p - plate ?l - location)
	        :precondition (and
	            (not (HoldingPlateOrBroom ?a))
	            (At ?a ?l)
	            (At ?p ?l)
	        )
	        :effect (and
	            (not (At ?p ?l))
	            (Holding ?a ?p)
	            (HoldingPlateOrBroom ?a)
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
	        )
	        :effect (and
	            (At ?a ?g)
	            (not (At ?a ?l))
	        )
	    )
	)


