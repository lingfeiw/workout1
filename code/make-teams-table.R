# ===================================================================
#title: make-teams-table
# Description:
#   This script performs transformations on various columns of the raw data file
#   and creates a csv data file.
# Input(s): data file 'nba2018.csv'
# Output(s): data file 'nba2018-teams.csv'
# ===================================================================

library("plyr")
library("dplyr")
dat <- read.csv('../data/nba2018.csv', stringsAsFactors = FALSE)
dat$experience[dat$experience=="R"] <- 0
dat$experience <- type.convert(dat$experience)
dat$salary <- dat$salary/1000000
dat$position <- factor(dat$position,level=c("C","PF","PG","SF","SG"))
dat$position <- revalue(dat$position,
                        c("C"="center","PF"="power_fwd",
                          "PG"="point_guard","SF"="small_fwd","SG"="shoot_guard"))

missed_fg=dat$field_goals_atts-dat$field_goals
missed_ft=dat$points1_atts-dat$points1
rebounds=dat$off_rebounds+dat$def_rebounds
dat <- mutate(dat,missed_fg,missed_ft,rebounds,
              efficiency=(dat$points+rebounds
                          +dat$assists+dat$steals+dat$blocks
                          -missed_fg-missed_ft-dat$turnovers)/dat$games)
dat

sink("../output/efficiency-summary.txt")
summary(dat$efficiency)
sink()




teams <-  summarise(group_by(dat, team),
          experience=round(sum(experience),2),
          salary=round(sum(salary),2),
          points3=sum(points3),
          points2=sum(points2),
          points1=sum(points1),
          points=sum(points),
          off_rebounds=sum(off_rebounds),
          def_rebounds=sum(def_rebounds),
          assists=sum(assists),
          steals=sum(steals),
          blocks=sum(blocks),
          turnovers=sum(turnovers),
          fouls=sum(fouls),
          efficiency=sum(efficiency))
teams
sink("../output/teams-summary.txt")
summary(teams)
sink()

write.csv(teams,"../data/nba2018-teams.csv")


