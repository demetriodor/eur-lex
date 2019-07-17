n=3
png('./figures/F5_noncom_newacts_hd.png', width=1200*n, height=900*n, res=96)

par(oma=c(6,5,22,4),
    par(mar=c(2,1,1,1)),
    bg=background.color,
    bty='n',
    family='Montserrat')
cdirs$cdirs<-as.numeric(as.character(cdirs$cdirs))

### main plot with dots
plot(xlim=c(1,30), ylim=c(0,180), NULL, axes=F, xlab="", ylab="", main='', cex.main=1.4, col.main=dark.color, font.main=2)
axis (2, font=1, tck=0.1, col=background.color, col.axis=dark.color, at=seq(0,180,20),line=-0.5, labels=seq(0,180,20), cex.axis=1.2*n)
abline(h=seq(0,180,20), col='grey')
abline(v=c(0.5, 10.5, 20.5, 30.5), col='grey')
axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=1:30,line=-1.5, labels=dirs$year.sem, cex.axis=1*n)


#lines (x=1:30, y = dirs$dirs, lwd=3, col=main.color3)
rect (xleft =seq(0.6, 29.6,1), xright =seq(1.4, 30.4,1), ybottom=rep(0,30), ytop=dirs$dirs, border=main.color2, col=main.color2)
rect (xleft =seq(0.68, 29.68,1), xright =seq(1.32, 30.32,1), ybottom=rep(0,30), ytop=dirsn$dirsn, border=main.color3, col=main.color3)

lines (x=1:10, y=rep(mean(dirs$dirs[1:10]),10), lwd=8, lty=2, col=main.color2)
lines (x=11:20, y=rep(mean(dirs$dirs[11:20]),10), lwd=8, lty=2, col=main.color2)
lines (x=21:30, y=rep(mean(dirs$dirs[21:30]),10), lwd=8, lty=2, col=main.color2)

lines (x=1:10, y=rep(mean(dirsn$dirsn[1:10]),10), lwd=8, lty=2, col=main.color3)
lines (x=11:20, y=rep(mean(dirsn$dirsn[11:20]),10), lwd=8, lty=2, col=main.color3)
lines (x=21:30, y=rep(mean(dirsn$dirsn[21:30]),10), lwd=8, lty=2, col=main.color3)

#title
mtext(expression(bold('Legislative Productivity of the European Union, 2004-2019: New main acts')),
      line=5*n+2, font=1, at=0.025, col=dark.color, cex=1.8*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars ') * ' show the number of directives and regulations adopted by the EP and/or the Council. ' * phantom ( '  Blue bars ' )),
      line=2.5*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression('Red bars ' * phantom (' show the number of directives and regulations adopted by the EP and/or the Council.  Blue bars ')),
      line=2.5*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars show the number of directives and regulations adopted by the EP and/or the Council. ') * '  Blue bars '),
      line=2.5*n+2, font=3, at=0.025, col=main.color3, cex=1.2*n, adj=0, padj=1, outer=T)

mtext(expression('show only new (non-amending) acts. The dashed ' * phantom (' ---  ---') * ' horizontal lines show the averages per EP term.'),
      line=1*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('show only new (non-amending) acts. The dashed ') * ' --- ' * phantom(' --- horizontal lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('show only new (non-amending) acts. The dashed --- ') * ' ---' * phantom(' horizontal lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color3, cex=1.2*n, adj=0, padj=1, outer=T)

#signature
mtext(text=expression("- dimiter " * phantom(".eu") * " -"),
      side=1, line=2, outer=T, font=1, family='Cairo', col=dark.color, cex=1*n, adj=1, padj=1)
mtext(text=expression(phantom("- dimiter ") * ".eu" * phantom(" -")),
      side=1, line=2, outer=T, font=1, family='Cairo', col=main.color3, cex=1*n, adj=1, padj=1)

#data
mtext(text=expression("Data: " * phantom(" Own extraction from EUR-Lex")),
      side=1, line=2, outer=T, font=1, family='Cairo', col=dark.color, cex=1*n, adj=0, padj=1)
mtext(text=expression(phantom("Data: ") * " Own extraction from EUR-Lex"),
      side=1, line=2, outer=T, font=1, family='Cairo', col=main.color3, cex=1*n, adj=0, padj=1)

text('Eighth European Parliament', x=25.5, y=176, cex=1.2*n, col=dark.color, font=3)
text('Seventh European Parliament', x=15, y=176, cex=1.2*n, col=dark.color, font=3)
text('Sixth European Parliament', x=5.5, y=176, cex=1.2*n, col=dark.color, font=3)

dev.off()


