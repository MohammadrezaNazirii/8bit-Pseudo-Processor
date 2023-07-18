`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:08:59 07/16/2022
// Design Name:   main
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 2/Logic Circuits/project/project/final_test.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module final_test;

	// Inputs
	reg clk;
	reg [19:0] data;

	// Outputs
	wire [7:0] result_Ra;
	wire [7:0] result_Rb;
	wire [7:0] result_Rc;
	wire [7:0] result_Rd;
	wire [15:0] result_bFloat;
	wire SF;
	wire ZF;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.data(data), 
		.result_Ra(result_Ra), 
		.result_Rb(result_Rb), 
		.result_Rc(result_Rc), 
		.result_Rd(result_Rd), 
		.result_bFloat(result_bFloat), 
		.SF(SF), 
		.ZF(ZF)
	);

	always #40 clk = ~clk;
	
	integer file;
	integer j;

	initial begin
		// Initialize Inputs
		clk = 0;
		#20;

		file = $fopen("instructions.txt", "r");
		
		for(j = 0;!$feof(file);j = j + 1)begin
			$fscanf(file, "%b", data);
			#80;
		end

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

