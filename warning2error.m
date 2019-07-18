%warning2error.m
%USAGE:
%   Add warnings to convert to errors.
%  warning2error('add','<component>[:<component>]:<mnemonic>',...
%
%   Remove warnings to convert to errors
%   warning2error('remove','<component>[:<component>]:<mnemonic>',...
%
%   Query warnings to convert to errors 
%   tf = warning2error('query','<component>[:<component>]:<mnemonic>')
%
%   Get entire list of warnings converted to errors
%   list = warning2error('get')
%
% Jesse Hopkins
% Oct 2 2012

function varargout = warning2error(op,varargin)
    persistent list;
    if isempty(list)
        list = {};
    end
    varargout={};

    switch lower(op)
        case 'add'
            list = unique([list(:);varargin(:)]);
        case 'remove'
            for i = 1:length(varargin)
                [tf idx] = ismember(varargin{i},list);
                allidx = 1:length(list);
                newidx = setdiff(allidx,idx);
                list = list(newidx);
            end
        case 'clear'
            list = {};
        case 'get'
            varargout{1} = list;
        case 'query'
            out = false(1,length(varargin));
            for i = 1:length(varargin)
                out(i) = ismember(varargin{1},list);
            end
            varargout{1} = out;
    end
end