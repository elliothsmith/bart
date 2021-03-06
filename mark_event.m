function mark_event(eventname,channel)
global data dio

% from previous version. seems like they used a series of analog channels. 
% I replaced their code in this function with our digital marker code. 
% % %Plexon channels:
% % %1: trial start
% % %2: responded
% % %3: inflating
% % %4: banked
% % %5: popped
% % %6: outcome shown
% % %7: max rt exceeded
% % %8: trial over
% % %10: response shown


% ::blackrock data "channel" codes::
%1: trial start ::      [1 2 3 4 11 12 13 14] = [Y O R G Yc Oc Rc Gc]
%2: responded ::        [22]
%3: inflating ::        [23 24] = [start stop]
%4: banked ::           [25]
%5: popped ::           [26]
%6: outcome shown ::    [100 200] = [correct incorrect] 
%7: max rt exceeded  :: [255]
%8: trial over ::		[150]


%send digital trigger
putvalue(dio,[dec2binvec(channel,8) 1]);
WaitSecs(.005);
putvalue(dio,[dec2binvec(0,8) 0]);

%stuff for saving in the data matrix
eventtime=GetSecs-data(end).trial_start_time;

if isfield(data(end),'ev')
    data(end).ev{end+1}=eventname;
    data(end).evt(end+1)=eventtime*1000;
else
    data(end).ev{1}=eventname;
    data(end).evt(1)=eventtime*1000;
end
end % end function

