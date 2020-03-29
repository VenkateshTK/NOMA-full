clc;
clear;

nvar = 5;
varsize =[1 nvar];
varmin = -5;
varmax = +5;

maxit = 1000;
npop =50;
w=1;
c1=2;
c2=2;

empty_particle.position = [];
empty_particle.velocity = [];
empty_particle.cost = [];
empty_particle.best.position =[];
empty_particle.best.cost = [];

particle = repmat(empty_particle,npop,1);

globalbest.cost = inf;

for i = 1:npop
    particle(i).position = unifrnd(varmin,varmax,varsize);
    particle(i).velocity = zeros(varsize);
    particle(i).cost = costfunction(particle(i).position);
    particle(i).best.position = particle(i).position;
    particle(i).best.cost = particle(i).cost;
    
    if particle(i).best.cost < globalbest.cost
        globalbest = particle(i).best;
    end
    
end

bestcost = zeros(maxit ,1);


function z= costfunction(x)
    z = sum(x.^2);
end
