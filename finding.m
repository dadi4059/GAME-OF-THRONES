function [ userBoard2 ] = finding( board, userBoard2 )

[x,y]=size(board);

% In cases when in the middle
    for ii = 3:x-1
        for jj = 3:y-1
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii-1,jj-1} = board{ii-1,jj-1};
                   userBoard2{ii+1,jj-1} = board{ii+1,jj-1};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii-1,jj+1} = board{ii-1,jj+1};
                   userBoard2{ii+1,jj+1} = board{ii+1,jj+1};
           end
        end
    end
    

% In cases when on first row
    for ii = 2
        for jj = 3:y-1
           if userBoard2{ii,jj} == 0
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii+1,jj-1} = board{ii+1,jj-1};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii+1,jj+1} = board{ii+1,jj+1};
           end
        end
    end
     
% In cases when on first column
    for ii = 3:x-1
        for jj = 2
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii-1,jj+1} = board{ii-1,jj+1};
                   userBoard2{ii+1,jj+1} = board{ii+1,jj+1};
           end
        end
    end
     
% In cases when on the last row
    for ii = x
        for jj = 3:y-1
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii-1,jj-1} = board{ii-1,jj-1};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii-1,jj+1} = board{ii-1,jj+1};
           end
        end
    end

% In cases when on the last column
    for ii = 3:x-1
        for jj = y
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii-1,jj-1} = board{ii-1,jj-1};
                   userBoard2{ii+1,jj-1} = board{ii+1,jj-1};
           end
        end
    end
% Top Left Corner
    for ii = 2
        for jj = 2
           if userBoard2{ii,jj} == 0
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii+1,jj+1} = board{ii+1,jj+1};
           end
        end
    end

% Top right corner
    for ii = 2
        for jj = y
           if userBoard2{ii,jj} == 0
                   userBoard2{ii+1,jj} = board{ii+1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii+1,jj-1} = board{ii+1,jj-1};
           end
        end
    end
     
% Bottom left corner
    for ii = x
        for jj = 2
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii,jj+1} = board{ii,jj+1};
                   userBoard2{ii-1,jj+1} = board{ii-1,jj+1};
           end
        end
    end
     
% Bottom right corner
    for ii = x
        for jj = y
           if userBoard2{ii,jj} == 0
                   userBoard2{ii-1,jj} = board{ii-1,jj};
                   userBoard2{ii,jj-1} = board{ii,jj-1};
                   userBoard2{ii-1,jj-1} = board{ii-1,jj-1};
           end
        end
    end
end

