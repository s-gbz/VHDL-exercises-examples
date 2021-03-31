- https://github.com/ghdl/ghdl/releases - Installation
- http://ghdl.free.fr/ghdl/ - Anleitung

-s = check syntax
```
ghdl -s ha.vhdl
```

-a = analyse = Kompilierung
```
ghdl -a ha_tb.vhdl
```

-e = elaborate = Executable build
```
ghdl -e ha_tb
```

-r = run !Wichtig! Es muss der Name der entity ausgegeben werden
```
ghdl -r ha_tb
```

--vcd = Erstellt .vcd Dump
```
ghdl -r ha_tb --vcd=ha.vcd
```

Startet GTKWave - wie sollen die Ausgaben gelesen werden?
```
gtkwave ha.vcd
```