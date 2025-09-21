monto_compra = float(input("Ingrese el monto total de la compra: "))
es_vip = input("¿Es usted miembro VIP? (True/False): ") == 'True'
tiene_codigo = input("¿Tiene un código de descuento especial? (True/False): ") == 'True'

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