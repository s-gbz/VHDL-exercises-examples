- Do all signals always have to be mapped for a TestBench?
    - => Mapping connects PORT INPUTs with signals of the TB.
    Since mostly only INPUT signals are modified, OUTPUT mapping can be avoided.

- Difference Moore/ Medvedev?

- What does the package ieee.numeric_std.all contain ?
    - => provides arithmetic functions for vectors
- ieee.numeric_std.all;
    - => provides arithmetic functions for vectors of the signed, unsigned types and arithmetic ops

- Difference signal vs port
    - PORTS define the interface of a component.
    - Signals are active INPUTs which are processed by the PORT.

- Why do signals have to be passed to processes?
    - => Specified signals are part of the sensitivity list.
    The process is continued if the signals change.
    The specification of the signals therefore corresponds to the "wait on" statement.

- Are there differences between if/ when/ case?
    - => when : no prioritization of the order - parallel
    - => if : Prioritization of the sequence - sequential . multiplexer
    - => case : No prioritization of ranking - sequential - n-to-1 multiplexer 
    - when and if are equivalent implementations within their respective modes
    
- Must i be set during the falling edge? 
    - => no

- Why must there be falling edges? Why does the circuit not work with "duration-1"?
    - => Because the next state is not changed until the rising edge.
    - Clocking is necessary to work sequentially.
    - "True parallelism cannot be virtualized" or similar.

- Why is the output of the first shift register not immediately available at SIPO?

- How does convolution work with systolic arrays?


Translated with www.DeepL.com/Translator (free version)