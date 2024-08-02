 COMPILADOR EXPRESIONES REGULARES 

Flex: Una herramienta para generar analizadores léxicos. Flex se utiliza para identificar tokens en el texto de entrada, que en este caso incluyen números y operadores matemáticos.
Bison: Un generador de analizadores sintácticos que utiliza una gramática especificada en BNF (Backus-Naur Form) para analizar la estructura de las expresiones matemáticas.

Explicación del Código
Gramática (Bison): Define las reglas para interpretar y calcular expresiones matemáticas. Las reglas gramaticales especifican cómo las expresiones pueden ser combinadas usando operadores aritméticos.
Análisis Léxico (Flex): Define los patrones para reconocer números y operadores en la entrada de texto. Convierte la entrada en una secuencia de tokens que el analizador sintáctico puede procesar.**
