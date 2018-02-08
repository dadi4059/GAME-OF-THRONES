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
% This function specifically places the kings in random locations on the
% board. In a cell array.

function [counter,board] = buildBoard(n)

% Creates a board of random real numbers from 0-1
board = cell(n+1,n+1);

% Make the first row and first column labels for the rows and columns for
% the user
% Make the rest of the board random real numbers from 0-1

for ii = 2:n+1
    board{ii,1} = ii-1;
end

for jj = 2:n+1
    board{1,jj} = jj-1;
end

for ii = 2:n+1
    for jj = 2:n+1
        board{ii,jj} = rand;
    end
end

% Initialize counter to 0
counter=0;
% Make roughly 15% of the towns have kings in them
for ii= 2:n+1
    for jj= 2:n+1
        if board{ii,jj}<.15
            board{ii,jj}=10;
            counter=counter+1;
        else board{ii,jj}=0;
        end
    end
end
end

