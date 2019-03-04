clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0303.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

figure
subplot(311)
plot(X.time,X.vehs,'LineWidth',2)
ylabel('number of vehicles')
xlabel('Time (seconds)')
grid on
subplot(312)
plot(X.time(2:end),X.flows_vph,'LineWidth',2)
ylabel('flow [vph]')
xlabel('Time (seconds)')
grid

for i=1:28
    for j=1:360
        if X.flows_vph(i,j)==0
            X.speed_kph(i,j)=120
        end
    end
end

        



density=X.vehs./(link_lengths(1:28)'*ones(1,361));
for i=1:28
    for j=1:360
        if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end
subplot(313)
plot(X.time(2:end),X.speed_kph,'LineWidth',2)
ylabel('speed [kph]')
xlabel('Time (seconds)')
grid
lgd=legend(num2str(X.link_ids'))
lgd.FontSize = 4;
lgd.NumColumns = 3
lgd.Location='southeastoutside'



padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Contour Plot of Speed')
ylabel('Link IDs')
xlabel('Time (seconds)')


padded_density = [density ; density(end,:)];
figure
i=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_density(:,2:end));
colorbar
set(i,'EdgeAlpha',0)
title('Contour Plot of Density')
ylabel('Link IDs')
xlabel('Time (seconds)')


padded_vehs = [X.vehs ; X.vehs(end,:)];
figure
j=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_vehs(:,2:end));
colorbar
set(j,'EdgeAlpha',0)
title('Contour Plot of Vehicles')
ylabel('Link IDs')
xlabel('Time (seconds)')

padded_flow = [X.flows_vph ; X.flows_vph(end,:)];
figure
k=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_flow);
colorbar
set(k,'EdgeAlpha',0)
title('Contour Plot of Flow')
ylabel('Link IDs')
xlabel('Time (seconds)')
tvh=sum(sum(X.vehs))
tvm=sum(sum(X.flows_vph))