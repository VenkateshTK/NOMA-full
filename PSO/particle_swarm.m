clc;
clear;
close all;

nvar = 5;
varsize =[1 nvar];
varmin = -5;
varmax = +5;

maxit = 1000;
kappa = 1;
phi1 = 2.05;
phi2 = 2.05;
phi = phi1+phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));
npop = 50;
w= chi;
wdamp = 0.99;
c1 = phi1*chi;
c2 = phi2*chi;

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

for it = 1:maxit
   for i = 1:npop
        particle(i).velocity = w*particle(i).velocity ...
           + c1*rand(varsize).*(particle(i).best.position - particle(i).position) ...
           + c2*rand(varsize).*(globalbest.position - particle(i).position);
        particle(i).position =  particle(i).position + particle(i).velocity;
        
        particle(i).position = max(particle(i).position, varmin);
        particle(i).position = min(particle(i).position, varmax);
        
        particle(i).cost = costfunction(particle(i).position);
        
        if particle(i).cost < particle(i).best.cost
            particle(i).best.position = particle(i).position;
            particle(i).best.cost = particle(i).cost;
            % Update Global Best
            if particle(i).best.cost < globalbest.cost
                globalbest = particle(i).best;
            end            
        end
   end
        bestcost(it) = globalbest.cost;
        
        disp(['Iteration' num2str(it) ': best cost =' num2str(bestcost(it))]);
        w = w*wdamp;
        
end

figure;
plot(bestcost,'LineWidth',2);
xlabel('Iteration');
ylabel('best cost');

figure;
semilogy(bestcost,'LineWidth',2);
xlabel('Iteration');
ylabel('best cost');
grid on;


function z= costfunction(x)
    z = sum(x.^2);
end
