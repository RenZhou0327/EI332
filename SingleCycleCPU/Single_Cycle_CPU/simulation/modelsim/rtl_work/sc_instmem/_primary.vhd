library verilog;
use verilog.vl_types.all;
entity sc_instmem is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        mem_clk         : in     vl_logic;
        imem_clk        : out    vl_logic
    );
end sc_instmem;
