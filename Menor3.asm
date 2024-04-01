.data		                    			# Sección para declarar variables
msg1: .asciiz "Ingresa 3 números para comparar:\n"	# Declara una cadena de caracteres
msg2: .asciiz "De estos 3 números el número menor es: " 	# Declara una cadena de caracteres

.text						# Sección de código
main:						# Sección de código principal
    li $v0, 4           				# Código de servicio 4 para imprimir una cadena
    la $a0, msg1         			# Carga la dirección de la cadena en $a0
    syscall             				# Llama al sistema para imprimir
    
    li $v0, 5					# Código de servicio 5 para leer un entero
    syscall					# Llama al sistema para leer un entero
    
    move $t0, $v0				# Mueve el entero ingresado al registro $t0
    
    li $v0, 5					# Código de servicio 5 para leer un entero
    syscall					# Llama al sistema para leer un entero
    
    move $t1, $v0				# Mueve el entero ingresado al registro $t1
    
    li $v0, 5					# Código de servicio 5 para leer un entero
    syscall					# Llama al sistema para leer un entero
    
    move $t2, $v0				# Mueve el entero ingresado al registro $t2
    
    li $v0, 4					# Código de servicio 4 para imprimir una cadena
    la $a0, msg2					# Carga la dirección de la cadena en $a0
    syscall					# Llama al sistema para imprimir
    
    ble $t0, $t1, comp1				# Si $t0 es menor o igual a $t1 va a la sección comp1, de lo contrario continúa
    move $t3, $t1				# Mueve al registro $t3 el valor de $t1, ya que este es menor que $t0
    j comp1f					# Salta al final del código de la comparación entre $t0 y $t1

comp1:						# Aquí llega si $t0 es menor o igual a $t1
    move $t3, $t0				# Mueve a $t3 el valor de $t0, ya que es menor o igual a $t1
    j comp1f					# Salta al final del código de la comparación entre $t0 y $t1
    
comp1f:						# Aquí ya terminó la comparación entre $t0 y $t1
    ble $t2, $t3, comp2				# Comparamos $t2 con el menor entre $t0 y $t1 que está en $t3
    j comp2f					# Aquí $t2 es mayor que $t3, entonces pasamos al final de esta comparación
    
comp2:						# Aquí llegamos si $t2 es menor o igual a $t3
    move $t3, $t2				# Movemos a $t3 el valor de $t2 por ser menor
    j comp2f					# Pasamos al final de la segunda comparación
    
comp2f:						# Hemos comparado $t0, $t1 y $t2 y el menor está en $t3
    li $v0, 1					# Código de servicio 1 para imprimir un entero
    move $a0, $t3				# Carga el valor del entero desde $t3 a $a0
    syscall					# Llama al sistema para imprimir
    
    # Finalizar el programa
    li $v0, 10          				# Código de servicio 10 para terminar la ejecución
    syscall					# Llama al sistema para terminar la ejecución del programa
