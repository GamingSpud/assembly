.data		                    			# Sección para declarar variables
msg1: .asciiz "Ingresa cuántos números de la serie Fibonacci debería imprimir: "	# Declara una cadena de caracteres
msg2: .asciiz " "                                         # Declara una cadena con el caracter espacio

.text						# Sección de código
main:						# Sección de código principal

    li $v0, 4           				# Código de servicio 4 para imprimir una cadena
    la $a0, msg1         			# Carga la dirección de la cadena en $a0
    syscall             				# Llama al sistema para imprimir
    
    li $v0, 5					# Código de servicio 5 para leer un entero
    syscall					# Llama al sistema para leer un entero
    
    move $s0, $v0				# Mueve el entero ingresado $v0 al registro $s0
    add $t0, $zero, 0				# Asigna al registro $t0 el valor 0
    add $t1, $zero, 1				# Asigna al registro $t1 el valor 1
    move $t2, $zero				# Asigna al registro $t2 el valor 0

loop: 						# Bucle que maneja la impresión de cada número en la serie
    ble $s0, 0, end				# Compara si el entero ingresado en $s0 es menor o igual a 0 para salir del ciclo
    sub $s0, $s0, 1				# Substrae 1 al número en $s0
    move $t2, $t1				# Mueve a $t2 el valor en $t1 para luego imprimirlo
    
    li $v0, 1					# Código de servicio 1 para imprimir un entero
    move $a0, $t2				# Carga el valor del entero desde $t2 a $a0
    syscall					# Llama al sistema para imprimir
    
    li $v0, 4					# Código de servicio 4 para imprimir una cadena
    la $a0, msg2					# Carga la dirección de la cadena en $a0
    syscall					# Llama al sistema para imprimir
    
    add $t2, $t0, $t1				# Suma $t0 y $t1 y guarda el resultado en $t2
    move $t0, $t1				# Mueve el valor en $t1 a $t0
    move $t1, $t2				# Mueve el valor en $t2 a $t1
    
    j loop					# Vuelve a iniciar el ciclo
    
end:						# Aquí llega una vez se ha relizado el ciclo $v0 veces
    
    # Finalizar el programa
    li $v0, 10          				# Código de servicio 10 para terminar la ejecución
    syscall					# Llama al sistema para cerrar el programa
