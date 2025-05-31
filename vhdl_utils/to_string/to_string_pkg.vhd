library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



package toStringPKG is 
    -- Various functions to print strings representation of values
    function to_string( slv : std_ulogic_vector ) return string;
    function to_string( slv : std_logic_vector ) return string;
    function to_string( sig : signed ) return string;
    function to_string( usig : unsigned ) return string;
    function to_hex( slv : std_ulogic_vector ) return string;
    function to_hex( slv : std_logic_vector ) return string;

end package;


package body toStringPKG is

        function int2hex( n : integer ) return character is
        begin
            case n is
            when 0 => return '0'; when  8 => return '8';
            when 1 => return '1'; when  9 => return '9';
            when 2 => return '2'; when 10 => return 'A';
            when 3 => return '3'; when 11 => return 'B';
            when 4 => return '4'; when 12 => return 'C';
            when 5 => return '5'; when 13 => return 'D';
            when 6 => return '6'; when 14 => return 'E';
            when 7 => return '7'; when 15 => return 'F';
            when others => 
                report "Bad N: " & integer'image(n);
                return '?';
            end case;
        end function;


    function to_hex ( slv : std_ulogic_vector ) return string is
        variable str : string (1 to slv'length/4 + 1);
        variable n : integer range 0 to 15;
        variable j : integer := 1;
        variable i : integer;
    begin
            if slv'ascending then
                i := slv'low;
                while i <= slv'high loop 
                    n := to_integer(unsigned(slv(i to i + 3)));
                    i := i+4;
                    str(j) := int2hex(n);
                    j := j + 1;
                end loop;
            else
                i := slv'high;
                while i >= slv'low loop
                    n := to_integer(unsigned(slv(i downto i - 3)));
                    i := i-4;
                    str(j) := int2hex(n);
                    j := j + 1;
                end loop;
            end if;

        if slv'length mod 4 = 0 then
            return str(1 to str'length - 1);
        else
            return str;
        end if;
    end function;

    function to_hex (slv : std_logic_vector ) return string is
    begin
        return to_hex(std_ulogic_vector(slv));
    end function;

    function to_string(slv: std_ulogic_vector) return string is
        variable slv_str : string (1 to slv'length);
        variable index : integer := 1;
    begin

        for i in slv'range loop
            slv_str(index) := std_ulogic'image(slv(i))(2);
            index := index + 1;
        end loop;
        return slv_str;
    end function;

    function to_string(slv: std_logic_vector) return string is
    begin
        return to_string(std_ulogic_vector(slv));
    end function;

    function to_string(sig : signed) return string is
        variable slv_var : std_ulogic_vector (sig'range) := std_Ulogic_vector(sig);
    begin
        return to_string(slv_var);
    end function;

    function to_string(usig : unsigned) return string is
        variable slv_var : std_ulogic_vector (usig'range) := std_Ulogic_vector(usig);
    begin
        return to_string(slv_var);
    end function;
end package body;
