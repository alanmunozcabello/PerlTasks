#lista para guardar tareas 

my @tareas; 

  

#menu principal 

sub menu { 

    print "\n------ Gestión de Tareas ------\n"; 

    print "1. Agregar tarea\n"; 

    print "2. Listar tareas\n"; 

    print "3. Marcar tarea como completada\n"; 

    print "4. Salir\n"; 

    print "Selecciona una opción: "; 

} 

  

#agrega una tarea a la lista 

sub agregar_tarea { 

    print "Ingrese la descripción de la tarea: "; 

    chomp(my $desc = <STDIN>);  #eliminar el '\n' del final de la cadena

    push @tareas, { descripcion => $desc, 
                    completada => 0 }; #añadir la tarea a tareas con su descripcion y como no completada por defecto

    print "Tarea agregada correctamente.\n"; 

} 

  

#listar todas las tareas 

sub listar_tareas { 

    if (@tareas == 0) { #si no hay tareas se muestra un mensaje y se retora

        print "No hay tareas registradas.\n"; 

        return; 

    } 

  

    print "\n=== Listado de Tareas ===\n"; 

    for my $i (0..$#tareas) { #se hay tareas se muestran una a una

        my $estado = $tareas[$i]->{completada} ? "[/]" : "[ ]"; #si una está completada asigna [/] a la variable estado

        print "$i. $estado $tareas[$i]->{descripcion}\n"; #aqui se imprime el estado y nombre/descripcion de la tarea

    } 

} 

  

#marcar una tarea como completada 

sub completar_tarea { 

    listar_tareas(); #primero se muestran las tareas

    if (@tareas == 0) { #si no hay tareas se retorna inmediatamente
        return;
    };

  

    print "Ingrese el número de la tarea que desea marcar como completada: "; 

    chomp(my $num = <STDIN>); #se obtiene el numero de la tarea y se le saca el '\n'

  

    if ($num >= 0 && $num <= $#tareas) { #si el numero ingresado es valido se marca como completada

        $tareas[$num]->{completada} = 1; 

        print "Tarea #$num marcada como completada.\n"; 

    } else { #si no es valido se muestra un mensaje

        print "Número No válido.\n"; 

    } 

} 

  

#menu recursivo

sub main { 

    while (1) { 

        menu(); #mostrar el menu 

        chomp(my $opcion = <STDIN>); #se obtiene el numero de la tarea y se le saca el '\n'

        if ($opcion<1 || $opcion>4) { #si la opcion no es valida se muestra un mensaje y se pasa a la siguiente iteracion del ciclo

            print "Entrada no válida. Intente de nuevo.\n"; 

            next; 

        };

        if ($opcion == 1) { #si la opcion es 1 se llama a agregar_tarea()

            agregar_tarea(); 

        } elsif ($opcion == 2) { #si la opcion es 2 se llama a listar_tareas()

            listar_tareas(); 

        } elsif ($opcion == 3) { #si la opcion es 3 se llama a completar_tarea()

            completar_tarea(); 

        } elsif ($opcion == 4) { #si la opcion es 4 se sale del programa

            print "¡Hasta luego!\n"; 

            last; 

        } else { #si la opcion no es valida se imprime un mensaje

            print "Opción no válida, intente de nuevo.\n"; 

        } 

    } 

} 

  

#ejecutar el programa 

main(); 
