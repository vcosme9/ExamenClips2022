(deffacts data 
	(pedido NARANJAS 2 MANZANAS 3 CAQUIS 0 UVA 1)
	(entregado NARANJAS 0 MANZANAS 0 CAQUIS 0 UVA 0)

	(almacen NARANJAS 10 MANZANAS 10 CAQUIS 10 UVA 10)
)

(defrule entrega-completa
	(declare (salience 10))
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	=>
	(printout t "PEDIDO ENTREGADO CON EXITO " crlf)
)

(defrule muevo-naranjas
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c_e UVA ?u_e)
	?f3 <- (almacen NARANJAS ?n_a MANZANAS ?m_a CAQUIS ?c_a UVA ?u_a)
		(test (< ?n 3))
		(test (> ?n 0))
		(test (> ?n_a 0))
	=>
	(assert (entregado NARANJAS ?n MANZANAS ?m_e CAQUIS ?c_e UVA ?u_e))
	(assert (almacen NARANJAS (- ?n_a ?n) MANZANAS ?m_a CAQUIS ?c_a UVA ?u_a))
	(printout t "Me llevo las naranajas " crlf)
)

(defrule muevo-manzanas
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c_e UVA ?u_e)
	?f3 <- (almacen NARANJAS ?n_a MANZANAS ?m_a CAQUIS ?c_a UVA ?u_a)
		(test (< ?m 3))
		(test (> ?m 0))
		(test (> ?m_a 0))
	=>
	(assert (entregado NARANJAS ?n_e MANZANAS ?m CAQUIS ?c_e UVA ?u_e))
	(assert (almacen NARANJAS ?n_a MANZANAS (- ?m_a ?m) CAQUIS ?c_a UVA ?u_a))
	(printout t "Me llevo las manzanas " crlf)
)

(defrule muevo-caquis
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c_e UVA ?u_e)
	?f3 <- (almacen NARANJAS ?n_a MANZANAS ?n_a CAQUIS ?c_a UVA ?u_a)
		(test (< ?c 3))
		(test (> ?c 0))
		(test (> ?c_a 0))
	=>
	(assert (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c UVA ?u_e))
	(assert (almacen NARANJAS ?n_a MANZANAS ?m_a CAQUIS ?n_a UVA ?n_a))
	(printout t "Me llevo los caquis " crlf)
)

(defrule muevo-uvas
	?f1 <- (pedido NARANJAS ?n MANZANAS ?m CAQUIS ?c UVA ?u)
	?f2 <- (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c_e UVA ?u_e)
	?f3 <- (almacen NARANJAS ?n_a MANZANAS ?n_a CAQUIS ?n_a UVA ?n_a)
		(test (< ?u 3))
		(test (> ?u 0))
		(test (> ?u_a 0))
	=>
	(assert (entregado NARANJAS ?n_e MANZANAS ?m_e CAQUIS ?c_e UVA ?u))
	(printout t "Me llevo los caquis " crlf)
)