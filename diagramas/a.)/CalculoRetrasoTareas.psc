Algoritmo CalculoRetrasoTareas
	// --- Variables ---
	Definir dia, mes, anio Como Entero
	Definir dia2, mes2, anio2 Como Entero
	Definir es_bisiesto, es_bisiesto2 Como Lógico
	Definir max_dia, max_dia2 Como Entero
	Definir valido Como Lógico
	Definir m Como Entero
	Definir leaps_antes, dias_mes_antes Como Entero
	Definir leaps_antes2, dias_mes_antes2 Como Entero
	Definir a1, a2, a3, b1, b2, b3 Como Entero
	Definir ordinal_limite, ordinal_real Como Entero
	Definir retraso_dias Como Entero
	Definir tiempo_total Como Entero
	Definir porcentaje Como Real
	Definir porcentaje_mostrado Como Real
	Escribir '=== Cálculo de retraso en tareas ==='
	// --- Fecha límite ---
	valido <- Falso
	Mientras  NO valido Hacer
		Escribir 'Fecha límite - Día (1-31): 'Sin Saltar
		Leer dia
		Escribir 'Fecha límite - Mes (1-12): 'Sin Saltar
		Leer mes
		Escribir 'Fecha límite - Año (ej. 2025): 'Sin Saltar
		Leer anio
		Si mes<1 O mes>12 Entonces
			Escribir 'Mes fuera de rango (1-12).'
		SiNo
			es_bisiesto <- ((anio MOD 4=0) Y (anio MOD 100<>0)) O (anio MOD 400=0)
			Si mes=1 O mes=3 O mes=5 O mes=7 O mes=8 O mes=10 O mes=12 Entonces
				max_dia <- 31
			SiNo
				Si mes=4 O mes=6 O mes=9 O mes=11 Entonces
					max_dia <- 30
				SiNo
					Si es_bisiesto Entonces
						max_dia <- 29
					SiNo
						max_dia <- 28
					FinSi
				FinSi
			FinSi
			Si dia<1 O dia>max_dia Entonces
				Escribir 'Día fuera de rango para el mes indicado.'
			SiNo
				valido <- Verdadero
			FinSi
		FinSi
	FinMientras
	// --- Fecha real ---
	valido <- Falso
	Mientras  NO valido Hacer
		Escribir 'Fecha real de entrega - Día (1-31): 'Sin Saltar
		Leer dia2
		Escribir 'Fecha real de entrega - Mes (1-12): 'Sin Saltar
		Leer mes2
		Escribir 'Fecha real de entrega - Año (ej. 2025): 'Sin Saltar
		Leer anio2
		Si mes2<1 O mes2>12 Entonces
			Escribir 'Mes fuera de rango (1-12).'
		SiNo
			es_bisiesto2 <- ((anio2 MOD 4=0) Y (anio2 MOD 100<>0)) O (anio2 MOD 400=0)
			Si mes2=1 O mes2=3 O mes2=5 O mes2=7 O mes2=8 O mes2=10 O mes2=12 Entonces
				max_dia2 <- 31
			SiNo
				Si mes2=4 O mes2=6 O mes2=9 O mes2=11 Entonces
					max_dia2 <- 30
				SiNo
					Si es_bisiesto2 Entonces
						max_dia2 <- 29
					SiNo
						max_dia2 <- 28
					FinSi
				FinSi
			FinSi
			Si dia2<1 O dia2>max_dia2 Entonces
				Escribir 'Día fuera de rango para el mes indicado.'
			SiNo
				valido <- Verdadero
			FinSi
		FinSi
	FinMientras
	// --- Conversión a ordinal (pasos para evitar expresiones largas) ---
	a1 <- Trunc((anio-1)/4)
	a2 <- Trunc((anio-1)/100)
	a3 <- Trunc((anio-1)/400)
	dias_mes_antes <- 0
	m <- 1
	Mientras m<mes Hacer
		Si m=1 O m=3 O m=5 O m=7 O m=8 O m=10 O m=12 Entonces
			dias_mes_antes <- dias_mes_antes+31
		SiNo
			Si m=4 O m=6 O m=9 O m=11 Entonces
				dias_mes_antes <- dias_mes_antes+30
			SiNo
				Si es_bisiesto Entonces
					dias_mes_antes <- dias_mes_antes+29
				SiNo
					dias_mes_antes <- dias_mes_antes+28
				FinSi
			FinSi
		FinSi
		m <- m+1
	FinMientras
	ordinal_limite <- anio*365+leaps_antes+dias_mes_antes+dia
	b1 <- Trunc((anio2-1)/4)
	b2 <- Trunc((anio2-1)/100)
	b3 <- Trunc((anio2-1)/400)
	dias_mes_antes2 <- 0
	m <- 1
	Mientras m<mes2 Hacer
		Si m=1 O m=3 O m=5 O m=7 O m=8 O m=10 O m=12 Entonces
			dias_mes_antes2 <- dias_mes_antes2+31
		SiNo
			Si m=4 O m=6 O m=9 O m=11 Entonces
				dias_mes_antes2 <- dias_mes_antes2+30
			SiNo
				Si es_bisiesto2 Entonces
					dias_mes_antes2 <- dias_mes_antes2+29
				SiNo
					dias_mes_antes2 <- dias_mes_antes2+28
				FinSi
			FinSi
		FinSi
		m <- m+1
	FinMientras
	ordinal_real <- anio2*365+leaps_antes2+dias_mes_antes2+dia2
	// --- Calcular retraso ---
	retraso_dias <- ordinal_real-ordinal_limite
	Si retraso_dias<0 Entonces
		retraso_dias <- 0
	FinSi
	// --- Tiempo total ---
	valido <- Falso
	Mientras  NO valido Hacer
		Escribir 'Ingrese el tiempo total asignado a la tarea (en días, > 0): 'Sin Saltar
		Leer tiempo_total
		Si tiempo_total<=0 Entonces
			Escribir 'El tiempo asignado debe ser mayor que 0.'
		SiNo
			valido <- Verdadero
		FinSi
	FinMientras
	// --- Porcentaje ---
	porcentaje <- 0.0
	Si tiempo_total>0 Entonces
		porcentaje <- (retraso_dias/tiempo_total)*100
	FinSi
	// --- Resultados ---
	Escribir ''
	Escribir '--- Resultados ---'
	porcentaje_mostrado <- Trunc(porcentaje*100)/100
	Escribir 'Días de retraso: ', retraso_dias
	Escribir 'Porcentaje de retraso respecto al tiempo asignado: ', porcentaje_mostrado, '%'
FinAlgoritmo
