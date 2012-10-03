WITH Prac11;
USE Prac11;
WITH Ada.Text_Io;USE Ada.Text_Io;
WITH Ada.Float_Text_Io;USE Ada.Float_Text_Io;


PROCEDURE Prac11_Pruebas IS 
   --------------------------------------------------------------------
   -- EFECTO: Programa para probar el paquete "Prac11.adb" de la
   --         práctica Prac11
   -- AUTOR: Ángel Alférez Aroca
   -- FECHA_CREACIÓN: 11/11/05
   -- ÚLTIMA_MODIFICACIÓN: 30/11/05 
   --------------------------------------------------------------------


   ------------  CONSTANTES DE DATOS PARA PRUEBAS  ----------

   C_Prueba00 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Manzan",
     17.0, "PERMEABLE");  
   C_Prueba01 : CONSTANT Tipo_Cuenca_Fluvial := Cons ("Jarama",
     60.0, "SEMIPERMEABLE");  

   P_Prueba00 : CONSTANT Tipo_Precipitacion := 1.0;  
   P_Prueba01 : CONSTANT Tipo_Precipitacion := 5.0;  

BEGIN
   Put(Volumen_Cuenca(C_Prueba00,P_Prueba00));
   new_line;
   Put(Volumen_Cuenca(C_Prueba01,P_Prueba01));
   END Prac11_Pruebas;
