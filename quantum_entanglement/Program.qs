namespace FirstQuantum {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    

    //  [Basic Operation of Quantum Entanglement Gate].
    //           
    //           _____ 
    //  |q0> ----| H | ---- O -----
    //           -----      |
    //                      |  
    //                      _
    //  |q1> --------------|+| ----
    //                      -
    //          (Hadamard) (CNOT)
    //            (Gate)


    @EntryPoint()
    operation EntanglementFunction() : Result [] {
        // Initialise two qubits as |0>.
        using (qubits = Qubit[2]) {
            // Hadamard gate on q0
            H(qubits[0]);
            // q0 is control, q1 is target.
            CNOT(qubits[0],qubits[1]);
            Message("Initial state of qubits: ");
            // DumpMachine gives the wave function of the system.
            // First column = computational basis state.
            // Second = Probability amplitude.
            // Column after ****... = numeric value of magnitude (i.e. modulus of 
            // complex number in column 2).
            DumpMachine();
            // MultiM measures an array of qubits
            // in this case it is measure qubits after Entanglement operation
            let result = MultiM(qubits);
            Message("After state: ");
            DumpMachine();
            return result;
        }
    }  
}
