workout01-Lingfei-Wu
================
Lingfei Wu
October 2, 2018

``` r
dat <- read.csv('../data//nba2018-teams.csv')
library('ggplot2')
```

``` r
ggplot(dat, aes(x=reorder(team,salary),y=salary)) +
  geom_bar(stat='identity') +
  coord_flip()+ 
  geom_hline(yintercept=mean(dat$salary),color="red",size=2)+
  xlab("Team") + ylab("Salary(in millions)")+labs(title="NBA Teams Ranked by Total Salary")
```

![](../report/workout01-Lingfei-Wu_files/NBA%20Teams%20Ranked%20by%20Total%20Salary-1.png)

``` r
ggplot(dat, aes(x=reorder(team,points),y=points)) +
  geom_bar(stat='identity') +
  coord_flip()+ 
  geom_hline(yintercept=mean(dat$points),color="red",size=2)+
  xlab("Team") + ylab("Points")+labs(title="NBA Teams Ranked by Total Points")
```

![](../report/workout01-Lingfei-Wu_files/NBA%20Teams%20Ranked%20by%20Total%20Points-1.png)

``` r
ggplot(dat, aes(x=reorder(team,efficiency),y=efficiency)) +
  geom_bar(stat='identity') +
  coord_flip()+ 
  geom_hline(yintercept=mean(dat$efficiency),color="red",size=2)+
  xlab("Team") + ylab("Efficiency")+labs(title="NBA Teams Ranked by Total Efficiency")
```

![](../report/workout01-Lingfei-Wu_files/NBA%20Teams%20Ranked%20by%20Total%20Efficiency-1.png)

``` r
myefficiency <-  1-4*(dat$turnovers+dat$fouls)/(dat$points+dat$off_rebounds
             +dat$def_rebounds+dat$assists+dat$steals+dat$blocks+dat$turnovers)
```

I first compute the ratio of negative behaviors to positive behaviors, and enlarge this error rate by 4 times. Since the team who has the larger error rate performs worse, I use 1 to subtract it and get my efficiency.

``` r
ggplot(dat, aes(x=reorder(team,myefficiency),y=myefficiency)) +
  geom_bar(stat='identity') +
  coord_flip()+ 
  geom_hline(yintercept=mean(myefficiency),color="red",size=2)+
  xlab("Team") + ylab("My Efficiency")+labs(title="NBA Teams Ranked by My Efficiency")
```

![](../report/workout01-Lingfei-Wu_files/NBA%20Teams%20Ranked%20by%20My%20Efficiency-1.png)

### Comments and Reflections

-   Yes.I think we should be more cautious about the path.
-   No.
-   No.
-   Using ggplot and push the commits to my github repository.
-   Writing the data dictionary.
-   No.
-   7 hours.
-   Ranking the teams.
-   Working with the file structure.
