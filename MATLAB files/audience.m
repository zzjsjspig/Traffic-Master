%%
clear
close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_0.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 0')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('Flow_0.fig')
saveas(gcf,'Flow_0.png')

tvh_0=sum(sum(X.vehs))
Y_0=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_0.time = X.time;
Y_0.vehs = X.vehs;
Y_0.flows_vph = X.flows_vph;
Y_0.speed_kph = X.speed_kph;
Y_0.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_50.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 50')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_50.fig')
saveas(gcf,'Flow_50.png')

tvh_50=sum(sum(X.vehs))
Y_50=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_50.time = X.time;
Y_50.vehs = X.vehs;
Y_50.flows_vph = X.flows_vph;
Y_50.speed_kph = X.speed_kph;
Y_50.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_100.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 100')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_100.fig')
saveas(gcf,'Flow_100.png')

tvh_100=sum(sum(X.vehs))
Y_100=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_100.time = X.time;
Y_100.vehs = X.vehs;
Y_100.flows_vph = X.flows_vph;
Y_100.speed_kph = X.speed_kph;
Y_100.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_150.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 150')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_150.fig')
saveas(gcf,'Flow_150.png')

tvh_150=sum(sum(X.vehs))
Y_150=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_150.time = X.time;
Y_150.vehs = X.vehs;
Y_150.flows_vph = X.flows_vph;
Y_150.speed_kph = X.speed_kph;
Y_150.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_200.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 200')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_200.fig')
saveas(gcf,'Flow_200.png')

tvh_200=sum(sum(X.vehs))
Y_200=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_200.time = X.time;
Y_200.vehs = X.vehs;
Y_200.flows_vph = X.flows_vph;
Y_200.speed_kph = X.speed_kph;
Y_200.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_250.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 250')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_250.fig')
saveas(gcf,'Flow_250.png')

tvh_250=sum(sum(X.vehs))
Y_250=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_250.time = X.time;
Y_250.vehs = X.vehs;
Y_250.flows_vph = X.flows_vph;
Y_250.speed_kph = X.speed_kph;
Y_250.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_300.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 300')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_300.fig')
saveas(gcf,'Flow_300.png')

tvh_300=sum(sum(X.vehs))
Y_300=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_300.time = X.time;
Y_300.vehs = X.vehs;
Y_300.flows_vph = X.flows_vph;
Y_300.speed_kph = X.speed_kph;
Y_300.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_350.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 350')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_350.fig')
saveas(gcf,'Flow_350.png')

tvh_350=sum(sum(X.vehs))
Y_350=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_350.time = X.time;
Y_350.vehs = X.vehs;
Y_350.flows_vph = X.flows_vph;
Y_350.speed_kph = X.speed_kph;
Y_350.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_400.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 400')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_400.fig')
saveas(gcf,'Flow_400.png')

tvh_400=sum(sum(X.vehs))
Y_400=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_400.time = X.time;
Y_400.vehs = X.vehs;
Y_400.flows_vph = X.flows_vph;
Y_400.speed_kph = X.speed_kph;
Y_400.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_450.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_450.fig')
saveas(gcf,'Flow_450.png')

tvh_450=sum(sum(X.vehs))
Y_450=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_450.time = X.time;
Y_450.vehs = X.vehs;
Y_450.flows_vph = X.flows_vph;
Y_450.speed_kph = X.speed_kph;
Y_450.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_500.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 500')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_500.fig')
saveas(gcf,'Flow_500.png')

tvh_500=sum(sum(X.vehs))
Y_500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_500.time = X.time;
Y_500.vehs = X.vehs;
Y_500.flows_vph = X.flows_vph;
Y_500.speed_kph = X.speed_kph;
Y_500.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_550.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 550')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_550.fig')
saveas(gcf,'Flow_550.png')

tvh_550=sum(sum(X.vehs))
Y_550=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_550.time = X.time;
Y_550.vehs = X.vehs;
Y_550.flows_vph = X.flows_vph;
Y_550.speed_kph = X.speed_kph;
Y_550.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_600.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 600')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_600.fig')
saveas(gcf,'Flow_600.png')

tvh_600=sum(sum(X.vehs))
Y_600=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_600.time = X.time;
Y_600.vehs = X.vehs;
Y_600.flows_vph = X.flows_vph;
Y_600.speed_kph = X.speed_kph;
Y_600.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_650.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 650')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_650.fig')
saveas(gcf,'Flow_650.png')

tvh_650=sum(sum(X.vehs))
Y_650=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_650.time = X.time;
Y_650.vehs = X.vehs;
Y_650.flows_vph = X.flows_vph;
Y_650.speed_kph = X.speed_kph;
Y_650.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_700.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 700')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_700.fig')
saveas(gcf,'Flow_700.png')

tvh_700=sum(sum(X.vehs))
Y_700=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_700.time = X.time;
Y_700.vehs = X.vehs;
Y_700.flows_vph = X.flows_vph;
Y_700.speed_kph = X.speed_kph;
Y_700.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_750.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 750')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_750.fig')
saveas(gcf,'Flow_750.png')

tvh_750=sum(sum(X.vehs))
Y_750=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_750.time = X.time;
Y_750.vehs = X.vehs;
Y_750.flows_vph = X.flows_vph;
Y_750.speed_kph = X.speed_kph;
Y_750.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_800.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 800')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_800.fig')
saveas(gcf,'Flow_800.png')

tvh_800=sum(sum(X.vehs))
Y_800=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_800.time = X.time;
Y_800.vehs = X.vehs;
Y_800.flows_vph = X.flows_vph;
Y_800.speed_kph = X.speed_kph;
Y_800.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_850.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 850')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_850.fig')
saveas(gcf,'Flow_850.png')

tvh_850=sum(sum(X.vehs))
Y_850=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_850.time = X.time;
Y_850.vehs = X.vehs;
Y_850.flows_vph = X.flows_vph;
Y_850.speed_kph = X.speed_kph;
Y_850.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0419_900.xml';
duration = 3600;
out_dt = 10;

scenario = Scenario(configfile);
link_ids = scenario.get_link_ids;
link_lengths=scenario.get_link_lengths_meters(link_ids);

otm = OTM(configfile);
otm.run_simple(0,duration,link_ids(1:28),out_dt)
X = otm.get_state_trajectory();

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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids(1:28)),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_900.fig')
saveas(gcf,'Flow_900.png')

tvh_900=sum(sum(X.vehs))
Y_900=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Y_900.time = X.time;
Y_900.vehs = X.vehs;
Y_900.flows_vph = X.flows_vph;
Y_900.speed_kph = X.speed_kph;
Y_900.link_ids = X.link_ids;
%%
close all
tvh=[tvh_0,tvh_50,tvh_100,tvh_150,tvh_200,tvh_250,tvh_300,tvh_350,tvh_400,tvh_450,...
    tvh_500,tvh_550,tvh_600,tvh_650,tvh_700,tvh_750,tvh_800,tvh_850,tvh_900]
tvh_difference=tvh
tvh_difference(1)=0
for i=2:19
    tvh_difference(i)=tvh(i)-tvh(i-1)
end
[M,I]=max(tvh_difference)
[m,i]=min(tvh_difference(2:19))
openfig('Flow_400.fig');
openfig('Flow_350.fig');
