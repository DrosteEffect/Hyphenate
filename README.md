Hyphenate
=========

[![View Hyphenate on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/61882)
[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=DrosteEffect/Hyphenate)

Word hyphenation using Franklin Mark Liang's algorithm (aka Knuth-Liang algorithm). As used by Knuth in TeX and LaTeX.

HYPHENATE provides a function to hyphenate words. HYPHENATE takes the word, and returns the parts that can be separated by hyphens.

### Examples ###

    >> hyphenate("hyphenation")
    ans =
        "hy"    "phen"    "a"    "tion"
    
    >> hyphenate('supercalifragilisticexpialidocious')
    ans =
        'su'    'per'    'cal'    'ifrag'    'ilis'    'tic'    'ex'    'pi'    'ali'    'do'    'cious'
    
    >> hyphenate('project')
    ans =
        'project'
    
    >> hyphenate('lemma') % default lhm=2 rhm=3
    ans =
       'lemma'
    >> hyphenate('lemma',2,2)
    ans =
       'lem'   'ma'