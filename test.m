function[noemalized255_result,binary_result]=function_new_motion_detection(bitplanes,th)

sum_total=sum(bitplanes,3);
summing=double(cumsum(bitplanes,3));
grad(1:size(bitplanes,3))=1:size(bitplanes,3);
diff_line_2D = repmat(grad,[256 1 1]);
diff_line_3D = repmat(diff_line_2D,1,1,256);
diff_line_3D = permute(diff_line_3D,[1 3 2]);
diff_line_3D=double(diff_line_3D).*double(sum_total)/(double(size(bitplanes,3)));
diff_summing_line_2D=sum(abs(summing-diff_line_3D),3);
noemalized255_result=diff_summing_line_2D/max(max(diff_summing_line_2D))*255;
binary_result=double(noemalized255_result>=th)*255;

%% comment
