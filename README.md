Hyphenate
=========

[![View Hyphenate on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/61882)
[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=DrosteEffect/Hyphenate)

Word hyphenation using Franklin Mark Liang's algorithm (aka Knuth-Liang algorithm). As used by Knuth in TeX and LaTeX.

HYPHENATE provides a function to hyphenate words. HYPHENATE takes the word, and returns the parts that can be separated by hyphens.

This MATLAB function was inspired by Ned Batchelder's Python implementation: <https://nedbatchelder.com/code/modules/hyphenate.html>

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

## How It Works ##

The algorithm works by checking thousands of patterns like `hy3ph` and `a5diu`. Each pattern contains letters and numbers, where the numbers indicate priority levels for hyphenation at each position: odd numbers allow hyphenation while even numbers suppress hyphenation. Higher numbers represent stronger confidence in the rule.

When hyphenating a word, the algorithm iterates from left to right, checking which patterns match the current character. When multiple patterns affect the same position, it keeps the highest priority number (this is the key insight: more confident rules override less confident ones). After all patterns are checked, the word is split at positions with odd numbers, respecting minimum distances `lefthyphenmin` and `righthyphenmin` from the word boundaries.

The patterns are stored in a [*trie* data structure](https://en.wikipedia.org/wiki/Trie) for efficient searching. A *trie* is a tree where each level represents one character, allowing the algorithm to quickly determine whether any patterns can possibly match at a given position without checking thousands of patterns individually.

Some words have hard-coded exceptions that override the pattern matching, either because their hyphenation breaks the general rules or because they fall into edge cases where multiple valid patterns conflict.

## Patterns and Exceptions ##

The patterns come from classic TeX (Knuth and Liang's original work) plus enhancements by Gerard Kuiken based on hyphenation corrections published through 2005, obtained from the [`ushyph` package](https://ctan.org/pkg/ushyph) (USHYPHMAX.TEX).

The exceptions come from Ned Batchelder (2007) and Barbara Beeton et al (2021), obtained from the [`hyphenex` package](https://ctan.org/pkg/hyphenex) (USHYPHEX.TEX).

These are commonly used by TeX and LaTeX when typesetting US English documents.