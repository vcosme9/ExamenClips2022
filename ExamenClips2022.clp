(deffacts data 
	(pedido NARANJAS 2 MANZANAS 3 CAQUIS 0 UVA 1)
	(entregado NARANJAS 0 MANZANAS 0 CAQUIS 0 UVA 0)

	(almacen NARANJAS 10 MANZANAS 10 CAQUIS 10 UVA 10)

	(robot NARANJAS 0 MANZANAS 0 CAQUIS 0 UVA 0)
)

(defrule entrega-completa
	(declare (salience 10))
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	=>
	(printout t "PEDIDO ENTREGADO CON EXITO " crlf)
)

(defrule move-left
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)

	?f2 <- (robot NARANJAS ?nr MANZANAS ?mr CAQUIS ?cr UVA ?ur)
		(test (< (+ (+ ?nr ?mr) (+ ?cr ?ur)) 3))
		(test (< ?n 3))
	=>
	(assert (robot NARANJAS ?n MANZANAS ?mr CAQUIS ?cr UVA ?ur))
	(printout t "muevo izquierda " crlf)
)