WITH Text_Io;
USE Text_Io;

PACKAGE BODY Lista IS

  -- lista.ads 
  -- Módulo para manejo de listas en Ada (Implementación) --
  -- Autor: Javier Galve
  -- Fecha de creación: 16/10/99
  -- Fecha de última modificación: 20/12/05


 type Desc is
    record 
      Elemento  : Tipo_Elemento;  
      Siguiente : Tipo;  
    end record; 


  FUNCTION Vacia RETURN Tipo IS
  BEGIN
    RETURN NULL;
  END Vacia;

  FUNCTION Es_Vacia (L : Tipo ) RETURN Boolean IS
  BEGIN
    RETURN L = NULL;
  END Es_Vacia;

  FUNCTION Copia (L : Tipo ) RETURN Tipo IS
    Aux, Copia, Nuevo : Tipo := L;
  BEGIN
    IF Aux = NULL THEN
      Copia := NULL;
    ELSE
      Copia := NEW Desc'(Aux.ALL.Elemento,NULL);
      Nuevo := Copia;
      WHILE Aux.ALL.Siguiente /= NULL LOOP
        Aux := Aux.ALL.Siguiente;
        Nuevo.ALL.Siguiente := NEW Desc' (Aux.ALL.Elemento,NULL);
        Nuevo := Nuevo.ALL.Siguiente;
      END LOOP;
    END IF;
    RETURN Copia;
  END Copia;

  FUNCTION Cons (E : Tipo_Elemento; L : Tipo) RETURN Tipo IS
  BEGIN
    RETURN NEW Desc'(E,Copia (L));
  END Cons;

  FUNCTION Cons_Final (E : Tipo_Elemento; L : Tipo) RETURN Tipo IS
    Aux : Tipo;
  BEGIN
    IF L = NULL THEN
      RETURN NEW Desc'(E, NULL);
    ELSE
      Aux := L;
      WHILE Aux.Siguiente /= NULL LOOP
        Aux := Aux.Siguiente;
      END LOOP;
      Aux.Siguiente := NEW Desc'(E, NULL);
      RETURN L;
    END IF;
  END Cons_Final;

  FUNCTION Primero (L : Tipo) RETURN Tipo_Elemento IS
  BEGIN
    IF Es_Vacia (L) THEN
      RAISE Error_De_Lista;
    ELSE
      RETURN L.Elemento;
    END IF;
  END Primero;

  FUNCTION Resto (L : Tipo) RETURN Tipo IS
  BEGIN
    IF Es_Vacia (L) THEN
      RAISE Error_De_Lista;
    ELSE
      RETURN Copia (L.Siguiente);
    END IF;
  END Resto;

--  FUNCTION Longitud (L : Tipo) RETURN Natural IS
--    C  : Natural := 0;
--    L1 : Tipo    := L;
--  BEGIN
--    WHILE L1 /= NULL LOOP
--      C := C + 1;
--      L1 := L1.Siguiente;
--    END LOOP;
--    RETURN C;
--  END Longitud;

  FUNCTION Lista_Cons (Elementos : Tipo_Elementos) RETURN Tipo IS
    Lista : Tipo;
    I     : Positive;
  BEGIN
    I := 1;
    Lista := Vacia;
    FOR I IN Elementos'First..Elementos'Last LOOP
      Lista := Cons_Final (Elementos (I), Lista);
    END LOOP;
    RETURN Lista;
  END Lista_Cons;

  PROCEDURE Escribir (L : Tipo ) IS
    L1 : Tipo := L;
  BEGIN
    Put ("[");
    WHILE L1 /= NULL LOOP
      Put_Elemento (L1.Elemento);
      L1 := L1.Siguiente;
      IF L1 /= NULL THEN
        Put (" ,");
      END IF;
    END LOOP;
    Put ("]");
  END Escribir;

END Lista;
