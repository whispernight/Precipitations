generic
   type Tipo_Elemento is private; 
   -- Tipo de los elementos --  

package Lista is

-- lista.ads 
-- M�dulo para manejo de listas en Ada (Especificaci�n) --
-- Autor: Metodolog�a de la Programaci�n
-- Fecha de creaci�n: 16/10/99
-- Fecha de �ltima modificaci�n: 23/11/05

-- Tipos -----------------------------------------------------------

type Tipo is private; 
-- Tipo para declarar listas --

type Tipo_Elementos is array (Positive range <>) of Tipo_Elemento; 
-- Tipo para la funci�n 'ListaCons' --

-- Funciones de manejo de listas -----------------------------------

function Vacia return Tipo; 
-- PRE: cierto
-- POST: resultado = <>

function Es_Vacia (L : Tipo ) return Boolean;
-- PRE: cierto
-- POST: resultado = (Longitud (L) = 0)

function Primero (L : Tipo ) return Tipo_Elemento; 
-- PRE: �EsVacia (L)
-- POST: resultado = L(1)

function Resto (L : Tipo ) return Tipo;
-- PRE: �EsVacia (L)
-- POST: resultado = L(2..)

function Cons (E : Tipo_Elemento; L : Tipo) return Tipo; 
-- PRE: cierto
-- POST: resultado(1) = E /\ resultado(2..) = L

-- Funci�n para manejar constantes de tipo lista -------------------

function Lista_Cons (Elementos : Tipo_Elementos) return Tipo; 
-- PRE: cierto
-- POST: "Generar una lista formada por 'elementos'."
-- POST: resultado = elementos

-- Procedimiento gen�rico para imprimir listas ---------------------

generic
  with procedure Put_Elemento (E : Tipo_Elemento); 
procedure Escribir (L : Tipo ); 

  Error_De_Lista : exception;
  
private
  type Desc;
  type Tipo is access Desc; 

end Lista;
