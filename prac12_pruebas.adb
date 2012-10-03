WITH Prac11;
USE Prac11;
WITH Prac12;
USE Prac12;
--...

PROCEDURE Prac12_Pruebas IS 
   --------------------------------------------------------------------
   -- EFECTO: Programa para probar el paquete "Prac12.adb" de la
   --         práctica Prac12
   -- AUTOR: Metodología de la Programación.
   -- FECHA_CREACIÓN: 12/12/05
   -- ÚLTIMA_MODIFICACIÓN: 12/12/05 
   --------------------------------------------------------------------


   ------------  CONSTANTES DE DATOS PARA PRUEBAS  ----------



   Ps_Prueba00 : CONSTANT Tipo_Precipitaciones := Lista_Precipitaciones.Lista_Cons
     ((("Alberc", 1.0), ("Jarama", 5.0), ("Henare", 9.0), ("Alberc", 0.8),
     ("Tajuna", 1.9), ("Guadar", 11.0)));  
   Ps_Prueba01 : CONSTANT Tipo_Precipitaciones := Lista_Precipitaciones.Vacia;
      

   C_Prueba00 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Manzan", 17.0, "PERMEABLE");
      

   C_Prueba01 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Jarama", 60.0, "SEMIPERMEABLE");
      

   C_Prueba02 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Tajuna", 9.5, "POCO_PERMEABLE");
      

   C_Prueba03 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Henare", 3.0, "PERMEABLE");
      

   C_Prueba04 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Alberc", 9.0, "SEMIPERMEABLE");
      

   Embalse_Prueba00 : CONSTANT Tipo_Embalse := Lista_Embalse.Lista_Cons ((C_Prueba00,
     C_Prueba01, C_Prueba02, C_Prueba03, C_Prueba04));  
   Embalse_Prueba01 : CONSTANT Tipo_Embalse := Lista_Embalse.Vacia;  

   Embalses_Prueba00 : CONSTANT Tipo_Embalses := Lista_Embalses.Lista_Cons
     ((Embalse_Prueba00, Embalse_Prueba01));  

   Ch_Prueba00 : CONSTANT Tipo_Cuenca_Hidrografica := ("Tajo  ", Embalses_Prueba00,
     Ps_Prueba00);  

BEGIN
   -------------  LLAMADAS A LAS FUNCIONES  -------------

END Prac12_Pruebas;
