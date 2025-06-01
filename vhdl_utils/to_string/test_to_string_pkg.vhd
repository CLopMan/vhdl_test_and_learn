library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
library vunit_lib;
--context vunit_lib.vunit_context;
use vunit_lib.string_ops.all;
use vunit_lib.dictionary.all;
use vunit_lib.path.all;
use vunit_lib.print_pkg.all;
use vunit_lib.log_levels_pkg.all;
use vunit_lib.logger_pkg.all;
use vunit_lib.log_handler_pkg.all;
use vunit_lib.id_pkg.all;
use vunit_lib.ansi_pkg.all;
use vunit_lib.checker_pkg.all;
use vunit_lib.check_pkg.all;
use vunit_lib.run_types_pkg.all;
use vunit_lib.run_pkg.all;
use vunit_lib.runner_pkg.key_t;
use vunit_lib.event_common_pkg.all;
use vunit_lib.event_pkg.all;

use work.toStringPKG.all;

entity to_string_pkg_tb is
    generic (runner_cfg : string);
end to_string_pkg_tb;

architecture bhv of to_string_pkg_tb is 
    signal my_vec_ascending : std_ulogic_vector(2 to 17) := X"ABCD";
    signal my_vec_descending : std_ulogic_vector(17 downto 2) := X"ABCD";
    signal my_logic_vec_ascending : std_logic_vector(2 to 17) := X"ABCD";
    signal my_logic_vec_descending : std_logic_vector(17 downto 2) := X"ABCD";
    signal signed_value_asc : signed (2 to 17) := to_signed(-314, 16);
    signal signed_value_desc : signed (17 downto 2) := to_signed(-314, 16);
    signal unsigned_value_asc : unsigned (2 to 17) := to_unsigned(314, 16);
    signal unsigned_value_desc : unsigned (17 downto 2) := to_unsigned(314, 16);
begin
    main : process
    begin
        test_runner_setup(runner, runner_cfg);

        while test_suite loop
            if run("to_sulv_hex_ascending") then
                assert "ABCD" = to_hex(my_vec_ascending);
            elsif run("to_sulv_hex_descending") then
                assert "ABCD" = to_hex(my_vec_descending);
            elsif run("to_sulv_string_ascending") then
                assert "1010101111001101" = to_string(my_vec_ascending);
            elsif run("to_sulv_string_descending") then
                assert "1010101111001101" = to_string(my_vec_descending);
            elsif run("to_slv_string_ascending") then
                assert "1010101111001101" = to_string(my_logic_vec_ascending);
            elsif run("to_slv_hex_ascending") then
                assert "ABCD" = to_hex(my_logic_vec_ascending);
            elsif run("to_slv_string_descending") then
                assert "1010101111001101" = to_string(my_logic_vec_descending);
            elsif run("to_slv_hex_descending") then
                assert "ABCD" = to_hex(my_logic_vec_descending);
            elsif run("to_signed_string_ascending") then
                assert "1111111011000110" = to_string(signed_value_asc);
            elsif run("to_signed_string_descending") then
                assert "1111111011000110" = to_string(signed_value_desc);
            elsif run("to_signed_hex_ascending") then
                assert "FEC6" = to_hex(signed_value_asc);
            elsif run("to_signed_hex_descending") then
                assert "FEC6" = to_hex(signed_value_desc);
            elsif run("to_unsigned_string_ascending") then
                assert "0000000100111010" = to_string(unsigned_value_asc);
            elsif run("to_unsigned_string_descending") then
                assert "0000000100111010" = to_string(unsigned_value_desc);
            elsif run("to_unsigned_hex_ascending") then
                assert "013A" = to_hex(unsigned_value_asc);
            elsif run("to_unsigned_hex_descending") then
                assert "013A" = to_hex(unsigned_value_desc) report to_hex(unsigned_value_desc);
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;

end architecture;
