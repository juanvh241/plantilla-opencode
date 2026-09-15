# Plan de intervencion

## Objetivo del plan

Completar el prototipo definido en el GDD en cinco partes incrementales. Cada parte entrega una mecanica verificable contra uno o mas criterios de aceptacion de la especificacion, con commits pequenos y documentacion de evidencia, sin ampliar el alcance declarado (sin power-ups, sonido, dificultad progresiva, etc.).

## Cambios propuestos

| Paso | Cambio minimo | Archivos previstos | Verificacion | Riesgo | Condicion de detencion |
|---:|---|---|---|---|---|
| 1 | Jugador: gravedad (~900 px/s2), impulso (~-350 px/s) fijo y constante, posicion horizontal fija, input espacio/click para impulsar | `scenes/player.tscn`, `scripts/player.gd`, `scenes/main.tscn` | Play (F5): sin input cae acelerando; cada input aplica siempre el mismo impulso hacia arriba | El impulso depende del delta/frame y varia | Si la caida o el impulso no son uniformes o el impulso acumula fuerza |
| 2 | Obstaculos: pares superior/inferior, hueco fijo (~150 px), intervalo regular (~300 px), posicion vertical aleatoria en rango, scroll izquierdo constant (~150 px/s) | `scenes/obstacle.tscn`, `scripts/obstacle_spawner.gd` | Play: pares regulares y alineados, hueco constante, posicion del hueco varia, scroll uniforme | Desalineacion entre el bloque superior e inferior del mismo par | Si el hueco o el intervalo no son constantes o los bloques del par no quedan alineados |
| 3 | Colision precisa al borde (obstaculos + limites superior/inferior) y puntaje (+1 por par superado) con HUD | Ajustes de colisionadores en escenas, `scripts/game_score.gd` o HUD en `main.tscn` | Play: cualquier contacto real termina la partida; +1 exacto por par; rozar el borde sin tocar cuenta como valido | Falsos positivos/negativos por tamano de colisionador | Si se detecta colision o fallo sin contacto visual claro, o el puntaje suma de mas |
| 4 | Flujo de pantallas: Inicio (espera input), Juego, Fin de partida (detiene todo, muestra puntaje) y reinicio total con input | `scripts/game_state.gd` o controlador en `main.tscn` | Play: transiciones correctas; reinicio limpia obstaculos y pone puntaje en 0 | Estado inconsistente en el reinicio (objetos residuales) | Si tras un reinicio quedan obstaculos o el puntaje no queda en 0 |
| 5 | Cierre: evidencia de pruebas reproducible por criterio, informe final y README final de controles/requisitos | `docs/evidencia-pruebas.md`, `docs/informe-final.md`, `README.md` | Ejecutar los pasos documentados y cruzar con cada criterio del GDD | Criterio sin prueba alguna | Si un criterio del GDD no queda cubierto por evidencia reproducible |

## Orden de implementacion

1. Primero el jugador (paso 1): es la base observable minima y desbloquea la verificacion de gravedad/impulso.
2. Luego los obstaculos (paso 2): dependen de un escenario que avanza y del jugador como referencia visual de `x`.
3. Luego colision y puntaje (paso 3): requieren obstaculos reales sobre los cuales detectar contacto y pares superados.
4. Luego el flujo de pantallas (paso 4): integra las mecanicas ya validadas; un reinicio incorrecto se detecta porque las partes 1-3 ya estan probadas.
5. Al final la evidencia y el informe (paso 5): recopilan las ejecuciones manuales de los pasos 1-4 contra los criterios.

Cada paso termina solo cuando su verificacion da el resultado esperado; no se avanza al paso siguiente con una verificacion fallida sin consulta.

## Fuera de alcance

- Todo lo declarado como "No incluye" en la especificacion (power-ups, sonido/musica, guardado de puntaje, dificultad progresiva, multijugador, exportacion).
- Renombrar el proyecto en `project.godot` (se mantiene "flappy bird IA" por decision del estudiante).
- Instalar herramientas (p. ej. `gh` CLI) o cambiar la configuracion global de git.
- Cambios al `.gitignore` o al estilo de render fuera de lo aprobado.