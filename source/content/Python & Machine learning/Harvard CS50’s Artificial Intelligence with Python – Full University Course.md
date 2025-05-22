---
draft: "true"
---

Apuntes del vídeo: https://www.youtube.com/watch?v=5NgNicANyqM

## Search
- Conceptos iniciales
	- **Agent**
	- **State**
	- **Initial state**: punto inicial para el algoritmo de búsqueda
	- **actions**: acciones que se pueden tomar en un estado concreto
		- Es una función: recoge el estado (input) y devuelve las acciones que se pueden tomar en ese estado.
	- **transition model**: qué estado resulta tras realizar una acción en un estado
	- **state space**: conjunto de todos los estados intermedios
	- **grafo**: representa los estados (nodos) y las acciones (aristas) que cambian de estados
	- **goal test**: determinar si el estado es el objetivo final
	- **path cost function**: coste asociado a una ruta concreta
	- **optimal solution**: la mejor solución posible
	- **nodo**: estructura de datos que contiene:
		- un estado
		- un padre
		- una acción (de padre a nodo)
		- coste de ruta (de inicio a actual)
	- approach
		- Empezar con la frontier (frontera) del estado inicial
		- *Mejora: almacenar los nodos visitados, para evitar bucles que visita hacia adelante y hacia atrás.*
		- repetir:
			- si la frontera está vacía (no más caminos), no hay solución posible
			- elimina un nodo de la frontera
			- si el nodo es el estado objetivo (goal state), ya tenemos la solución
			- *Mejora: añade el nodo actual a nodos visitados*
			- expandir el nodo, añadiendo los nodos resultantes a la frontera
				- *Mejora: solo se añade si no están ya en la frontera ni en la lista de nodos explorados.*
			- *Mejora: stack (pila): last in first out (LIFO) para decidir qué nodo se explora el siguiente.*
				- Enfoque de **búsqueda en profundidad.**
			- *Mejora: queue (cola): first in first out (FIFO) para decidir qué nodo se explora el siguiente.*
				- Enfoque de **búsqueda en anchura.**
	-  uninformed search
	- informed search
	- greedy best-first search
		- heurística h(n)
			- Distancia Manhattan
	- A* search
		- Considera h(n) + g(n)
			- h(n): heurística hasta objetivo
			- g(n): coste para llegar a ese nodo
	- Adversarial search
		- Minimax
			- Min: minimiza puntos (gana un jugador)
			- Max: maximiza puntos (gana otro jugador)
			- Game
				- S0: estado inicial
				- player(s): pueden mover estado s
				- action(s): acciones posibles en el estado s
				- result(s,a): devuelve el estado tras la acción a en el estado s
				- terminal(s): comprueba si el juego terminó
				- utility(s): valor que tiene el estado final del juego
			- El algoritmo dado un estado s
				- El jugador MAX escogerá la acción a, dentro del conjunto action(s) que produce el mayor valor de MIN-VALUE(result(s,a))
				- El jugador MIN escogerá la acción a, dentro del conjunto action (s) que produce el menor valor de MAX-VALUE(result(s,a))
```python
def MAX_VALUE(state):
	if terminal(state):
		return utility(state)
	v = -infinity
	for action in action(s):
		v = MAX(v, MIN_VALUE(result(state, action)))
	return v
```


				- optimizaciones:
					- Alpha-Beta prunning:
						- Eliminar nodos que no van a subir o bajar el valor que ya tiene un nodo anterior
			- Algoritmo Depth-Limited Minimax
				- evaluation function:
					- Dado un estado, obtiene la utility(state), es decir, cómo va el juego.
			- 