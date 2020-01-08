Hyphenate
=========

Word hyphenation using Franklin Mark Liang's algorithm (aka Knuth-Liang algorithm). As used by Knuth in TeX and LaTeX.

HYPHENATE provides a function to hyphenate words. HYPHENATE takes the word, and returns the parts that can be separated by hyphens.

### Examples ###

>> hyphenate('hyphenation')
ans =
    'hy'    'phen'    'a'    'tion'

>> hyphenate('supercalifragilisticexpialidocious')
ans =
    'su'    'per'    'cal'    'ifrag'    'ilis'    'tic'    'ex'    'pi'    'ali'    'do'    'cious'

>> hyphenate('project')
ans =
    'project'
