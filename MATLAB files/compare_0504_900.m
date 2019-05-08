close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0503_900_alinea.xml';
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
title('Link Speeds with Mainline Demand Flow of 7500 and Max On-ramp Demand with Controller')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_0504_900_A.fig')
saveas(gcf,'Flow_0504_900_A.png')

tvh_0504_900_A=sum(sum(X.vehs))
j_900=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
j_900.time = X.time;
j_900.vehs = X.vehs;
j_900.flows_vph = X.flows_vph;
j_900.speed_kph = X.speed_kph;
j_900.link_ids = X.link_ids;
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
title('Link Speeds with Mainline Demand Flow of 7500 and Max On-ramp Demand')
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

a900=100*(tvh_0504_900-tvh_0504_900_A)/(tvh_0504_900)

%plot(X_values,X_J,"-x")
%ylabel('TVH Improvement Percentage (%)') 
%title("The Dependence of Total Delay on Controller Presence")