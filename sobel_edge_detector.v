module sobel_edge_detector (
    input wire clk,           // Clock signal
    input wire rst,           // Reset signal
    input wire [7:0] pixel_in, // 8-bit input pixel
    output reg [7:0] edge_out  // 8-bit output pixel (edge detected)
);

    // 3x3 pixel buffer
    reg [7:0] line_buffer [2:0][2:0];
    integer i, j;
    
    wire signed [10:0] Gx, Gy;  // Gradient values

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all pixel values in the buffer
            for (i = 0; i < 3; i = i + 1)
                for (j = 0; j < 3; j = j + 1)
                    line_buffer[i][j] <= 0;
            edge_out <= 0;
        end else begin
            // Shift pixels in the 3x3 buffer
            for (i = 0; i < 2; i = i + 1) begin
                for (j = 0; j < 3; j = j + 1) begin
                    line_buffer[i][j] <= line_buffer[i+1][j];
                end
            end
            
            for (j = 0; j < 2; j = j + 1) begin
                line_buffer[2][j] <= line_buffer[2][j+1];
            end
            
            line_buffer[2][2] <= pixel_in;

            // Compute Sobel gradients
            assign Gx = (line_buffer[0][0] + (line_buffer[1][0] << 1) + line_buffer[2][0]) -
                        (line_buffer[0][2] + (line_buffer[1][2] << 1) + line_buffer[2][2]);

            assign Gy = (line_buffer[0][0] + (line_buffer[0][1] << 1) + line_buffer[0][2]) -
                        (line_buffer[2][0] + (line_buffer[2][1] << 1) + line_buffer[2][2]);

            // Compute the final edge magnitude
            edge_out <= (|Gx| + |Gy|) > 8'hFF ? 8'hFF : (|Gx| + |Gy|);
        end
    end
endmodule
