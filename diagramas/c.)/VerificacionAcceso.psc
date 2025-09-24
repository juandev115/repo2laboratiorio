Algoritmo VerificacionAcceso
	// --- Variables ---
	Definir nivel_acceso_requerido Como Entero
	Definir nivel_acceso_usuario Como Entero
	Definir tarjeta_activa Como Lógico
	Definir contrasena_reciente Como Lógico
	Definir nivel_valido, tarjeta_valida, contrasena_valida Como Lógico
	Definir dato Como Cadena
	// --- Inicialización ---
	nivel_acceso_requerido <- 3 // Necesario para leer la entrada de texto
	// --- Nivel de acceso ---
	nivel_valido <- Falso
	Mientras  NO nivel_valido Hacer
		Escribir 'Ingrese su nivel de acceso (0-5): 'Sin Saltar
		Leer nivel_acceso_usuario
		Si nivel_acceso_usuario>=0 Y nivel_acceso_usuario<=5 Entonces
			nivel_valido <- Verdadero
		SiNo
			Escribir 'Debe ingresar un número entre 0 y 5.'
		FinSi
	FinMientras
	// --- Tarjeta activa ---
	tarjeta_valida <- Falso
	Mientras  NO tarjeta_valida Hacer
		Escribir '¿Su tarjeta está activa? (V/F): 'Sin Saltar
		Leer dato
		dato <- Mayusculas(dato) // Leemos la entrada como texto para validarla
		Si dato='V' Entonces
			tarjeta_activa <- Verdadero
			tarjeta_valida <- Verdadero
		SiNo
			Si dato='F' Entonces
				tarjeta_activa <- Falso
				tarjeta_valida <- Verdadero
			SiNo
				Escribir 'Entrada inválida. Escriba V o F.'
			FinSi
		FinSi
	FinMientras
	// --- Contraseña reciente ---
	contrasena_valida <- Falso
	Mientras  NO contrasena_valida Hacer
		Escribir '¿Cambió su contraseña en los últimos 30 días? (V/F): 'Sin Saltar
		Leer dato
		dato <- Mayusculas(dato)
		Si dato='V' Entonces
			contrasena_reciente <- Verdadero
			contrasena_valida <- Verdadero
		SiNo
			Si dato='F' Entonces
				contrasena_reciente <- Falso
				contrasena_valida <- Verdadero
			SiNo
				Escribir 'Entrada inválida. Escriba V o F.'
			FinSi
		FinSi
	FinMientras
	// --- Lógica de acceso ---
	Si nivel_acceso_usuario>=nivel_acceso_requerido Y tarjeta_activa Y contrasena_reciente Entonces
		Escribir 'Acceso permitido.'
	SiNo
		Escribir 'Acceso denegado.'
	FinSi
FinAlgoritmo
