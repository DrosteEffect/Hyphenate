classdef test_text_fun < handle
	% Class for comparing actual function output against expected output.
	%
	% (c) 2015-2026 Stephen Cobeldick
	%
	% See also HYPHENATE_TEST NUM2ORD_TEST NUM2WORDS_TEST WORDS2NUM_TEST
	properties
		funHnd % handle to function under test
		barHnd % handle to waitbar
		fmtOTL % format string open-to-line
		inpArg = {}; % input arguments
		outExp = {}; % expected output arguments
		cntNow = 0; % count of current test
		cntTot = 0; % count of all tests
		cntFld = 0; % count of failed tests
		cntFlg = true; % count vs compare
	end
	methods
		function obj = test_text_fun(fnh) % constructor
			dbs = dbstack();
			fmt = '%s|%3d:';
			try %#ok<TRYNC> Octave
				if feature('hotlinks')
					fmt = '<a href="matlab:opentoline(''%1$s'',%2$d)">%1$s|%2$d:</a>';
				end
			end
			obj.funHnd = fnh;
			obj.fmtOTL = fmt;
			obj.barHnd = myWaitbar(0,'Counting tests...', 'IntegerHandle','off', 'Name',dbs(2).name);
		end
		function delete(obj) % destructor
			try %#ok<TRYNC>
				close(obj.barHnd);
			end
		end
		function warn(obj,txt) % warning text
			if obj.cntFlg
				warning(txt)
			end
		end
		function e(obj,erX) % expected error identifier
			assert(ischar(erX),'Expected error identifier must be a character row vector.')
			if obj.cntFlg % count
				obj.cntTot = obj.cntTot + 1;
			else % execute and compare
				obj.cntNow = obj.cntNow + 1;
				myWaitbar(obj.cntNow/obj.cntTot,obj.barHnd,sprintf('Running test %d of %d',obj.cntNow,obj.cntTot));
				dbs = dbstack();
				erA = '<no error>';
				unused = cell(size(obj.outExp));
				try
					[unused{:}] = obj.funHnd(obj.inpArg{:}); %#ok<NASGU>
				catch exc
					erA = exc.identifier;
				end
				boo = ~strcmp(erA,erX);
				if boo
					fprintf(obj.fmtOTL,dbs(2).file,dbs(2).line);
					fprintf(' (error identifier)\n');
					fprintf('actual: %s\n',erA);
					fprintf('expect: %s\n',erX);
					fprintf('     \x394: ')
					fprintf(2,'%s\n',myTextDiff(erA,erX)); % red!
				end
				obj.cntFld = obj.cntFld + boo;
				obj.inpArg = {};
				obj.outExp = {};
			end
		end
		function out = i(obj,varargin) % provided input arguments
			obj.inpArg = varargin;
			if nargout
				out = obj;
			else
				obj.check();
			end
		end
		function out = j(obj,varargin) % replace inputs
			idx = cellfun(@(a)isequal(a,@i),obj.inpArg);
			assert(nnz(idx)==numel(varargin))
			obj.inpArg(idx) = varargin;
			if nargout
				out = obj;
			else
				obj.check();
			end
		end
		function out = o(obj,varargin) % expected outputs
			obj.outExp = varargin;
			if nargout
				out = obj;
			else
				obj.check();
			end
		end
		function start(obj) % start execution
			obj.cntFlg = false;
			myWaitbar(0,obj.barHnd,'Starting tests...');
		end
		function finish(obj) % finish execution
			dbs = dbstack();
			fprintf(obj.fmtOTL, dbs(2).file, dbs(2).line);
			if obj.cntFld
				fprintf(' %d of %d tests failed.\n', obj.cntFld, obj.cntTot);
			else
				fprintf(' All %d tests passed.\n', obj.cntTot)
			end
		end
		function check(obj) % compare expected against actual output
			if obj.cntFlg % count
				obj.cntTot = obj.cntTot + 1;
			else % execute & compare
				obj.cntNow = obj.cntNow + 1;
				myWaitbar(obj.cntNow/obj.cntTot, obj.barHnd, sprintf('Running test %d of %d', obj.cntNow, obj.cntTot));
				dbs = dbstack();
				inC = obj.inpArg;
				xpC = obj.outExp;
				opC =  cell(size(xpC));
				boo = false(size(xpC));
				[opC{:}] = obj.funHnd(inC{:});
				for k = 1:numel(xpC)
					opA = opC{k};
					xpA = xpC{k};
					if isequal(xpA,@i)
						% ignore this output
					elseif ~isequal(class(opA),class(xpA))
						boo(k) = true;
						opT = class(opA);
						xpT = class(xpA);
					elseif ischar(opA)||isa(opA,'string')||iscellstr(opA) %#ok<ISCLSTR>
						if ~isequal(size(opA),size(xpA))||~all(reshape(strcmp(opA,xpA),1,[]))
							boo(k) = true;
							opT = myPretty(opA);
							xpT = myPretty(xpA);
						end
					elseif isfloat(opA)
						if ~myIsEqualFP(opA,xpA)
							boo(k) = true;
							opT = myPretty(opA);
							xpT = myPretty(xpA);
						end
					elseif ~isequaln(opA,xpA)
						boo(k) = true;
						opT = myPretty(opA);
						xpT = myPretty(xpA);
					end
					if boo(k)
						fprintf(obj.fmtOTL, dbs(3).file, dbs(3).line);
						fprintf(' (output #%d)\n',k);
						fprintf('actual: %s\n', opT);
						fprintf('expect: %s\n', xpT);
						fprintf('     \x394: ')
						fprintf(2,'%s\n',myTextDiff(opT,xpT)); % red!
					end
				end
				obj.cntFld = obj.cntFld + any(boo);
				obj.inpArg = {};
			end
		end
	end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%test_text_fun
function varargout = myWaitbar(varargin)
% Protect against systems that do not support graphics, e.g. FEX & online.
varargout = cell(1,nargout);
try %#ok<TRYNC>
	[varargout{:}] = waitbar(varargin{:});
	drawnow()
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myWaitbar
function txt = myTextDiff(A,B)
dmn = min(numel(A),numel(B));
dmx = max(numel(A),numel(B));
txt = repmat('^',1,dmx);
txt(A(1:dmn)==B(1:dmn)) = ' ';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myTextDiff
function ie = myIsEqualFP(a,b)
% Compare equality of floating-point arrays with 2*EPS tolerance.
assert(isfloat(a)&&isfloat(b),'Inputs must be floating point numeric.')
af = isfinite(a(:));
bf = isfinite(b(:));
ai = isinf(a(:));
bi = isinf(b(:));
ie = isequal(size(a),size(b)) && ~any(xor(af,bf)|xor(ai,bi)) && ...
	all(a(ai)==b(bi)) && all(abs(a(af)-b(bf))<=(eps(a(af))+eps(b(bf))));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myIsEqualFP
function out = myPretty(inp)
if isempty(inp)|| ndims(inp)>2 %#ok<ISMAT>
	out = sprintf('x%u',size(inp));
	out = sprintf('%s %s',out(2:end),class(inp));
elseif isnumeric(inp) || islogical(inp)
	out = regexprep(mat2str(inp,23),'\s+',',');
elseif ischar(inp)
	if size(inp,1)>1
		out = mat2str(inp,15);
	else
		out = sprintf('''%s''',inp);
	end
elseif isa(inp,'string')
	inp(ismissing(inp)) = "<missing>";
	if isscalar(inp)
		out = sprintf('"%s"',inp);
	else
		fmt = repmat(',"%s"',1,size(inp,2));
		out = sprintf([';',fmt(2:end)],inp.');
		out = sprintf('[%s]',out(2:end));
	end
elseif iscell(inp)
	tmp = cellfun(@myPretty,inp.','uni',0);
	fmt = repmat(',%s',1,size(inp,2));
	out = sprintf([';',fmt(2:end)],tmp{:});
	out = sprintf('{%s}',out(2:end));
else
	out = regexprep(evalc('disp(inp)'),'\s+',' ');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%myPretty