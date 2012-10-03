PACKAGE BODY Prac12 IS

   --------------------------------------------------------------------
   -- EFECTO: Plantilla para la pr�ctica Prac12
   -- AUTOR: �ngel Alf�rez Aroca
   -- FECHA_CREACI�N: 11/11/05
   -- �LTIMA_MODIFICACI�N: 7/1/05
   --------------------------------------------------------------------
   -- OBSERVACIONES:
   -- S�lo hay que rellenar el c�digo relativo a la soluci�n de
   -- las funciones "Volumen_Embalse" y "Es_Suelo_Valido".
   -- Se pueden definir cualesquiera otras funciones que se consideren
   -- necesarias.
   -- Se deben a�adir las importaciones necesarias.
   --------------------------------------------------------------------
-- Funci�n auxiliar que calcula el volumen total de una cuenca
   function Volum_Total_Cu (C:Tipo_Cuenca_Fluvial;Ps:Tipo_Precipitaciones) return Tipo_Volumen is
   begin
      if Lista_Precipitaciones.Es_Vacia(Ps) then return 0.0;
      elsif C.Nombre=Lista_Precipitaciones.Primero(Ps).Nombre then 
         return Volumen_Cuenca(C,Lista_Precipitaciones.Primero(Ps).Precipitacion) + 
            Volum_Total_Cu (C,Lista_Precipitaciones.Resto(Ps));
      else return Volum_Total_Cu (C,Lista_Precipitaciones.Resto(Ps));
      end if;
   end Volum_Total_Cu;
   FUNCTION Volumen_Embalse (
         E  : Tipo_Embalse;        
         Ps : Tipo_Precipitaciones ) 
     RETURN Tipo_Volumen IS 
   BEGIN
      --------------------------------------------------------------------
      if Lista_Embalse.Es_Vacia(E) then return 0.0;
      else return Volum_Total_Cu(Lista_Embalse.Primero(E),Ps) + Volumen_Embalse(Lista_Embalse.Resto(E),Ps);
      end if;
      --------------------------------------------------------------------
   END Volumen_Embalse;
	--Funciona como filtro y como acumulador
   FUNCTION Volum_Total_Cu_Suel_Val (
      E : Tipo_Embalse;
      S : Tipo_Suelo;
      Ps: Tipo_Precipitaciones) 
         RETURN Tipo_Volumen IS
      BEGIN
         if Lista_Embalse.Es_Vacia(E) or Lista_Precipitaciones.Es_Vacia(Ps) then return 0.0;
         elsif Lista_Embalse.Primero(E).Suelo=S then
            return Volum_Total_Cu(Lista_Embalse.Primero(E),Ps) + Volum_Total_Cu_Suel_Val (Lista_Embalse.Resto(E),S,Ps);
         else return Volum_Total_Cu_Suel_Val (Lista_Embalse.Resto(E),S,Ps);
         end if;
      end Volum_Total_Cu_Suel_Val;
         
   --Funci�n que cumple la condici�n del programa (porcentaje)
   FUNCTION Condicion (      
      E : Tipo_Embalse;
      Ps: Tipo_Precipitaciones;
      S : Tipo_Suelo;
      P : Tipo_Porcentaje)
         return Boolean is 
   begin
      return integer (Volum_Total_Cu_Suel_Val(E,S,Ps)/Volumen_Embalse(E,Ps)) >= P/100;
   end Condicion;
   
   FUNCTION Condicion_Embalses (      
      Es : Tipo_Embalses;
      Ps: Tipo_Precipitaciones;
      S : Tipo_Suelo;
      P : Tipo_Porcentaje)
         return Boolean is 
   begin
      if Lista_Embalses.Es_Vacia(Es) or Lista_Precipitaciones.Es_Vacia(Ps) then
         return True;
      else
         return Condicion(Lista_Embalses.Primero(Es),Ps,S, P) and 
            Condicion_Embalses (Lista_Embalses.Resto(Es),Ps,S, P);
      end if;
   end Condicion_Embalses;   

   FUNCTION Es_Suelo_Valido (
         Ch : Tipo_Cuenca_Hidrografica; 
         S  : Tipo_Suelo;               
         P  : Tipo_Porcentaje           ) 
     RETURN Boolean IS 
   BEGIN
      --------------------------------------------------------------------
      return Condicion_Embalses(Ch.Embalses,Ch.Precipitaciones,S,P);  
      --------------------------------------------------------------------
   END Es_Suelo_Valido ;


END Prac12;
