# Angry Flappy Bird

Arcade de habilidad y reflejos, 2D, vista lateral, estilo "Flappy Bird". El jugador controla un personaje que vuela/flota en una posicion horizontal fija mientras el escenario avanza hacia la izquierda. El prototipo implementa el movimiento del personaje, la generacion de obstaculos, las colisiones, el puntaje y el flujo de pantallas (inicio / juego / game over / reinicio).

Proyecto academico individual desarrollado con la plantilla PIAPC. La documentacion del proceso esta en `docs/`: auditoria, especificacion, plan, evidencia de pruebas e informe final.

## Datos del proyecto

- Estudiante: Juan Martin Vianco Hail
- Materia, comision y anio: Programacion de IA y Patrones de Comportamiento, anio 2026 (comision: [PENDIENTE])
- Nombre del proyecto: Angry Flappy Bird
- Motor y version: Godot 4.7.2
- Estado: Prototipo jugable completo - inicio, juego, game over y reinicio funcionando

## Mecanicas implementadas

- Movimiento del personaje: caida por gravedad (900 px/s2) e impulso fijo hacia arriba (350 px/s) por input, con posicion horizontal fija.
- Obstaculos: pares de bloques con hueco fijo (150 px) generados cada 300 px con posicion vertical aleatoria; escenario en scroll constante (150 px/s).
- Colision precisa al borde: cualquier contacto con un obstaculo o con el techo/piso termina la partida.
- Puntaje: +1 por cada par de obstaculos superado, visible en el HUD.
- Pantallas: inicio (espera un input), juego y game over con reinicio total mediante un nuevo input.

## Requisitos y ejecucion

- Godot 4.7.2 (editor de escritorio).
- Editor: abrir el proyecto desde el editor (importar `project.godot`) y ejecutar con F5.
- CLI (headless, sin ventana): el binario del editor esta en `Downloads` (no en el PATH); ejemplo de validacion:
  `Godot_v4.7.2-stable_win64.exe --headless --path <ruta-del-proyecto> --quit-after 300`
- Los pasos reproducibles de validacion estan en `docs/evidencia-pruebas.md`.

## Controles

- Espacio / click / tap: inicia la partida, impulsa al personaje hacia arriba y reinicia tras el game over.

## Creditos

- Codigo: original del autor (Juan Martin Vianco Hail).
- Icono: generado por defecto al crear el proyecto en el editor Godot 4.7.2.
- Sin assets, sonidos, tipografias, plugins ni codigo de terceros.

## Entrega o demostracion

[PENDIENTE] Agregar el enlace a una compilacion, video o publicacion cuando la entrega lo requiera.