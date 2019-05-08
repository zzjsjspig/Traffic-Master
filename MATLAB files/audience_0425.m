%%

close all

configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_0.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 0')
ylabel('Link IDs')
xlabel('Time (seconds)')

savefig('Flow_0_25.fig')
saveas(gcf,'Flow_0_25.png')

tvh_0_25=sum(sum(X.vehs))
Z_0=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_0.time = X.time;
Z_0.vehs = X.vehs;
Z_0.flows_vph = X.flows_vph;
Z_0.speed_kph = X.speed_kph;
Z_0.link_ids = X.link_ids;

%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_50.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 50')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_50_25.fig')
saveas(gcf,'Flow_50_25.png')

tvh_50_25=sum(sum(X.vehs))
Z_50=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_50.time = X.time;
Z_50.vehs = X.vehs;
Z_50.flows_vph = X.flows_vph;
Z_50.speed_kph = X.speed_kph;
Z_50.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_100.xml';
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
for i=1:28
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 100')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_100_25.fig')
saveas(gcf,'Flow_100_25.png')

tvh_100_25=sum(sum(X.vehs))
Z_100=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_100.time = X.time;
Z_100.vehs = X.vehs;
Z_100.flows_vph = X.flows_vph;
Z_100.speed_kph = X.speed_kph;
Z_100.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_150.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 150')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_150_25.fig')
saveas(gcf,'Flow_150_25.png')

tvh_150_25=sum(sum(X.vehs))
Z_150=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_150.time = X.time;
Z_150.vehs = X.vehs;
Z_150.flows_vph = X.flows_vph;
Z_150.speed_kph = X.speed_kph;
Z_150.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_200.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 200')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_200_25.fig')
saveas(gcf,'Flow_200_25.png')

tvh_200_25=sum(sum(X.vehs))
Z_200=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_200.time = X.time;
Z_200.vehs = X.vehs;
Z_200.flows_vph = X.flows_vph;
Z_200.speed_kph = X.speed_kph;
Z_200.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_250.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 250')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_250_25.fig')
saveas(gcf,'Flow_250_25.png')

tvh_250_25=sum(sum(X.vehs))
Z_250=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_250.time = X.time;
Z_250.vehs = X.vehs;
Z_250.flows_vph = X.flows_vph;
Z_250.speed_kph = X.speed_kph;
Z_250.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_300.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 300')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_300_25.fig')
saveas(gcf,'Flow_300_25.png')

tvh_300_25=sum(sum(X.vehs))
Z_300=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_300.time = X.time;
Z_300.vehs = X.vehs;
Z_300.flows_vph = X.flows_vph;
Z_300.speed_kph = X.speed_kph;
Z_300.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_350.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 350')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_350_25.fig')
saveas(gcf,'Flow_350_25.png')

tvh_350_25=sum(sum(X.vehs))
Z_350=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_350.time = X.time;
Z_350.vehs = X.vehs;
Z_350.flows_vph = X.flows_vph;
Z_350.speed_kph = X.speed_kph;
Z_350.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_400.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 400')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_400_25.fig')
saveas(gcf,'Flow_400_25.png')

tvh_400_25=sum(sum(X.vehs))
Z_400=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_400.time = X.time;
Z_400.vehs = X.vehs;
Z_400.flows_vph = X.flows_vph;
Z_400.speed_kph = X.speed_kph;
Z_400.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_450.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 450')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_450_25.fig')
saveas(gcf,'Flow_450_25.png')

tvh_450_25=sum(sum(X.vehs))
Z_450=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_450.time = X.time;
Z_450.vehs = X.vehs;
Z_450.flows_vph = X.flows_vph;
Z_450.speed_kph = X.speed_kph;
Z_450.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_500.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 500')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_500_25.fig')
saveas(gcf,'Flow_500_25.png')

tvh_500_25=sum(sum(X.vehs))
Z_500=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_500.time = X.time;
Z_500.vehs = X.vehs;
Z_500.flows_vph = X.flows_vph;
Z_500.speed_kph = X.speed_kph;
Z_500.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_550.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 550')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_550_25.fig')
saveas(gcf,'Flow_550_25.png')

tvh_550_25=sum(sum(X.vehs))
Z_550=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_550.time = X.time;
Z_550.vehs = X.vehs;
Z_550.flows_vph = X.flows_vph;
Z_550.speed_kph = X.speed_kph;
Z_550.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_600.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 600')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_600_25.fig')
saveas(gcf,'Flow_600_25.png')

tvh_600_25=sum(sum(X.vehs))
Z_600=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_600.time = X.time;
Z_600.vehs = X.vehs;
Z_600.flows_vph = X.flows_vph;
Z_600.speed_kph = X.speed_kph;
Z_600.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_650.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 650')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_650_25.fig')
saveas(gcf,'Flow_650_25.png')

tvh_650_25=sum(sum(X.vehs))
Z_650=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_650.time = X.time;
Z_650.vehs = X.vehs;
Z_650.flows_vph = X.flows_vph;
Z_650.speed_kph = X.speed_kph;
Z_650.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_700.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 700')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_700_25.fig')
saveas(gcf,'Flow_700_25.png')

tvh_700_25=sum(sum(X.vehs))
Z_700=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_700.time = X.time;
Z_700.vehs = X.vehs;
Z_700.flows_vph = X.flows_vph;
Z_700.speed_kph = X.speed_kph;
Z_700.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_750.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 750')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_750_25.fig')
saveas(gcf,'Flow_750_25.png')

tvh_750_25=sum(sum(X.vehs))
Z_750=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_750.time = X.time;
Z_750.vehs = X.vehs;
Z_750.flows_vph = X.flows_vph;
Z_750.speed_kph = X.speed_kph;
Z_750.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_800.xml';
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

density=X.vehs./(link_lengths(1:44)'*ones(1,361));
for i=1:44
    for j=1:360
       if isnan(X.speed_kph(i,j))
            X.speed_kph(i,j)=120
        end
    end
end

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 800')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_800_25.fig')
saveas(gcf,'Flow_800_25.png')

tvh_800_25=sum(sum(X.vehs))
Z_800=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_800.time = X.time;
Z_800.vehs = X.vehs;
Z_800.flows_vph = X.flows_vph;
Z_800.speed_kph = X.speed_kph;
Z_800.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_850.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 850')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_850_25.fig')
saveas(gcf,'Flow_850_25.png')

tvh_850_25=sum(sum(X.vehs))
Z_850=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_850.time = X.time;
Z_850.vehs = X.vehs;
Z_850.flows_vph = X.flows_vph;
Z_850.speed_kph = X.speed_kph;
Z_850.link_ids = X.link_ids;
%%
close all
configfile = '/Users/jeff/Downloads/otm-base-master/src/main/resources/test_configs/Capstone_0425_900.xml';
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

padded_speed = [X.speed_kph ; X.speed_kph(end,:)];
figure;
h=pcolor(X.time(2:end),0:numel(link_ids),padded_speed);
colorbar
set(h,'EdgeAlpha',0)
title('Speed at Different Links with On-Ramp Demand Flow of 900')
ylabel('Link IDs')
xlabel('Time (seconds)')
savefig('Flow_900_25.fig')
saveas(gcf,'Flow_900_25.png')

tvh_900_25=sum(sum(X.vehs))
Z_900=struct('time',[],'vehs',[],'flows_vph',[],'speed_kph',[],'link_ids',[]);
Z_900.time = X.time;
Z_900.vehs = X.vehs;
Z_900.flows_vph = X.flows_vph;
Z_900.speed_kph = X.speed_kph;
Z_900.link_ids = X.link_ids;
%%
close all
tvh_25=[tvh_0_25,tvh_50_25,tvh_100_25,tvh_150_25,tvh_200_25,tvh_250_25,tvh_300_25,tvh_350_25,tvh_400_25,tvh_450_25,...
    tvh_500_25,tvh_550_25,tvh_600_25,tvh_650_25,tvh_700_25,tvh_750_25,tvh_800_25,tvh_850_25,tvh_900_25]
tvh_difference_25=tvh_25
tvh_difference_25(1)=0
for i=2:19
    tvh_difference_25(i)=tvh_25(i)-tvh_25(i-1)
end
[M,I]=max(tvh_difference_25)
[m,i]=min(tvh_difference_25(2:19))
openfig('Flow_650_25.fig');
openfig('Flow_350_25.fig');
