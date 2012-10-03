WITH Ada.Numerics.Elementary_Functions;
USE Ada.Numerics.Elementary_Functions;

PACKAGE BODY Prac11 IS

   --------------------------------------------------------------------
   -- EFECTO: Plantilla para la práctica Prac11
   -- AUTOR: Ángel Alférez Aroca
   -- FECHA_CREACIÓN: 11/11/05
   -- ÚLTIMA_MODIFICACIÓN: 17/11/05
   --------------------------------------------------------------------
   -- OBSERVACIONES:
   -- Sólo hay que rellenar el código relativo a la solución de
   -- las funciones "Volumen_Cuenca" y "Cons".
   -- Se pueden definir cualesquiera otras funciones que se consideren
   -- necesarias.
   -- Se deben añadir las importaciones necesarias.
   --------------------------------------------------------------------
   FUNCTION Valor_K (Suelo : Tipo_Suelo) RETURN Tipo_Precipitacion IS
   BEGIN
      
      IF Suelo = PERMEABLE THEN
         RETURN 25.4;
      
      ELSIF Suelo = SEMIPERMEABLE THEN
         RETURN 15.2;
      
      ELSE
         RETURN 12.7;
   END IF;
  END Valor_k;



   FUNCTION Volumen_Cuenca (
         C : Tipo_Cuenca_Fluvial; 
         P : Tipo_Precipitacion ) 
     RETURN Tipo_Volumen IS
      --PRE : cierto
      --POST: 'resultado' es el volumen de agua medida en litros recogida en la cuenca 'C' 
   BEGIN
       RETURN(((P*C.Area*(10.0**6.0))/Valor_K(C.Suelo))*(1.0-Exp(-Valor_K(C.Suelo))));
   
       END Volumen_Cuenca;
       
       
       
       

   FUNCTION Cons (
         Nombre : Tipo_Nombre; 
         Area   : Tipo_Area;   
         Suelo  : String       ) 
     RETURN Tipo_Cuenca_Fluvial IS 
      --PRE : cierto
      --POST: 'resultado' es el dato que resulta al agregar los datos 'N', 'A' y 'S' en una tupla de tipo 'Cuenca_Fluvial', de modo que resultado = (N, A, Suelo (S)).
      --POST: resultado = (N, A, Suelo (S)).
      --DONDE: Suelo (S) = "Construcción de un dato de tipo Suelo a partir de un String 'S'"
   BEGIN
     IF Suelo="PERMEABLE" THEN
     RETURN (Nombre,Area,PERMEABLE);
     ELSIF Suelo="SEMIPERMEABLE" THEN
     RETURN (Nombre,Area,SEMIPERMEABLE);
     ELSE 
     RETURN (Nombre,Area,POCO_PERMEABLE);
     END IF;
   END Cons;

END Prac11;
