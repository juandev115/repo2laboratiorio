dias_asignados = float(input("Ingrese los días asignados para la tarea: "))
dias_retraso = float(input("Ingrese los días de retraso de la tarea: "))

porcentaje_retraso = (dias_retraso / dias_asignados) * 100

print("Días de retraso:", dias_retraso)
print("Porcentaje de retraso:", porcentaje_retraso, "%")