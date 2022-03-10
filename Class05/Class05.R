# Class 05 Data Visualization

# This is the "base" R plot
plot(cars)

# We are going to get a new plotting package called ggplot2
# ggplot(cars)

# install.packages("ggplot2")
# Now we need to call/load the package
library(ggplot2)

# This sets up the plot
ggplot(cars)

gg <- ggplot(cars) + aes(x=dist, y=speed) + geom_point()
gg
# One las thing. Let's add a line to the data

gg + geom_smooth()

# I want a linear model
gg + labs(title="Speed and Stopping Distances of Cars", 
          x="Speed (MPH)", 
          y="Stopping Distance (ft)", 
          subtitle = "Car stopping distance", 
          caption="Dataset: 'cars'") + 
  geom_smooth(method="lm", se=FALSE) + theme_bw()









# RNASeq experiment dataset

# Read the data into R
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# > Q. How many genes in this dataset? 
nrow(genes)

colnames(genes)

# I want to plot this result
ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) + 
  geom_point()


# Q. How many genes are "up" regulated in this
table( genes$State )

# Q. Using your values above and 2 significant figures. What fraction of total genes is up-regulated in this dataset?
round( table(genes$State)/nrow(genes) * 100, 2 )


# Add some color to denote up/down values
ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) + 
  geom_point() +
  labs(title="Some gene expression data")
p <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) + 
  geom_point()
p + scale_colour_manual(values=c("blue","gray","red")) +
  labs(title="Gene Expresion Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")
