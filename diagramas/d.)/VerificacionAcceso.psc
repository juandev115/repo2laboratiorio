Algoritmo CalculoDescuento
	// --- Variables ---
	Definir monto_compra Como Real
	Definir es_vip, tiene_codigo Como Lógico
	Definir compra_valida, vip_valido, codigo_valido Como Lógico
	Definir descuento_total Como Real
	Definir monto_con_descuento Como Real
	Definir dato Como Cadena
	// --- Entrada y validación del monto ---
	compra_valida <- Falso
	Mientras  NO compra_valida Hacer // Necesario para leer la entrada de texto
		Escribir 'Ingrese el monto total de la compra: 'Sin Saltar
		Leer monto_compra
		Si monto_compra>=0 Entonces
			compra_valida <- Verdadero
		SiNo
			Escribir 'El monto no puede ser negativo.'
		FinSi
	FinMientras
	// --- Entrada y validación de VIP ---
	vip_valido <- Falso
	Mientras  NO vip_valido Hacer
		Escribir '¿Es usted miembro VIP? (V/F): 'Sin Saltar
		Leer dato
		dato <- Mayusculas(dato)
		Si dato='V' Entonces
			es_vip <- Verdadero
			vip_valido <- Verdadero
		SiNo
			Si dato='F' Entonces
				es_vip <- Falso
				vip_valido <- Verdadero
			SiNo
				Escribir 'Entrada inválida. Escriba V o F.'
			FinSi
		FinSi
	FinMientras
	// --- Entrada y validación de código de descuento ---
	codigo_valido <- Falso
	Mientras  NO codigo_valido Hacer
		Escribir '¿Tiene un código de descuento especial? (V/F): 'Sin Saltar
		Leer dato
		dato <- Mayusculas(dato)
		Si dato='V' Entonces
			tiene_codigo <- Verdadero
			codigo_valido <- Verdadero
		SiNo
			Si dato='F' Entonces
				tiene_codigo <- Falso
				codigo_valido <- Verdadero
			SiNo
				Escribir 'Entrada inválida. Escriba V o F.'
			FinSi
		FinSi
	FinMientras
	// --- Cálculo del descuento ---
	descuento_total <- 0
	Si monto_compra>100 Entonces
		descuento_total <- descuento_total+0.20
	FinSi
	Si es_vip Entonces
		descuento_total <- descuento_total+0.10
	FinSi
	Si tiene_codigo Entonces
		descuento_total <- descuento_total+0.05
	FinSi
	monto_con_descuento <- monto_compra*(1-descuento_total)
	// --- Resultados ---
	Escribir 'Monto original:', monto_compra
	Escribir 'Descuento total aplicado:', descuento_total*100, '%'
	Escribir 'Total a pagar después de los descuentos:', monto_con_descuento
FinAlgoritmo
