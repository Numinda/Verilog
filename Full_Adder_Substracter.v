module Full_Adder_Substracter(
    output cout, //MSB, determines if answer is positive or negative
    output [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [7:0] bin;
    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;                          
    assign bin[5] = b[5]^cin;
    assign bin[6] = b[6]^cin;
    assign bin[7] = b[7]^cin;
    
      
    wire [8:1] carry; 
     Full_Adder FA0(a[0],bin[0],cin,carry[1],s[0]);
     Full_Adder FA1(a[1],bin[1],carry[1],carry[2],s[1]);
     Full_Adder FA2(a[2],bin[2],carry[2],carry[3],s[2]);
     Full_Adder FA3(a[3],bin[3],carry[3],carry[4],s[3]);
     Full_Adder FA4(a[4],bin[4],carry[4],carry[5],s[4]);
     Full_Adder FA5(a[5],bin[5],carry[5],carry[6],s[5]);
     Full_Adder FA6(a[6],bin[6],carry[6],carry[7],s[6]);
     Full_Adder FA7(a[7],bin[7],carry[7],carry[8],s[7]);
     
     assign cout = cin^carry[8];
   
endmodule