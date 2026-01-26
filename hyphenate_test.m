function hyphenate_test
% Test function for the function HYPHENATE.
%
%% Dependencies %%
%
% * MATLAB R2009b or later.
% * hyphenate.m <www.mathworks.com/matlabcentral/fileexchange/61882>
%
% See also HYPHENATE
cnt = 0;
itr = 0;
if feature('hotlinks')
	fmt = '<a href="matlab:opentoline(''%1$s'',%2$d)">%1$s|%2$d:</a>';
else
	fmt = '%s|%d:';
end
%
%% Mfile Help Examples %%
%
chk("hyphenation", ["hy","phen","a","tion"])
chk('supercalifragilisticexpialidocious', {'su','per','cal','ifrag','ilis','tic','ex','pi','ali','do','cious'})
chk('project', {'project'})
%%% <https://tex.stackexchange.com/questions/40324/pdflatex-and-hyphenation>
chk('lemma',{'lemma'})
chk('lemma',2,2,{'lem','ma'})
%
%% FEX Screenshot Examples %%
%
chk('paragraph',{'para','graph'})
chk('dictionary',{'dic','tio','nary'})
%
%% EdgeCases %%
%
chk('',{''})
chk("","")
chk('a':'z', {'abcde','fghijklmnopqrstu','vwxyz'})
%
%% Internet Examples %%
%
%%% <https://ctan.org/pkg/testhyphens>
%\documentclass{article}
%\usepackage{hyphsubst}
%\HyphSubstLet{english}{usenglishmax}
%\usepackage{testhyphens}
chk('manifests',{'man','i','fests'})
chk('instruments',{'in','stru','ments'})
chk('he',{'he'})
chk('analyses',{'analy','ses'})
chk('the',{'the'})
chk('samples',{'sam','ples'})
chk('and',{'and'})
chk('submits',{'sub','mits'})
chk('the',{'the'})
chk('analyses',{'analy','ses'})
chk('to',{'to'})
chk('the',{'the'})
chk('federal',{'fed','eral'})
chk('office',{'of','fice'})
%
%%% <https://tex.stackexchange.com/questions/634643/how-to-use-the-usenglishmax-hyphenation-patterns-from-hyph-utf8-pdflatex-te>
%\usepackage{hyphsubst}
%\HyphSubstLet{english}{usenglishmax}
%\input{ushyphex}
%\usepackage{testhyphens}
chk('academy',0,0,{'acad','e','my'})
chk('academies',0,0,{'acad','e','mies'})
chk('accusative',0,0,{'ac','cu','sa','tive'})
chk('acronym',0,0,{'acro','nym'})
chk('acronyms',0,0,{'acro','nyms'})
chk('acupuncture',0,0,{'acu','punc','ture'})
chk('acupuncturist',0,0,{'acu','punc','tur','ist'})
chk('adamant',0,0,{'ad','a','mant'})
chk('addable',0,0,{'add','a','ble'})
chk('addible',0,0,{'add','i','ble'})
chk('algebraically',0,0,{'al','ge','bra','i','cal','ly'})
chk('antiderivative',0,0,{'anti','deriv','a','tive'})
%
%% Print Summary %%
%
fprintf(' %d of %d testcases failed.\n',cnt,itr)
%
	function chk(varargin)
		%
		xpA = varargin{end};
		opA = hyphenate(varargin{1:end-1});
		boo = false;
		%
		if ~isequal(class(opA),class(xpA))
			boo = true;
			opT = class(opA);
			xpT = class(xpA);
		elseif ~isequal(opA,xpA)
			boo = true;
			opT = tfPretty(opA);
			xpT = tfPretty(xpA);
		end
		%
		if boo
			dmn = min(numel(opT),numel(xpT));
			dmx = max(numel(opT),numel(xpT));
			erT = repmat('^',1,dmx);
			erT(opT(1:dmn)==xpT(1:dmn)) = ' ';
			%
			dbs = dbstack();
			fprintf(fmt, dbs(2).file, dbs(2).line);
			fprintf('\n')
			fprintf('actual: %s\n', opT);
			fprintf('expect: %s\n', xpT);
			fprintf('     \x394: ')
			fprintf(2,'%s\n',erT); % red!
		end
		cnt = cnt+boo;
		itr = itr+1;
	end
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%hyphenate_test
function out = tfPretty(inp)
if isempty(inp)|| ndims(inp)>2 %#ok<ISMAT>
	out = sprintf('x%u',size(inp));
	out = sprintf('%s %s',out(2:end),class(inp));
elseif ischar(inp)
	out = mat2str(inp);
elseif isa(inp,'string')
	if isscalar(inp)
		out = sprintf('"%s"',inp);
	else
		fmt = repmat(',"%s"',1,size(inp,2));
		out = sprintf([';',fmt(2:end)],inp.');
		out = sprintf('[%s]',out(2:end));
	end
elseif iscell(inp)
	tmp = cellfun(@tfPretty,inp.','uni',0);
	fmt = repmat(',%s',1,size(inp,2));
	out = sprintf([';',fmt(2:end)],tmp{:});
	out = sprintf('{%s}',out(2:end));
else
	error('Class "%s" is not supported.',class(inp))
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%tfPretty
% Copyright (c) 2017-2026 Stephen Cobeldick
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license