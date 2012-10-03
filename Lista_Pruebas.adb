WITH Ada.Integer_Text_Io;
USE Ada.Integer_Text_Io;
WITH Ada.Text_Io;
USE Ada.Text_Io;

-- Hay que enganchar el paquete de la Lista con su WITH

WITH Lista;

PROCEDURE Lista_Pruebas IS 

   -- Lista_Pruebas.adb 
   -- Manual de uso de la Lista y programa de ejemplo de uso de una 
   -- lista de numeros naturales. 
   -- Fecha de creación: 10/04
   -- Fecha de última modificación: 24/11/05


   -- Hay que instanciar la Lista con la siguiente sintaxis:
   -- PACKAGE <<Mi_Lista>> IS NEW Lista (<<Tipo_Elemento_Mi_Lista>>);
   -- USE <<Mi_Lista>>;   -- No recomendable si hay varias listas

   PACKAGE Lista_Numeros IS NEW Lista (Natural);
   USE Lista_Numeros;

   -- Hay que declarar el procedimiento que escriba el
   -- Tipo_Elemento_MI_Lista con la siguiente sintaxis:
   -- PROCEDURE <<Escribir_Mi_Elemento>> (e:Tipo_Elemento_Mi_Lista) IS
   -- BEGIN
   --   <<Bloque de órdenes de escritura>>;
   -- END <<Escribir_Mi_Elemento>>;

   PROCEDURE Put_Numero (
         N : Natural ) IS 
   BEGIN
      Ada.Integer_Text_Io.Put (N,2);
   END Put_Numero;

   -- Hay que instanciar el procedimiento que escribe la Lista del
   -- genérico "Put" con la siguiente sintaxis:
   -- PROCEDURE <<Escribir_Mi_Lista>> IS NEW Escribir (<<Escribir_Mi_Elemento>>);

   PROCEDURE Put_Lista_Nat IS 
   NEW Escribir (Put_Numero);

   -- "Lista_Cons" debe recibir como parametro actual un agregado
   -- posicional (con sus parentesis y sus comitas) 
   -- No admite un agregado con un único elemento. Para hacer esto,
   -- es necesario utilizar el constructor de lista "Cons".

   Aux1 : CONSTANT Tipo := Lista_Cons ((2, 4, 6, 8, 0, 1, 3, 5, 7, 9)); 
   Aux2 : CONSTANT Tipo := Vacia;    
   Aux3 : CONSTANT Tipo := Cons (2, (Cons (3, (Cons (4, Vacia)))));  
   Aux4 : CONSTANT Tipo := Cons (4, Vacia);  


BEGIN
   Put ("Construyo la lista [1,2,3] : ");
   --Put_Lista_Nat (Cons (1,Cons (2,Cons (3,Vacia))));
   New_Line;
   Put ("La vacia: ");
   Put_Lista_Nat (Aux2);
   New_Line;
   Put ("Un 10 en la vacia: ");
   Put_Lista_Nat (Cons (10,Aux2));
   Ada.Text_Io.New_Line;
   Ada.Text_Io.Put ("La vacia original: ");
   Put_Lista_Nat (Aux2);
   New_Line;
   Put ("La de los 10 digitos: ");
   Put_Lista_Nat (Aux1);
   New_Line;
   Put ("Meto un 10: ");
   Put_Lista_Nat (Cons (10,Aux1));
   New_Line;
   Put ("La original de 10: ");
   Put_Lista_Nat (Aux1);
   New_Line;
   Put ("El resto: ");
   Put_Lista_Nat (Resto (Aux1));
   New_Line;
   Put ("El resto del resto: ");
   Put_Lista_Nat (Resto (Resto (Aux1)));
   New_Line;
   Put ("La original de 10: ");
   Put_Lista_Nat (Aux1);
   New_Line;
   Put ("Una con 3: ");
   Put_Lista_Nat (Aux3);
   New_Line;
   Put ("Otra con 1: ");
   Put_Lista_Nat (Aux4);
   New_Line;

END Lista_Pruebas;