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
% This fuction puts the non-user board together. It makes sure the correct
% amount of kings are randomly put on the board. It also calculates how
% many kings and knights the user starts with.

function [kings, knights, board] = initializeBoard(n)

%initialize counter to 0
counter=0;

%while loop improves accuracy of the random matrix by calling to buildBoard
%function
while counter<(.13)*(n.^2) || counter>(.17)*(n.^2)
    [counter,board]=buildBoard(n);      

end

%call to the initialize kings function to get numbers for kings surrounding
%towns with no king
[board]= initializeKings(board);
%disp(board);

%Sets knights and kings equal to the number of kings implemented in to the
%board
kings=counter;
knights=counter;

end
