%% Script to extract every n'th frame, if the two trackers are of different length
size_vo = size(pos_vo);
size_ot = size(pos_ot);

frames_vo = size_vo(1);
frames_ot = size_ot(1);
if (frames_ot > frames_vo)
   pos_ot_new = zeros(frames_vo, 3);
   
   diff_frames = frames_ot-frames_vo;
   ratio = frames_vo/frames_ot;
   n = floor(ratio*10);
   j = 1;
   for i=1:frames_ot
       if (mod(i-1, n) == 0)
           pos_ot_new(j, :) = pos_ot(i, :);
           j = j+1;
       end
   end
   pos_ot = pos_ot_new;
else %frames_vo > frames_ot
    pos_vo_new = zeros(frames_ot, 3);
    
    diff_frames = frames_vo-frames_ot;
    ratio = frames_ot/frames_vo;
    n = floor(ratio*10);
    j = 1;
    for i = 1:frames_vo
        if (mod(i-1, n) == 0)
            pos_vo_new(j, :) = pos_vo(i, :);
            j = j+1;
        end
    end
    pos_vo = pos_vo_new;
end