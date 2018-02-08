% Dak Dice
%
% Partner: Kirk Van Arkel
%
% CSCI 1320 Final Project: Game of Thrones
%
% Ioana Fleming
%
% 4/3/15
%
% This function initializes the user board with x's in every location.
function [userBoard2] = userBoard(n)

% Creates a user board as a cell
userBoard2=cell(n+1,n+1);

%Sets first row of board user sees to 1-n
for ii = 2:n+1
    userBoard2{ii,1}=ii-1;
end
fprintf('\n')

%Sets first column of board user sees to 1-n
for jj = 2:n+1
    userBoard2{1,jj}=jj-1;
end

%Goes through each town and puts an x to cover location of kings
for ii = 2:n+1
    for jj = 2:n+1
        userBoard2{ii,jj}= ' $$$$ ';
    end
end

end