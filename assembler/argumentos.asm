;argumentos.asm
;Pedro Muñoz
;16/03/17
%include 'funciones.asm'

section .text
	global _start 		;tiene que ser declarado para usar gcc

_start: 			;le dice al linker entry point
	pop ECX 		;obtenemos el numero de argumentos
	pop EAX 		;nombre del programa
	dec ECX 		;decrementar uno menos a ECX
	mov EBX, 1h 		;puede ser tambien "0x1" o "1"

ciclo:
	pop EAX 		;obtenemos argumento
	call atoi 		;convierte el argum a numero
	imul EBX, EAX 		;multiplicamos acumulado x

	dec ECX 		;restamos 1 al numero de argumentos
	cmp ECX, 0 		;checamos si es el ultimo argumento
	jnz ciclo 		;seguimos si no es el ultimo
				;si fue el ultimo argumento...
	mov EAX, EBX
	call iprintLF 		;imprimimos el argumento

	jmp quit 		;salimos
