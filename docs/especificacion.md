# Especificacion

## Problema

El proyecto de Godot es una base vacia (solo `project.godot` e icono): no existe ninguna mecanica del juego definido en el GDD. Se necesita un prototipo jugable de "Angry Flappy Bird" que implemente el movimiento del personaje, la generacion de obstaculos, la deteccion de colision, el puntaje y el flujo de pantallas.

## Resultado esperado

Un juego 2D lateral funcional en Godot 4 con: personaje que cae por gravedad y recibe un impulso fijo por input; escenario en scroll horizontal constante; pares de obstaculos con hueco fijo y posicion vertical aleatoria; +1 por par superado; colision precisa que termina la partida mostrando el puntaje; y reinicio completo con un nuevo input.

## Alcance

- Incluye:
  - Escena principal + personaje (gravedad ~900 px/s2, impulso ~-350 px/s, posicion horizontal fija).
  - Input: espacio / click / tap.
  - Generacion de obstaculos en pares (hueco ~150 px) a intervalos regulares (~300 px) con posicion vertical aleatoria.
  - Scroll del escenario hacia la izquierda a velocidad constante (~150 px/s).
  - Colision precisa al borde (obstaculos y limites superior/inferior de pantalla).
  - Puntaje: +1 por par superado, con HUD visible.
  - Flujo de pantallas: Inicio / Juego / Fin de partida con reinicio total.
  - Documentacion de proceso (evidencia-pruebas, registro-intervencion, informe-final).
- No incluye: power-ups, personajes o escenarios alternativos, sonido y musica, guardado de puntaje entre sesiones, dificultad progresiva, multijugador, exportacion a plataformas.

## Restricciones

- Tecnicas: Godot 4.7.2, GDScript, renderer GL Compatibility (configurado en `project.godot`), arquitectura por escenas (jugador, obstaculos, spawner, HUD).
- Operativas: commits pequenos por parte; registro de cada ciclo; push solo a `origin main`; sin instalar dependencias, sin red fuera del push; sin tocar archivos fuera del plan.
- De calidad: cada parte se valida manualmente en el editor (F5) contra los criterios de aceptacion y se documenta en `evidencia-pruebas.md`; sin codigo muerto ni valores magicos sin constante.

## Casos y criterios de aceptacion

| Caso | Dado | Cuando | Entonces | Evidencia |
|---|---|---|---|---|
| Caida por gravedad | Juego en estado Inicio o Juego, sin input | El personaje queda libre | Desciende de forma continua y acelerada (aceleracion ~900 px/s2) | Play manual (F5) registrado en evidencia-pruebas |
| Impulso | Juego en estado Juego | Se recibe un input (espacio/click/tap) | Se cancela la caida y se aplica el mismo impulso fijo hacia arriba, luego vuelve a caer | Play manual + captura |
| Generacion de obstaculos | Juego en estado Juego | El escenario avanza | Aparecen pares cada ~300 px, hueco de ~150 px, posicion vertical aleatoria en cada par; scroll ~150 px/s constante | Play manual + captura |
| Puntaje | El personaje supera la posicion horizontal de un par | Sin colision | El marcador suma exactamente 1 (una sola vez por par) | Play manual |
| Colision con obstaculo o limite | El personaje toca un obstaculo o el borde superior/inferior de la pantalla | En cualquier momento | Termina la partida de inmediato y se muestra el puntaje final | Play manual |
| Borde del hueco (caso limite) | El personaje roza el borde del hueco sin tocarlo | Al pasar un par | Cuenta como pasada valida (preciso al borde, no aproximado); suma +1 si supera el par | Play manual |
| Reinicio (caso limite) | Pantalla de fin de partida | Se recibe un input | Se reinicia por completo: posicion del personaje, puntaje en 0, obstaculos eliminados | Play manual |
| Error | Estado inconsistente tras un reinicio | Se ejecuta el reinicio | No quedan obstaculos residuales, el personaje esta en su posicion inicial y el puntaje en 0 | Play manual + revision de escena |

## Invariantes

- El personaje conserva su posicion horizontal fija durante toda la partida.
- La aceleracion, el impulso, la velocidad de scroll y el tamano del hueco son constantes (sin dificultad progresiva).
- El impulso aplica siempre el mismo valor (sin sumar fuerza acumulada).
- El puntaje solo aumenta por pares efectivamente superados (maximo 1 por par).
- Fin de partida: si el personaje abandona el area visible por un limite (superior o inferior), el estado de fin de partida se activa igualmente (equivalente a colision con el limite).

## Preguntas abiertas

- Resolucion de referencia de la ventana: el GDD usa valores absolutos en px. Se asumira una base 480x720 (retrato), pendiente de confirmacion del estudiante.
- Rotacion visual del personaje al impulsarse (estetica): el GDD no lo define; se implementara sin rotacion salvo indicacion contraria.
- Input movil (touch) en exportacion: fuera de alcance; el click y el espacio son suficientes para el prototipo.
- Metodo de ejecucion de pruebas: manual en el editor (F5) mientras `godot` no este en el PATH.