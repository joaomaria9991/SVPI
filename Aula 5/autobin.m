function M= autobin(I)
t=graythresh(I);
M=I>t;


end