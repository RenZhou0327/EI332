library verilog;
use verilog.vl_types.all;
entity sc_cu is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        z               : in     vl_logic;
        wmem            : out    vl_logic;
        wreg            : out    vl_logic;
        regrt           : out    vl_logic;
        m2reg           : out    vl_logic;
        aluc            : out    vl_logic_vector(3 downto 0);
        shift           : out    vl_logic;
        aluimm          : out    vl_logic;
        pcsource        : out    vl_logic_vector(1 downto 0);
        jal             : out    vl_logic;
        sext            : out    vl_logic
    );
end sc_cu;
