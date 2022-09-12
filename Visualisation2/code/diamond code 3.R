library(ggplot2)
n = nrow(diamonds)
cut = diamonds$cut

cuttable = data.frame(table (cut))
pie(cuttable$Freq,labels = cuttable$cut)
ggplot(data = cuttable, aes(x = "", y = Freq, fill = cut))+
  coord_polar("y",start = 0)+
  geom_bar(stat = "log", width = 1)+
  #theme_void()+
  scale_fill_brewer(palette = "Set2")
