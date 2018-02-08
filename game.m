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
% Allows a user to play a game where the user tries to reveal kings. The user will enter
% their name and create a board of their choice while initializing a number of kings and knights. The computer chooses random
% placements for the kings within the board and then instructs the user to
% guess a location on the board. Once all of the knights are gone OR kings revealed, display end result and ask them to play again 

%%
close all
clear all
clc

%%
% Displays the name of the game to the user
fprintf('Welcome to the Game of Thrones. \n\n');

% Asks user to input their name and stores as a string called name
name = input('State your name, Your Grace: ','s');

% Asks user for their desired board size and makes sure its between 5 & 20
n = input('Please enter the size of your kingdom (Enter an integer for the size of the board): ', 's');

n = str2num(n);
   
while isempty(n) == 1 || n<=4 || n>=21 || mod(n,1) ~= 0
    n = input('Please enter an integer for the size of your kingdom between 5 and 20: ','s');
    n = str2num(n);
end

% Calls to initializeBoard function
[kings, knights, board] = initializeBoard(n);

% Saves how many kings were started with
totalkings=kings;
% disp(board)

% Calls to user board
[userBoard2] = userBoard(n);   
disp(userBoard2);    

% Display user's name and the number of knights and kings the user will
% begin with
fprintf('%s, my friend, you have %d knights left to defeat %d kings \n',name, knights,kings)


movecounter = 0;
% While loop if there are still kings and knights left
while kings~=0 &&knights~=0
    
    % Asks user for there next move
    
    move = input('Please enter your next move ("row" space "column"): ','s');
    % Splits input into a 1 by 2 cell
    rowcol = regexp(move,' ','split');
    
    % Defines size of board
    [ r, c ] =  size(rowcol);
    % disp(userBoard2)
    
    while r ~= 1 || c~= 2
            % If the user does not enter a 1 by 2 cell, it asks again
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
            [ r, c ] =  size(rowcol);

            disp(userBoard2)
    end
            % Once move is a 1 by 2 cell, this defines the row and column
            % of there move
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            
    % If row of column entered is not a number, it will result in an empty cell and
    % ask the user to input move correctly
    while isempty(roww) == 1 || isempty(coll) == 1 ||...
            roww > n || coll > n || roww < 1 ||...
            coll < 1 || mod(roww,1) ~= 0 || mod(coll,1) ~= 0
            
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
            
            % Now if the cells are full, it checks again to make sure it is
            % the correct size
            while r ~= 1 || c~= 2
        
                move = input('Please enter your next move correctly ("row" space "column"): ','s');
                rowcol = regexp(move,' ','split'); 
                disp(userBoard2)
            end
        
            % Once move is a 1 by 2 cell, this defines the row and column
            % of there move
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            disp(userBoard2)

    end

    
% Makes sure the cell meets the requirements
        while isempty(roww) == 1 || isempty(coll) == 1 ||...
            roww > n || coll > n || roww < 1 ||...
            coll < 1 || mod(roww,1) ~= 0 || mod(coll,1) ~= 0
            
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
        
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            b =  size(rowcol);
        end

    % Adds one to row and col due to board being 1 size bigger
    rowww = roww +1;
    colll = coll +1;
    
    % Calls to the function moves
    [ movecounter, kings, knights, userBoard2 ] = moves(rowww, colll, board, knights, kings, movecounter, name, userBoard2);
    
    disp(userBoard2)

end

% If knights have run out but kings have not
if knights == 0 && kings ~= 0
    disp('You Fail, You ran out of knights, my Grace.')
    
    % Asks user if they would like to play the same board again
    replayBoard = input('Would you like to play the same board setup again?(Y/N): ','s');
    
    % If the user does not enter a capital Y or N, it will continue to ask.
    while strcmp(replayBoard,'Y')~=1 && strcmp(replayBoard,'N')~=1
        replayBoard= input('Please enter either a capital Y for yes or a capital N for no: ','s');
    end
    
    % If they input Y, resets board so they play the same one they just did
    while strcmp(replayBoard,'Y')==1
%%       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allow the user to play the same board an additional time. This is a copy
% of our script within our script
%


% Re-initializes the amount of kings and knights started with
totalkings = kings;
knights = totalkings;
% disp(board)

% Calls to user board
[userBoard2] = userBoard(n);   
disp(userBoard2);    

% Display user's name and the number of knights and kings the user will
% begin with
fprintf('%s, my friend, you have %d knights left to defeat %d kings \n',name, knights,kings)


movecounter = 0;
% While loop if there are still kings and knights left
while kings~=0 &&knights~=0
    
    % Asks user for there next move
    
    move = input('Please enter your next move ("row" space "column"): ','s');
    % Splits input into a 1 by 2 cell
    rowcol = regexp(move,' ','split');
    
    [ r, c ] =  size(rowcol);
    disp(userBoard2)
    
    while r ~= 1 || c~= 2
            
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
            [ r, c ] =  size(rowcol);

            disp(userBoard2)
    end
        
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            
    while isempty(roww) == 1 || isempty(coll) == 1 ||...
            roww > n || coll > n || roww < 1 ||...
            coll < 1 || mod(roww,1) ~= 0 || mod(coll,1) ~= 0
            
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
            
            while r ~= 1 || c~= 2
        
                move = input('Please enter your next move correctly ("row" space "column"): ','s');
                rowcol = regexp(move,' ','split'); 
                disp(userBoard2)
            end
        
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            disp(userBoard2)

    end

    
%     while  size(rowcol) ~= 2
        while isempty(roww) == 1 || isempty(coll) == 1 ||...
            roww > n || coll > n || roww < 1 ||...
            coll < 1 || mod(roww,1) ~= 0 || mod(coll,1) ~= 0
            
            move = input('Please enter your next move correctly ("row" space "column"): ','s');
            rowcol = regexp(move,' ','split'); 
        
            roww = str2num(rowcol{1});
            coll = str2num(rowcol{2});
            b =  size(rowcol);
        end

    % Adds one to row and col due to board being 1 size bigger
    rowww = roww +1;
    colll = coll +1;
    
    % Calls to the function moves
    [ movecounter, kings, knights, userBoard2 ] = moves(rowww, colll, board, knights, kings, movecounter, name, userBoard2);
    
    disp(userBoard2)

end

% If knights have run out but kings have not
if knights == 0 && kings ~= 0
    disp('You Fail, You ran out of knights, my Grace.')
    
    % Asks user if they would like to play the same board again
    replayBoard = input('Would you like to play the same board setup again?(Y/N): ','s');
    
    % If the user does not enter a capital Y or N, it will continue to ask.
    while strcmp(replayBoard,'Y')~=1 && strcmp(replayBoard,'N')~=1
        replayBoard= input('Please enter either a capital Y for yes or a capital N for no: ','s');
    end
    
    % If they input Y, resets board so they play the same one they just did
    if strcmp(replayBoard,'Y')==1
        % Does nothing but stores the value and allows the user to play the
        % same board again if they want to.
    end
        
    % If they input N, program is terminated
    if strcmp(replayBoard,'N')==1
%         clear all;
%         close all;
%         clc;
        % Exit game; game is over
    end
    
% If they have found all the kings and have knights left
elseif knights ~= 0 && kings == 0
    fprintf('Congratulations %s, Your Grace! You have %d knights left and you defeated all %d kings in %d moves. \n',...
            name, knights, totalkings, movecounter)
    % putting what we want to display together
    scores= {name, movecounter, n};
    % Open text file for appending
    FID=fopen('Dice_Dak_results.txt','a');
    % If the name is 5 or less letters, tabs twice, otherwise just once
    if length(name)<=5
        format='%s \t\t %d \t\t %d \n';
    else
    	format= '%s \t %d \t\t %d \n';
    end
    % Prints on to the text file
    fprintf(FID,format,scores{1,:});
    % Closes the text file
    fclose(FID);
    % Displays the results and previous results during game
    type Dice_Dak_results.txt    
        
    % Asks user if they want to play again
    playagain = input('Would you like to play again?(Y/N): ','s');
    
    % User must enter a capital Y or N to continue
    while strcmp(playagain,'Y')~=1 && strcmp(playagain,'N')~=1
        playagain= input('Please enter either a capital Y for yes or a capital N for no: ','s');
    end
    
    % If user entered a Y, reset board fully
    if strcmp(playagain,'Y')==1
        game
        
    % If user enters a N, program is terminated
    elseif strcmp(playagain,'N')==1
%           clear all;
%           close all;
%           clc;
        % Exit game; game is over
    end
end
    % Ending the while loop if the user wants to play the same board.
    end
    
% End of the additional try with the same board and king locations  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    
    % If they input N, program is terminated
    if strcmp(replayBoard,'N')==1
        clear all;
        close all;
        clc;
        % Exit game; game is over
    end
    
% If they have found all the kings and have knights left
elseif knights ~= 0 && kings == 0
    fprintf('Congratulations %s, Your Grace! You have %d knights left and you defeated all %d kings in %d moves. \n',...
            name, knights, totalkings, movecounter)
    % Putting what we want to display together
    scores= {name, movecounter, n};
    % Open text file for appending
    FID=fopen('Dice_Dak_results.txt','a');
    % If the name is 5 or less letters, tabs twice, otherwise just once
    if length(name)<=5
        format='%s \t\t %d \t\t %d \n';
    else
    	format= '%s \t %d \t\t %d \n';
    end
    % Prints on to the text file
    fprintf(FID,format,scores{1,:});
    % Closes the text file
    fclose(FID);
    % Displays the results and previous results during game
    type Dice_Dak_results.txt    
        
    % Asks user if they want to play again
    playagain = input('Would you like to play again?(Y/N): ','s');
    
    % User must enter a capital Y or N to continue
    while strcmp(playagain,'Y')~=1 && strcmp(playagain,'N')~=1
        playagain= input('Please enter either a capital Y for yes or a capital N for no: ','s');
    end
    
    % If user entered a Y, reset board fully
    if strcmp(playagain,'Y')==1
        game
        
    % If user enters a N, program is terminated
    elseif strcmp(playagain,'N')==1
        clear all;
        close all;
        clc;
        % Exit game; game is over
    end
end
