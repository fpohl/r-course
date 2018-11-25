library(rgdal)
library(ggplot2)
library(grid)
library(ggmap)
library(dplyr)
library(sf)

#################

#http://developers.google.com/maps
register_google("AIzaSyDYUzWsPtAe97crsuuPGUJzGfeyz2_akDY")
map <- get_map(location = 'Geiselwind', zoom = 9, map="terrain")
ggmap(map)

#https://developers.google.com/maps/documentation/maps-static/styling#features
map <- get_googlemap(center = 'Geiselwind', zoom = 9, map="terrain",
                     style='feature:road|visibility:off')
ggmap(map)

#vector of steigerwald borders
steigi <- readOGR("adm/steigerwald.gpkg")
steigi <- spTransform(steigi,CRS=CRS("+proj=longlat +datum=WGS84"))
steigi <- fortify(steigi)

steigi_map <- ggmap(map) +
              geom_map(map=steigi, data=steigi, 
              aes(map_id=id, x=long, y=lat, group=group), 
              color="red", alpha=0) 
plot(steigi_map)

xlim <- ggplot_build(steigi_map)$layout$panel_scales_x[[1]]$range$range 
ylim <- ggplot_build(steigi_map)$layout$panel_scales_y[[1]]$range$range
df <- data.frame(xlim,ylim)
df

##################################################################################

germany <- readOGR("adm/gadm36_DEU_1.shp")
bundes <- fortify(germany)
ger_map <- ggplot(bundes,aes(x=long,y=lat,group=group)) +
                  geom_polygon(fill="gray",col="white") +
                  coord_equal()+
                  geom_rect(data = df, inherit.aes = FALSE , fill=NA, colour="black",
                  aes(xmin = df$xlim[1], xmax = xlim[2], ymin = ylim[1], ymax = ylim[2]))+
                  labs(x = NULL, y = NULL)
plot(ger_map)


maptheme <- theme(
  axis.text = element_blank(),
  axis.ticks = element_blank(),
  panel.grid = element_blank(),
  panel.border = element_rect(fill = NA, colour = "black"),
  panel.background = element_blank()
)

grid.newpage()
vp_b <- viewport(width = 1, height = 1, x = 0.5, y = 0.5)  # the larger map
vp_a <- viewport(width = 0.3, height = 0.3, x = 0.34, y = 0.84)  # the inset in upper left
print(steigi_map + maptheme, vp = vp_b)
print(ger_map + maptheme, vp = vp_a)


##########################################
steigi_pnv <- readOGR("adm/steigi_pnv.gpkg")
steigi_pnv@data$First_PNV_ <-rownames(steigi_pnv$data)
head(steigi_pnv)
pnv <- fortify(steigi_pnv) %>% left_join(steigi_pnv@data)
plot(pnv)
head(steigi_pnv)
pnv <- fortify(steigi_pnv)

ggplot() + geom_sf(aes(fill = NEU),data=pnv,inherit.aes = FALSE)
