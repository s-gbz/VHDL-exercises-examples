- Müssen bei einer TestBench immer alle Signale gemappt werden?
    - => Mapping verbindet PORT INPUTs mit Signalen der TB.
    Da meist nur INPUT Signale modifiziert werden, kann OUTPUT mapping vermieden werden

- Unterschied Moore/ Medvedev?

- Was enthält das Package ieee.numeric_std.all ?
    - => provides arithmetic functions for vectors
- ieee.numeric_std.all;
    - => provides arithmetic functions for vectors of the signed, unsigned types and arithmetic ops

- Unterschied signal vs port
    - PORTS definieren das Interface einer Komponente.
    - Signale sind aktive INPUTs die vom PORT verarbeitet werden

- Warum müssen Signale an Prozesse überreicht werden?
    - => Angegebene Signalen sind Teil der sensitivity list.
    Der Prozess wird fortgeführt sofern die Signale sich ändern.
    Die Angabe der Signale entspricht somit dem "wait on" statement.

- Gibt es Unterschiede zwischen if/ when/ case?
    - => when : Keine Priorisierung der Rangfolge - parallel
    - => if   : Priorisierung der Rangfolge - sequentiell . multiplexer
    - => case : Keine Priorisierung der Rangfolge - sequentiell - n-zu-1 multiplexer 
    - when und if sind äquivalente implementationen innerhalb ihrer jeweiligen modi
    
- Muss i während der sinkenden flanke gesetzt werden? 
    - => nein

- Warum muss es sinkende Flanken geben? Warum funktioniert die Schaltung nicht mit "dauer-1"?
    - => Weil der nächste Status erst bei steigender Flanke verändert wird.
    - Taktung ist notwendig, um sequentiell arbeiten zu können.
    - "Echte Parallelität ist nicht virtualisierbar" o.ä.

- Warum ist beim SIPO die Ausgabe des ersten Shift Registers nicht sofort verfügbar?

- Wie funktioniert Faltung bei systolischen Arrays?
