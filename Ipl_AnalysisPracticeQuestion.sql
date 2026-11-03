-- Easy
 select*from ipl_data;
-- -- -- display only player name, teams, runs
 select Player_Name, Team, Runs from ipl_data;
-- -- -- find all matchs where team is 'mumbai indians'
 select * from ipl_data where Team='Mumbai Indians';
-- -- -- select unique teams from table
 select distinct Team from ipl_data;
-- -- -- find top 10 rows
 select * from ipl_data limit 0,10;
-- -- -- sortplayers by run in descending order
 select Player_Name from ipl_data order by Runs desc;
-- -- -- show only players who scored more than 50 runs
 select Player_Name from ipl_data where Runs >50;
-- -- -- show all bowlers from chennai super kings
 select * from ipl_data where Role='Bowler' and Team='Chennai Super Kings';
 
select * from ipl_data order by Runs desc;
-- -- -- show matches played at wankhede stadium
 select  * from ipl_data where Venue='Wankhede stadium';
-- -- -- find all the man of the match winners
 select * from ipl_data where Result='win' and Man_of_Match='yes';
 -- Medium
-- -- -- players who Scored between 30 and 60 runs
 select Player_Name from ipl_data where Runs between 30 and 60;
 select distinct Runs from ipl_data order by runs desc limit 1,1;
 -- -- select players from kkr and mi
select * from ipl_data where Team ="Kolkata Knight Riders" or Team= "mumbai indians";
-- -- -- -- find players who are not all rounders
 select * from ipl_data where Role != 'All-Rounder';
-- -- -- -- show matches where wickets are null
 select * from ipl_data where Wickets is null;
-- -- -- -- show matches where strike rate is not null
 select * from ipl_data where Strike_Rate is not null;
-- -- -- -- find matches with more than 2 wickects ormore than 50 runs
 select * from ipl_data where wickets>2 and runs>50;
-- -- -- -- list matches where player scored 0 but team won
 select * from ipl_data where Runs=0 and Result='Win';
-- -- -- -- show all records where venue name starts with an E
 select * from ipl_data where Venue like 'E%';
-- -- -- -- show all players whose name contains singh
 select * from ipl_data where Player_Name like '%Singh%';
--  list top 5 highest wicket takers
 select * from ipl_data order by Wickets Desc limit 0,5;
 -- Advance ques
 -- find players who scored 50+ runs and took atleast 1 wicket
 select * from ipl_data where Runs>50 and Wickets=1;
 -- count total no. of matches played by each team 
 select count(*) NumOfMatch,Team from ipl_data group by Team;
 -- show top5 players by total runs
 select sum(Runs) TotalRuns,Player_Name from ipl_data group by Player_Name order by TotalRuns desc limit 5;
 -- calculate average runs per team
 select avg(Runs) AvgRuns,Team from ipl_data group by Team ;
 -- find number of wins per team
 select  count(*) NumWin from ipl_data where Result='Win' group by Team ;
 -- find no. of players whose name matches regex pattern of starting with R.
 select * from ipl_data where Player_Name regexp '^R' ;
 -- find all records where venue name ends with stadium
 select * from ipl_data where Venue regexp 'stadium$';
 -- show teams who never won any match
select distinct team from ipl_data where team not in (select distinct team from ipl_data where result='win');
-- show top 5 strike rate above 150 
select * from ipl_data where Strike_Rate>150 order by Strike_Rate Desc limit 5;
-- find average economy rate of bowlers who took more than 10 wickets
 select Player_Name,avg(Economy_Rate) AvgEco ,sum(Wickets) TotalWickets from ipl_data where Role='Bowler'
 group by Player_Name having TotalWickets>10;