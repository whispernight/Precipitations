PACKAGE Prac11 IS

   --------------------------------------------------------------------
   -- EFECTO: Paquete de especificaci�n de tipos y operaciones para
   --         la pr�ctica Prac11
   -- AUTOR: �ngel Alf�rez Aroca
   -- FECHA_CREACI�N: 11/11/05
   -- �LTIMA_MODIFICACI�N: 18/11/05
   --------------------------------------------------------------------
   
   SUBTYPE Tipo_Nombre IS String (1..6);
   
   SUBTYPE Tipo_Area IS float range 0.0..float'last;
   
   TYPE Tipo_Suelo IS (PERMEABLE, SEMIPERMEABLE, POCO_PERMEABLE);
   
   TYPE Tipo_Cuenca_Fluvial IS record
         Nombre: Tipo_Nombre;
         Area:Tipo_Area;
         Suelo:Tipo_Suelo;
         end record;
   
   SUBTYPE Tipo_Precipitacion IS float range 0.0..float'last;

   SUBTYPE Tipo_Volumen IS float range 0.0..float'last;

   FUNCTION Volumen_Cuenca (
         C : Tipo_Cuenca_Fluvial; 
         P : Tipo_Precipitacion   ) 
     RETURN Tipo_Volumen; 
     

   FUNCTION Cons (
         Nombre : Tipo_Nombre; 
         Area   : Tipo_Area;   
         Suelo  : String       ) 
     RETURN Tipo_Cuenca_Fluvial ;
   END Prac11;
