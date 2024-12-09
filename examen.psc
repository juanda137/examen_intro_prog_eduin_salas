Funcion opc = menu
	Escribir "============="
	Escribir "Notas finales"
	Escribir ""
	Escribir "1. añadir notas al estudiante"
	Escribir "2. lista de estudiantes"
	Escribir "3. calcular nota final"
	Escribir "4. salir del programa"
	Leer opc
	Repetir
		Si opc < 1 O opc > 4 Entonces
			Escribir "Ingrese de nuevo el resultado"
			Leer opc
		FinSi
	Hasta Que opc >= 1 Y opc <= 4
FinFuncion

Funcion x = notas(bd, cantEstudiantes, nomb, nota1, nota2, nota3, inasistencias)
    bd[cantEstudiantes, 1] = nomb
    bd[cantEstudiantes, 2] = nota1
    bd[cantEstudiantes, 3] = nota2
    bd[cantEstudiantes, 4] = nota3
    bd[cantEstudiantes, 5] = inasistencias
    x = cantEstudiantes + 1
FinFuncion

Funcion listaEstudiantes(bd, cantEstudiantes)
    Para i <- 1 Hasta cantEstudiantes - 1 Hacer
        Escribir "Estudiante ", i
        Escribir "Nombre: ", bd[i, 1]
        Escribir "Nota 1: ", bd[i, 2]
        Escribir "Nota 2: ", bd[i, 3]
        Escribir "Nota 3: ", bd[i, 4]
        Escribir "Inasistencias: ", bd[i, 5]
    FinPara
FinFuncion

Funcion notaFinal = calcularNotaFinal(nota1, nota2, nota3, inasistencias)
    promedio = (nota1 + nota2 + nota3) / 3
    Si inasistencias >= 10 Y inasistencias < 15 Entonces
        notaFinal = promedio - 0.5
    Sino
        Si inasistencias >= 15 Entonces
            notaFinal = promedio - 1
        Sino
            notaFinal = promedio
        FinSi
    FinSi
FinFuncion

Funcion tablaNotas(bd, cantEstudiantes)
    Escribir "COD   NOMBRE         P1    P2    P3    INASISTENCIAS    NOTA FINAL"
    Para i <- 1 Hasta cantEstudiantes - 1 Hacer
        promedio = calcularNotaFinal(bd[i, 2], bd[i, 3], bd[i, 4], bd[i, 5])
        Escribir i, "   ", bd[i, 1], "    ", bd[i, 2], "    ", bd[i, 3], "    ", bd[i, 4], "       ", bd[i, 5], "         ", promedio
    FinPara
FinFuncion

Algoritmo examen
    cantEstudiantes = 1
    Dimensionar estudiantes[100, 5] 
    Repetir
        Escribir "Seleccione una opción:"
        Escribir "1. Agregar estudiante"
        Escribir "2. Ver lista de estudiantes"
        Escribir "3. Ver tabla de estudiantes con su nota final"
        Escribir "4. Salir"
        Leer opcElegida
        Segun opcElegida Hacer
            1:
                Escribir "Ingrese el nombre del estudiante"
                Leer nomb
                Escribir "Digite las tres notas"
                Leer nota1
                Leer nota2
                Leer nota3
                Escribir "Digite las inasistencias del estudiante"
                Leer inasistencias
                cantEstudiantes = notas(estudiantes, cantEstudiantes, nomb, nota1, nota2, nota3, inasistencias)
            2:
                Escribir "Estos son los estudiantes:"
                listaEstudiantes(estudiantes, cantEstudiantes)
            3:
                Escribir "Tabla de estudiantes con su nota final:"
                tablaNotas(estudiantes, cantEstudiantes)
            4:
                Escribir "Saliendo del programa"
        FinSegun
    Hasta Que opcElegida = 4
FinAlgoritmo