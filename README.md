# Mario Kart Wii Remote Code Execution

Injects arbitrary code into a client's game.

## Prerequisites
- devkitPPC

## Building
```
mkdir out
/opt/devkitpro/powerpc-eabi-as -mgekko -mregnames ./source/mario_kart_wii_remote_code_execution.S -o ./out/mario_kart_wii_remote_code_execution.o
/opt/devkitpro/powerpc-eabi-ld -Ttext 0x80000000 ./out/mario_kart_wii_remote_code_execution.o
/opt/devkitpro/powerpc-eabi-objcopy -O binary ./out/mario_kart_wii_remote_code_execution.o ./out/mario_kart_wii_remote_code_execution.bin
```

## Usage
Branch to the compiled assembly code from the appropriate address. After the assembly code has finished executing, redirect code execution to the instruction following the original branch instruction.

## CVE-ID
[CVE-2023-35856](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-35856)

## License
[GNU General Public License v2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
