Algoritmo CalculoVolumenEsfera
	// --- Variables ---
	Definir radio Como Real
	Definir radio_valido Como L�gico
	Definir volumen Como Real
	// --- Inicializaci�n ---
	radio_valido <- Falso
	// --- Entrada y Validaci�n ---
	Mientras  NO radio_valido Hacer
		Escribir 'El volumen de la pelota es: ', volumen
		Leer radio
		Si radio>0 Entonces
			radio_valido <- Verdadero
		SiNo
			Escribir 'El radio debe ser mayor a 0.'
		FinSi
	FinMientras
	// --- C�lculo del Volumen ---
	// En PSeInt la divisi�n de enteros (4/3) puede truncarse,
	// as� que se usa 4.0/3.0 para asegurar el resultado decimal.
	volumen <- (4.0/3.0)*PI*(radio^3)
	// --- Salida ---
	Escribir 'El volumen de la pelota es:', volumen
FinAlgoritmo
