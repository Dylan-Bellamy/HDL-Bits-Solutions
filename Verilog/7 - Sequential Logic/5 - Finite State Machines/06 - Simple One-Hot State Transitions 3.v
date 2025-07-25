module fsm3onehot_circuit(
   input in,
   input [3:0] state,
   output [3:0] next_state,
   output out
); 
   parameter A=0, B=1, C=2, D=3;
   // State transition logic: Derive an equation for each state flip-flop.
   assign next_state[A] = ~in&(state[0]|state[2]);
   assign next_state[B] = in&(state[0]|state[1]|state[3]);
   assign next_state[C] = ~in&(state[1]|state[3]);
   assign next_state[D] = in&state[2];
   // Output logic: 
   assign out = state[D];
endmodule 