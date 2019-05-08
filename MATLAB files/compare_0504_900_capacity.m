close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0504_900_capacity.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids,out_dt)
X = otm.get_state_trajectory();

for i=1:44
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

density=X.vehs./(link_lengths'*ones(1,361));
for i=1:44
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end


padded_speed = [X.speed_kph; X.speed_kph(end,:)];
figure;
subplot(211)
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows with Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_0504_900_B.fig')
saveas(gcf,'Flow_0504_900_B.png')

tvh_0504_900_B=sum(sum(X.vehs))
j_900_B=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
j_900_B.time = X.time;
j_900_B.vehs = X.vehs;
j_900_B.flows_vph = X.flows_vph;
j_900_B.speed_kph = X.speed_kph;
j_900_B.link_ids = X.link_ids;
%%


configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_900.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids,out_dt)
X = otm.get_state_trajectory();

for i=1:44
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

density=X.vehs./(link_lengths'*ones(1,361));
for i=1:44
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end


padded_speed = [X.speed_kph; X.speed_kph(end,:)];

subplot(212)
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with Maximum On-Ramp and Mainline Demand Flows')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_0504_900.fig')
saveas(gcf,'Flow_0504_900.png')

tvh_0504_900=sum(sum(X.vehs))
j_900_no=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
j_900_no.time = X.time;
j_900_no.vehs = X.vehs;
j_900_no.flows_vph = X.flows_vph;
j_900_no.speed_kph = X.speed_kph;
j_900_no.link_ids = X.link_ids;
%%

b900=100*(tvh_0504_900-tvh_0504_900_B)/(tvh_0504_900)

%plot(X_values,X_J,"-x")
%ylabel('TVH Improvement Percentage (%)') 
%title("The Dependence of Total Delay on Controller Presence")