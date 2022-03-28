(deffacts data 
	(pedido NARANJAS 2 MANZANAS 3 CAQUIS 0 UVA 1)
	(entregado NARANJAS 2 MANZANAS 3 CAQUIS 0 UVA 1)

	(almacen NARANJAS 10 MANZANAS 10 CAQUIS 10 UVA 10)

	(robot NARANJAS 0 MANZANAS 0 CAQUIS 0 UVA 0)
)

(defrule move-up
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	(not (obstacle ?x =(+ ?y 1) ))
	(dimension ?column ?row)
		(test (<> (+ ?y 1) (+ ?row 1)))
	=>
	(assert (posRobot ?x (+ ?y 1) ?b ))
	(printout t "muevo arriba " crlf)
)