# Cálculo de días de retraso y porcentaje respecto al tiempo asignado
# Código robusto sin funciones ni listas/tuplas; usa while para validación.

print("=== Cálculo de retraso en tareas ===")

# --- Fecha límite ---
valido = False
while not valido:
    dia_s = input("Fecha límite - Día (1-31): ").strip()
    if not dia_s.isdigit():
        print("Entrada inválida para el día. Intente de nuevo.")
        continue
    dia = int(dia_s)

    mes_s = input("Fecha límite - Mes (1-12): ").strip()
    if not mes_s.isdigit():
        print("Entrada inválida para el mes. Intente de nuevo.")
        continue
    mes = int(mes_s)

    anio_s = input("Fecha límite - Año (ej. 2025): ").strip()
    if not anio_s.isdigit():
        print("Entrada inválida para el año. Intente de nuevo.")
        continue
    anio = int(anio_s)

    if mes < 1 or mes > 12:
        print("Mes fuera de rango (1-12).")
        continue

    # determinar si es año bisiesto
    es_bisiesto = (anio % 4 == 0 and (anio % 100 != 0 or anio % 400 == 0))

    # determinar días máximos del mes
    if mes == 1 or mes == 3 or mes == 5 or mes == 7 or mes == 8 or mes == 10 or mes == 12:
        max_dia = 31
    elif mes == 4 or mes == 6 or mes == 9 or mes == 11:
        max_dia = 30
    else:  # mes == 2
        if es_bisiesto:
            max_dia = 29
        else:
            max_dia = 28

    if dia < 1 or dia > max_dia:
        print("Día fuera de rango para el mes indicado.")
        continue

    valido = True

# --- Fecha de finalización real ---
valido = False
while not valido:
    dia2_s = input("Fecha real de entrega - Día (1-31): ").strip()
    if not dia2_s.isdigit():
        print("Entrada inválida para el día. Intente de nuevo.")
        continue
    dia2 = int(dia2_s)

    mes2_s = input("Fecha real de entrega - Mes (1-12): ").strip()
    if not mes2_s.isdigit():
        print("Entrada inválida para el mes. Intente de nuevo.")
        continue
    mes2 = int(mes2_s)

    anio2_s = input("Fecha real de entrega - Año (ej. 2025): ").strip()
    if not anio2_s.isdigit():
        print("Entrada inválida para el año. Intente de nuevo.")
        continue
    anio2 = int(anio2_s)

    if mes2 < 1 or mes2 > 12:
        print("Mes fuera de rango (1-12).")
        continue

    es_bisiesto2 = (anio2 % 4 == 0 and (anio2 % 100 != 0 or anio2 % 400 == 0))

    if mes2 == 1 or mes2 == 3 or mes2 == 5 or mes2 == 7 or mes2 == 8 or mes2 == 10 or mes2 == 12:
        max_dia2 = 31
    elif mes2 == 4 or mes2 == 6 or mes2 == 9 or mes2 == 11:
        max_dia2 = 30
    else:
        if es_bisiesto2:
            max_dia2 = 29
        else:
            max_dia2 = 28

    if dia2 < 1 or dia2 > max_dia2:
        print("Día fuera de rango para el mes indicado.")
        continue

    valido = True

# --- Convertir cada fecha a número ordinal (días desde año 0) ---
# calcular saltos de años bisiestos hasta el año anterior
leaps_antes = (anio - 1) // 4 - (anio - 1) // 100 + (anio - 1) // 400
dias_mes_antes = 0
m = 1
while m < mes:
    if m == 1 or m == 3 or m == 5 or m == 7 or m == 8 or m == 10 or m == 12:
        dias_mes_antes += 31
    elif m == 4 or m == 6 or m == 9 or m == 11:
        dias_mes_antes += 30
    else:  # febrero
        if es_bisiesto:
            dias_mes_antes += 29
        else:
            dias_mes_antes += 28
    m += 1

ordinal_limite = anio * 365 + leaps_antes + dias_mes_antes + dia

leaps_antes2 = (anio2 - 1) // 4 - (anio2 - 1) // 100 + (anio2 - 1) // 400
dias_mes_antes2 = 0
m = 1
while m < mes2:
    if m == 1 or m == 3 or m == 5 or m == 7 or m == 8 or m == 10 or m == 12:
        dias_mes_antes2 += 31
    elif m == 4 or m == 6 or m == 9 or m == 11:
        dias_mes_antes2 += 30
    else:
        if es_bisiesto2:
            dias_mes_antes2 += 29
        else:
            dias_mes_antes2 += 28
    m += 1

ordinal_real = anio2 * 365 + leaps_antes2 + dias_mes_antes2 + dia2

# --- Calcular retraso ---
retraso_dias = ordinal_real - ordinal_limite
if retraso_dias < 0:
    retraso_dias = 0  # sin retraso si se entregó antes o en la fecha límite

# --- Tiempo total asignado ---
valido = False
while not valido:
    tiempo_s = input("Ingrese el tiempo total asignado a la tarea (en días, > 0): ").strip()
    if not tiempo_s.isdigit():
        print("Entrada inválida. Ingrese un número entero positivo.")
        continue
    tiempo_total = int(tiempo_s)
    if tiempo_total <= 0:
        print("El tiempo asignado debe ser mayor que 0.")
        continue
    valido = True

# --- Porcentaje de retraso ---
porcentaje = 0.0
if tiempo_total > 0:
    porcentaje = (retraso_dias / tiempo_total) * 100

# --- Resultados ---
print("\n--- Resultados ---")
print("Días de retraso:", retraso_dias)
print("Porcentaje de retraso respecto al tiempo asignado: {:.2f}%".format(porcentaje))
