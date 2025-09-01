clear all
% % input1 = 'vimto_short_cif.yuv';
% % input = 'rugby_short_cif.yuv';
% % input = 'flowergarden_short_cif.yuv';

width = 352;
height = 288;

input_sequence_yuv = 'recon.yuv';
for num_frame = 1:100
        [Y, ~, ~] = yuv_read_one_frame(input_sequence_yuv, num_frame, width, height);

imshow(Y)
pause(0.0333)
end