- https://github.com/ghdl/ghdl/releases - Installation
- http://ghdl.free.fr/ghdl/ - Instruction

-s = check syntax
```
ghdl -s ha.vhdl
```

-a = analyze = compile
```
ghdl -a ha_tb.vhdl
```

-e = elaborate = executable build
```
ghdl -e ha_tb
```

-r = run !Important! The name of the entity must be provided
```
ghdl -r ha_tb
```

--vcd = Creates .vcd dump
```
ghdl -r ha_tb --vcd=ha.vcd
```

Starts GTKWave - how should the output be read?
```
gtkwave ha.vcd
```

Translated with www.DeepL.com/Translator (free version)