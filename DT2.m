%Read in data of four features and the expected result of classification
[attrib1,attrib2,attrib3,attrib4,class] = textread('C:\pictures\iris.data.txt','%f%f%f%f%s','delimiter',',');
attrib = [attrib1';attrib2';attrib3';attrib4']';
a = zeros(150,1);
a(strcmp(class,'Iris-setosa')) = 1;
a(strcmp(class,'Iris-versicolor')) = 2;
a(strcmp(class,'Iris-virginica')) = 3;

%Draw distribution of data in different features
x= 1:150;
figure(1)
plot(x,attrib1,'r');
hold on
plot(x,attrib2,'g');
hold on
plot(x,attrib3,'b');
hold on
plot(x,attrib4,'--');
%From the graph, we can observe trendency of data in different features
%change.

figure(2);
scatter(x,attrib1,'r','filled');
hold on
scatter(x,attrib2,'b','filled');
hold on
scatter(x,attrib3,'g','filled');
hold on
scatter(x,attrib4,'y','filled');
xlabel('Index of Attribute Value');
ylabel('Attribute Value');
legend('sepal length','sepal width','petal length','petal width')

figure(3)
scatter(attrib1,a,'r','filled');
hold on
scatter(attrib2,a,'b','filled');
hold on
scatter(attrib3,a,'g','filled');
hold on
scatter(attrib4,a,'y','filled');
xlabel('Value of Some Attribute');
ylabel('Corresponding Class');
legend('sepal length','sepal width','petal length','petal width')

%Divide data of some attribute
[mp1,gp1,T1] = DIV(attrib1);
[mp2,gp2,T2] = DIV(attrib2);
[mp3,gp3,T3] = DIV(attrib3);
[mp4,gp4,T4] = DIV(attrib4);
[GA1,ent1,p1] = IG(mp1,gp1,attrib1,a,T1)
[GA2,ent2,p2] = IG(mp2,gp2,attrib2,a,T2)
[GA3,ent3,p3] = IG(mp3,gp3,attrib3,a,T3)
[GA4,ent4,p4] = IG(mp4,gp4,attrib4,a,T4)

GAM1 = max(GA1,GA2);
GAM2 = max(GAM1,GA3);
GA= max(GAM2,GA4)
%Choose attribute4 (Iris-virginica) as node

c1 = T4(p4);
n1 = length(attrib4);
label1 = mark(attrib4,c1);
attrib_p = attrib4./max(attrib4);
figure(4)
scatter(x,label1,'g','filled');
hold on
scatter(x,attrib_p,'r','filled');
xlabel('Index of Attribute Value');
ylabel('Attribute Division/Value(After Normalizing)')
legend('After Division','Before Division')
sum1 = sum(sum(label1==0));
sum2 = sum(sum(label1==1));
figure(5)
pie3([sum1,sum2]);
legend('Minus Group','Great Group');
[z1,count1] = DEC(attrib4,label1,a);
% Minus group is fine. Great group need to continue partition.

Remain1 = attrib4(attrib4<c1);
n2 = 1:n1-length(Remain1);
attrib_c = zeros(150,4);
for i = 1:n1
    if label1(i) == 0
        a1(i) = 0;
        attrib_c(i,:) = 0;
    else a1(i) = a(i);
         attrib_c(i,:) = attrib(i,:);
    end
end
a1 = a1(a1~=0);
a1 = a1';
attrib_c(all(attrib_c==0,2),:) = [];
attrib_c(:,4) = [];
attrib_c1 = attrib_c(:,1)';
attrib_c2 = attrib_c(:,2)';
attrib_c3 = attrib_c(:,3)';
[mp11,gp11,T11] = DIV(attrib_c1);
[mp21,gp21,T21] = DIV(attrib_c2);
[mp31,gp31,T31] = DIV(attrib_c3);
[GA11,ent11,p11] = IG(mp11,gp11,attrib_c1,a1,T11);
[GA21,ent21,p21] = IG(mp21,gp21,attrib_c2,a1,T21);
[GA31,ent31,p31] = IG(mp31,gp31,attrib_c3,a1,T31);

GAMc = max(GA11,GA21);
GAc = max(GAMc,GA31);
%Choose attribute3 as the division attribute.


c2 = T31(p31);
n2 = length(attrib_c3);
x = 1:n2;
label2 = mark(attrib_c3,c2);
attrib_p2 = attrib_c3./max(attrib_c3);
figure(6)
scatter(x,label2,'g','filled');
hold on
scatter(x,attrib_p2,'r','filled');
xlabel('Index of Attribute Value');
ylabel('Attribute Division/Value(After Normalizing)')
legend('After Division','Before Division')
sum21 = sum(sum(label2==0));
sum22 = sum(sum(label2==1));
figure(7)
pie3([sum21,sum22]);
legend('Minus Group','Great Group');
[z2,count2] = DEC(attrib_c3,label2,a1);
%The result indicates neither group is divided totally.


for i = 1:n2
    for j = 1:3
     if label1(i) == 0
        a2g(i) = 0;
        a2m(i) = a(i);
        attrib_c2g(i,:) = 0;
        attrib_c2m(i,j) = attrib_c(i,j);
     else a2g(i) = a(i);
         a2m(i) = 0;
         attrib_c2g(i,j) = attrib_c(i,j);
         attrib_c2m(i,:) = 0;
     end
    end
end
a2g = a2g(a2g~=0);
a2m = a2m(a2m~=0);
a2g = a2g';
a2m = a2m';
attrib_c2g(all(attrib_c2g==0,2),:) = [];
attrib_c2m(all(attrib_c2m==x0,2),:) = [];
attrib_c2g1 = attrib_c2g(:,1)';
attrib_c2g2 = attrib_c2g(:,2)';
attrib_c2g3 = attrib_c2g(:,3)';
attrib_c2m1 = attrib_c2m(:,1)';
attrib_c2m2 = attrib_c2m(:,2)';
attrib_c2m3 = attrib_c2m(:,3)';

%Great group
[mp12g,gp12g,T12g] = DIV(attrib_c2g1);
[mp22g,gp22g,T22g] = DIV(attrib_c2g2);
[GA12g,ent12g,p12g] = IG(mp12g,gp12g,attrib_c2g1,a2g,T12g);
[GA22g,ent22g,p22g] = IG(mp22g,gp22g,attrib_c2g2,a2g,T22g);

GAM2g = max(GA12g,GA22g);
%Choose attribte2 as the division attribute in great group

c3g = T22g(p22g);
n3g = length(attrib_c2g3);
x = 1:n3g;
label3g = mark(attrib_c2g3,c3g);
attrib_p3 = attrib_c2g3./max(attrib_c2g3);
figure(8)
scatter(x,label3g,'g','filled');
hold on
scatter(x,attrib_p3,'r','filled');
xlabel('Index of Attribute Value');
ylabel('Attribute Division/Value(After Normalizing)')
legend('After Division','Before Division')
sum41 = sum(sum(label3g==0));
sum42 = sum(sum(label3g==1));
figure(9)
pie3([sum41,sum42]);
legend('Minus Group','Great Group');
[z3g,count3g] = DEC(attrib_c2g3,label3g,a2g);
%This great group is divided perfectly.


%Minus group
[mp12m,gp12m,T12m] = DIV(attrib_c2m1);
[mp22m,gp22m,T22m] = DIV(attrib_c2m2);
[GA12m,ent12m,p12m] = IG(mp12m,gp12m,attrib_c2m1,a2m,T12m);
[GA22m,ent22m,p22m] = IG(mp22m,gp22m,attrib_c2m2,a2m,T22m);

GAM2m = max(GA12m,GA22m);

c3m = T22m(p22g);
n3m = length(attrib_c2m3);
x = 1:n3m;
label3m = mark(attrib_c2m3,c3m);
attrib_p4 = attrib_c2m3./max(attrib_c2m3);
figure(10)
scatter(x,label3m,'g','filled');
hold on
scatter(x,attrib_p4,'r','filled');
xlabel('Index of Attribute Value');
ylabel('Attribute Division/Value(After Normalizing)')
legend('After Division','Before Division')
sum31 = sum(sum(label3m==0));
sum32 = sum(sum(label3m==1));
figure(11)
pie3([sum31,sum32]);
legend('Minus Group','Great Group');
[z3m,count3m] = DEC(attrib_c2m3,label3g,a2m);
    







