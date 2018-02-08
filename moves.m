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
% This function deals with all the moves that are taken by the user. It
% displays there move on the user board and lets them know how many knights
% and kings they have left after each move.

function [ movecounter, kings, knights, userBoard2 ] = moves(rowww, colll, board, knights, kings, movecounter, name, userBoard2)

% If the user board and our back board are the same, thatt means they
% already guessed that position and must guess a different location.
if board{rowww,colll} == userBoard2{rowww,colll}
    fprintf('\n You already guessed that town, try again. \n\n');

% If they guess where a king is
elseif board{rowww,colll} == 10 && strcmp(userBoard2{rowww,colll},' * ')==0
    % Puts a * where a king is located
    userBoard2{rowww,colll} = ' KING ';
    % Displays a message saying they found a king
    fprintf('\n You have found a king!! \n')
    % subtracts 1 from kings and adds 2 to knights
    kings = kings - 1;
    knights = knights + 2;
    % Movecounter adding to find total at the end
    movecounter = movecounter + 1;
    
% If they guess where they have already guessed a king
elseif board{rowww,colll} == 10 && strcmp(userBoard2{rowww,colll},' * ')==1
    fprintf('\n You already found that king, try again. \n\n')
    % disp(userBoard2)

% If they guess where there is no king or zero    
elseif board{rowww,colll} ~= 10 && board{rowww,colll} ~= 0
    % Displays number of kings touching that town
    userBoard2{rowww,colll} = board{rowww, colll};
    % Displays user board
    % disp(userBoard2)
    % Subtracts one from knights 
    knights = knights - 1;  
    movecounter = movecounter + 1;
    
% If they guess where there is a zero    
elseif board{rowww,colll} == 0 
    % Call to a function like initialize kings
    [ userBoard2 ] = findingzeros( rowww, colll, board, userBoard2 );
    % Calls to a function that display numbers around zeros that have
    % already been found
    [ userBoard2 ] = finding( board, userBoard2 );
    knights = knights - 1;
    movecounter = movecounter + 1;
    
end



fprintf('%s, my friend, you have %d knights left to defeat %d kings. \n', name, knights, kings)


end