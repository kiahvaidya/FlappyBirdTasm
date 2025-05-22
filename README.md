# Flappy Bird Basic Demo in TASM

## Description

This is a simple assembly language program written for **Turbo Assembler (TASM)** running in a 16-bit DOS environment.
It simulates a very basic version of a "Flappy Bird"-style mechanic in **text mode** by moving a character (`@`) vertically on the screen:

* Gravity pulls the bird down each frame.
* Press **Spacebar** to make the bird "jump" (move up).
* The bird cannot move above the top or below the bottom of the screen.
* The bird’s horizontal position is fixed.

## Features

* Uses BIOS interrupts (`int 10h` for screen cursor and character output).
* Uses keyboard interrupts (`int 16h`) to detect key presses.
* Simple delay loop to slow down the update rate.

## Requirements

* Turbo Assembler (TASM)
* DOS environment or DOS emulator (e.g., DOSBox)

## How to assemble and run

1. Save the code as `flappy.asm`.
2. Open DOS prompt or DOSBox.
3. Assemble the code:

   ```
   tasm flappy.asm
   ```
4. Link the object file:

   ```
   tlink flappy.obj
   ```
5. Run the program:

   ```
   flappy.exe
   ```

## Controls

* **Spacebar**: Make the bird jump upward.
* No other controls.

## Limitations

* Not a complete game — no pipes, collision detection, or scoring.
* Runs only in 80x25 text mode.
* Simple delay for animation (not smooth).
* Only basic vertical movement.

## Notes

This program is meant as a learning example for keyboard input, screen output, and basic game logic in assembly language.
