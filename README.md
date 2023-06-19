# Mario Kart Wii Remote Code Execution

Injects arbitrary code into a client's game.

## Assembling
```
powerpc-gekko-as.exe mario_kart_wii_remote_code_execution.S -o mario_kart_wii_remote_code_execution.elf
powerpc-eabi-objcopy.exe -O binary mario_kart_wii_remote_code_execution.elf mario_kart_wii_remote_code_execution.bin
```

## Usage
Branch to the compiled assembly code from the appropriate address. After the assembly code has finished executing, redirect code execution to the instruction following the original branch instruction.

## CVE-ID
[CVE-2023-35856](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-35856)

## License
[GNU General Public License v2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
