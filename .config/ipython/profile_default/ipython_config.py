# sample ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20

"""
c.InteractiveShellApp.extensions = [
    'myextension'
]
"""

c.InteractiveShellApp.exec_lines = [
    'import numpy as np',
    'from timeit import timeit'
]

"""
c.InteractiveShellApp.exec_files = [
    'mycode.py',
    'fancy.ipy'
]
"""

c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'Linux'
c.TerminalInteractiveShell.highlight_matching_brackets = False
from pygments.token import Token
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.MatchingBrackets.Other  : '#FF00FF', # nested brackets color
    Token.MatchingBracket.Other   : '#FF00FF', # bracket color
    Token.MatchingBracket.Cursor  : '#4b3588', # on cursor over bracket color
    Token.MatchingBrackets.Cursor : '#4b3588', # on cursor over nested matching brackets color
}

c.InteractiveShell.confirm_exit = False
# c.InteractiveShell.deep_reload = True
c.InteractiveShell.editor = '$EDITOR'
c.InteractiveShell.xmode = 'Context'

c.TerminalInteractiveShell.autocall = 1

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]
