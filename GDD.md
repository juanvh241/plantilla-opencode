# GDD simplificado

## Juego y experiencia

- Genero y situacion de juego: Arcade de habilidad y reflejos, 2D, vista lateral, scroll horizontal infinito, estilo "Flappy Bird".
- Rol del jugador: Controla un personaje que vuela/flota en una posicion horizontal fija de la pantalla, mientras el escenario avanza hacia la izquierda.
- Experiencia buscada: Control simple de aprender pero dificil de dominar; tension momento a momento; ganas de reintentar de inmediato despues de perder.

## Comportamiento a resolver

- Entidad: Personaje jugable (ave u objeto volador).
- Problema actual: El proyecto esta vacio. No existe todavia el movimiento del personaje, la gravedad, la generacion de obstaculos, la deteccion de colision, el puntaje ni el flujo de pantallas (inicio / juego / game over).
- Comportamiento esperado: Detallado en la seccion Reglas.

## Reglas

- Movimiento del personaje: Cae constantemente por gravedad (velocidad vertical que aumenta con el tiempo, ej. aceleracion ~900 px/s2). Al recibir un input (tap / click / tecla espacio), se cancela la velocidad de caida y se aplica un impulso vertical fijo hacia arriba (ej. ~-350 px/s), luego vuelve a caer por gravedad. El personaje se mantiene siempre en la misma posicion horizontal.
- Escenario: Se desplaza horizontalmente hacia la izquierda a velocidad constante (ej. ~150 px/s). No hay aumento de dificultad ni de velocidad con el tiempo.
- Obstaculos: Pares de bloques (uno desde arriba, uno desde abajo) con un hueco vertical de altura fija (ej. ~150 px) entre ambos. Se generan a intervalos horizontales regulares (ej. cada ~300 px). La posicion vertical del hueco varia de forma aleatoria dentro de un rango en cada par nuevo.
- Puntaje: Se suma 1 punto cada vez que el personaje supera la posicion horizontal de un par de obstaculos sin haber chocado.
- Colision: Si el personaje toca cualquier parte de un obstaculo, o el limite superior o inferior de la pantalla, el juego pasa inmediatamente a estado de fin de partida.
- Pantallas: (1) Inicio: el juego espera un primer input para arrancar el movimiento. (2) Juego: el personaje vuela y se generan obstaculos. (3) Fin de partida: se detiene todo, se muestra el puntaje final, y un nuevo input reinicia completamente el estado (posicion del personaje, puntaje en 0, obstaculos eliminados).
- Caso limite: El personaje pasa justo rozando el borde del hueco entre dos obstaculos sin tocarlo — debe contar como pasada valida, no como choque. La deteccion de colision debe ser precisa al borde, no aproximada.

## Limites

- Fuera de alcance: Power-ups, distintos personajes o escenarios visuales, sonido y musica, guardado de puntaje entre sesiones, dificultad progresiva, multijugador.
- Restricciones tecnicas: Godot 4.
- Criterios de aceptacion:
  - Sin input, el personaje cae por gravedad de forma continua y visible.
  - Un input aplica siempre el mismo impulso vertical hacia arriba.
  - Los obstaculos se generan en pares con hueco de altura fija, a intervalos regulares, con posicion vertical aleatoria.
  - El puntaje se incrementa en exactamente 1 por cada par de obstaculos superado.
  - Cualquier colision (obstaculo o limite de pantalla) termina la partida y muestra el puntaje.
  - Desde la pantalla de fin de partida, un input reinicia el juego por completo.

El GDD delimita la intencion de diseno. La especificacion y el plan convierten esa intencion en una intervencion tecnica verificable.