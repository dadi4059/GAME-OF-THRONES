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
% This function puts a number associated with how many kings are touching
% that spot to each location on the board. Goes through each location on
% the board and since a king for us is a 10, we divided each position by 10

function newBoard = initializeKings(board)

% Sets x and y to the size of the board
[x,y]=size(board);
newBoard=board;

% In cases when in the middle
for ii = 3:x-1
    for jj = 3:y-1
        if board{ii,jj}~=10 
            board{ii,jj}=0;
            newBoard{ii,jj}= (board{ii,jj-1}+board{ii-1,jj-1}+board{ii-1,jj}+board{ii-1,jj+1}+...
                board{ii+1,jj-1}+board{ii+1,jj}+board{ii+1,jj+1}+board{ii,jj+1})/10;
        end
    end
end
% In cases when on first row
for ii = 2
    for jj = 3:y-1
        if board{ii,jj}~=10 
            board{ii,jj}=0;
            newBoard{ii,jj}= (board{ii,jj-1}+board{ii,jj+1}+board{ii+1,jj-1}+...
                board{ii+1,jj+1}+board{ii+1,jj})/10;
        end
    end
end
% In cases when on first column
for ii = 3:x-1
    for jj = 2
        if board{ii,jj}~=10 
            board{ii,jj}=0;
            newBoard{ii,jj}= (board{ii-1,jj}+board{ii+1,jj}+board{ii+1,jj+1}+...
                board{ii,jj+1}+board{ii-1,jj+1})/10;
        end
    end
end
% In cases when on the last row
for ii = x
    for jj = 3:y-1  
        if board{ii,jj}~=10 
            board{ii,jj}=0;
            newBoard{ii,jj}= (board{ii,jj+1}+board{ii-1,jj+1}+board{ii-1,jj}+...
                board{ii-1,jj-1}+board{ii,jj-1})/10; 
        end
    end
end
% In cases when on the last column
for ii = 3:x-1
    for jj = y
        if board{ii,jj}~=10 
            board{ii,jj}=0;
            newBoard{ii,jj}= floor(board{ii-1,jj}+board{ii-1,jj-1}+board{ii,jj-1}+...
                board{ii+1,jj-1}+board{ii+1,jj})/10;
        end
    end
end

% Top left corner
if board{2,2}~=10 
    board{2,2}=0;
    newBoard{2,2} = (board{2,3}+board{3,3}+board{3,2})/10;
end

% Top right corner
if board{2,y}~=10
    board{2,y}=0;
    newBoard{2,y} = (board{2,y-1}+board{3,y-1}+board{3,y})/10;
end
% Bottom left corner
if board{x,2}~=10 
    board{x,2}=0;
    newBoard{x,2} =(board{x-1,2}+board{x-1,3}+board{x,3})/10;
end

% Bottom right corner
if board{x,y}~=10
    board{x,y}=0;
    newBoard{x,y} =(board{x,y-1}+board{x-1,y-1}+board{x-1,y})/10;
  
end
end