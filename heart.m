f=@(x,y,z) x.^2.*z.^3+9*y.^2.*z.^3/80-(x.^2+9*y.^2/4+z.^2-1).^3;%�������溯��
[x,y,z]=meshgrid(-1.5:0.1:1.5);%��ͼ��Χ
v=f(x,y,z);
%��ͼ
pic_num = 1;
h=patch(isosurface(x,y,z,v,0));
isonormals(x,y,z,v,h)
set(h,'FaceColor','r','EdgeColor','none');
title('Programmed By ��')
alpha(0.6)   
grid off;
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5])
lighting Gouraud
h = camlight('left');
for i = 1:180%ˮƽ��ת�����
        camorbit(1,0)
        camlight(h,'left');
        %savegif('dot');
        
        drawnow;
       % hold on
       F=getframe(gcf);
       I=frame2im(F);
       [I,map]=rgb2ind(I,256);
      if pic_num == 1
          imwrite(I,map,'test2.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
      else
          imwrite(I,map,'test2.gif','gif','WriteMode','append','DelayTime',0.2);
      end
    pic_num = pic_num + 1;
end
