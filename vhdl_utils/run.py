from vunit import VUnit
from vunit.ui import Library
import os

cwd : str = os.getcwd()
prj_dirs : list[str] = [
        cwd+'/to_string/'
        ]

# create a vunit instance from argv
vunit: VUnit = VUnit.from_argv(compile_builtins=False, vhdl_standard="93")
vunit.add_vhdl_builtins(None)

# create a library called lib
lib : Library = vunit.add_library("lib")

# add sources
for dir in prj_dirs:
    lib.add_source_files(dir + "*.vhd")

vunit.main()
