WITH Prac11;
USE Prac11;
WITH Lista;
PACKAGE Prac12 IS

   --------------------------------------------------------------------
   -- EFECTO: Paquete de especificación de tipos y operaciones para
   --         la práctica Prac12
   -- AUTOR: Metodología de la Programación.
   -- FECHA_CREACIÓN: 24/11/05
   -- ÚLTIMA_MODIFICACIÓN: 11/12/05
   --------------------------------------------------------------------
   --Medida = Tupla (Nombre, Precipitacion)
   TYPE Tipo_Medida IS
   RECORD
      Nombre : Tipo_Nombre;
      Precipitacion : Tipo_Precipitacion ;
   END RECORD;

   --Precipitaciones = Coleccion (Medida)
   PACKAGE Lista_Precipitaciones IS NEW Lista (Tipo_Medida);
   SUBTYPE Tipo_Precipitaciones IS Lista_Precipitaciones.Tipo;

   --Embalse = Coleccion (Cuenca_Fluvial)
   PACKAGE Lista_Embalse IS NEW Lista (Tipo_Cuenca_Fluvial);
   SUBTYPE Tipo_Embalse IS Lista_Embalse.Tipo;

   --Embalses = Coleccion (Embalse)
   PACKAGE Lista_Embalses IS NEW Lista (Tipo_Embalse);
   SUBTYPE Tipo_Embalses IS Lista_Embalses.Tipo;

   --Cuenca_Hidrografica = Tupla (Nombre, Embalses, Precipitaciones)
   TYPE Tipo_Cuenca_Hidrografica IS
   RECORD
      Nombre : Tipo_Nombre;
      Embalses : Tipo_Embalses;
      Precipitaciones : Tipo_Precipitaciones;
   END RECORD;

   --Porcentaje = [0, 100]
   SUBTYPE Tipo_Porcentaje IS Natural RANGE 0..100;

   FUNCTION Volumen_Embalse (
         E  : Tipo_Embalse;        
         Ps : Tipo_Precipitaciones ) 
     RETURN Tipo_Volumen; 
   --PRE : ...
   --POST: ...

   FUNCTION Es_Suelo_Valido (
         Ch : Tipo_Cuenca_Hidrografica; 
         S  : Tipo_Suelo;               
         P  : Tipo_Porcentaje           ) 
     RETURN Boolean; 
   --PRE : ...
   --POST: ...

END Prac12;
