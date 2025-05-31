library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package test_utils is
    procedure clock
    (
        signal clk : inout std_ulogic;
        signal stop : in boolean;
        constant clk_period : in time
    );
end package;


package body test_utils is

    procedure clock
    (
        signal clk : inout std_ulogic;
        signal stop : in boolean;
        constant clk_period : in time
    ) is
    begin
        while not stop loop
            clk <= not clk;
            wait for clk_period/2;
        end loop;
    end procedure;

end package body;
