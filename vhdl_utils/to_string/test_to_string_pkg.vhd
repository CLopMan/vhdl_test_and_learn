library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
--use work.test_utils.all;
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
begin
--    clock(clk, 10 ns, stop);
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
            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;

end architecture;
