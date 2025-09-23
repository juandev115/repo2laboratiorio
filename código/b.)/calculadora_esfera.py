pi = 3.14159

radio_valido = False
while not radio_valido:
    dato = input("Ingrese el radio de la pelota (esfera): ")
    if dato.replace(".", "", 1).isdigit():  # permite números con punto decimal
        radio = float(dato)
        if radio > 0:
            radio_valido = True
        else:
            print("El radio debe ser mayor a 0.")
    else:
        print("Entrada inválida. Ingrese un número válido.")

volumen = (4/3) * pi * (radio**3)
print("El volumen de la pelota es:", volumen)