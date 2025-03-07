`timescale 1ns / 1ps

module sobel_edge_detector_tb;
    reg clk;
    reg rst;
    reg [7:0] pixel_in;
    wire [7:0] edge_out;
    
    sobel_edge_detector uut (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .edge_out(edge_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        pixel_in = 0;

        // Apply reset
        #10;
        rst = 0;
        
        // Feed in some sample pixel values
        #10 pixel_in = 8'h12;
        #10 pixel_in = 8'h45;
        #10 pixel_in = 8'h89;
        #10 pixel_in = 8'hFF;
        #10 pixel_in = 8'h34;
        #10 pixel_in = 8'h78;
        
        // Wait and stop simulation
        #50;
        $stop;
    end
endmodule
