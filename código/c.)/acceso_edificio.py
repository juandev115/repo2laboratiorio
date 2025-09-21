nivel_acceso_requerido = 3 

nivel_acceso_usuario = int(input("Ingrese su nivel de acceso (0-5): "))
tarjeta_activa = input("¿Su tarjeta está activa? (True/False): ") == 'True'
contrasena_reciente = input("¿Cambió su contraseña en los últimos 30 días? (True/False): ") == 'True'

if nivel_acceso_usuario >= nivel_acceso_requerido and tarjeta_activa and contrasena_reciente:
    print("Acceso permitido.")
else:
    print("Acceso denegado.")