compra_valida = False
while not compra_valida:
    dato = input("Ingrese el monto total de la compra: ")
    if dato.replace(".", "", 1).isdigit():
        monto_compra = float(dato)
        if monto_compra >= 0:
            compra_valida = True
        else:
            print("El monto no puede ser negativo.")
    else:
        print("Entrada inválida. Ingrese un número válido.")

vip_valido = False
while not vip_valido:
    dato = input("¿Es usted miembro VIP? (True/False): ")
    if dato == "True" or dato == "False":
        es_vip = (dato == "True")
        vip_valido = True
    else:
        print("Entrada inválida. Escriba True o False.")

codigo_valido = False
while not codigo_valido:
    dato = input("¿Tiene un código de descuento especial? (True/False): ")
    if dato == "True" or dato == "False":
        tiene_codigo = (dato == "True")
        codigo_valido = True
    else:
        print("Entrada inválida. Escriba True o False.")

descuento_total = 0

if monto_compra > 100:
    descuento_total = descuento_total + 0.20

if es_vip:
    descuento_total = descuento_total + 0.10

if tiene_codigo:
    descuento_total = descuento_total + 0.05

monto_con_descuento = monto_compra * (1 - descuento_total)

print("Monto original:", monto_compra)
print("Descuento total aplicado:", descuento_total * 100, "%")
print("Total a pagar después de los descuentos:", monto_con_descuento)