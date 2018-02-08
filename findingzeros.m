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
% This function uses recursion to display all the zeros around the zero
% location that was choosen by the user.
function [ userBoard2 ] = findingzeros( rowww, colll, board, userBoard2 )

[x,y]=size(board);
%newBoard=board;

if rowww >2 && colll >2 && rowww <x && colll <y
    % In cases when in the middle
    for ii = rowww-1:rowww+1
        for jj = colll-1:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
          end
        end
    end

% In cases when on first row
elseif rowww == 2 && colll>2 && colll <y
     for ii = rowww:rowww+1
        for jj = colll-1:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
     
% In cases when on first column
elseif rowww> 2 && colll == 2 && rowww <x
     for ii = rowww-1:rowww+1
        for jj = colll:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
     
% In cases when on the last row
elseif rowww == x && colll> 2 && colll <y
     for ii = rowww-1:rowww
        for jj = colll-1:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end

% In cases when on the last column
elseif rowww> 2 && colll == y && rowww <x
     for ii = rowww-1:rowww+1
        for jj = colll-1:colll
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
% Top Left Corner
elseif rowww == 2 && colll == 2
     for ii = rowww:rowww+1
        for jj = colll:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end

% Top right corner
elseif rowww == 2 && colll == y
     for ii = rowww:rowww+1
        for jj = colll-1:colll
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
     
% Bottom left corner
elseif rowww == x && colll == 2
     for ii = rowww-1:rowww
        for jj = colll:colll+1
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
     
% Bottom right corner
elseif rowww == x && colll == y
     for ii = rowww-1:rowww
        for jj = colll-1:colll
           if board{ii,jj} == 0
               if userBoard2{ii,jj} ~= 0
                   userBoard2{ii,jj} = board{ii,jj};
                  [ userBoard2 ] = findingzeros( ii, jj, board, userBoard2 );
               end
     
          end
        end
     end
end

end