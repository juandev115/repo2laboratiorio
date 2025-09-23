nivel_acceso_requerido = 3  

nivel_valido = False
while not nivel_valido:
    dato = input("Ingrese su nivel de acceso (0-5): ")
    if dato.isdigit():
        nivel_acceso_usuario = int(dato)
        if 0 <= nivel_acceso_usuario <= 5:
            nivel_valido = True
        else:
            print("Debe ingresar un número entre 0 y 5.")
    else:
        print("Entrada inválida. Ingrese un número entero.")

tarjeta_valida = False
while not tarjeta_valida:
    dato = input("¿Su tarjeta está activa? (True/False): ")
    if dato == "True" or dato == "False":
        tarjeta_activa = (dato == "True")
        tarjeta_valida = True
    else:
        print("Entrada inválida. Escriba True o False.")

contrasena_valida = False
while not contrasena_valida:
    dato = input("¿Cambió su contraseña en los últimos 30 días? (True/False): ")
    if dato == "True" or dato == "False":
        contrasena_reciente = (dato == "True")
        contrasena_valida = True
    else:
        print("Entrada inválida. Escriba True o False.")

if nivel_acceso_usuario >= nivel_acceso_requerido and tarjeta_activa and contrasena_reciente:
    print("Acceso permitido.")
else:
    print("Acceso denegado.")
