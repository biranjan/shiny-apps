rm(list=ls())
library(maptools)
library(ggplot2)


chi_shp <- readShapePoly("data/chile_shp/cl_regiones_geo.shp")
chi_f <- fortify(chi_shp)
system.time(
  print(
    ggplot()+
      geom_polygon(data=chi_f,aes(long,lat,fill=id,group=group))+
      coord_equal() + ggtitle("a")
    )
  )


chi_shp <- readShapePoly("data/chile_shp_simplified/cl_regiones_geo.shp")
chi_f <- fortify(chi_shp)
system.time(
  print(
    ggplot()+
      geom_polygon(data=chi_f,aes(long,lat,fill=id,group=group))+
      coord_equal() + ggtitle("b")
    )
  )



table(chi_f$id)
chi_f$id <- as.numeric(chi_f$id)+1

library(plyr)
graphics.off()
llply(sort(unique(chi_f$id)), function(x){ #x <- 2
  chi_f$flag <- ifelse(chi_f$id==x, "yep", "nope")
  ggplot()+ 
    geom_polygon(data=chi_f,aes(long,lat, fill=flag,group=group))+
    coord_equal() + ggtitle(x)
})



# library(raster)
# 
# polyArg <- getData('GADM', country='ARG',level=0)
# polyBol <- getData('GADM',country='BOL',level=0)
# polyPeru <- getData('GADM',country='PER',level=0)
# 
# file.remove("ARG_adm0.RData", "BOL_adm0.RData", "PER_adm0.RData")
# 
# polyArg_f <- fortify(polyArg)
# polyBol_f <- fortify(polyBol)
# polyPeru_f <- fortify(polyPeru)




ggplot()+ 
  geom_polygon(data=chi_f,aes(long,lat,fill=id,group=group)) +
  geom_polygon(data=polyArg_f,aes(long,lat,group=group), fill='white',col='grey')+ 
  geom_polygon(data=polyBol_f,aes(long,lat,group=group), fill='white',col='grey')+ 
  geom_polygon(data=polyPeru_f,aes(long,lat,group=group), fill='white',col='grey')+ 
#   geom_text(aes(-65,-35,label='Argentina',colour=NA,angle=45))+
#   geom_text(aes(-80,-35,label='Pacific Ocean',colour=NA,angle=90))+
#   geom_text(aes(-65,-18,label='Bolivia',colour=NA,angle=0))+
#   geom_text(aes(-73,-13,label='Peru',colour=NA,angle=0))+
#   geom_text(aes(-72,-56,label='Chile',colour=NA,angle=0))+
  scale_x_continuous(name=expression(paste("Longitud (",degree,")")), limits=c(-82,-53)) +
  scale_y_continuous(name=expression(paste("Latitud (",degree,")"))) + 
  coord_equal()+theme_bw()+theme(legend.position='none')






chi_shp <- readShapePoly("data/chile_shp_simplified/cl_regiones_geo.shp")
chi_f <- fortify(chi_shp)


  

