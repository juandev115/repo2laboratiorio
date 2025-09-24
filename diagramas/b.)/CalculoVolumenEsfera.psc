Algoritmo CalculoVolumenEsfera
	// --- Variables ---
	Definir radio Como Real
	Definir radio_valido Como Lógico
	Definir volumen Como Real
	// --- Inicialización ---
	radio_valido <- Falso
	// --- Entrada y Validación ---
	Mientras  NO radio_valido Hacer
		Escribir 'El volumen de la pelota es: ', volumen
		Leer radio
		Si radio>0 Entonces
			radio_valido <- Verdadero
		SiNo
			Escribir 'El radio debe ser mayor a 0.'
		FinSi
	FinMientras
	// --- Cálculo del Volumen ---
	// En PSeInt la división de enteros (4/3) puede truncarse,
	// así que se usa 4.0/3.0 para asegurar el resultado decimal.
	volumen <- (4.0/3.0)*PI*(radio^3)
	// --- Salida ---
	Escribir 'El volumen de la pelota es:', volumen
FinAlgoritmo
