library verilog;
use verilog.vl_types.all;
entity sc_io_computer is
    port(
        SW0             : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        SW4             : in     vl_logic;
        SW5             : in     vl_logic;
        SW6             : in     vl_logic;
        SW7             : in     vl_logic;
        SW8             : in     vl_logic;
        SW9             : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end sc_io_computer;
