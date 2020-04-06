clc;
clear;

total_power= zeros(10000,1);
dataset = [];
s=0;

%1 -100
%100 -200 try

for a = 1 : 100
    r = 1 + (4)*rand(4,1);
    h = sort(r');
    
    power_tot = [795,891,1000,1122,1258,1412,1584,1778,1995,2238,2511,2818,3162,400];
    
    vmax = 400;   

    for j = 1 : (length(power_tot)) 
        nvar = 4;
        varsize =[1 nvar];
        varmin = 0.000000000001;
        varmax = vmax;

        maxit =400;
        kappa = 1;
        phi1 = 2.05;
        phi2 = 2.05;
        phi = phi1+phi2;
        chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));
        npop = 500;
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

        globalbest.cost = -inf;

        for i = 1:npop
            particle(i).position = unifrnd(varmin,varmax,varsize);
            particle(i).velocity = zeros(varsize);
            particle(i).cost = costfunction(particle(i).position,h);
            particle(i).best.position = particle(i).position;
            particle(i).best.cost = particle(i).cost;

            if particle(i).best.cost > globalbest.cost
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

                particle(i).cost = costfunction(particle(i).position,h);

                if particle(i).cost > particle(i).best.cost
                    particle(i).best.position = particle(i).position;
                    particle(i).best.cost = particle(i).cost;
                    % Update Global Best
                    if particle(i).best.cost > globalbest.cost
                        globalbest = particle(i).best;
                    end            
                end
            end
            bestcost(it) = globalbest.cost;
            %w = w*wdamp;
        end
        disp([ num2str(a) '- Iteration' num2str(it) ': best cost = ' num2str(bestcost(it)) ' power =' num2str(sum(globalbest.position))]);
        s = s+1;


        vmax = vmax + 0.5*(power_tot(j)-sum(globalbest.position));  

        dataset(s).h1 = h(1);
        dataset(s).h2 = h(2);
        dataset(s).h3 = h(3);
        dataset(s).h4 = h(4);
        
        dataset(s).power1 = globalbest.position(1)/100;
        dataset(s).power2 = globalbest.position(2)/100;
        dataset(s).power3 = globalbest.position(3)/100;
        dataset(s).power4 = globalbest.position(4)/100;
        
        dataset(s).total = sum(globalbest.position)/100;
        dataset(s).check = costfunction(globalbest.position,h);
        dataset(s).channel = valuescheck(globalbest.position,h);

        total_power(s) = sum(globalbest.position);

    end
end


figure;
plot(total_power,'LineWidth',2);
xlabel('Iteration');
ylabel('best cost');
grid on;