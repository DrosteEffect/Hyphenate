function hyphenate_test
% Test function for the function HYPHENATE.
%
%% Dependencies %%
%
% * MATLAB R2009b or later.
% * hyphenate.m and test_text_fun.m, both from <www.mathworks.com/matlabcentral/fileexchange/61882>
%
% See also HYPHENATE TEST_TEXT_FUN
chk = test_text_fun(@hyphenate);
hytMain(chk)
chk.start()
hytMain(chk)
chk.finish()
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%hyphenate_test
function hytMain(chk)
%
%% Mfile Help Examples %%
%
chk.i("hyphenation").o(["hy","phen","a","tion"])
chk.i('supercalifragilisticexpialidocious').o({'su','per','cal','ifrag','ilis','tic','ex','pi','ali','do','cious'})
chk.i('project').o({'project'})
%
%%% <https://tex.stackexchange.com/questions/40324/pdflatex-and-hyphenation>
chk.i('lemma').o({'lemma'})
chk.i('lemma',2,2).o({'lem','ma'})
%
%% FEX Screenshot Examples %%
%
chk.i('paragraph').o({'para','graph'})
chk.i('dictionary').o({'dic','tio','nary'})
%
%% Empty %%
%
chk.i('').o({''})
chk.i("").o("")
%
%% Systematic %%
%
chk.i('a':'a').o({'a'})
chk.i('a':'b').o({'ab'})
chk.i('a':'c').o({'abc'})
chk.i('a':'d').o({'abcd'})
chk.i('a':'e').o({'abcde'})
chk.i('a':'f').o({'abcdef'})
chk.i('a':'g').o({'abcdefg'})
chk.i('a':'h').o({'abcde','fgh'})
chk.i('a':'i').o({'abcde','fghi'})
chk.i('a':'j').o({'abcde','fghij'})
chk.i('a':'k').o({'abcde','fghijk'})
chk.i('a':'l').o({'abcde','fghijkl'})
chk.i('a':'m').o({'abcde','fghijklm'})
chk.i('a':'n').o({'abcde','fghijklmn'})
chk.i('a':'o').o({'abcde','fghijklmno'})
chk.i('a':'p').o({'abcde','fghijklmnop'})
chk.i('a':'q').o({'abcde','fghijklmnopq'})
chk.i('a':'r').o({'abcde','fghijklmnopqr'})
chk.i('a':'s').o({'abcde','fghijklmnopqrs'})
chk.i('a':'t').o({'abcde','fghijklmnopqrst'})
chk.i('a':'u').o({'abcde','fghijklmnopqrstu'})
chk.i('a':'v').o({'abcde','fghijklmnopqrstuv'})
chk.i('a':'w').o({'abcde','fghijklmnopqrstuvw'})
chk.i('a':'x').o({'abcde','fghijklmnopqrstu','vwx'})
chk.i('a':'y').o({'abcde','fghijklmnopqrstu','vwxy'})
chk.i('a':'z').o({'abcde','fghijklmnopqrstu','vwxyz'})
chk.i('b':'z').o({'bcde','fghijklmnopqrstu','vwxyz'})
chk.i('c':'z').o({'cde','fghijklmnopqrstu','vwxyz'})
chk.i('d':'z').o({'de','fghijklmnopqrstu','vwxyz'})
chk.i('e':'z').o({'efghijklmnopqrstu','vwxyz'})
chk.i('f':'z').o({'fghijklmnopqrstu','vwxyz'})
chk.i('g':'z').o({'ghijklmnopqrstu','vwxyz'})
chk.i('h':'z').o({'hijklmnopqrstu','vwxyz'})
chk.i('i':'z').o({'ijklmnopqrstu','vwxyz'})
chk.i('j':'z').o({'jklmnopqrstu','vwxyz'})
chk.i('k':'z').o({'klmnopqrstu','vwxyz'})
chk.i('l':'z').o({'lmnopqrstu','vwxyz'})
chk.i('m':'z').o({'mnopqrstu','vwxyz'})
chk.i('n':'z').o({'nopqrstu','vwxyz'})
chk.i('o':'z').o({'opqrstu','vwxyz'})
chk.i('p':'z').o({'pqrstu','vwxyz'})
chk.i('q':'z').o({'qrstu','vwxyz'})
chk.i('r':'z').o({'rstu','vwxyz'})
chk.i('s':'z').o({'stu','vwxyz'})
chk.i('t':'z').o({'tu','vwxyz'})
chk.i('u':'z').o({'uvwxyz'})
chk.i('v':'z').o({'vwxyz'})
chk.i('w':'z').o({'wxyz'})
chk.i('x':'z').o({'xyz'})
chk.i('y':'z').o({'yz'})
chk.i('z':'z').o({'z'})
%
%% Internet Examples %%
%
%%% <https://ctan.org/pkg/testhyphens>
%\documentclass{article}
%\usepackage{hyphsubst}
%\HyphSubstLet{english}{usenglishmax}
%\usepackage{testhyphens}
chk.i('manifests').o({'man','i','fests'})
chk.i('instruments').o({'in','stru','ments'})
chk.i('he').o({'he'})
chk.i('analyses').o({'analy','ses'})
chk.i('the').o({'the'})
chk.i('samples').o({'sam','ples'})
chk.i('and').o({'and'})
chk.i('submits').o({'sub','mits'})
chk.i('the').o({'the'})
chk.i('analyses').o({'analy','ses'})
chk.i('to').o({'to'})
chk.i('the').o({'the'})
chk.i('federal').o({'fed','eral'})
chk.i('office').o({'of','fice'})
%
%%% <https://tex.stackexchange.com/questions/634643/how-to-use-the-usenglishmax-hyphenation-patterns-from-hyph-utf8-pdflatex-te>
%\usepackage{hyphsubst}
%\HyphSubstLet{english}{usenglishmax}
%\input{ushyphex}
%\usepackage{testhyphens}
chk.i('academy',0,0).o({'acad','e','my'})
chk.i('academies',0,0).o({'acad','e','mies'})
chk.i('accusative',0,0).o({'ac','cu','sa','tive'})
chk.i('acronym',0,0).o({'acro','nym'})
chk.i('acronyms',0,0).o({'acro','nyms'})
chk.i('acupuncture',0,0).o({'acu','punc','ture'})
chk.i('acupuncturist',0,0).o({'acu','punc','tur','ist'})
chk.i('adamant',0,0).o({'ad','a','mant'})
chk.i('addable',0,0).o({'add','a','ble'})
chk.i('addible',0,0).o({'add','i','ble'})
chk.i('algebraically',0,0).o({'al','ge','bra','i','cal','ly'})
chk.i('antiderivative',0,0).o({'anti','deriv','a','tive'})
%
%% Capitalisation Tests %%
%
chk.i('Hyphenation').o({'Hy','phen','a','tion'})
chk.i('HYPHENATION').o({'HY','PHEN','A','TION'})
chk.i("Hyphenation").o(["Hy","phen","a","tion"])
chk.i("HYPHENATION").o(["HY","PHEN","A","TION"])
chk.i('Dictionary').o({'Dic','tio','nary'})
chk.i('DICTIONARY').o({'DIC','TIO','NARY'})
chk.i("Dictionary").o(["Dic","tio","nary"])
chk.i("DICTIONARY").o(["DIC","TIO","NARY"])
%
%% Hyphen-Minimum Tests %%
%
chk.i('hyphenation',0,0).o({'hy','phen','a','tion'})
chk.i('hyphenation',2,3).o({'hy','phen','a','tion'})
chk.i('hyphenation',3,3).o({'hyphen','a','tion'})
chk.i('hyphenation',2,4).o({'hy','phen','a','tion'})
chk.i('hyphenation',2,5).o({'hy','phen','ation'})
chk.i('hyphenation',10,0).o({'hyphenation'})
chk.i('hyphenation',0,10).o({'hyphenation'})
chk.i('hyphenation',10,10).o({'hyphenation'})
chk.i('lemma',0,0).o({'lem','ma'})
chk.i('lemma',2,2).o({'lem','ma'})
chk.i('lemma',2,3).o({'lemma'})
chk.i('lemma',3,2).o({'lem','ma'})
chk.i('lemma',3,3).o({'lemma'})
%
%% Exceptions from Ned Batchelder %%
%
chk.i('associate').o({'as','so','ciate'})
chk.i('associates').o({'as','so','ciates'})
chk.i('declination').o({'dec','li','na','tion'})
chk.i('obligatory').o({'oblig','a','tory'})
chk.i('philanthropic').o({'phil','an','thropic'})
chk.i('present').o({'present'})
chk.i('presents').o({'presents'})
chk.i('project').o({'project'})
chk.i('projects').o({'projects'})
chk.i('reciprocity').o({'reci','procity'})
chk.i('recognizance').o({'re','cog','ni','zance'})
chk.i('reformation').o({'ref','or','ma','tion'})
chk.i('retribution').o({'ret','ri','bu','tion'})
chk.i('table').o({'ta','ble'})
%
%% Additional Generated Tests %%
%
chk.i('database',0,0).o({'data','base'})
chk.i('dataset',0,0).o({'data','set'})
chk.i('ecosystem',0,0).o({'eco','sys','tem'})
chk.i('hexadecimal',0,0).o({'hexa','dec','i','mal'})
chk.i('hyphenation',0,0).o({'hy','phen','a','tion'})
chk.i('infrastructure',0,0).o({'in','fra','struc','ture'})
chk.i('interdisciplinary',0,0).o({'in','ter','dis','ci','pli','nary'})
chk.i('methodology',0,0).o({'meth','od','o','lo','gy'})
chk.i('microorganism',0,0).o({'micro','organ','ism'})
chk.i('programmable',0,0).o({'pro','gram','mable'})
chk.i('synchronous',0,0).o({'syn','chro','nous'})
chk.i('thermometer',0,0).o({'ther','mom','eter'})
chk.i('transparency',0,0).o({'trans','par','en','cy'})
%
%% Proper-Name Exception Tests %%
%
chk.i('Alexander',0,0).o({'Alex','an','der'})
chk.i('Alexandria',0,0).o({'Alex','an','dria'})
chk.i('Arkansas',0,0).o({'Ar','kan','sas'})
chk.i('Canada',0,0).o({'Can','a','da'})
chk.i('Canadian',0,0).o({'Ca','na','di','an'})
chk.i('Chicago',0,0).o({'Chi','ca','go'})
chk.i('February',0,0).o({'Feb','ru','ary'})
chk.i('Florida',0,0).o({'Flor','i','da'})
chk.i('Franklin',0,0).o({'Frank','lin'})
chk.i('Gaussian',0,0).o({'Gauss','ian'})
chk.i('Hamiltonian',0,0).o({'Ham','il','to','nian'})
chk.i('January',0,0).o({'Jan','u','ary'})
chk.i('Japanese',0,0).o({'Ja','pa','nese'})
chk.i('Knuthian',0,0).o({'Knuth','ian'})
chk.i('Massachusetts',0,0).o({'Mass','a','chu','setts'})
chk.i('Microsoft',0,0).o({'Mi','cro','soft'})
chk.i('November',0,0).o({'No','vem','ber'})
chk.i('Philadelphia',0,0).o({'Phil','a','del','phia'})
chk.i('September',0,0).o({'Sep','tem','ber'})
chk.i('Singapore',0,0).o({'Singa','pore'})
chk.i('Wikipedia',0,0).o({'Wiki','pe','dia'})
%
%% Error Handling %%
%
% First input must be a character row vector or string scalar.
chk.i(1).e('SC:hyphenate:word:NotText')
chk.i(true).e('SC:hyphenate:word:NotText')
chk.i([]).e('SC:hyphenate:word:NotText')
chk.i({''}).e('SC:hyphenate:word:NotText')
chk.i({'hyphenation'}).e('SC:hyphenate:word:NotText')
chk.i(['abc';'def']).e('SC:hyphenate:word:NotText')
chk.i(reshape('abcdef',1,2,3)).e('SC:hyphenate:word:NotText')
chk.i(["hyphenation","dictionary"]).e('SC:hyphenate:word:NotText')
%
% First input must contain only alphabetic characters.
chk.i('hyphen-ation').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphenation1').e('SC:hyphenate:word:NotAlphabetic')
chk.i('1hyphenation').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphen ation').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphenation.').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphenation!').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphenation_').e('SC:hyphenate:word:NotAlphabetic')
chk.i('hyphenation/word').e('SC:hyphenate:word:NotAlphabetic')
chk.i("hyphen-ation").e('SC:hyphenate:word:NotAlphabetic')
%
% Second input must be a real numeric scalar.
chk.i('hyphenation','2').e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',{2}).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',true).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',[]).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',[1,2]).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',[1;2]).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',ones(2)).e('SC:hyphenate:lhm:NotRealScalarNumeric')
chk.i('hyphenation',1+1i).e('SC:hyphenate:lhm:NotRealScalarNumeric')
%
% Second input must be a non-negative whole number.
chk.i('hyphenation',-1).e('SC:hyphenate:lhm:NotWholePositive')
chk.i('hyphenation',-0.5).e('SC:hyphenate:lhm:NotWholePositive')
chk.i('hyphenation',0.5).e('SC:hyphenate:lhm:NotWholePositive')
chk.i('hyphenation',1.5).e('SC:hyphenate:lhm:NotWholePositive')
chk.i('hyphenation',NaN).e('SC:hyphenate:lhm:NotWholePositive')
%
% Third input must be a real numeric scalar.
chk.i('hyphenation',2,'3').e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,{3}).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,true).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,[]).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,[2,3]).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,[2;3]).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,ones(2)).e('SC:hyphenate:rhm:NotRealScalarNumeric')
chk.i('hyphenation',2,1+1i).e('SC:hyphenate:rhm:NotRealScalarNumeric')
%
% Third input must be a non-negative whole number.
chk.i('hyphenation',2,-1).e('SC:hyphenate:rhm:NotWholePositive')
chk.i('hyphenation',2,-0.5).e('SC:hyphenate:rhm:NotWholePositive')
chk.i('hyphenation',2,0.5).e('SC:hyphenate:rhm:NotWholePositive')
chk.i('hyphenation',2,1.5).e('SC:hyphenate:rhm:NotWholePositive')
chk.i('hyphenation',2,NaN).e('SC:hyphenate:rhm:NotWholePositive')
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%hytMain
% Copyright (c) 2017-2026 Stephen Cobeldick
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license