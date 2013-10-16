clear all;
clc;
vid=videoinput('winvideo',1,'YUY2_640x480');
NEWSMART.fig=close;
rgb_image = getsnapshot(vid);
[a b c]=size(rgb_image);%no.of layers
y=a;
x=b;
x1=x/2-120;
x2=x/2+120;
y1=y/2-30;
y2=y/2+30;
%ser=serial('COM10');
%fopen(ser);
%pause(5);
import java.awt.Robot;%mouse=robot
import java.awt.event.*;
mouse = Robot;
while(1)
    image=getsnapshot(vid);
    flushdata(vid);
    rgb_image=ycbcr2rgb(image);
    rbar=0;
    cbar=0;
    e=0;
    FR=rgb_image(:,:,1);
    FG=rgb_image(:,:,2);
    FB=rgb_image(:,:,3);
    I=((FR>=192)&(FR<=255)&(FG>=250)&(FG<=255)&(FB>=101)&(FB<=255));
    se=strel('disk',5);
    B=imopen(I,se);
    final=imclose(B,se);
    [L,n]=bwlabel(final);
    imshow(L);
    imshow(L);
    for k=1:n
        [r,c]=find(L==k);
        rbar=mean(r);
        cbar=mean(c);
    end
    mouse.mouseMove(cbar*2.134375,rbar*1.6);
end
