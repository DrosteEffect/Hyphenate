function hyphenate_test
% Test function for the function HYPHENATE.
%
% (c) 2017-2025 Stephen Cobeldick
%
%%% Dependencies:
% hyphenate.m <www.mathworks.com/matlabcentral/fileexchange/61882>
%
% See Also: HYPHENATE
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
%% TESTHYPHENS.TEX %%
%
% \documentclass{article}
% \usepackage{hyphsubst}
% \HyphSubstLet{english}{usenglishmax}
% \usepackage{testhyphens}
%
%%% <https://ctan.org/pkg/testhyphens>
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

%
%% Print Summary %%
%
fprintf(' %d of %d testcases failed.\n',cnt,itr)
%
	function chk(inA,xpA)
		%
		opA = hyphenate(inA);
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
			fprintf('diff:   ')
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