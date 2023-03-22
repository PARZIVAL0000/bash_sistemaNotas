#!/bin/bash  

profesor=("111" "profesor") #identificador y password para el maestro... simples datos quedamos.

i=3
bloqueado=10

declare -A informacion 
informacion=([Nombres]="" [Curso]="" [Paralelo]="" [Nota_Teorico]="" [Nota_Practico]="" [Nota_Examen]="") #esta diccionario nos sirve para no perder la referencia de la informacion del usuario cuando lo inserta...

function imprimir_alerta () {
    echo -e "\n\033[31;47m[!] $1"
    echo -e "\033[0m"
    read 
}

function iniciar_sesion() {
    while [ true ]; do 

        echo $(clear)
        echo -e """\033[1;36m
    ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
                                                    ░██████╗██╗░██████╗████████╗███████╗███╗░░░███╗░█████╗░  ██████╗░███████╗
                                                    ██╔════╝██║██╔════╝╚══██╔══╝██╔════╝████╗░████║██╔══██╗  ██╔══██╗██╔════╝
                                                    ╚█████╗░██║╚█████╗░░░░██║░░░█████╗░░██╔████╔██║███████║  ██║░░██║█████╗░░
                                                    ░╚═══██╗██║░╚═══██╗░░░██║░░░██╔══╝░░██║╚██╔╝██║██╔══██║  ██║░░██║██╔══╝░░
                                                    ██████╔╝██║██████╔╝░░░██║░░░███████╗██║░╚═╝░██║██║░░██║  ██████╔╝███████╗
                                                    ╚═════╝░╚═╝╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚═╝  ╚═════╝░╚══════╝

                                                                    ███╗░░██╗░█████╗░████████╗░█████╗░░██████╗
                                                                    ████╗░██║██╔══██╗╚══██╔══╝██╔══██╗██╔════╝
                                                                    ██╔██╗██║██║░░██║░░░██║░░░███████║╚█████╗░
                                                                    ██║╚████║██║░░██║░░░██║░░░██╔══██║░╚═══██╗
                                                                    ██║░╚███║╚█████╔╝░░░██║░░░██║░░██║██████╔╝
                                                                    ╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░

                                        ███████╗░██████╗████████╗██╗░░░██╗██████╗░██╗░█████╗░███╗░░██╗████████╗██╗██╗░░░░░███████╗░██████╗
                                        ██╔════╝██╔════╝╚══██╔══╝██║░░░██║██╔══██╗██║██╔══██╗████╗░██║╚══██╔══╝██║██║░░░░░██╔════╝██╔════╝
                                        █████╗░░╚█████╗░░░░██║░░░██║░░░██║██║░░██║██║███████║██╔██╗██║░░░██║░░░██║██║░░░░░█████╗░░╚█████╗░
                                        ██╔══╝░░░╚═══██╗░░░██║░░░██║░░░██║██║░░██║██║██╔══██║██║╚████║░░░██║░░░██║██║░░░░░██╔══╝░░░╚═══██╗
                                        ███████╗██████╔╝░░░██║░░░╚██████╔╝██████╔╝██║██║░░██║██║░╚███║░░░██║░░░██║███████╗███████╗██████╔╝
                                        ╚══════╝╚═════╝░░░░╚═╝░░░░╚═════╝░╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚══════╝╚══════╝╚═════╝░
    ════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"""
        echo -e """
    \t\t\t\t\t\t\t\033[1;33m=====================================================
    \t\t\t\t\t\t\t\033[1;33m    |                INICIAR SESION             |
    \t\t\t\t\t\t\t\033[1;33m====================================================="""
        if [ $i -gt 0 ] && [ $i -le 3 ]; then 
            echo -e "\t\t\t\t\t\t\t\t[*] NUMERO DE INTENTOS DISPONIBLES : $i"
            echo -n -e "\n\n\t\t\t\t\t\t\t\t\033[1;37m[>>] INSERTA TU IDENTIFICADOR: " 
            read identificador 

            if [ ${#identificador} -eq 0 ]; then 
                echo -e "\n\033[31;47m[!] La entrada no debe estar vacia, presiona enter...."
                echo -e "\033[0m"
                read 
            else 

                if [ $(($identificador)) -eq $((${profesor[0]})) ]; then 

                    #vamos a preguntar nuevamente el password cuando se equivoque
                    
                    echo -n -e "\n\t\t\t\t\t\t\t\t\033[1;37m[>>] INSERTA TU PASSWORD: " 
                    read password

                
                    if [ "$password" == "${profesor[1]}" ]; then  
                        echo $( sleep 2s )
                        return 0 
                    else
                        i=$(($i-1))
                        echo -e "\n\033[31;47m[!] password incorrecto, presiona enter...."
                        echo -e "\033[0m"
                        read
                    fi
                
                else 
                    echo -e "\n\033[31;47m[!] Identificador incorrecto, presiona enter...."
                    echo -e "\033[0m"
                    read
                fi 

            fi
        else 
            if [ $bloqueado -gt 0 ] && [ $bloqueado -le 10 ]; then 

                echo -e "\t\t\t\t\t\t\t\t\033[31;47m[!]    SISTEMA BLOQUEADO : $bloqueado seg."
                echo -e "\033[0m"
                bloqueado=$(($bloqueado-1))
            else 
                i=3
                bloqueado=10
            fi 
            
            echo $(sleep 1s)
        fi 
    done 

}


function imprimir_marco() {
    
 
    if [[ ${#informacion[Nombres]} != 0 ]]; then 
        echo   -e "\t\t\t    [*] Inserta nombres completos: ${informacion[Nombres]}"
        if [[ ${#informacion[Curso]} != 0 ]]; then 
            echo   -e "\n\n\t\t\t    [*] Inserta el curso: ${informacion[Curso]}"

            if [[ ${#informacion[Paralelo]} != 0 ]]; then 
                echo   -e "\n\n\t\t\t    [*] Inserta el paralelo: ${informacion[Paralelo]}"

                if [[ ${#informacion[Nota_Teorico]} != 0 ]]; then 
                    echo   -e "\n\n\t\t\t    [*] Inserta la nota teorica: ${informacion[Nota_Teorico]}"

                    if [[ ${#informacion[Nota_Practico]} != 0 ]]; then 
                        echo   -e "\n\n\t\t\t    [*] Inserta la nota practica: ${informacion[Nota_Practico]}"

                        if [[ ${#informacion[Nota_Examen]} != 0 ]]; then 
                            echo   -e "\n\n\t\t\t    [*] Inserta la nota examen: ${informacion[Nota_Examen]}"
                        fi
                    fi 
                fi 
            fi 
        fi  
    fi 

}

function perfil_estudiante () {

    info_estudiante=()

    contenido=("A" "B" "C" "D" "E" "F" "G" "H" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
    numeros=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
    identificador=""
    #acceder de manera aleatoria al uno de los valores 
    # posicion=$(($RANDOM%25))


    for i in {0..2}; do 
        identificador+=${contenido[$(($RANDOM%25))]}
    done 

    identificador+="-"

    for j in {0..2}; do 
        identificador+=${numeros[$(($RANDOM%9))]}
    done 

   

    while [ true ]; do 
        echo $(clear)
         echo -e """\033[35m


\t\t\t   ======================================================================================================================
\t\t\t                                  █▀█ █▀▀ █▀█ █▀▀ █ █░░   █▀▀ █▀ ▀█▀ █░█ █▀▄ █ ▄▀█ █▄░█ ▀█▀ █▀▀
\t\t\t                                  █▀▀ ██▄ █▀▄ █▀░ █ █▄▄   ██▄ ▄█ ░█░ █▄█ █▄▀ █ █▀█ █░▀█ ░█░ ██▄
\t\t\t   ======================================================================================================================
\t\t\t                                          INSERTA LA LETRA --- R --- PARA RETROCEDER                                      """
        echo -e "\033[39m" 


        if [[ ${informacion[Nombres]} == "" ]]; then 
            echo  -n -e "\t\t\t    [*] Inserta nombres completos: "
            IFS=" " read -ra nombres

            if [[ ${nombres[0]^^} == R ]]; then 
                info_estudiante=()
                informacion[Nombres]=""
                informacion[Curso]=""
                informacion[Paralelo]=""
                informacion[Nota_Teorico]=""
                informacion[Nota_Practico]=""
                informacion[Nota_Examen]=""
                break 
            else 

                if [[ ${#nombres} == 0 ]]; then 
                    imprimir_alerta "La entrada es obligatoria, presiona enter para continuar...."
                elif [[ ${#nombres[@]} != 2 ]]; then 
                    imprimir_alerta "Debes insertar solamente un nombre y un apellido, presiona enter para continuar..."
                else
                    if [[ ${nombres[0]} =~ [0-9] ]] && [[ ${nombres[0]} =~ [@|!|-|_|\\|/|\+|\-] ]] || [[ ${nombres[1]} =~ [0-9] ]] && [[ ${nombres[1]} =~ [@|!|-|_|\\|/|\+|\-] ]] ; then 
                        imprimir_alerta "La entrada no es numerica, presiona enter para continuar...."
                    else 
                        nombre=${nombres[0]}" "${nombres[1]}
                        info_estudiante+=$identificador
                        info_estudiante+=" "
                        info_estudiante+=$nombre
                        informacion[Nombres]=$nombre
                    fi 
                fi
            fi 

        else 
            imprimir_marco

            if [[ ${informacion[Curso]} == "" ]]; then  

                echo  -n -e "\n\n\t\t\t    [*] Inserta el curso: "
                IFS=" " read -ra curso 

                if [[ ${#curso} -eq 0 ]]; then 
                    imprimir_alerta "Tu entrada es obligatoria, presiona enter... "
                elif [[ ${curso[0]^^} == R ]]; then
                    info_estudiante=()
                    informacion[Nombres]=""
                    informacion[Curso]=""
                    informacion[Paralelo]=""
                    informacion[Nota_Teorico]=""
                    informacion[Nota_Practico]=""
                    informacion[Nota_Examen]="" 
                    break 
                elif [[ ${#curso[@]} != 1 ]]; then 
                    imprimir_alerta "Debes introducir un solo curso, presiona enter..." 
                else 
                    
                    #cuando solamente sea un curso.... verificaremos si no introdujo numeros.... 
                    if [[ ${curso[0]} =~ [0-9] ]]; then 
                        imprimir_alerta "No debes insertar numeros, presiona enter..." 
                    else 
                        info_estudiante+=" "
                        info_estudiante+=${curso[0]}
                        informacion[Curso]=${curso[0]}
                    fi
                
                     
                fi 
            
            else 
               
                if [[ ${informacion[Paralelo]} == "" ]]; then 
                    echo  -n -e "\n\n\t\t\t    [*] Inserta el paralelo: "
                    IFS=" " read -ra paralelo
                     
                    if [[ ${#paralelo[@]} == 0 ]]; then 
                        imprimir_alerta "La entrada es obligatoria, presiona enter..."
                    elif [[ ${paralelo[0]^^} == R ]]; then 
                        info_estudiante=()
                        informacion[Nombres]=""
                        informacion[Curso]=""
                        informacion[Paralelo]=""
                        informacion[Nota_Teorico]=""
                        informacion[Nota_Practico]=""
                        informacion[Nota_Examen]=""
                        break 
                    elif [[ ${#paralelo[@]} != 1 ]]; then 
                        imprimir_alerta "La entrada admite solamente un paralelo, presiona enter..."
                    else 
                        

                        if [[ ${paralelo[0]^^} == A ]] || [[ ${paralelo[0]^^} == B ]] || [[ ${paralelo[0]^^} == C ]]; then
                            info_estudiante+=" " 
                            info_estudiante+=${paralelo[0]^^}
                            informacion[Paralelo]=${paralelo[0]^^}
                        else     
                            imprimir_alerta "Solamente se admiten 3 paralelos:A, B y C. Presiona enter..."
                        fi 
                    fi

                else 

                    if [[ ${informacion[Nota_Teorico]} == "" ]]; then 
                        echo  -n -e "\n\n\t\t\t    [*] Inserta la nota teorica: "
                        read nota_teorico

                        if [[ ${#nota_teorico} == 0 ]]; then 
                            imprimir_alerta "El campo es obligatorio. Presiona enter...." 
                        elif [[ ${nota_teorico^^} == R ]]; then 
                            info_estudiante=()
                            informacion[Nombres]=""
                            informacion[Curso]=""
                            informacion[Paralelo]=""
                            informacion[Nota_Teorico]=""
                            informacion[Nota_Practico]=""
                            informacion[Nota_Examen]=""
                            break 
                        else 

                            #verificaremos si nuestra entrada es un numero...
                            if [[ $nota_teorico =~ [0-9] ]]; then 

                                if [[ $(($nota_teorico)) -ge 0 ]] && [[ $(($nota_teorico)) -le 10 ]]; then 
                                    info_estudiante+=" "
                                    info_estudiante+=$nota_teorico
                                    informacion[Nota_Teorico]=$nota_teorico
                                else 
                                    imprimir_alerta "Nota inserta incorrecta. Presiona enter..."  
                                
                                fi 
                            else 
                                imprimir_alerta "La entrada debe ser numerica. Presiona enter...."  
                            fi 
                        fi 
                    else 

                        if [[ ${informacion[Nota_Practico]} == "" ]]; then 
                            echo  -n -e "\n\n\t\t\t    [*] Inserta la nota practico: "
                            read nota_practico

                            if [[ ${#nota_practico} == 0 ]]; then 
                                imprimir_alerta "El campo es obligatorio. Presiona enter...."
                            elif [[ ${nota_practico^^} == R ]]; then 
                                info_estudiante=()
                                informacion[Nombres]=""
                                informacion[Curso]=""
                                informacion[Paralelo]=""
                                informacion[Nota_Teorico]=""
                                informacion[Nota_Practico]=""
                                informacion[Nota_Examen]=""
                                break 
                            else 

                                #verificaremos si nuestra entrada es un numero...
                                if [[ $nota_practico =~ [0-9] ]]; then 

                                    if [[ $(($nota_practico)) -ge 0 ]] && [[ $(($nota_practico)) -le 10 ]]; then 
                                        info_estudiante+=" "
                                        info_estudiante+=$nota_practico
                                        informacion[Nota_Practico]=$nota_practico
                                    else 
                                        imprimir_alerta "Nota inserta incorrecta. Presiona enter..."  
                                    
                                    fi 
                                else 
                                    imprimir_alerta "La entrada debe ser numerica. Presiona enter...."  
                                fi 
                            fi 

                        else 

                            if [[ ${informacion[Nota_Examen]} == "" ]]; then 
                                echo  -n -e "\n\n\t\t\t    [*] Inserta la nota examen: "
                                read nota_examen

                                if [[ ${#nota_examen} == 0 ]]; then 
                                    imprimir_alerta "El campo es obligatorio. Presiona enter...." 
                                elif [[ ${nota_examen^^} == R ]]; then
                                    info_estudiante=()
                                    informacion[Nombres]=""
                                    informacion[Curso]=""
                                    informacion[Paralelo]=""
                                    informacion[Nota_Teorico]=""
                                    informacion[Nota_Practico]=""
                                    informacion[Nota_Examen]="" 
                                    break
                                else 

                                    #verificaremos si nuestra entrada es un numero...
                                    if [[ $nota_examen =~ [0-9] ]]; then 

                                        if [[ $(($nota_examen)) -ge 0 ]] && [[ $(($nota_examen)) -le 10 ]]; then 
                                            info_estudiante+=" "
                                            info_estudiante+=$nota_examen
                                            informacion[Nota_Examen]=$nota_examen
                                        else 
                                            imprimir_alerta "Nota inserta incorrecta. Presiona enter..."  
                                        fi 
                                    else 
                                        imprimir_alerta "La entrada debe ser numerica. Presiona enter...."  
                                    fi 
                                fi 

                            else 

                                #llegados a este punto.... lo que vamos hacer es calcular... nuestra nota
                                promedio_final=$(($nota_teorico+$nota_practico+$nota_examen))
                                promedio_final=$(($promedio_final/3))

                                echo -e "\n\n\t\t\t    [*] Promedio general: $promedio_final"
                                info_estudiante+=" "
                                info_estudiante+=$promedio_final

                                if [[ $(($promedio_final)) -ge 0  ]] && [[ $(($promedio_final)) -le 4  ]]; then 
                                    echo -e "\n\n\t\t\t    [*] REPROBADO"
                                    info_estudiante+=" "
                                    info_estudiante+="REPROBADO"
                                elif [[ $(($promedio_final)) -ge 5  ]] && [[ $(($promedio_final)) -le 7  ]]; then 
                                    echo -e "\n\n\t\t\t    [*] REMEDIAL"
                                    info_estudiante+=" "
                                    info_estudiante+="REMEDIAL"
                                elif [[ $(($promedio_final)) -ge 8  ]] && [[ $(($promedio_final)) -le 10  ]]; then 
                                    echo -e "\n\n\t\t\t    [*] APROBADO"
                                    info_estudiante+=" "
                                    info_estudiante+="APROBADO"
                                fi 


                                echo -n -e "$info_estudiante\n" >> Alumnos.txt
                                

                                imprimir_alerta "INFORMACION GUARDADA... PRESIONA ENTER PARA CONTINUAR."

                                info_estudiante=()
                                informacion[Nombres]=""
                                informacion[Curso]=""
                                informacion[Paralelo]=""
                                informacion[Nota_Teorico]=""
                                informacion[Nota_Practico]=""
                                informacion[Nota_Examen]=""

                                break 

                            fi 

                        fi 

                    fi 

                fi 

            fi 

        fi 

    done 
 
}

function mostrar_perfil () {
    echo $(clear)  
    informacion=$(cat Alumnos.txt)

    #vamos a leer la informacion contenido dentro de nuestro archivo de Alumnos.txt 

    echo -e """

\t\t\t\t     --------------------------------------------------------------------------------------------
\t\t\t\t         ██╗███╗░░██╗███████╗░█████╗░██████╗░███╗░░░███╗░█████╗░░█████╗░██╗░█████╗░███╗░░██╗
\t\t\t\t         ██║████╗░██║██╔════╝██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗██║██╔══██╗████╗░██║
\t\t\t\t         ██║██╔██╗██║█████╗░░██║░░██║██████╔╝██╔████╔██║███████║██║░░╚═╝██║██║░░██║██╔██╗██║
\t\t\t\t         ██║██║╚████║██╔══╝░░██║░░██║██╔══██╗██║╚██╔╝██║██╔══██║██║░░██╗██║██║░░██║██║╚████║
\t\t\t\t         ██║██║░╚███║██║░░░░░╚█████╔╝██║░░██║██║░╚═╝░██║██║░░██║╚█████╔╝██║╚█████╔╝██║░╚███║
\t\t\t\t         ╚═╝╚═╝░░╚══╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░╚════╝░╚═╝░░╚══╝
\t\t\t\t        
\t\t\t\t        ███████╗░██████╗████████╗██╗░░░██╗██████╗░██╗░█████╗░███╗░░██╗████████╗███████╗░██████╗
\t\t\t\t        ██╔════╝██╔════╝╚══██╔══╝██║░░░██║██╔══██╗██║██╔══██╗████╗░██║╚══██╔══╝██╔════╝██╔════╝
\t\t\t\t        █████╗░░╚█████╗░░░░██║░░░██║░░░██║██║░░██║██║███████║██╔██╗██║░░░██║░░░█████╗░░╚█████╗░
\t\t\t\t        ██╔══╝░░░╚═══██╗░░░██║░░░██║░░░██║██║░░██║██║██╔══██║██║╚████║░░░██║░░░██╔══╝░░░╚═══██╗
\t\t\t\t        ███████╗██████╔╝░░░██║░░░╚██████╔╝██████╔╝██║██║░░██║██║░╚███║░░░██║░░░███████╗██████╔╝
\t\t\t\t        ╚══════╝╚═════╝░░░░╚═╝░░░░╚═════╝░╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═════╝░
\t\t\t\t     --------------------------------------------------------------------------------------------"""
   
    echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

    while IFS=" " read -ra codigo
    do 


        if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

            if [[ ${#codigo[2]} -le 4 ]]; then 
                if [[ ${#codigo[3]} -le 6 ]]; then 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                fi 
            else 
                if [[ ${#codigo[3]} -le 6 ]]; then 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                fi
            fi  

        elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
            if [[ ${#codigo[2]} -le 4 ]]; then 
                if [[ ${#codigo[3]} -le 6 ]]; then 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                fi 
            else 

                if [[ ${#codigo[3]} -le 6 ]]; then 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t\t         "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                fi
            
                
            fi 
        elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
            if [[ ${#codigo[2]} -le 4 ]]; then 
                
                echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                
            else 
                echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                
            fi 
        fi 

     

         
    done <<< $informacion


    imprimir_alerta "Presiona enter para continuar... "
}


function buscar_perfil () {
    echo $(clear)

    while [[ true ]]; do 
        echo $(clear)

        echo -e """\x1b[34m

\t\t\t\t     --------------------------------------------------------------------------------------------                                                                      
\t\t\t\t                           ██████╗░██╗░░░██╗░██████╗░█████╗░░█████╗░██████╗░
\t\t\t\t                           ██╔══██╗██║░░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗
\t\t\t\t                           ██████╦╝██║░░░██║╚█████╗░██║░░╚═╝███████║██████╔╝
\t\t\t\t                           ██╔══██╗██║░░░██║░╚═══██╗██║░░██╗██╔══██║██╔══██╗
\t\t\t\t                           ██████╦╝╚██████╔╝██████╔╝╚█████╔╝██║░░██║██║░░██║
\t\t\t\t                           ╚═════╝░░╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝
\t\t\t\t     --------------------------------------------------------------------------------------------
\t\t\t\t            \x1b[33m                   [*] PARA RETROCEDER INSERTA ----- R -----                                """



        echo -n -e "\n\n\n\t\t\t\t     [>] INSERTA EL CODIGO DEL ESTUDIANTE:  "
        IFS=" " read -ra id_estudiante

        if [[ ${#id_estudiante[@]} == 0 ]]; then 
            imprimir_alerta "La entrada es obligatoria, presiona enter."
        else 
            if [[ ${#id_estudiante[@]} != 1 ]]; then 
                imprimir_alerta "Debes introducir un solo codigo, presiona enter."
            else 
                #verificamos si lo que el usuario introdujo es R o otra cosa.
                if [[ ${id_estudiante[0]^^} == R ]]; then 
                    break 
                else 
                    #aqui haremos todo el proceso para poder verificar....
                    fichero=$(cat Alumnos.txt)
                    codigo=()
                    flag=false
                    while IFS=" " read -ra informacion_estudiante 
                    do 
                        if [[ ${informacion_estudiante[0]} != ${id_estudiante[0]} ]]; then 
                            continue
                        else 
                            flag=true  
                        fi 

                        for indice in {0..9} 
                        do 
                            codigo[$indice]=${informacion_estudiante[$indice]}
                        done                        

                    done <<< $fichero  

                    if [[ $flag == true ]]; then 

                        echo $(clear)
                        #renderizamos la informacion obtenida para nuestros usuarios...
                    
                        while [[ true ]]; do 
                            echo $(clear)  
                        
                            #vamos a leer la informacion contenido dentro de nuestro archivo de Alumnos.txt 
                            echo -e """

\t\t\t\t     --------------------------------------------------------------------------------------------
\t\t\t\t         ██╗███╗░░██╗███████╗░█████╗░██████╗░███╗░░░███╗░█████╗░░█████╗░██╗░█████╗░███╗░░██╗
\t\t\t\t         ██║████╗░██║██╔════╝██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗██║██╔══██╗████╗░██║
\t\t\t\t         ██║██╔██╗██║█████╗░░██║░░██║██████╔╝██╔████╔██║███████║██║░░╚═╝██║██║░░██║██╔██╗██║
\t\t\t\t         ██║██║╚████║██╔══╝░░██║░░██║██╔══██╗██║╚██╔╝██║██╔══██║██║░░██╗██║██║░░██║██║╚████║
\t\t\t\t         ██║██║░╚███║██║░░░░░╚█████╔╝██║░░██║██║░╚═╝░██║██║░░██║╚█████╔╝██║╚█████╔╝██║░╚███║
\t\t\t\t         ╚═╝╚═╝░░╚══╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░╚════╝░╚═╝░░╚══╝
\t\t\t\t        
\t\t\t\t        ███████╗░██████╗████████╗██╗░░░██╗██████╗░██╗░█████╗░███╗░░██╗████████╗███████╗░██████╗
\t\t\t\t        ██╔════╝██╔════╝╚══██╔══╝██║░░░██║██╔══██╗██║██╔══██╗████╗░██║╚══██╔══╝██╔════╝██╔════╝
\t\t\t\t        █████╗░░╚█████╗░░░░██║░░░██║░░░██║██║░░██║██║███████║██╔██╗██║░░░██║░░░█████╗░░╚█████╗░
\t\t\t\t        ██╔══╝░░░╚═══██╗░░░██║░░░██║░░░██║██║░░██║██║██╔══██║██║╚████║░░░██║░░░██╔══╝░░░╚═══██╗
\t\t\t\t        ███████╗██████╔╝░░░██║░░░╚██████╔╝██████╔╝██║██║░░██║██║░╚███║░░░██║░░░███████╗██████╔╝
\t\t\t\t        ╚══════╝╚═════╝░░░░╚═╝░░░░╚═════╝░╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═════╝░
\t\t\t\t     --------------------------------------------------------------------------------------------"""
                    
                            echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

                            if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

                                if [[ ${#codigo[2]} -le 4 ]]; then 
                                    if [[ ${#codigo[3]} -le 6 ]]; then 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                                    else 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                                    fi 
                                else 
                                    if [[ ${#codigo[3]} -le 6 ]]; then 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                                    else 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                                    fi
                                fi  

                            elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
                                if [[ ${#codigo[2]} -le 4 ]]; then 
                                    if [[ ${#codigo[3]} -le 6 ]]; then 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                                    
                                    else 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                                    fi 
                                else 

                                    if [[ ${#codigo[3]} -le 6 ]]; then 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t\t         "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                                    
                                    else 
                                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                                    fi
                                
                                    
                                fi 
                            elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
                                if [[ ${#codigo[2]} -le 4 ]]; then 
                                    
                                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                                    
                                else 
                                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                                    
                                fi 
                            fi 

                        

                    


                            imprimir_alerta "Presiona enter para continuar... "

                            break 
                        done 
                    
                    else 
                        imprimir_alerta "Codigo invalido, presiona enter."
                    fi 

                fi 
            fi 
        fi  
    done 
}

function eliminar_perfil () {
    echo $(clear)
    while [[ true ]]; do 
        #dentro de esta seccion lo que haremos es eliminar por completo los datos de un estudiante el cual seleccionemos mediante su codigo unico.
        echo $(clear)  
        informacion=$(cat Alumnos.txt)

        #vamos a leer la informacion contenido dentro de nuestro archivo de Alumnos.txt 

        echo -e """\x1b[31m

\t\t\t\t     --------------------------------------------------------------------------------------------                                                                      
\t\t\t\t                     ███████╗██╗░░░░░██╗███╗░░░███╗██╗███╗░░██╗░█████╗░██████╗░
\t\t\t\t                     ██╔════╝██║░░░░░██║████╗░████║██║████╗░██║██╔══██╗██╔══██╗
\t\t\t\t                     █████╗░░██║░░░░░██║██╔████╔██║██║██╔██╗██║███████║██████╔╝
\t\t\t\t                     ██╔══╝░░██║░░░░░██║██║╚██╔╝██║██║██║╚████║██╔══██║██╔══██╗
\t\t\t\t                     ███████╗███████╗██║██║░╚═╝░██║██║██║░╚███║██║░░██║██║░░██║
\t\t\t\t                     ╚══════╝╚══════╝╚═╝╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░╚═╝
\t\t\t\t     --------------------------------------------------------------------------------------------
\t\t\t\t            \x1b[33m                   [*] PARA RETROCEDER INSERTA ----- R -----                                """
   
        echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

        while IFS=" " read -ra codigo
        do 


            if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

                if [[ ${#codigo[2]} -le 4 ]]; then 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    fi 
                else 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    fi
                fi  

            elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
                if [[ ${#codigo[2]} -le 4 ]]; then 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    fi 
                else 

                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t\t         "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    fi
                
                    
                fi 
            elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
                if [[ ${#codigo[2]} -le 4 ]]; then 
                    
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                    
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                    
                fi 
            fi 

        

            
        done <<< $informacion


        echo -n -e "\n\n        [>] INSERTA EL CODIGO: "
        IFS=" " read -ra opcion 


        if [[ ${#opcion[@]} == 0  ]]; then 
            imprimir_alerta "Tu entrada es obligatoria, presiona enter."
        else 

            if [[ ${#opcion[@]} != 1 ]]; then
                imprimir_alerta "Debes insertar un solo codigo, presiona enter."
            else 

                if [[ ${opcion[0]^^} == R ]]; then 
                    break 
                else 
                    #dentro de este punto... validaremos por si el codigo que se inserto es el correcto... si existe mas que todo.
                    fichero=$(cat Alumnos.txt)
                    indice=0 
                    flag=false


                    while IFS=" " read -ra codigos
                    do 
                        if [[ ${codigos[0]} == ${opcion[0]} ]]; then 
                            flag=true 
                            continue
                        fi 

                        

                        if [[ $flag ]]; then  
                            if [[ $indice == 0 ]]; then 
                                echo ${codigos[@]} > Alumnos.txt 
                                indice=$(($indice+1)) 
                            else 
                                echo ${codigos[@]} >> Alumnos.txt
                            fi 
                        
                        fi 

                    done <<< $fichero


                    if [[ $flag == false ]]; then 
                        imprimir_alerta "Codigo invalido, presiona enter."
                    fi 
                fi 
                
            fi  
        fi 
    done 
}

#esta funcino se llama, cuando el usuario eligue una opcion dada. Por ejemplo: elegue la opcion de modificar el nombre
#esta funcion se invoca y se toma su argumento identificador para poder ejecutar la logica de esta funcion....
function editando_dato () {
    echo $(clear)
    while [ true ]; do 
        echo $(clear)
        archivo=$(cat Alumnos.txt)

        while IFS=" " read -ra codigo
        do 

            if [[ ${codigo[0]} == $1 ]]; then 

                #llegados a este punto nos toca renderizar la informacion...
                echo -e """\x1b[33m

\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t     ███████╗██████╗░██╗████████╗░█████╗░███╗░░██╗██████╗░░█████╗░  ██████╗░░█████╗░████████╗░█████╗░░██████╗
\t\t\t     ██╔════╝██╔══██╗██║╚══██╔══╝██╔══██╗████╗░██║██╔══██╗██╔══██╗  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝
\t\t\t     █████╗░░██║░░██║██║░░░██║░░░███████║██╔██╗██║██║░░██║██║░░██║  ██║░░██║███████║░░░██║░░░██║░░██║╚█████╗░
\t\t\t     ██╔══╝░░██║░░██║██║░░░██║░░░██╔══██║██║╚████║██║░░██║██║░░██║  ██║░░██║██╔══██║░░░██║░░░██║░░██║░╚═══██╗
\t\t\t     ███████╗██████╔╝██║░░░██║░░░██║░░██║██║░╚███║██████╔╝╚█████╔╝  ██████╔╝██║░░██║░░░██║░░░╚█████╔╝██████╔╝
\t\t\t     ╚══════╝╚═════╝░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░  ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═════╝░
\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t                                      PRESIONA ---- R ---- PARA RETROCEDER                                     """
   
                echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

               

                if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

                    if [[ ${#codigo[2]} -le 4 ]]; then 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        fi 
                    else 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        fi
                    fi  

                elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
                    if [[ ${#codigo[2]} -le 4 ]]; then 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        fi 
                    else 

                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t\t         "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        fi
                    
                        
                    fi 
                elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
                    if [[ ${#codigo[2]} -le 4 ]]; then 
                        
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                        
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                        
                    fi 
                fi 


            fi 

        done <<< $archivo

        if [[ $2 == A ]]; then 
            echo -n -e "\n\n\t\x1b[32m[A] INSERTA NUEVO NOMBRE: "
            IFS=" " read -ra nuevo_nombre 

            #tendremos que verificar por si presiona R ... para que lo retroceda a otra parte de la interfaz...
            if [[ ${#nuevo_nombre[@]} == 0 ]]; then 
                imprimir_alerta "Tu entrada es obligatoria, presiona enter."
            else 
                #debemos validar que el usuario deba introducir un nombre y un apellido. Sin embargo,
                #mucho antes verificar que no sean digitos 
                if [[ ${#nuevo_nombre[@]} == 2 ]]; then 

                    if [[ ${nuevo_nombre[0]} =~ [0-9] ]] || [[ ${nuevo_nombre[1]} =~ [0-9] ]]; then 
                        imprimir_alerta "Tu entrada no debe ser numerica, presiona enter."
                    else 
                        #dentro de aqui... lo que nos tocaria hacer en hacer una actualizacion del dato dato hacia nuestro archivo .txt
                        fichero=$(cat Alumnos.txt)
                        flag=0
                       
                        while IFS=" " read -ra actualizacion 
                        do 

                            if [[ ${actualizacion[0]} == $1 ]]; then 
                                actualizacion[1]=${nuevo_nombre[0]}
                                actualizacion[2]=${nuevo_nombre[1]}
                            fi 

                            if [[ $flag == 0 ]]; then 
                                echo ${actualizacion[@]} > Alumnos.txt
                                flag=$flag+1
                            else 
                                echo ${actualizacion[@]} >> Alumnos.txt
                            fi 
                             
                        done <<< $fichero

                        echo $(sleep 3s)

                        break 
                        
                    fi 
                else 
                    imprimir_alerta "TU entrada debe contener un nombre y un apellido, presiona enter."

                fi
            fi 


        elif [[ $2 == B ]]; then 
            echo -n -e "\n\n\t\x1b[33m[B] INSERTA NUEVO CURSO: "
            IFS=" " read -ra nuevo_curso 

            if [[ ${#nuevo_curso[@]} == 0 ]]; then 
                imprimir_alerta "La entrada es obligatoria, presiona enter."
            else 
                if [[ ${#nuevo_curso[@]} != 1 ]]; then 
                    imprimir_alerta "Solamente debes introducir un curso, presiona enter."
                else 
                    if [[ ${nuevo_curso[0]} =~ [0-9] ]]; then 
                        imprimir_alerta "La entrada no debe ser numerica, presiona enter."
                    else 
                        #dentro de aqui... lo que nos tocaria hacer en hacer una actualizacion del dato dato hacia nuestro archivo .txt
                        fichero=$(cat Alumnos.txt)
                        flag=0
                       
                        while IFS=" " read -ra actualizacion 
                        do 

                            if [[ ${actualizacion[0]} == $1 ]]; then 
                                actualizacion[3]=${nuevo_curso[0]}
                            fi 

                            if [[ $flag == 0 ]]; then 
                                echo ${actualizacion[@]} > Alumnos.txt
                                flag=$flag+1
                            else 
                                echo ${actualizacion[@]} >> Alumnos.txt
                            fi 
                             
                        done <<< $fichero

                        echo $(sleep 3s)

                        break 
                    fi 
                fi 
            fi 

        elif [[ $2 == C ]]; then 
            echo -n -e "\n\n\t\x1b[36m[C] INSERTA NUEVO PARALELO: "
            IFS=" " read -ra nuevo_paralelo

            # A - B - C -> solamente tres cursos por el momento.

            if [[ ${#nuevo_paralelo[@]} == 0 ]]; then 
                imprimir_alerta "La entrada es obligatoria, presiona enter."
            else 
                if [[ ${#nuevo_paralelo[@]} != 1 ]]; then 
                    imprimir_alerta "La entrada debe contener un solo paralelo, presiona enter."
                else 
                    if [[ ${nuevo_paralelo[0]} =~ [0-9] ]]; then 
                        imprimir_alerta "La entrada no debe contener numeros, presiona enter."
                    else 
                        if [[ ${nuevo_paralelo[0]^^} == A ]] || [[ ${nuevo_paralelo[0]^^} == B ]] || [[ ${nuevo_paralelo[0]^^} == C ]]; then 
                            #dentro de aqui... lo que nos tocaria hacer en hacer una actualizacion del dato dato hacia nuestro archivo .txt
                            fichero=$(cat Alumnos.txt)
                            flag=0
                        
                            while IFS=" " read -ra actualizacion 
                            do 

                                if [[ ${actualizacion[0]} == $1 ]]; then 
                                    actualizacion[4]=${nuevo_paralelo[0]}
                                fi 

                                if [[ $flag == 0 ]]; then 
                                    echo ${actualizacion[@]} > Alumnos.txt
                                    flag=$flag+1
                                else 
                                    echo ${actualizacion[@]} >> Alumnos.txt
                                fi 
                                
                            done <<< $fichero

                            echo $(sleep 3s)

                            break 
                        else 
                            imprimir_alerta "La entrada solo soporta tres paralelos: A - B - C. Presiona enter para intentarlo otra vez."
                        fi  
                    fi 
                fi 
            fi 

        #el proceso de las notas.... debemos ir calculando el promedio y generar un estado -> REPROBADO, REMEDIAL Y APROBADO...

        elif [[ $2 == D ]]; then 
            echo -n -e "\n\n\t\x1b[31m[D] INSERTA NUEVA NOTA TEORICA: "
            IFS=" " read -ra nueva_notaTeorica 

            if [[ ${#nueva_notaTeorica[@]} == 0 ]]; then 
                imprimir_alerta "Tu entrada es obligatoria, presiona enter."
            else 
                if [[ ${#nueva_notaTeorica[@]} != 1 ]]; then 
                    imprimir_alerta "Debes contener una sola entrada y debe ser numerica, presiona enter."
                else 
                    if [[ ${nueva_notaTeorica[0]} =~ [0-9] ]]; then 
                        
                        if [[ ${nueva_notaTeorica[0]} -ge 0 ]] && [[ ${nueva_notaTeorica[0]} -le 10 ]]; then 
                            fichero=$(cat Alumnos.txt)
                            flag=0
                        
                            while IFS=" " read -ra actualizacion 
                            do 

                                if [[ ${actualizacion[0]} == $1 ]]; then 
                                    actualizacion[5]=${nueva_notaTeorica[0]}

                                    #generamos un promedio nuevamente.
                                    promedio_reseteado=$(( ${actualizacion[5]}+${actualizacion[6]}+${actualizacion[7]} ))
                                    promedio_reseteado=$(($promedio_reseteado/3))

                                    actualizacion[8]=$promedio_reseteado

                                    if [[ $(($promedio_reseteado)) -ge 0  ]] && [[ $(($promedio_reseteado)) -le 4  ]]; then 
                                        actualizacion[9]="REPROBADO"
                                    elif [[ $(($promedio_reseteado)) -ge 5  ]] && [[ $(($promedio_reseteado)) -le 7  ]]; then 
                                        actualizacion[9]="REMEDIAL"
                                    elif [[ $(($promedio_reseteado)) -ge 8  ]] && [[ $(($promedio_reseteado)) -le 10  ]]; then 
                                        actualizacion[9]="APROBADO"
                                    fi 

                                fi 

                                if [[ $flag == 0 ]]; then 
                                    echo ${actualizacion[@]} > Alumnos.txt
                                    flag=$flag+1
                                else 
                                    echo ${actualizacion[@]} >> Alumnos.txt
                                fi 
                                
                            done <<< $fichero

                            echo $(sleep 3s)

                            break 
                        else 
                            imprimir_alerta "Nota insertada incorrecta, presiona enter."
                        fi

                    else 
                        imprimir_alerta "Tu entrada debe ser numerica, presiona enter."
                    fi 
                fi 
            fi 

        elif [[ $2 == E ]]; then 
            echo -n -e "\n\n\t\x1b[36m[E] INSERTA NUEVA NOTA PRACTICA: "
            IFS=" " read -ra nueva_notaPractica

            if [[ ${#nueva_notaPractica[@]} == 0 ]]; then 
                imprimir_alerta "Tu entrada es obligatoria, presiona enter."
            else 
                if [[ ${#nueva_notaPractica[@]} != 1 ]]; then 
                    imprimir_alerta "Debes contener una sola entrada y debe ser numerica, presiona enter."
                else 
                    if [[ ${nueva_notaPractica[0]} =~ [0-9] ]]; then 
                        
                        if [[ ${nueva_notaPractica[0]} -ge 0 ]] && [[ ${nueva_notaPractica[0]} -le 10 ]]; then 
                            fichero=$(cat Alumnos.txt)
                            flag=0
                        
                            while IFS=" " read -ra actualizacion 
                            do 

                                if [[ ${actualizacion[0]} == $1 ]]; then 
                                    actualizacion[6]=${nueva_notaPractica[0]}

                                    #generamos un promedio nuevamente.
                                    promedio_reseteado=$(( ${actualizacion[5]}+${actualizacion[6]}+${actualizacion[7]} ))
                                    promedio_reseteado=$(($promedio_reseteado/3))
                           

                                    actualizacion[8]=$promedio_reseteado

                                    if [[ $(($promedio_reseteado)) -ge 0  ]] && [[ $(($promedio_reseteado)) -le 4  ]]; then 
                                        actualizacion[9]="REPROBADO"
                                    elif [[ $(($promedio_reseteado)) -ge 5  ]] && [[ $(($promedio_reseteado)) -le 7  ]]; then 
                                        actualizacion[9]="REMEDIAL"
                                    elif [[ $(($promedio_reseteado)) -ge 8  ]] && [[ $(($promedio_reseteado)) -le 10  ]]; then 
                                        actualizacion[9]="APROBADO"
                                    fi

                                fi 

                                if [[ $flag == 0 ]]; then 
                                    echo ${actualizacion[@]} > Alumnos.txt
                                    flag=$flag+1
                                else 
                                    echo ${actualizacion[@]} >> Alumnos.txt
                                fi 
                                
                            done <<< $fichero

                            echo $(sleep 3s)

                            break 
                        else 
                            imprimir_alerta "Nota insertada incorrecta, presiona enter."
                        fi

                    else 
                        imprimir_alerta "Tu entrada debe ser numerica, presiona enter."
                    fi 
                fi 
            fi 


        elif [[ $2 == F ]]; then 
            echo -e -n "\n\n\t\x1b[35m[F] INSERTA NUEVA NOTA EXAMEN: "
            IFS=" " read -ra nueva_notaExamen

            if [[ ${#nueva_notaExamen[@]} == 0 ]]; then 
                imprimir_alerta "Tu entrada es obligatoria, presiona enter."
            else 
                if [[ ${#nueva_notaExamen[@]} != 1 ]]; then 
                    imprimir_alerta "Debes contener una sola entrada y debe ser numerica, presiona enter."
                else 
                    if [[ ${nueva_notaExamen[0]} =~ [0-9] ]]; then 
                        
                        if [[ ${nueva_notaExamen[0]} -ge 0 ]] && [[ ${nueva_notaExamen[0]} -le 10 ]]; then 
                            fichero=$(cat Alumnos.txt)
                            flag=0
                        
                            while IFS=" " read -ra actualizacion 
                            do 
                                if [[ ${actualizacion[0]} == $1 ]]; then 
                                    actualizacion[7]=${nueva_notaExamen[0]}

                                    #generamos un promedio nuevamente.
                                    promedio_reseteado=$(( ${actualizacion[5]}+${actualizacion[6]}+${actualizacion[7]} ))
                                    promedio_reseteado=$(($promedio_reseteado/3))

                                    actualizacion[8]=$promedio_reseteado

                                    if [[ $(($promedio_reseteado)) -ge 0  ]] && [[ $(($promedio_reseteado)) -le 4  ]]; then 
                                        actualizacion[9]="REPROBADO"
                                    elif [[ $(($promedio_reseteado)) -ge 5  ]] && [[ $(($promedio_reseteado)) -le 7  ]]; then 
                                        actualizacion[9]="REMEDIAL"
                                    elif [[ $(($promedio_reseteado)) -ge 8  ]] && [[ $(($promedio_reseteado)) -le 10  ]]; then 
                                        actualizacion[9]="APROBADO"
                                    fi
                                fi 

                                if [[ $flag == 0 ]]; then 
                                    echo ${actualizacion[@]} > Alumnos.txt
                                    flag=$flag+1
                                else 
                                    echo ${actualizacion[@]} >> Alumnos.txt
                                fi 
                                
                            done <<< $fichero

                            echo $(sleep 3s)

                            break 
                        else 
                            imprimir_alerta "Nota insertada incorrecta, presiona enter."
                        fi

                    else 
                        imprimir_alerta "Tu entrada debe ser numerica, presiona enter."
                    fi 
                fi 
            fi
        fi 
        
        
        #llegando a este punto lo que tenemos que hacer es una modificacion de nuestro promedio.
        
    done 
}

function editando_usuario_unico () {
    #vamos a generar solamente la informacion del estudiante seleccionado, con ayuda de su codigo...
    echo $(clear)

    while [ true ]; do 
        echo $(clear)

        archivo=$(cat Alumnos.txt)

        while IFS=" " read -ra codigo
        do 

            if [[ ${codigo[0]} == $1 ]]; then 

                #llegados a este punto nos toca renderizar la informacion...
                echo -e """\x1b[33m

\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t     ███████╗██████╗░██╗████████╗░█████╗░███╗░░██╗██████╗░░█████╗░  ██████╗░░█████╗░████████╗░█████╗░░██████╗
\t\t\t     ██╔════╝██╔══██╗██║╚══██╔══╝██╔══██╗████╗░██║██╔══██╗██╔══██╗  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝
\t\t\t     █████╗░░██║░░██║██║░░░██║░░░███████║██╔██╗██║██║░░██║██║░░██║  ██║░░██║███████║░░░██║░░░██║░░██║╚█████╗░
\t\t\t     ██╔══╝░░██║░░██║██║░░░██║░░░██╔══██║██║╚████║██║░░██║██║░░██║  ██║░░██║██╔══██║░░░██║░░░██║░░██║░╚═══██╗
\t\t\t     ███████╗██████╔╝██║░░░██║░░░██║░░██║██║░╚███║██████╔╝╚█████╔╝  ██████╔╝██║░░██║░░░██║░░░╚█████╔╝██████╔╝
\t\t\t     ╚══════╝╚═════╝░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░  ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═════╝░
\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t                                      PRESIONA ---- R ---- PARA RETROCEDER                                     """
   
                echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

               
                if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

                    if [[ ${#codigo[2]} -le 4 ]]; then 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        fi 
                    else 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                        fi
                    fi 

                elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
                    if [[ ${#codigo[2]} -le 4 ]]; then 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        fi 
                    else 

                        if [[ ${#line[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        
                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                        fi
                    
                        
                    fi 
                elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
                    if [[ ${#codigo[2]} -le 4 ]]; then 

                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"

                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t  "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"

                        fi 
                        
                        
                    else 
                        if [[ ${#codigo[3]} -le 6 ]]; then 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"

                        else 
                            echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t  "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"

                        fi 
                    fi 
                fi 


            fi 

        done <<< $archivo

        echo -e """ 
\t\x1b[37m----------------------------------------------------------------------------
\x1b[37;41m\t[!] AL ESCOGER UNA DE ESTAS OPCIONES, YA NO PODRAS CANCELAR EL PROCESO.\x1b[0m 
\t\x1b[37m----------------------------------------------------------------------------
\t\x1b[32m[A].-CAMBIAR NOMBRES
\t\x1b[37m---------------------------
\t\x1b[33m[B].-CAMBIAR CURSO
\t\x1b[37m---------------------------
\t\x1b[36m[C].-CAMBIAR PARALELO
\t\x1b[37m---------------------------
\t\x1b[31m[D].-CAMBIAR NOTA TEORICA
\t\x1b[37m---------------------------
\t\x1b[36m[E].-CAMBIAR NOTA PRACTICA
\t\x1b[37m---------------------------
\t\x1b[35m[F].-CAMBIAR NOTA EXAMEN
\t\x1b[37m---------------------------
\t\x1b[33m[G].-RETROCEDER
\t\x1b[37m---------------------------"""


        echo -n -e "\n\t[>] INSERTA UNA LAS OPCIONES: " 
        read opcion 


        case ${opcion^^} in 
            A ) 
                editando_dato $1 "A";; 
            
            B ) 
                editando_dato $1 "B";;
            
            C ) 
                editando_dato $1 "C";; 

            D )
                editando_dato $1 "D";; 

            E )
                editando_dato $1 "E";;

            F ) 
                editando_dato $1 "F";;

            G )
                break  ;;
        esac
        
    done 
}

function editar_perfil () {
    echo $(clear)
    #dentro de este campo lo que haremos es hacer un recorrido de todo los datos y preguntar al usuario por uno de los ID de los usuarios.
    while [ true ]; do 
        echo $(clear)  
        informacion=$(cat Alumnos.txt)

        #vamos a leer la informacion contenido dentro de nuestro archivo de Alumnos.txt 

        echo -e """\x1b[33m

\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t     ███████╗██████╗░██╗████████╗░█████╗░███╗░░██╗██████╗░░█████╗░  ██████╗░░█████╗░████████╗░█████╗░░██████╗
\t\t\t     ██╔════╝██╔══██╗██║╚══██╔══╝██╔══██╗████╗░██║██╔══██╗██╔══██╗  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝
\t\t\t     █████╗░░██║░░██║██║░░░██║░░░███████║██╔██╗██║██║░░██║██║░░██║  ██║░░██║███████║░░░██║░░░██║░░██║╚█████╗░
\t\t\t     ██╔══╝░░██║░░██║██║░░░██║░░░██╔══██║██║╚████║██║░░██║██║░░██║  ██║░░██║██╔══██║░░░██║░░░██║░░██║░╚═══██╗
\t\t\t     ███████╗██████╔╝██║░░░██║░░░██║░░██║██║░╚███║██████╔╝╚█████╔╝  ██████╔╝██║░░██║░░░██║░░░╚█████╔╝██████╔╝
\t\t\t     ╚══════╝╚═════╝░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░  ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═════╝░
\t\t\t     ----------------------------------------------------------------------------------------------------------
\t\t\t                                      PRESIONA ---- R ---- PARA RETROCEDER                                     """
   
        echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

        while IFS=" " read -ra line 
        do 

            if [[ ${line[8]} -ge 0 ]] && [[ ${line[8]} -le 4 ]]; then 

                if [[ ${#line[2]} -le 4 ]]; then 
                    if [[ ${#line[3]} -le 6 ]]; then 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t            "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[37;41m${line[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t    "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[37;41m${line[9]}\x1b[0m"
                    fi 
                else 
                    if [[ ${#line[3]} -le 6 ]]; then 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t            "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[37;41m${line[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t    "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[37;41m${line[9]}\x1b[0m"
                    fi
                fi 

            elif [[ ${line[8]} -ge 5 ]] && [[ ${line[8]} -le 7 ]]; then 
                if [[ ${#line[2]} -le 4 ]]; then 
                    if [[ ${#line[3]} -le 6 ]]; then 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t            "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;43m${line[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t    "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;43m${line[9]}\x1b[0m"
                    fi 
                else 

                    if [[ ${#line[3]} -le 6 ]]; then 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t "${line[3]}"\t\t         "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;43m${line[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t "${line[3]}"\t    "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;43m${line[9]}\x1b[0m"
                    fi
                  
                    
                fi 
            elif [[ ${line[8]} -ge 8 ]] && [[ ${line[8]} -le 10 ]]; then 
                if [[ ${#line[2]} -le 4 ]]; then 
                    
                    echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t\t "${line[3]}"\t      "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;42m${line[9]}\x1b[0m"
                    
                else 
                    echo -e "\n\t "${line[0]}"    "${line[1]}" "${line[2]}"\t "${line[3]}"            "${line[4]}"\t\t     "${line[5]}"\t\t     "${line[6]}"\t\t     "${line[7]}"\t\t     "${line[8]}"\t\t     ""\x1b[30;42m${line[9]}\x1b[0m"
                    
                fi 
            fi 

        
        done <<< $informacion

        echo -n -e "\n\n\t\x1b[30;42m[>] PARA MODIFICAR INSERTA EL CODIGO DEL ESTUDIANTE: \x1b[0m"
        read id_estudiante


        if [[ $id_estudiante == "" ]]; then 
            imprimir_alerta "Tu entrada es obligatoria para poder hacer una modificacion... presiona enter."
        else 

            if [[ ${id_estudiante^^} == R ]]; then 
                break 
            else 
                #cuando el usuario introduzca su valor especifico....debemos comparar con los codigos que poseemos en los archivos planos.
                fichero=$(cat Alumnos.txt)
                flag=false #con esta bandera nos dice absolutamente todo lo que tenemos que hacer...
                 
                while IFS=" " read -ra codigo
                do  
                    
                    if [[ ${codigo[0]} == $id_estudiante ]]; then 
                        flag=true
                    fi 
                done <<< $fichero

                if [[ $flag == true ]]; then 
                    editando_usuario_unico $id_estudiante
                else 

                    imprimir_alerta "Codigo insertado incorrecto, presiona enter...."
                fi 
               
            fi 
        fi 

    done
}


function guardar_perfil () {
    #dentro de esta seccion verificaremos si el usuario acepta hacer los cambios realizados durante la actividad en su cuenta....
    #si dice que no... todos los valores anteriores cambiados volveran a reestablecerse, caso contrario se guardaran los cambios....
    
    #entonces esta funcion verifica por la parte de editar... esta conecta con la parte de editar perfiles de estudiantes. 
    echo $(clear)
    flag=true
    while [[ true ]]; do
        echo $(clear)  
        informacion=$(cat Alumnos.txt)

        #vamos a leer la informacion contenido dentro de nuestro archivo de Alumnos.txt 

        echo -e """\x1b[35m

\t\t\t\t     --------------------------------------------------------------------------------------------
\t\t\t\t         ██╗███╗░░██╗███████╗░█████╗░██████╗░███╗░░░███╗░█████╗░░█████╗░██╗░█████╗░███╗░░██╗
\t\t\t\t         ██║████╗░██║██╔════╝██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗██║██╔══██╗████╗░██║
\t\t\t\t         ██║██╔██╗██║█████╗░░██║░░██║██████╔╝██╔████╔██║███████║██║░░╚═╝██║██║░░██║██╔██╗██║
\t\t\t\t         ██║██║╚████║██╔══╝░░██║░░██║██╔══██╗██║╚██╔╝██║██╔══██║██║░░██╗██║██║░░██║██║╚████║
\t\t\t\t         ██║██║░╚███║██║░░░░░╚█████╔╝██║░░██║██║░╚═╝░██║██║░░██║╚█████╔╝██║╚█████╔╝██║░╚███║
\t\t\t\t         ╚═╝╚═╝░░╚══╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░╚════╝░╚═╝░░╚══╝
\t\t\t\t        
\t\t\t\t        ███████╗░██████╗████████╗██╗░░░██╗██████╗░██╗░█████╗░███╗░░██╗████████╗███████╗░██████╗
\t\t\t\t        ██╔════╝██╔════╝╚══██╔══╝██║░░░██║██╔══██╗██║██╔══██╗████╗░██║╚══██╔══╝██╔════╝██╔════╝
\t\t\t\t        █████╗░░╚█████╗░░░░██║░░░██║░░░██║██║░░██║██║███████║██╔██╗██║░░░██║░░░█████╗░░╚█████╗░
\t\t\t\t        ██╔══╝░░░╚═══██╗░░░██║░░░██║░░░██║██║░░██║██║██╔══██║██║╚████║░░░██║░░░██╔══╝░░░╚═══██╗
\t\t\t\t        ███████╗██████╔╝░░░██║░░░╚██████╔╝██████╔╝██║██║░░██║██║░╚███║░░░██║░░░███████╗██████╔╝
\t\t\t\t        ╚══════╝╚═════╝░░░░╚═╝░░░░╚═════╝░╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═════╝░
\t\t\t\t     --------------------------------------------------------------------------------------------"""
   
        echo -e """\x1b[37m
        =========|=======================================================| NOTAS ========================================|===============================
        Codigo \t | Nombre Completo \t   Curso \t   Paralelo \t | Teorica \t   Practico \t   Examen \t | Promedio \t     Estado \t
        ---------|-------------------------------------------------------|-----------------------------------------------|-------------------------------"""

        while IFS=" " read -ra codigo
        do 


            if [[ ${codigo[8]} -ge 0 ]] && [[ ${codigo[8]} -le 4 ]]; then 

                if [[ ${#codigo[2]} -le 4 ]]; then 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    fi 
                else 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[37;41m${codigo[9]}\x1b[0m"
                    fi
                fi  

            elif [[ ${codigo[8]} -ge 5 ]] && [[ ${codigo[8]} -le 7 ]]; then 
                if [[ ${#codigo[2]} -le 4 ]]; then 
                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    fi 
                else 

                    if [[ ${#codigo[3]} -le 6 ]]; then 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t\t         "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    
                    else 
                        echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"\t    "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;43m${codigo[9]}\x1b[0m"
                    fi
                
                    
                fi 
            elif [[ ${codigo[8]} -ge 8 ]] && [[ ${codigo[8]} -le 10 ]]; then 
                if [[ ${#codigo[2]} -le 4 ]]; then 
                    
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t\t "${codigo[3]}"\t      "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                    
                else 
                    echo -e "\n\t "${codigo[0]}"    "${codigo[1]}" "${codigo[2]}"\t "${codigo[3]}"            "${codigo[4]}"\t\t     "${codigo[5]}"\t\t     "${codigo[6]}"\t\t     "${codigo[7]}"\t\t     "${codigo[8]}"\t\t     ""\x1b[30;42m${codigo[9]}\x1b[0m"
                    
                fi 
            fi 

        
        done <<< $informacion

        if [[ $flag == true  ]]; then 

            echo -n -e "\n  [>] DESEAS GUARDAR LOS CAMBIOS REALIZADOS [Y/N]:  "
            IFS=" " read -ra opcion 

            if [[ ${#opcion[@]} == 0 ]]; then 
                imprimir_alerta "Debes insertar una opcion, presiona enter."
            else 
                if [[ ${#opcion[@]} != 1 ]]; then 
                    imprimir_alerta "Debes insertar una opcion, presiona enter."
                else 
                    
                    if [[ ${opcion[0]^^} == Y ]]; then 
                        #correcto..
                        echo -e "\n\n\x1b[30;42m [*] CAMBIOS GUARDADOS CORRECTAMENTE \x1b[0m"
                        echo $(sleep 4s)
                        break 
                    elif [[ ${opcion[0]^^} == N ]]; then 
                        #volvemos a reestablecer los datos ....
                        #ocupamos nuestra variable cambios , el cual contiene nuestros valores originales...los que no fueron modificados...
                        echo -e ${cambios[@]} > Alumnos.txt
                        flag=false
                    
                    fi 
                fi 
            fi 
        elif [[ $flag == false ]]; then
            imprimir_alerta "Cambios Reseteados, Presiona Enter..."
            break 
        fi 

    done 
}


iniciar_sesion

if [ $? -eq 0 ]; then 
    #ejecucion exitosa.... lo que podemos ejecutar otro tipo de codigo. 
    cambios=()
    
    #guardaremos la informacion del archivo dentro del arreglo cambios=()
    f=$(cat Alumnos.txt)
    while IFS=" " read -ra info 
    do 
        cambios+=${info[@]}
        cambios+="\n"
    done <<< $f
    
    readonly cambios=${cambios[@]}

    while [ true ]; do
        echo $(clear)
        
        echo -e """\033[32m
\t\t\t   ======================================================================================================================
\t\t\t        █▄▄ █ █▀▀ █▄░█ █░█ █▀▀ █▄░█ █ █▀▄ █▀█   ▄▀█ █░░   █▀ █ █▀ ▀█▀ █▀▀ █▀▄▀█ ▄▀█   █▀▄ █▀▀   █▄░█ █▀█ ▀█▀ ▄▀█ █▀
\t\t\t        █▄█ █ ██▄ █░▀█ ▀▄▀ ██▄ █░▀█ █ █▄▀ █▄█   █▀█ █▄▄   ▄█ █ ▄█ ░█░ ██▄ █░▀░█ █▀█   █▄▀ ██▄   █░▀█ █▄█ ░█░ █▀█ ▄█
\t\t\t   ======================================================================================================================"""
        echo -e "\033[39m"

        echo -e """\033[33m 
\t\t\t                     __________________________________________________________________________________
\t\t\t                         __________________________________________________________________________
\t\t\t                         |                                                                        |
\t\t\t                         |                  [1.-]  CREAR PERFIL ESTUDIANTIL                       |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [2.-]  MOSTRAR PERFILES ESTUDIANTILES                 |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [3.-]  GUARDAR PERFILES ESTUDIANTILES                 |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [4.-]  ELIMINAR PERFIL ESTUDIANTIL                    |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [5.-]  EDITAR PERFIL ESTUDIANTIL                      |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [6.-]  BUSCAR PERFIL ESTUDIANTIL                      |
\t\t\t                         |                                                                        |
\t\t\t                         |                  [7.-]  RETROCEDER                                     |
\t\t\t                          ________________________________________________________________________
\t\t\t                    ____________________________________________________________________________________"""

        echo -e -n """
\t\t\t                    [>] INTRODUCE TU OPCION: """ 
        read opcion 


        if [ "$opcion" == "" ]; then 
            imprimir_alerta "La entrada no debe estar vacia, presiona enter...." 
        else 
            case $opcion in 
                1 ) 
                    #trabajaremos con nuestra primera opcion para poder generar el respectivo perfil del estudiante. 
                    perfil_estudiante   ;;
                2 ) 
                    mostrar_perfil ;; 
                3 ) 
                    guardar_perfil ;; 
                4 ) 
                    eliminar_perfil ;;
                5 ) 
                    editar_perfil ;; 
                6 ) 
                    buscar_perfil ;;
                7 ) 
                    iniciar_sesion ;;
            esac 
        fi 

        echo $(sleep 1s)
    done
fi 