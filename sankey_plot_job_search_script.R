# Script for making interactive sankey plot/diagram/network

# general template: from source to target
## increase value when getting new link for a job
## remove any nodes that end up with zero (to make cleaner visualization)
jobs_template<-list(
  nodes = data.frame(name=c("Applications", "Early interview", "Final interview", "Offer", "Rejected", "Withdrawn", "Offer accepted", "Offer rejected", "Ghosted")),
  links = data.frame(source = c(0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3),
                     target = c(1, 2, 4, 5, 8, 2, 4, 5, 8, 3, 4, 5, 8, 6, 7),
                     value = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
)



jobs2020_2021<-list(
  nodes = data.frame(name=c("Applications", "Early interview", "Final interview", "Offer", "Rejected", "Withdrawn", "Offer accepted", "Offer rejected", "Ghosted")),
  links = data.frame(source =  c(0,  0, 0,  0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3),
                      target = c(1,  2, 4,  5, 8, 2, 4, 5, 8, 3, 4, 5, 8, 6, 7),
                      value =  c(12, 3, 41, 1, 5, 3, 6, 3, 0, 2, 3, 1, 0, 1, 1))
)


jobs2022_2024<-list(
  nodes = data.frame(name=c("Applications", "Early interview", "Final interview", "Offer", "Rejected", "Offer accepted", "Offer rejected", "Ghosted")),
  links = data.frame(source = c(0,  0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3),
                     target = c(1,  2, 4, 5, 7, 2, 4, 5, 7, 3, 4, 5, 7, 5, 6),
                     value =  c(11, 2, 9, 0, 3, 2, 7, 0, 2, 2, 2, 0, 0, 1, 1))
)


library(sankeyD3)
sankeyNetwork(Links = jobs2020_2021$links, Nodes = jobs2020_2021$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name", units = "count",
              fontSize = 12, nodeWidth = 20, showNodeValues = T, dragY=T)

sankeyNetwork(Links = jobs2022_2024$links, Nodes = jobs2022_2024$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name", units = "count",
              fontSize = 12, nodeWidth = 20, showNodeValues = T, dragY=T)

# percentages
## percentage of applications leading to interviews
(app_interviews_2020 <- (12+3)/62) # 2020-2021: 24%
(app_interviews_2023 <- (11+2)/25) # 2022-2024: 52%

## percentage of applications resulting in late interviews
(app_final_interviews_2020 <- (6)/62) # 2020-2021: 10%
(app_final_interviews_2023 <- (4)/25) # 2022-2024: 16%

## percentage of early interviews resulting in late interviews
(early_final_interviews_2020 <- (3)/12) # 2020-2021: 25%
(early_final_interviews_2023 <- (2)/11) # 2022-2024: 18%


