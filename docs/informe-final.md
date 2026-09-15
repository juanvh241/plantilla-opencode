# Informe final

## Resultado

El proyecto paso de una base vacia de Godot a un prototipo jugable completo de "Angry Flappy Bird": el ave cae por gravedad (~900 px/s2) y recibe un impulso fijo (~-350 px/s) por input (espacio/click/tap); los obstaculos se generan en pares con hueco fijo (~150 px) a intervalos regulares (~300 px) con posicion vertical aleatoria y scroll constante (~150 px/s); el puntaje suma +1 por par superado; cualquier colision (obstaculo, techo o piso) congela la partida y muestra el puntaje; y un nuevo input reinicia todo. Los modelos de estado, puntaje y reinicio se validaron de forma automatica (exit 0) y la validacion visual final fue confirmada por el estudiante el 2026-09-15.

## Cambios y decisiones

- Cambios realizados (7 commits en `main`):
  1. `2c74f90` Seteado de opencode y proyecto de Godot.
  2. `6b116e1` Especificacion y plan del juego.
  3. `ef78c68` Jugador: gravedad e impulso.
  4. `9929a38` Obstaculos: generacion y scroll.
  5. `f18bda9` Colision, puntaje y HUD.
  6. `2eba7ab` Fix: conexion de senal passed en spawner (bug detectado en F5).
  7. `c2f9d22` Flujo de pantallas: inicio, juego, game over y reinicio.
- Decisiones humanas relevantes: motor Godot 4.7.2; nombre del proyecto; se mantuvo el nombre interno "flappy bird IA"; resolucion base 480x720 asumida (pendiente de confirmacion); commit identity `juanvh241`; force push aprobado al vincular el remoto; permisos: editar, ejecutar y commits/push locales, sin instalar ni red fuera del push.
- Acciones del agente aceptadas, rechazadas o corregidas: todas las partes aceptadas; el bug de conexion de senal fue detectado por el estudiante en F5 y corregido en `2eba7ab`.

## Validacion

- Camino principal: FSM test automatico (START→PLAYING→GAME_OVER→reinicio) con asserts OK y exit 0; escena principal 300 y 600 frames en headless sin errores (exit 0).
- Caso limite: test de spawn automatico (1 obstaculo sin errores tras el fix); el caso de rozar el borde del hueco queda como prueba manual en el editor.
- Version validada: `c2f9d22` (https://github.com/juanvh241/plantilla-opencode/commit/c2f9d22).

## Limites y riesgos pendientes

- La validacion visual completa (gravedad, impulso, conteo, colision y caso limite del borde) fue confirmada por el estudiante el 2026-09-15 y registrada en `evidencia-pruebas.md` (sin limites de juego pendientes).
- La resolucion de referencia 480x720 fue confirmada por el estudiante el 2026-09-15; dejo de considerarse un supuesto.
- La comision de la materia sigue pendiente de completar en el README.
- Si se exporta a movil, habria que validar el input tactil ("tap" ya mapeado) en destino real.