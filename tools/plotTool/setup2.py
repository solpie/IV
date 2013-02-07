#-*- coding: UTF-8 -*-
import sys
from cx_Freeze import setup, Executable

reload(sys)
sys.setdefaultencoding('utf-8')

# Dependencies are automatically detected, but it might need fine tuning.
build_exe_options = {"packages": ["os"], "excludes": ["tkinter"]}

# GUI applications require a different base on Windows (the default is for a
# console application).
base = None
if sys.platform == "win32":
    base = "Win32GUI"
exeName = 'plotTool.exe'

setup(name=u'excel导出工具',
      version="0.1",
      author="SolPie",
      options={"build_exe": build_exe_options},
      executables=[Executable(
          script="plotTool.py",
          compress=True,
          targetName=exeName
      )]
)